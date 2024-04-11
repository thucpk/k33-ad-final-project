from fastapi import APIRouter
from typing import Any
from app.core.config import settings
import psycopg2
import psycopg2.extras
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT


router = APIRouter()


@router.get(
    "/",
    status_code=201,
)
def orders(user_id=1, order_status=2, limit=5, page=0) -> Any:
    offset = page * limit
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
        "page": page,
    }

    return rs


@router.post("/cancel-order", status_code=201)
def cancel_order(order_id: int) -> Any:
    pg_con = psycopg2.connect(
        host=settings.POSTGRES_SERVER,
        port=settings.POSTGRES_PORT,
        database=settings.POSTGRES_DB,
        user=settings.POSTGRES_USER,
        password=settings.POSTGRES_PASSWORD
    )

    pg_con.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)

    try:
        # Open a cursor to perform database operations
        with pg_con.cursor(cursor_factory=psycopg2.extras.DictCursor) as cur:
            # Start a new transaction
            cur.execute("BEGIN")
            cur.execute(f"""
            SELECT max(ma_trang_thai) as ma_trang_thai
            FROM don_hang dh
            JOIN chi_tiet_trang_thai_don_hang ctttdh on dh.ma_don_hang=ctttdh.ma_don_hang
            WHERE dh.ma_don_hang={order_id}""")
            order = cur.fetchone()
            if not order:
                return {"message": "order not found"}
            if order['ma_trang_thai'] in (4, 5):
                return {"message": "order is not cancelable"}

            cur.execute(f"""
            INSERT INTO chi_tiet_trang_thai_don_hang(
                ma_don_hang, ma_trang_thai, thoi_gian_xu_ly_trang_thai, 
                ma_chi_tiet_trang_thai_don_hang, mo_ta_chi_tiet, 
                created_date, modified_date) 
            VALUES ({order_id}, 4, current_timestamp, 0, 'customer ask cancel order', 
                current_timestamp, current_timestamp)""")
            # Update product quantity
            cur.execute(f"SELECT ma_san_pham, so_luong_san_pham FROM chi_tiet_don_hang "
                        f"WHERE ma_don_hang={order_id}")
            products = cur.fetchall()
            product_list = ",".join([str(p['ma_san_pham']) for p in products])
            cur.execute(f"SELECT ma_san_pham, so_luong_ton_kho, so_luong_da_ban "
                        f"FROM san_pham WHERE ma_san_pham IN ({product_list})")
            before_products = cur.fetchall()
            for product in products:
                cur.execute(f"UPDATE san_pham "
                            f"SET so_luong_ton_kho=so_luong_ton_kho+{product['so_luong_san_pham']},"
                            f"so_luong_da_ban=so_luong_da_ban-{product['so_luong_san_pham']} "
                            f"WHERE ma_san_pham={product['ma_san_pham']}")
            cur.execute(f"SELECT ma_san_pham, so_luong_ton_kho, so_luong_da_ban "
                        f"FROM san_pham WHERE ma_san_pham IN ({product_list})")
            after_products = cur.fetchall()
            data = {
                "before": [dict(r) for r in before_products],
                "after": [dict(r) for r in after_products]
            }
            # Commit the transaction
            cur.execute("COMMIT;")
    except (Exception, psycopg2.DatabaseError) as error:
        print(f"Error: {error}")
        # Rollback the transaction in case of error
        if pg_con:
            pg_con.rollback()
            if pg_con:
                pg_con.close()
            return {"message": " transaction failed"}

    return {"message": "transaction success", "data": data}
