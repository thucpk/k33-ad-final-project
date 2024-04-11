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
        if "thuong_hieu" in conditions and conditions["thuong_hieu"] is not None:
            filters.append({
                "match": {
                    "thuong_hieu": conditions["thuong_hieu"]
                }
            })
        if "tiki_now" in conditions and conditions["tiki_now"] > 0:
            filters.append({
                "match": {
                    "tiki_now": conditions["tiki_now"]
                }
            })
        if "price_from" in conditions:
            filters.append({
                "range": {
                    "don_gia": {
                        "gte": conditions["price_from"]
                    }
                }
            })
        if "price_to" in conditions:
            filters.append({
                "range": {
                    "don_gia": {
                        "lte": conditions["price_to"]
                    }
                }
            })
        return filters

    def product_query(self, index, search_term, conditions=None, sort_by=None):
        filtered = self.product_filter_builder(conditions)
        query = {
            "function_score": {
                "query": {
            "bool": {
                "should": [
                    {
                        "match": {
                            "ten_san_pham": {
                                "query": search_term,
                                "boost": 20
                            }
                        }
                    },
                    {
                        "match": {
                            "ten_gian_hang": {
                                "query": search_term,
                                "boost": 20
                            }
                        }
                    },
                    {
                        "match": {
                            "thuong_hieu": {
                                "query": search_term,
                                "boost": 10
                            }
                        }
                    },
                    {
                        "match": {
                            "sku": {
                                "query": search_term,
                                "boost": 30
                            }
                        }
                    }
                ],
                "filter": filtered
            }
        },
        "functions": [
            {
                "script_score": {
                    "script": {
                        "source": "if (_score > 0) { return _score; } return 0;"
                    }
                }
            }
        ],
        "min_score": 0.0001
            }
        }
        print(query)

        sort = {
            "ban_chay": {"so_luong_da_ban": {"order": "desc"}},
            "hang_moi": {"created_date": {"order": "desc"}},
            "gia_thap_den_cao": {"don_gia": {"order": "asc"}},
            "gia_cao_den_thap": {"don_gia": {"order": "desc"}}
        }.get(sort_by, None)
        res = self.es_cli.search(index=index, query=query, sort=sort)
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
        # check index if exists, delete
        if self.es_cli.indices.exists(index=_index):
            self.es_cli.indices.delete(index=_index)
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
