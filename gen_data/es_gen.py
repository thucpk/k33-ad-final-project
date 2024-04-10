import json
import pandas as pd
from sqlalchemy import create_engine
import yaml
from app.core.config import settings
from app.es_utils import ESUtils

if __name__ == '__main__':
    pg_host = settings.POSTGRES_SERVER
    pg_port = settings.POSTGRES_PORT
    pg_db = settings.POSTGRES_DB
    pg_user = settings.POSTGRES_USER
    pg_pw = settings.POSTGRES_PASSWORD

    pg_engine = create_engine("postgresql+psycopg2://{}:{}@{}:{}/{}".format(
        pg_user, pg_pw, "localhost", pg_port, pg_db))

    print("Load products into Elasticsearch")
    q = """
    SELECT
        sp.ma_san_pham, sp.sku, sp.ten_san_pham, sp.mo_ta_san_pham,
        sp.thong_tin_chi_tiet thong_tin_chi_tiet_san_pham,
        sp.dac_diem_noi_bat dac_diem_noi_bat_san_pham,
        sp.so_luong_da_ban,
        ten_gian_hang, thuong_hieu, diem_so_trung_binh,
        sp.created_date
    FROM san_pham sp
    JOIN Nha_ban_hang nbh on sp.Ma_nha_ban_hang = nbh.Ma_nha_ban_hang
    JOIN Loai_san_pham lsp on sp.Ma_loai_san_pham = lsp.Ma_loai_san_pham
    -- JOIN mau_sac_san_pham mssp on sp.Ma_san_pham = mssp.Ma_san_pham
    """

    df = pd.read_sql_query(
        q, pg_engine)

    es_utils = ESUtils()
    es_product_mapping = json.load(open('./gen_data/es_product_mapping.json', 'r'))
    es_product_index = 'san_pham'
    product_key = 'ma_san_pham'
    product_docs = df.to_dict(orient='records')
    es_utils.create_and_index_documents(es_product_index, es_product_mapping, product_key, product_docs)

    print("Load autocomplete data into Elasticsearch")
    es_autocomplete_mapping = json.load(open('./gen_data/es_autocomplete_mapping.json', 'r'))
    es_autocomplete_index = 'autocomplete'
    autocomplete_docs = yaml.safe_load(open('./gen_data/es_autocomplete_data.yml', 'r'))['docs']
    autocomplete_key = 'id'
    es_utils.create_and_index_documents(
        es_autocomplete_index, es_autocomplete_mapping, autocomplete_key, autocomplete_docs)