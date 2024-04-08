from fastapi import APIRouter, Depends
from typing import Any
# from pydantic.networks import EmailStr
#
from app.api.deps import get_current_active_superuser
# from app.models import Message
# from app.utils import generate_test_email, send_email
from app.search_suggestion_cache import SuggestionSearchCache

router = APIRouter()


@router.get(
    "/",
    # dependencies=[Depends(get_current_active_superuser)],
    status_code=201,
)
def get_suggestion() -> Any:
    """
    load suggestion data
    """
    cache = SuggestionSearchCache()
    ad = cache.get_campaign_ads()
    kw_trend = cache.retrieve_kw_trend()
    hot_categories = cache.get_hot_categories()
    hot_keywords = cache.get_hot_keywords()
    data = {
        "campaign_ads": ad,
        "keywords_trend": kw_trend,
        "hot_categories": hot_categories,
        "hot_keywords": hot_keywords
    }
    return data
