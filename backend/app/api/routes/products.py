from fastapi import APIRouter, Depends
from typing import Any
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
def products(q='', rating=0, tiki_now=0, price_from=0, price_to=None) -> Any:
    """
    load suggestion data
    """
    # load from cache
    es_utils = ESUtils()
    data = es_utils.product_query('products', q, conditions={"diem_so_trung_binh": rating})
    total = data['hits']['total']['value']
    hists = data['hits']['hits']
    docs = [hit['_source'] for hit in hists]
    rs = {
        "total": total,
        "data": docs
    }
    return rs
