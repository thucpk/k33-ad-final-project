from fastapi import APIRouter, Depends
from typing import Any
import urllib.parse
# from pydantic.networks import EmailStr
#
from app.api.deps import get_current_active_superuser
# from app.models import Message
# from app.utils import generate_test_email, send_email
from app.search_suggestion_cache import SuggestionSearchCache
from app.es_utils import ESUtils

router = APIRouter()


@router.get(
    "/",
    # dependencies=[Depends(get_current_active_superuser)],
    status_code=201,
)
def get_suggestion(q='') -> Any:
    """
    load suggestion data
    """
    # load from cache
    if q == '':
        cache = SuggestionSearchCache()
        ad = cache.get_campaign_ads()
        kw_trend = cache.retrieve_kw_trend()
        hot_categories = cache.get_hot_categories()
        hot_keywords = cache.get_hot_keywords()
        res = {
            "amplitude": {
                "store_name_in_search_suggestion": "",
                "suggestion_state": "empty_query"
            },
            "data": kw_trend,
            "data_collapsed": 3,
            "widgets": [
                ad,
                hot_keywords,
                hot_categories
            ]
        }
    else:
        es_utils = ESUtils()
        kws = es_utils.kw_autocomplete('autocomplete', q)
        data = [{
            "keyword": kw,
            "type": "keyword",
            "url":  urllib.parse.quote_plus(f"https://tiki.vn/search?q={kw}")
        } for kw in kws]
        res = {
            "amplitude": {
                "store_name_in_search_suggestion": "",
                "suggestion_state": "query_available"
            },
            "data": data
        }

    return res
