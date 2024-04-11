from fastapi import APIRouter, Depends
from typing import Any, Optional, Literal
# from pydantic.networks import EmailStr
#
from app.api.deps import get_current_active_superuser
# from app.models import Message
# from app.utils import generate_test_email, send_email
from app.es_utils import ESUtils

router = APIRouter()


@router.get(
    "/",
    # dependencies=[Depends(get_current_active_superuser)],
    status_code=201,
)
def products(
        q: str = '', rating: int = 0,
        tiki_now: int = 0,
        brand: Optional[str] = None,
        price_from: int = 0,
        price_to: Optional[int] = None,
        sort_by: Literal['default', 'ban_chay', 'hang_moi', 'gia_thap_den_cao', 'gia_cao_den_thap'] = 'default'
) -> Any:
    """
    load suggestion data
    """
    # load from cache
    es_utils = ESUtils()
    data = es_utils.product_query(
        'products',
        q,
        conditions={
            "diem_so_trung_binh": rating,
            "tiki_now": tiki_now,
            "thuong_hieu": brand,
            "price_from": price_from,
            "price_to": price_to
        },
        sort_by=sort_by
    )
    total = data['hits']['total']['value']
    hists = data['hits']['hits']
    docs = [hit['_source'] for hit in hists]
    rs = {
        "total": total,
        "data": docs
    }
    return rs
