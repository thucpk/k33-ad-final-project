import redis
import os
import dotenv
import json
from app.core.config import settings


class SuggestionSearchCache(object):
    def __init__(self):
        self.r = redis.StrictRedis(
            host=settings.REDIS_HOST, port=settings.REDIS_PORT, password=settings.REDIS_PASSWORD, decode_responses=True)

    def clear_all_cache(self):
        self.r.flushdb()

    def retrieve_all_keys(self):
        return self.r.keys()

    def incr_hot_keyword(self, keyword, increment=1):
        self.r.zincrby('search_suggestion:hot_keywords', increment, keyword)

    def get_hot_keywords(self, n=10):
        top_keywords = self.r.zrevrange('search_suggestion:hot_keywords', 0, n-1, withscores=True)
        keywords_details = list()
        for kw in top_keywords:
            kw_detail = self.retrieve_keyword_detail(kw)
            kw_detail['title'] = kw  # Assuming the title is the keyword itself
            keywords_details.append(kw_detail)

        return {
            "code": "hot_keywords",
            "items": keywords_details,
            "placement": "bottom",
            "title": "Tìm Kiếm Phổ Biến",
            "type": "hot_keywords"
        }

    def incr_hot_category(self, cat, increment=1):
        self.r.zincrby('search_suggestion:hot_categories', increment, cat)

    def get_hot_categories(self, n=10):
        top_categories = self.r.zrevrange('search_suggestion:hot_categories', 0, n-1, withscores=True)
        categories_details = []
        for kw in top_categories:
            kw_detail = self.retrieve_keyword_detail(kw)
            kw_detail['title'] = kw  # Assuming the title is the keyword itself
            categories_details.append(kw_detail)

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
            self.r.set(f'keywords_trend:{k}', json.dumps(kw))


# if __name__ == '__main__':
#     dotenv.load_dotenv()
#     cache = SuggestionSearchCache()
#     cache.clear_all_cache()
#     item = {
#         "subtitle": "500 sản phẩm",
#         "thumbnail_url": "https:\/\/salt.tikicdn.com\/cache\/280x280\/ts\/product\/e1\/9c\/5f\/8744ec46b8944da136785ea2d56cdea6.png",
#         "title": "áo polo nam",
#         "url": "https:\/\/tiki.vn\/search?q=%C3%A1o+polo+nam&ref=searchBar"
#     }
#     cache.store_keyword_detail(item)
#     cache.retrieve_category_detail('áo polo nam')
#
#     item = {
#         "id": 28856,
#         "name": "Máy đọc sách",
#         "thumbnail_url": "https://salt.tikicdn.com/ts/category/fc/ab/44/a492de1fa611e8e6122fadc24a1bb7b0.png",
#         "url": "https://tiki.vn/may-doc-sach/c28856",
#         "url_key": "may-doc-sach"
#     }
#     _id = item['id']
#     cache.store_category_detail(item)
#     cache.retrieve_category_detail(_id)
#
#     cache.set_campaign_ads({
#         "code": "promo",
#         "icon": "https:\/\/salt.tikicdn.com\/ts\/upload\/4b\/4e\/8a\/d4d3453a684913b8ee5aeaa2ea26ebae.png",
#         "image_url": "https:\/\/salt.tikicdn.com\/ts\/tikimsp\/26\/d0\/c5\/3d2a898df02b7f26055532bab456f214.png",
#         "placement": "top",
#         "text": "Tiki BEST - Chốt Deal Tốt Nhất",
#         "title": "promo",
#         "type": "promo",
#         "url": "https:\/\/tiki.vn\/khuyen-mai\/hero-top-san-pham-ban-chay?itm_campaign=HMP_YPD_TKA_BNA_UNK_ALL_ALL_UNK_UNK_UNK_TMSX.8ca875ae-3998-4a9f-bdea-4124d09f42ab&itm_medium=CPD&itm_source=tiki-ads&tmsx=8ca875ae-3998-4a9f-bdea-4124d09f42ab&waypoint_id=TECH"
#     })
#     # print(cache.get_campaign_ads())
#
#     trend_keywords = [
#         {
#             "keyword": "iphone 15",
#             "type": "keyword",
#             "url": "https:\/\/tiki.vn\/search?q=iphone%2015"
#         },
#         {
#             "id": -100,
#             "keyword": "Apple Flagship Store",
#             "logo": "https:\/\/salt.tikicdn.com\/cache\/80x80\/ts\/tka\/4c\/ec\/65\/955f13c00db11dbc52907030568c9517.png",
#             "store_id": -100,
#             "subtitle": "42 sản phẩm",
#             "title": "Apple Flagship Store",
#             "type": "seller",
#             "url": "https:\/\/tiki.vn\/khuyen-mai\/appleflagshipstore"
#         },
#         {
#             "keyword": "tai nghe bluetooth",
#             "type": "keyword",
#             "url": "https:\/\/tiki.vn\/search?q=tai%20nghe%20bluetooth"
#         },
#         {
#             "keyword": "ensure",
#             "type": "keyword",
#             "url": "https:\/\/tiki.vn\/search?q=ensure"
#         },
#         {
#             "keyword": "iphone",
#             "type": "keyword",
#             "url": "https:\/\/tiki.vn\/search?q=iphone"
#         },
#         {
#             "keyword": "tam thể",
#             "type": "keyword",
#             "url": "https:\/\/tiki.vn\/search?q=tam%20th%E1%BB%83"
#         },
#         {
#             "keyword": "iphone 15 pro max",
#             "type": "keyword",
#             "url": "https:\/\/tiki.vn\/search?q=iphone%2015%20pro%20max"
#         },
#         {
#             "keyword": "thẻ điên thoại",
#             "type": "keyword",
#             "url": "https:\/\/tiki.vn\/search?q=th%E1%BA%BB%20%C4%91i%C3%AAn%20tho%E1%BA%A1i"
#         },
#         {
#             "keyword": "iphone 13",
#             "type": "keyword",
#             "url": "https:\/\/tiki.vn\/search?q=iphone%2013"
#         },
#         {
#             "keyword": "ipad",
#             "type": "keyword",
#             "url": "https:\/\/tiki.vn\/search?q=ipad"
#         }
#     ]
#
#     cache.store_kw_trend(trend_keywords)
#     print(cache.retrieve_all_keys())
#     # print(cache.retrieve_kw_trend())
#
#     # cache.incr_hot_keyword('python programming')
#     # cache.incr_hot_keyword('redis tutorial')
#     # cache.incr_hot_keyword('python programming')
#     # cache.incr_hot_keyword('python programming')
#     # top_keywords = cache.get_hot_keywords(10)
#     # print("Top Keywords and Scores:")
#     # for kw, score in top_keywords:
#     #     print(f"{kw}: {score}")
