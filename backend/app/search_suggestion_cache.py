import redis
import json
from app.core.config import settings


class SuggestionSearchCache(object):
    def __init__(self):
        self.r = redis.StrictRedis(
            host=settings.REDIS_HOST, port=settings.REDIS_PORT, password=settings.REDIS_PASSWORD,
            decode_responses=True)

    def clear_all_cache(self):
        self.r.flushdb()

    def retrieve_all_keys(self, pattern='*'):
        return self.r.keys(pattern)

    def incr_hot_keyword(self, keyword, increment=1):
        keyword = keyword.replace(' ', '_')
        self.r.zincrby('search_suggestion:hot_keywords', increment, keyword)

    def get_hot_keywords(self, n=10):
        top_keywords = self.r.zrevrange('search_suggestion:hot_keywords', 0, n-1, withscores=True)
        keywords_details = list()
        for w, _ in top_keywords:
            kw_detail = self.retrieve_keyword_detail(w)
            kw_detail['title'] = w  # Assuming the title is the keyword itself
            keywords_details.append(kw_detail)

        return {
            "code": "hot_keywords",
            "items": keywords_details,
            "placement": "bottom",
            "title": "Tìm Kiếm Phổ Biến",
            "type": "hot_keywords"
        }

    def incr_hot_category(self, cat_id, increment=1):
        self.r.zincrby('search_suggestion:hot_categories', increment, cat_id)

    def get_hot_categories(self, n=10):
        top_categories = self.r.zrevrange('search_suggestion:hot_categories', 0, n-1, withscores=True)
        categories_details = []
        for cat_id, _ in top_categories:
            cat_detail = self.retrieve_category_detail(cat_id)
            cat_detail['id'] = cat_id
            categories_details.append(cat_detail)

        return {
            "code": "hot_categories",
            "items": categories_details,
            "placement": "bottom",
            "title": "Danh Mục Nổi Bật",
            "type": "hot_categories"
        }

    def retrieve_keyword_detail(self, keyword):
        kw_detail = self.r.hgetall(f'search_suggestion:keyword_details:{keyword}')
        if not kw_detail:
            return None
        kw_detail['title'] = keyword.replace('_', ' ')
        return kw_detail

    def store_keyword_detail(self, detail):
        keyword = detail['title'].replace(' ', '_')
        self.r.hset(f'search_suggestion:keyword_details:{keyword}', mapping=detail)

    def retrieve_category_detail(self, category_id):
        cat_detail = self.r.hgetall(f'search_suggestion:category_details:{category_id}')
        if not cat_detail:
            return None
        return cat_detail

    def store_category_detail(self, detail):
        category_id = detail.pop('id')
        self.r.hset(f'search_suggestion:category_details:{category_id}', mapping=detail)
        # print(self.retrieve_category_detail(category_id))

    def set_campaign_ads(self, ads):
        self.r.set('search_suggestion:campaign_ads', json.dumps(ads))

    def get_campaign_ads(self):
        return json.loads(self.r.get('search_suggestion:campaign_ads'))

    def retrieve_kw_trend(self):
        default_keys = self.r.keys('search_suggestion:keywords_trend:*')
        kw_trend = list()
        for key in default_keys:
            kw_trend.append(json.loads(self.r.get(key)))
        return kw_trend

    def store_kw_trend(self, kw_trends):
        for kw in kw_trends:
            k = kw['keyword'].replace(' ', '_')
            self.r.set(f'search_suggestion:keywords_trend:{k}', json.dumps(kw))
