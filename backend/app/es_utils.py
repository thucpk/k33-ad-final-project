from elasticsearch import Elasticsearch, helpers
from app.core.config import settings
from typing import List


class ESUtils(object):
    def __init__(self):
        self.es_cli = Elasticsearch(hosts=[{
            "host": settings.ELASTICSEARCH_SERVER, "port": settings.ELASTICSEARCH_PORT,
            "scheme": settings.ELASTICSEARCH_SCHEMA}])

    @staticmethod
    def product_filter_builder(conditions=None):
        filters = []
        if conditions is None:
            return filters
        if "diem_so_trung_binh" in conditions:
            filters.append({
                "range": {
                    "diem_so_trung_binh": {
                        "gte": conditions["diem_so_trung_binh"]
                    }
                }
            })
        elif "thuong_hieu" in conditions:
            filters.append({
                "match": {
                    "thuong_hieu": conditions["thuong_hieu"]
                }
            })
        return filters

    def product_query(self, index, search_term, conditions=None, sort_by=None):
        filtered = self.product_filter_builder(conditions)
        query = {
            "bool": {
                "must": {
                    "multi_match": {
                        "query": search_term,
                        "fields": [
                            "ten_san_pham^1",     # Default boost
                            "ten_gian_hang^1",    # Default boost
                            "thuong_hieu^1",      # Default boost
                            "sku^10"              # Higher boost for SKU matches
                        ]
                    }
                },
                "filter": filtered
            }
        }
        sorted = {
            # "diem_so_trung_binh":  {"diem_so_trung_binh": {"order": "desc"}},
            "created_date": {"created_date": {"order": "desc"}}
        }.get(sort_by, None)
        res = self.es_cli.search(index=index, query=query, sort=sorted)
        return res

    def kw_autocomplete(self, index, search_term):
        suggest = {
            "name-suggestion": {
                "prefix": search_term,
                "completion": {
                    "field": "suggest"
                }
            }
        }
        res = self.es_cli.search(index=index, suggest=suggest)
        rs = list()
        for hit in res['suggest']['name-suggestion'][0]['options']:
            rs.append(hit['_source']['name'])
        return rs

    def create_and_index_documents(self, _index: str, es_mapping: dict, key: str, data: List[dict]):
        self.es_cli.options(ignore_status=400).indices.create(index=_index, body=es_mapping)
        actions = [
            {
                "_index": _index,
                "_id": row[key],
                "_source": row
            }
            for row in data
        ]

        res = helpers.bulk(self.es_cli, actions)
        if len(res) == 1:
            raise Exception(f"Failed to index documents: {res}")
        print(f"Bulk {_index} indexing, success: {res[0]}, failed: {res[1]}")
