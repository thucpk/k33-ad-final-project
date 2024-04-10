from fastapi import APIRouter
from typing import Any
from app.core.config import settings
import psycopg2
import psycopg2.extras


router = APIRouter()


@router.get(
    "/",
    status_code=201,
)
def order_tracking(user_id=1, order_status=2, limit=5, offset=0) -> Any:
    pg_con = psycopg2.connect(
        host=settings.POSTGRES_SERVER,
        port=settings.POSTGRES_PORT,
        database=settings.POSTGRES_DB,
        user=settings.POSTGRES_USER,
        password=settings.POSTGRES_PASSWORD
    )
    template_q = f"""
    with tmp as (
        select dh.ma_don_hang
        from nguoi_dung_tiki ndt
        join don_hang dh on ndt.ma_nguoi_dung_tiki=dh.ma_nguoi_dung_tiki
        join chi_tiet_trang_thai_don_hang ctttdh on dh.ma_don_hang=ctttdh.ma_don_hang
        where ndt.ma_nguoi_dung_tiki={user_id}
        group by 1
        having max(ma_trang_thai)={order_status}
    )
    """
    count_q = f"""
    {template_q}
    select count(1) as total
    from tmp
    """
    q = f"""
    {template_q}
    select c.*
    from don_hang c
    join tmp on tmp.ma_don_hang=c.ma_don_hang
    LIMIT {limit} OFFSET {offset};
    """
    with pg_con.cursor(cursor_factory=psycopg2.extras.DictCursor) as cur:
        cur.execute(q)
        items = [dict(r) for r in cur.fetchall()]
        cur.execute(count_q)
        total = cur.fetchone()['total']
    rs = {
        "total": total,
        "items": items,
        "limit": limit,
        "offset": offset,
    }

    return rs
