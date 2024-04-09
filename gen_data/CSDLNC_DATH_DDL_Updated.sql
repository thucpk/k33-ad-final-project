-- Created by Vertabelo (http://vertabelo.com) - PNTTrang
-- Last modification date: 2024-04-08 17:01:41.245

-- tables
-- Table: Binh_luan
CREATE TABLE Binh_luan (
    Ma_binh_luan bigint  NOT NULL,
    Ma_san_pham bigint  NOT NULL,
    Noi_dung text  NOT NULL,
    Diem_so int  NOT NULL DEFAULT 1 CHECK (Diem_so >= 1 AND Diem_so <=5),
    Created_date timestamp  NOT NULL,
    Modified_date timestamp  NOT NULL,
    Ma_nguoi_dung_Tiki bigint  NOT NULL,
    CONSTRAINT PK_Binh_luan_san_pham PRIMARY KEY (Ma_binh_luan)
);

CREATE INDEX Binh_luan_ng_dung_tiki on Binh_luan (Ma_nguoi_dung_Tiki ASC);

-- Table: Chi_tiet_don_hang
CREATE TABLE Chi_tiet_don_hang (
    Ma_san_pham bigint  NOT NULL,
    Ma_don_hang bigint  NOT NULL,
    So_luong_san_pham smallint  NOT NULL,
    Thanh_tien decimal(15,4)  NOT NULL DEFAULT 0 CHECK (Thanh_tien >= 0),
    Created_date timestamp  NOT NULL,
    Modified_date timestamp  NOT NULL,
    Ma_voucher bigint  NOT NULL,
    CONSTRAINT PK_Chi_tiet_don_hang PRIMARY KEY (Ma_san_pham,Ma_don_hang)
);

CREATE INDEX Thong_tin_voucher_indx on Chi_tiet_don_hang (Ma_voucher ASC);

-- Table: Chi_tiet_trang_thai_don_hang
CREATE TABLE Chi_tiet_trang_thai_don_hang (
    Ma_trang_thai smallint  NOT NULL,
    Ma_don_hang bigint  NOT NULL,
    Thoi_gian_xu_ly_trang_thai timestamp  NOT NULL,
    Mo_ta_chi_tiet text  NOT NULL,
    Created_date timestamp  NOT NULL,
    Modified_date timestamp  NOT NULL,
    CONSTRAINT PK_Chi_tiet_trang_thai_don_hang PRIMARY KEY (Ma_trang_thai,Ma_don_hang)
);

-- Table: Dia_chi
CREATE TABLE Dia_chi (
    Ma_nguoi_dung_Tiki bigint  NOT NULL,
    Ma_dia_chi bigint  NOT NULL,
    Cong_ty text  NULL,
    Tinh_Thanh_pho text  NOT NULL,
    Quan_xa_huyen text  NOT NULL,
    Duong text  NOT NULL,
    Phuong text  NOT NULL,
    So_nha text  NOT NULL,
    Loai_dia_chi smallint  NOT NULL,
    CONSTRAINT PK_Dia_chi PRIMARY KEY (Ma_nguoi_dung_Tiki,Ma_dia_chi)
);

-- Table: Don_hang
CREATE TABLE Don_hang (
    Ma_don_hang bigint  NOT NULL,
    Dia_chi_nhan_hang text  NOT NULL,
    SDT_nguoi_nhan char(10)  NOT NULL,
    Tong_tam_tinh decimal(15,4)  NOT NULL DEFAULT 0 CHECK (Tong_tam_tinh >= 0),
    Tong_so_tien_giam_gia decimal(15,4)  NOT NULL DEFAULT 0 CHECK (Tong_so_tien_giam_gia >= 0),
    Phi_van_chuyen_thuc_te decimal(15,4)  NOT NULL DEFAULT 0 CHECK (Phi_van_chuyen_thuc_te >= 0),
    Tong_tien_don_hang decimal(15,4)  NOT NULL DEFAULT 0 CHECK (Tong_tien_don_hang >= 0),
    Mo_hinh_ap_dung smallint  NOT NULL DEFAULT 1,
    Ngay_nhan_hang_thuc_te timestamp  NOT NULL,
    Ngay_giao_hang_du_kien timestamp  NOT NULL,
    Ngay_nhan_hang_du_kien timestamp  NOT NULL,
    Ma_don_vi_van_chuyen smallint  NOT NULL,
    Created_date timestamp  NOT NULL,
    Modified_date timestamp  NOT NULL,
    CONSTRAINT PK_ma_don_hang PRIMARY KEY (Ma_don_hang)
);

CREATE INDEX Don_hang_Dvvc_Indx on Don_hang (Ma_don_vi_van_chuyen ASC);

-- Table: Don_vi_van_chuyen
CREATE TABLE Don_vi_van_chuyen (
    Ma_dvvc smallint  NOT NULL,
    Ten_dvvc text  NOT NULL,
    Loai_dvvc int  NOT NULL,
    Mo_ta text  NULL,
    Khuyen_mai_van_chuyen decimal(15,4)  NOT NULL DEFAULT 0 CHECK (Khuyen_mai_van_chuyen >= 0),
    Phi_van_chuyen_3kg_dau_tien_VND decimal(15,4)  NOT NULL DEFAULT 0 CHECK (Phi_van_chuyen_3kg_dau_tien_VND >= 0),
    Phi_van_chuyen_moi_0_5kg_VND decimal(15,4)  NOT NULL DEFAULT 0 CHECK (Phi_van_chuyen_moi_0_5kg_VND >= 0),
    Created_date timestamp  NOT NULL,
    Modified_date timestamp  NOT NULL,
    CONSTRAINT PK_DVVC PRIMARY KEY (Ma_dvvc)
);

-- Table: Hinh_anh_binh_luan
CREATE TABLE Hinh_anh_binh_luan (
    Ma_binh_luan bigint  NOT NULL,
    Ma_hinh_anh bigint  NOT NULL,
    URL text  NOT NULL,
    CONSTRAINT PK_Hinhanh_binhluan PRIMARY KEY (Ma_hinh_anh,Ma_binh_luan)
);

-- Table: Hinh_anh_san_pham
CREATE TABLE Hinh_anh_san_pham (
    Ma_san_pham bigint  NOT NULL,
    Ma_hinh_anh int  NOT NULL,
    URL text  NOT NULL,
    CONSTRAINT PK_Hinh_anh_san_pham PRIMARY KEY (Ma_san_pham,Ma_hinh_anh)
);

-- Table: Kich_thuoc_san_pham
CREATE TABLE Kich_thuoc_san_pham (
    Ma_san_pham bigint  NOT NULL,
    Ma_hinh_anh int  NOT NULL,
    Kich_thuoc char(10)  NOT NULL,
    CONSTRAINT PK_Kich_thuoc_san_pham PRIMARY KEY (Ma_san_pham,Ma_hinh_anh)
);

-- Table: Lich_su_gia_san_pham
CREATE TABLE Lich_su_gia_san_pham (
    Ma_lich_su_gia_san_pham bigint  NOT NULL,
    Ma_san_pham bigint  NOT NULL,
    Thoi_gian_bat_dau_hieu_luc timestamp  NOT NULL DEFAULT '1999-01-01 04:05:06',
    Don_gia decimal(15,4)  NOT NULL,
    Thoi_han_su_dung timestamp  NOT NULL DEFAULT '1999-01-01 04:05:06'
        CHECK (Thoi_han_su_dung >= Thoi_gian_bat_dau_hieu_luc),
    CONSTRAINT PK_Lich_su_gia_san_pham PRIMARY KEY (Ma_lich_su_gia_san_pham)
);

CREATE INDEX Ma_san_pham_IDX_Lichsugia on Lich_su_gia_san_pham (Ma_san_pham ASC);

-- Table: Loai_san_pham
CREATE TABLE Loai_san_pham (
    Ma_loai_san_pham smallint  NOT NULL,
    Ten text  NOT NULL,
    Mo_ta text  NULL,
    Cap_do_loai_san_pham int  NOT NULL,
    Created_date timestamp  NOT NULL,
    Modified_date timestamp  NOT NULL,
    Ma_loai_san_pham_cha smallint  NULL,
    CONSTRAINT PK_Loai_san_pham PRIMARY KEY (Ma_loai_san_pham)
);

CREATE INDEX Ma_loai_spcha_con on Loai_san_pham (Ma_loai_san_pham_cha ASC);

-- Table: Mau_sac_san_pham
CREATE TABLE Mau_sac_san_pham (
    Ma_san_pham bigint  NOT NULL,
    Ma_mau_sac int  NOT NULL,
    Ten_mau_sac text  NULL,
    CONSTRAINT PK_Mau_sac_san_pham PRIMARY KEY (Ma_san_pham,Ma_mau_sac)
);

-- Table: Nguoi_dung
CREATE TABLE Nguoi_dung (
    Ma_dinh_danh_nguoi_dung bigint  NOT NULL,
    Thoi_gian_truy_cap_lan_cuoi timestamp  NOT NULL,
    IP_Address text  NOT NULL,
    Thiet_bi_su_dung text  NOT NULL,
    Ma_quoc_gia char(5)  NOT NULL,
    Quoc_gia text  NOT NULL,
    Ma_khu_vuc char(5)  NOT NULL,
    Khu_vuc text  NOT NULL,
    Mui_gio text  NOT NULL,
    Tinh_thanh_pho text  NULL,
    Quan_Xa_Huyen text  NULL,
    Kinh_do decimal(9,6)  NOT NULL,
    Vi_do decimal(9,6)  NOT NULL,
    CONSTRAINT PK_Nguoi_dung PRIMARY KEY (Ma_dinh_danh_nguoi_dung)
);

-- Table: Nguoi_dung_Tiki
CREATE TABLE Nguoi_dung_Tiki (
    Ma_nguoi_dung_Tiki bigint  NOT NULL,
    Ho_va_ten text  NOT NULL,
    Gioi_tinh text  NULL CHECK (Gioi_tinh IN ('Nam', 'Nữ', 'Không xác định')),
    Kenh_xac_thuc text  NOT NULL,
    Ngay_sinh timestamp  NULL,
    Ten_dang_nhap text  NOT NULL CHECK (char_length(Ten_dang_nhap) >= 6),
    Avatar_url text  NULL,
    Quoc_tich text  NULL,
    Mat_khau text  NOT NULL CHECK (char_length(Mat_khau) >= 20 AND Mat_khau ~ '.*[A-Z].*' AND Mat_khau ~ '.*[^a-zA-Z0-9].*' AND Mat_khau ~ '^[A-Za-z]'),
    Email_dang_nhap text  NOT NULL,
    SDT_dang_nhap char(10)  NOT NULL,
    Tiki_xu int  NOT NULL DEFAULT 0 CHECK (Tiki_xu >= 0),
    Ma_dinh_danh_nguoi_dung bigint  NOT NULL,
    CONSTRAINT PK_Nguoi_dung_Tiki PRIMARY KEY (Ma_nguoi_dung_Tiki)
);

-- Table: Nha_ban_hang
CREATE TABLE Nha_ban_hang (
    Ma_nha_ban_hang int  NOT NULL,
    Hinh_thuc_ban_hang text  NOT NULL,
    Ho_ten_nha_ban_hang text  NOT NULL,
    CCCD_CMND char(12)  NOT NULL,
    Mat_khau text  NOT NULL CHECK (char_length(Mat_khau) >= 20 AND Mat_khau ~ '.*[A-Z].*' AND Mat_khau ~ '.*[^a-zA-Z0-9].*' AND Mat_khau ~ '^[A-Za-z]'),
    Email_nha_ban_hang text  NOT NULL,
    Quoc_tich text  NOT NULL,
    SDT_nha_ban_hang char(10)  NOT NULL,
    STK_thanh_toan text  NOT NULL,
--     Ho_ten text  NOT NULL,
    Ten_gian_hang text  NOT NULL,
    Hinh_anh text  NULL,
    Logo text  NULL,
    URL_gian_hang text  NULL,
    Created_date timestamp  NOT NULL,
    Modified_date timestamp  NOT NULL,
    CONSTRAINT PK_Nha_ban_hang PRIMARY KEY (Ma_nha_ban_hang)
);

-- Table: Phuong_thuc_thanh_toan
CREATE TABLE Phuong_thuc_thanh_toan (
    Ma_nguoi_dung_Tiki bigint  NOT NULL,
    Ma_phuong_thuc_thanh_toan bigint  NOT NULL,
    Ngay_het_han text  NOT NULL,
    Ten_chu_the text  NOT NULL,
    Ma_CCV text  NOT NULL,
    So_tai_khoan text  NOT NULL,
    Ngan_hang text  NOT NULL,
    CONSTRAINT PK_Phuong_thuc_thanh_toan PRIMARY KEY (Ma_nguoi_dung_Tiki,Ma_phuong_thuc_thanh_toan)
);

-- Table: San_pham
CREATE TABLE San_pham (
    Ma_san_pham bigint  NOT NULL,
    SKU char(10)  NOT NULL,
    Ten_san_pham text  NOT NULL,
    Mo_ta_san_pham text  NOT NULL CHECK (char_length(Mo_ta_san_pham) > 200),
    Thuong_hieu text  NULL,
    Ten_tac_gia text  NULL,
    Thong_tin_chi_tiet json  NULL,
    Thong_tin_bao_hanh json  NULL,
    Dac_diem_noi_bat text  NULL,
    Thong_tin_an_tam_mua_sam json  NULL,
    Han_su_dung timestamp  NULL,
    So_luong_ton_kho int  NOT NULL DEFAULT 0 CHECK (So_luong_ton_kho >=0),
    So_luong_da_ban int  NOT NULL DEFAULT 0 CHECK (So_luong_da_ban >= 0),
    Diem_so_trung_binh int  NOT NULL DEFAULT 0 CHECK (Diem_so_trung_binh >= 0 AND Diem_so_trung_binh <= 5),
    Created_date timestamp  NOT NULL,
    Modified_date timestamp  NOT NULL,
    Ma_loai_san_pham smallint  NOT NULL,
    Ma_nha_ban_hang int  NOT NULL,
    CONSTRAINT PK_San_pham PRIMARY KEY (Ma_san_pham)
);

CREATE INDEX Loaisp_Sanpham_indx on San_pham (Ma_loai_san_pham ASC);

CREATE INDEX Nha_ban_hang_indx on San_pham (Ma_nha_ban_hang ASC);

-- Table: Thong_tin_voucher
CREATE TABLE Thong_tin_voucher (
    Ma_voucher bigint  NOT NULL,
    Ten_voucher char(10)  NOT NULL,
    Mo_ta_voucher text  NULL,
    Trang_thai_active boolean  NOT NULL,
    Phan_tram_giam_gia real  NOT NULL DEFAULT 0.0,
    So_tien_khuyen_mai decimal(15,4)  NOT NULL DEFAULT 0,
    Dieu_kien_su_dung text  NOT NULL,
    Han_su_dung timestamp  NOT NULL,
    Created_date timestamp  NOT NULL,
    Modified_date timestamp  NOT NULL,
    CONSTRAINT PK_Voucher PRIMARY KEY (Ma_voucher)
);

-- Table: Trang_thai_don_hang
CREATE TABLE Trang_thai_don_hang (
    Ma_trang_thai smallint  NOT NULL DEFAULT 1 CHECK (Ma_trang_thai >=1 AND Ma_trang_thai <=5),
    Ten_trang_thai text  NOT NULL,
    Mo_ta_trang_thai text  NULL,
    Created_date timestamp  NOT NULL,
    Modified_date timestamp  NOT NULL,
    CONSTRAINT PK_Trang_thai_don_hang PRIMARY KEY (Ma_trang_thai)
);

-- foreign keys
-- Reference: Binh_luan_Hinh_anh_binh_luan (table: Hinh_anh_binh_luan)
ALTER TABLE Hinh_anh_binh_luan ADD CONSTRAINT Binh_luan_Hinh_anh_binh_luan
    FOREIGN KEY (Ma_binh_luan)
    REFERENCES Binh_luan (Ma_binh_luan)
    ON DELETE  SET NULL 
    ON UPDATE  SET NULL 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Binh_luan_Nguoi_dung_Tiki (table: Binh_luan)
ALTER TABLE Binh_luan ADD CONSTRAINT Binh_luan_Nguoi_dung_Tiki
    FOREIGN KEY (Ma_nguoi_dung_Tiki)
    REFERENCES Nguoi_dung_Tiki (Ma_nguoi_dung_Tiki)
    ON DELETE  CASCADE 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Binh_luan_San_pham (table: Binh_luan)
ALTER TABLE Binh_luan ADD CONSTRAINT Binh_luan_San_pham
    FOREIGN KEY (Ma_san_pham)
    REFERENCES San_pham (Ma_san_pham)
    ON DELETE  CASCADE 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Chi_tiet_don_hang_Don_hang (table: Chi_tiet_don_hang)
ALTER TABLE Chi_tiet_don_hang ADD CONSTRAINT Chi_tiet_don_hang_Don_hang
    FOREIGN KEY (Ma_don_hang)
    REFERENCES Don_hang (Ma_don_hang)
    ON DELETE  CASCADE 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Chi_tiet_trang_thai_don_hang_Trang_thai_don_hang (table: Chi_tiet_trang_thai_don_hang)
ALTER TABLE Chi_tiet_trang_thai_don_hang ADD CONSTRAINT Chi_tiet_trang_thai_don_hang_Trang_thai_don_hang
    FOREIGN KEY (Ma_trang_thai)
    REFERENCES Trang_thai_don_hang (Ma_trang_thai)
    ON DELETE  CASCADE 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Dia_chi_Nguoi_dung_Tiki (table: Dia_chi)
ALTER TABLE Dia_chi ADD CONSTRAINT Dia_chi_Nguoi_dung_Tiki
    FOREIGN KEY (Ma_nguoi_dung_Tiki)
    REFERENCES Nguoi_dung_Tiki (Ma_nguoi_dung_Tiki)
    ON DELETE  SET NULL 
    ON UPDATE  SET NULL 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Don_hang_Chi_tiet_trang_thai_don_hang (table: Chi_tiet_trang_thai_don_hang)
ALTER TABLE Chi_tiet_trang_thai_don_hang ADD CONSTRAINT Don_hang_Chi_tiet_trang_thai_don_hang
    FOREIGN KEY (Ma_don_hang)
    REFERENCES Don_hang (Ma_don_hang)
    ON DELETE  CASCADE 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Don_hang_Don_vi_van_chuyen (table: Don_hang)
ALTER TABLE Don_hang ADD CONSTRAINT Don_hang_Don_vi_van_chuyen
    FOREIGN KEY (Ma_don_vi_van_chuyen)
    REFERENCES Don_vi_van_chuyen (Ma_dvvc)
    ON DELETE  CASCADE 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Kich_thuoc_san_pham_San_pham (table: Kich_thuoc_san_pham)
ALTER TABLE Kich_thuoc_san_pham ADD CONSTRAINT Kich_thuoc_san_pham_San_pham
    FOREIGN KEY (Ma_san_pham)
    REFERENCES San_pham (Ma_san_pham)
    ON DELETE  CASCADE 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Mau_sac_san_pham_San_pham (table: Mau_sac_san_pham)
ALTER TABLE Mau_sac_san_pham ADD CONSTRAINT Mau_sac_san_pham_San_pham
    FOREIGN KEY (Ma_san_pham)
    REFERENCES San_pham (Ma_san_pham)
    ON DELETE  CASCADE 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Nguoi_dung_Tiki_Nguoi_dung (table: Nguoi_dung_Tiki)
ALTER TABLE Nguoi_dung_Tiki ADD CONSTRAINT Nguoi_dung_Tiki_Nguoi_dung
    FOREIGN KEY (Ma_dinh_danh_nguoi_dung)
    REFERENCES Nguoi_dung (Ma_dinh_danh_nguoi_dung)
    ON DELETE  CASCADE 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Phuong_thuc_thanh_toan_Nguoi_dung_Tiki (table: Phuong_thuc_thanh_toan)
ALTER TABLE Phuong_thuc_thanh_toan ADD CONSTRAINT Phuong_thuc_thanh_toan_Nguoi_dung_Tiki
    FOREIGN KEY (Ma_nguoi_dung_Tiki)
    REFERENCES Nguoi_dung_Tiki (Ma_nguoi_dung_Tiki)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: San_pham_Chi_tiet_don_hang (table: Chi_tiet_don_hang)
ALTER TABLE Chi_tiet_don_hang ADD CONSTRAINT San_pham_Chi_tiet_don_hang
    FOREIGN KEY (Ma_san_pham)
    REFERENCES San_pham (Ma_san_pham)
    ON DELETE  CASCADE 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: San_pham_Hinh_anh_san_pham (table: Hinh_anh_san_pham)
ALTER TABLE Hinh_anh_san_pham ADD CONSTRAINT San_pham_Hinh_anh_san_pham
    FOREIGN KEY (Ma_san_pham)
    REFERENCES San_pham (Ma_san_pham)
    ON DELETE  SET NULL 
    ON UPDATE  SET NULL 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: San_pham_Lich_su_gia_san_pham (table: Lich_su_gia_san_pham)
ALTER TABLE Lich_su_gia_san_pham ADD CONSTRAINT San_pham_Lich_su_gia_san_pham
    FOREIGN KEY (Ma_san_pham)
    REFERENCES San_pham (Ma_san_pham)
    ON DELETE  CASCADE 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: San_pham_Nha_ban_hang (table: San_pham)
ALTER TABLE San_pham ADD CONSTRAINT San_pham_Nha_ban_hang
    FOREIGN KEY (Ma_nha_ban_hang)
    REFERENCES Nha_ban_hang (Ma_nha_ban_hang)
    ON DELETE  CASCADE 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Thong_tin_voucher_Chi_tiet_don_hang (table: Chi_tiet_don_hang)
ALTER TABLE Chi_tiet_don_hang ADD CONSTRAINT Thong_tin_voucher_Chi_tiet_don_hang
    FOREIGN KEY (Ma_voucher)
    REFERENCES Thong_tin_voucher (Ma_voucher)
    ON DELETE  CASCADE 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: product_category_product (table: San_pham)
ALTER TABLE San_pham ADD CONSTRAINT product_category_product
    FOREIGN KEY (Ma_loai_san_pham)
    REFERENCES Loai_san_pham (Ma_loai_san_pham)
    ON DELETE  CASCADE 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: product_category_product_category (table: Loai_san_pham)
ALTER TABLE Loai_san_pham ADD CONSTRAINT product_category_product_category
    FOREIGN KEY (Ma_loai_san_pham_cha)
    REFERENCES Loai_san_pham (Ma_loai_san_pham)
    ON DELETE  CASCADE 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

