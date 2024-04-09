DELETE FROM nha_ban_hang where ma_nha_ban_hang < 6;
DELETE FROM san_pham WHERE ma_san_pham < 20;






INSERT INTO Nha_ban_hang(ma_nha_ban_hang, hinh_thuc_ban_hang, ten_gian_hang, cccd_cmnd, mat_khau, email_nha_ban_hang, quoc_tich, sdt_nha_ban_hang, stk_thanh_toan, ho_ten_nha_ban_hang, ho_ten, hinh_anh, logo, url_gian_hang, created_date, modified_date)
VALUES (1, 'FBT', 'SHOP Laptop', '123456789012', 'P@ssw0rdS3cureAndSafe2024!', 'nva@gmail.com', 'Việt Nam', '0912345678', '1234567890', 'Nguyễn Văn A','Nguyễn Văn A', 'shop-1.jpg', 'logo-1.jpg', 'http://tiki.vn/cua-hang/shop-1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       (2, 'FBT', 'THE GIO DIEN TUUU', '234567890123', 'S@feSecureP@ssword2024!', 'ttb@gmail.com', 'Việt Nam', '0923456789', '2345678901', 'Trần Thị B', 'Trần Thị B','shop-2.jpg', 'logo-2.jpg', 'http://tiki.vn/cua-hang/shop-2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       (3, 'FBT', 'SHOP ABC', '345678901234', 'An0therS3cureP@ssword!', 'lvc@gmail.com', 'Việt Nam', '0934567890', '3456789012', 'Lê Văn C', 'Lê Văn C', 'shop-3.jpg', 'logo-3.jpg', 'http://tiki.vn/cua-hang/shop-2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       (4, 'FBT', 'DO AN VAT', '456789012345', 'SecureP@ssword2024ForD!', 'ptd@gmail.com', 'Việt Nam', '0945678901', '4567890123', 'Phạm Thị D', 'Phạm Thị D', 'shop-4.jpg', 'logo-4.jpg', 'http://tiki.vn/cua-hang/shop-2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       (5, 'FBT', 'SHOP XYZ', '567890123456', 'P@ssw0rdV3ryS3cure2024!', 'hme@gmail.com', 'Việt Nam', '0956789012', '5678901234', 'Hoàng Minh E', 'Hoàng Minh E', 'shop-5.jpg', 'logo-5.jpg', 'http://tiki.vn/cua-hang/shop-2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


INSERT INTO Loai_san_pham (Ma_loai_san_pham, Ten, Mo_ta, Cap_do_loai_san_pham, Created_date, Modified_date, Ma_loai_san_pham_cha)
VALUES (1, 'Laptop - Máy Vi Tính - Linh kiện', 'Các sản phẩm máy vi tính bao gồm laptop, desktop và linh kiện điện tử.', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1),
       (2, 'Máy Vi Tính', 'Các sản phẩm máy vi tính để bàn.', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1),
       (3, 'Laptop', 'Các mẫu laptop mới nhất từ các thương hiệu hàng đầu.', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1),
       (4, 'Linh Kiện Điện Tử', 'Tất cả linh kiện điện tử cho máy vi tính và các thiết bị điện tử khác.', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1);

-- Laptop
INSERT INTO San_pham (Ma_san_pham, SKU, Ten_san_pham, Mo_ta_san_pham, Thuong_hieu, Ten_tac_gia, Thong_tin_chi_tiet, Thong_tin_bao_hanh, Dac_diem_noi_bat, Thong_tin_an_tam_mua_sam, Han_su_dung, So_luong_ton_kho, So_luong_da_ban, Diem_so_trung_binh, Created_date, Modified_date, Ma_loai_san_pham, Ma_nha_ban_hang)
VALUES (1, 'LAP12345', 'Laptop Gaming XYZ', 'Laptop gaming cao cấp với card đồ họa mạnh mẽ. Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 'XYZ', NULL, '{"description": "CPU i7, RAM 16GB, SSD 512GB, GPU RTX 3060"}', '{"description": "Bảo hành 2 năm"}', 'Hiệu suất cao, thiết kế mỏng nhẹ', '{"description": "1 đổi 1 trong 30 ngày đầu tiên"}', NULL, 50, 10, 4.5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 3, 1),
       (2, 'LAP23456', 'Laptop Doanh Nhân ABC', 'Laptop doanh nhân, thiết kế sang trọng, bảo mật cao. Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 'ABC', NULL, '{"description": "CPU i5, RAM 8GB, SSD 256GB"}', '{"description": "Bảo hành 2 năm"}', 'Bảo mật vân tay, trọng lượng nhẹ', '{"description": "Hỗ trợ trả góp 0%"}', NULL, 30, 5, 4.8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 3, 2);

-- Máy Vi Tính (Desktop)
INSERT INTO San_pham (Ma_san_pham, SKU, Ten_san_pham, Mo_ta_san_pham, Thuong_hieu, Ten_tac_gia, Thong_tin_chi_tiet, Thong_tin_bao_hanh, Dac_diem_noi_bat, Thong_tin_an_tam_mua_sam, Han_su_dung, So_luong_ton_kho, So_luong_da_ban, Diem_so_trung_binh, Created_date, Modified_date, Ma_loai_san_pham, Ma_nha_ban_hang)
VALUES (3, 'DESK34567', 'Desktop Gaming Pro', 'Máy tính để bàn chuyên game, cấu hình cao. Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 'ProGame', NULL, '{"description": "CPU i9, RAM 32GB, SSD 1TB, GPU RTX 3080"}', '{"description": "Bảo hành 3 năm"}', 'Tản nhiệt nước, RGB LED', '{"description": "Miễn phí vận chuyển"}', NULL, 20, 3, 4.9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 1),
       (4, 'DESK45678', 'Desktop Văn Phòng VPRO', 'Máy tính để bàn cho văn phòng, hiệu suất ổn định. Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 'VPRO', NULL, '{"description": "CPU i5, RAM 8GB, HDD 1TB"}', '{"description": "Bảo hành 2 năm"}', 'Tiết kiệm điện, hoạt động êm ái', '{"description": "Hỗ trợ cài đặt tận nơi"}', NULL, 100, 25, 4.2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 3);

-- Thiết Bị Điện Tử (Linh kiện và phụ kiện)
INSERT INTO San_pham (Ma_san_pham, SKU, Ten_san_pham, Mo_ta_san_pham, Thuong_hieu, Ten_tac_gia, Thong_tin_chi_tiet, Thong_tin_bao_hanh, Dac_diem_noi_bat, Thong_tin_an_tam_mua_sam, Han_su_dung, So_luong_ton_kho, So_luong_da_ban, Diem_so_trung_binh, Created_date, Modified_date, Ma_loai_san_pham, Ma_nha_ban_hang)
VALUES
    (5, 'RAM78901', 'RAM DDR4 8GB XYZ', 'RAM DDR4 8GB cho laptop và desktop. Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 'XYZ', NULL, '{"description": "DDR4, 8GB, 2666MHz"}', '{"description": "Bảo hành 5 năm"}', 'Tốc độ cao, ổn định', '{"description": "Đổi mới trong 6 tháng đầu"}', NULL, 200, 40, 4.7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 4, 1),
    (6, 'SSD89012', 'SSD 512GB ABC', 'Ổ cứng SSD 512GB tốc độ cao. Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 'ABC', NULL, '{"description": "512GB, NVMe, tốc độ đọc 3500MB/s"}', '{"description": "Bảo hành 3 năm"}', 'Tốc độ truyền dữ liệu nhanh', '{"description": "Hỗ trợ kỹ thuật miễn phí 12 tháng"}', NULL, 150, 30, 4.9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 4, 2),
    (7, 'GPU90123', 'GPU RTX 3070', 'Card đồ họa RTX 3070 cho gaming và đồ họa. Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 'Nvidia', NULL, '{"description": "8GB GDDR6, Ray Tracing, DLSS"}', '{"description": "Bảo hành 3 năm"}', 'Hiệu suất đồ họa cao', '{"description": "Hỗ trợ trả góp lãi suất 0%"}', NULL, 25, 7, 4.8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 4, 3),
    (8, 'MON01234', 'Monitor Gaming 144Hz', 'Màn hình gaming 27 inch, độ phân giải 1440p, tần số quét 144Hz. Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 'GameMax', NULL, '{"description": "27 inch, 1440p, 144Hz"}', '{"description": "Bảo hành 2 năm"}', 'Màu sắc sống động, độ trễ thấp', '{"description": "Hỗ trợ đổi trả trong 15 ngày"}', NULL, 50, 20, 4.6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 4, 1),
    (9, 'KEY34567', 'Bàn Phím Cơ Gaming RGB', 'Bàn phím cơ chuyên game, LED RGB. Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 'MechKey', NULL, '{"description": "Switch xanh, LED RGB, chống nước"}', '{"description": "Bảo hành 1 năm"}', 'Gõ êm, độ bền cao', '{"description": "Hỗ trợ đổi mới trong 1 tháng"}', NULL, 100, 50, 4.7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 4, 2),
    (10, 'MOU45678', 'Chuột Gaming RGB', 'Chuột gaming không dây, đèn LED RGB. Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 'Gamer', NULL, '{"description": "DPI có thể điều chỉnh, kết nối không dây"}', '{"description": "Bảo hành 1 năm"}', 'Độ chính xác cao, thiết kế thoải mái', '{"description": "Miễn phí vận chuyển"}', NULL, 150, 75, 4.5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 4, 3);

-- Laptop Xách Tay
INSERT INTO San_pham (Ma_san_pham, SKU, Ten_san_pham, Mo_ta_san_pham, Thuong_hieu, Ten_tac_gia, Thong_tin_chi_tiet, Thong_tin_bao_hanh, Dac_diem_noi_bat, Thong_tin_an_tam_mua_sam, Han_su_dung, So_luong_ton_kho, So_luong_da_ban, Diem_so_trung_binh, Created_date, Modified_date, Ma_loai_san_pham, Ma_nha_ban_hang)
VALUES(11, 'LAPXHT001', 'Laptop Xách Tay Dell XPS', 'Laptop Dell XPS xách tay từ Mỹ, mỏng nhẹ, hiệu suất cao. Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 'Dell', NULL, '{"description": "CPU i7, RAM 16GB, SSD 1TB, Màn hình 4K"}', '{"description": "Bảo hành quốc tế 1 năm"}', 'Màn hình 4K cảm ứng, thiết kế sang trọng', '{"description": "Cam kết chính hãng, hỗ trợ đổi trả trong 7 ngày"}', NULL, 10, 2, 5.0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 1),
      (12, 'MACXHT002', 'MacBook Pro 16 inch Xách Tay', 'MacBook Pro 16 inch 2021 xách tay từ Mỹ, bản cao cấp nhất. Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 'Apple', NULL, '{"description": "Apple M1 Pro, RAM 32GB, SSD 1TB"}', '{"description": "Bảo hành quốc tế 1 năm"}', 'Hiệu suất mạnh mẽ, màn hình Retina', '{"description": "Cam kết chính hãng, hỗ trợ đổi trả trong 7 ngày"}', NULL, 5, 1, 5.0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2);


INSERT INTO Mau_sac_san_pham (Ma_san_pham, Ma_mau_sac, Ten_mau_sac)
VALUES
    (1, 1, 'Trắng'),
    (1, 2, 'Đen'),
    (2, 1, 'Trắng'),
    (2, 2, 'Đen'),
    (3, 1, 'Trắng'),
    (3, 2, 'Đen'),
    (4, 1, 'Trắng'),
    (4, 2, 'Đen'),
    (5, 1, 'Trắng'),
    (5, 2, 'Đen'),
    (6, 1, 'Trắng'),
    (6, 2, 'Đen'),
    (7, 1, 'Trắng'),
    (7, 2, 'Đen'),
    (8, 1, 'Trắng'),
    (8, 2, 'Đen'),
    (9, 1, 'Trắng'),
    (9, 2, 'Đen'),
    (10, 1, 'Trắng'),
    (10, 2, 'Đen'),
    (11, 1, 'Trắng'),
    (11, 2, 'Đen'),
    (12, 1, 'Trắng'),
    (12, 2, 'Đen');

-- check
SELECT
    sp.ma_san_pham,
    sp.sku,
    ten_san_pham, mo_ta_san_pham,
    thong_tin_chi_tiet thong_tin_chi_tiet_san_pham,
    dac_diem_noi_bat dac_diem_noi_bat_san_pham,
    ten_gian_hang, thuong_hieu, diem_so_trung_binh
FROM san_pham sp
LEFT join Nha_ban_hang nbh on sp.Ma_nha_ban_hang = nbh.Ma_nha_ban_hang
left join Loai_san_pham lsp on sp.Ma_loai_san_pham = lsp.Ma_loai_san_pham
-- left join mau_sac_san_pham mssp on sp.Ma_san_pham = mssp.Ma_san_pham
-- WHERE sp.Ma_san_pham = 1;



insert into trang_thai_don_hang
    (ma_trang_thai, ten_trang_thai, mo_ta_trang_thai, created_date, modified_date)
values
    (1, 'Chờ xác nhận', 'Đơn hàng chờ xác nhận', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 'Đang xử lý', 'Đơn hàng đang được xử lý', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (3, 'Đang vận chuyển', 'Đơn hàng đang vận chuyển', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (4, 'Giao hàng thành công', 'Đơn hàng đã được giao thành công', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (5, 'Đã hủy', 'Đơn hàng đã bị hủy', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


insert into don_vi_van_chuyen(ma_dvvc, ten_dvvc, loai_dvvc, mo_ta, khuyen_mai_van_chuyen, phi_van_chuyen_3kg_dau_tien_vnd, phi_van_chuyen_moi_0_5kg_vnd, created_date, modified_date)
values(1, 'TikiNOW Smart Logistics', 1, 'Dịch vụ giao hàng siêu tốc 2h -3h', 0, 25000, 2000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);



insert into don_hang(MA_DON_HANG, DIA_CHI_NHAN_HANG, SDT_NGUOI_NHAN, NGAY_NHAN_HANG_THUC_TE, NGAY_GIAO_HANG_DU_KIEN, NGAY_NHAN_HANG_DU_KIEN, MA_DON_VI_VAN_CHUYEN, CREATED_DATE, MODIFIED_DATE)
VALUES
    (1, '123 Nguyen Thi Minh Khai, Q5, TP.HCM', 0123456789, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, '456 Nguyen Van Cu, Q5, TP.HCM', 0123456789, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (3, '789 Nguyen Trai, Q5, TP.HCM', 0123456789, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (4, '1011 Nguyen Dinh Chieu, Q5, TP.HCM', 0123456789, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (5, '1213 Nguyen Van Linh, Q5, TP.HCM', 0123456789, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into chi_tiet_trang_thai_don_hang(ma_chi_tiet_trang_thai_don_hang, ma_don_hang, ma_trang_thai, Thoi_gian_xu_ly_trang_thai, mo_ta_chi_tiet, created_date, modified_date)
values
    (1,1,1, '2024-04-10 00:00:00', 'Chờ Tiki xác nhận', current_timestamp, current_timestamp),
    (2,1,2, '2024-04-10 00:01:00', 'Sẵn sàng lấy hàng', current_timestamp, current_timestamp),
    (3,1,2, '2024-04-10 00:02:00', 'Đang lấy hàng', current_timestamp, current_timestamp),
    (4,1,2, '2024-04-10 00:03:00', 'Đang đóng gói', current_timestamp, current_timestamp),
    (5,2,1, '2024-04-10 00:00:00', 'Chờ Tiki xác nhận', current_timestamp, current_timestamp),
    (6,2,2, '2024-04-10 00:01:00', 'Sẵn sàng lấy hàng', current_timestamp, current_timestamp),
    (7,2,2, '2024-04-10 00:02:00', 'Đang lấy hàng', current_timestamp, current_timestamp),
    (8,2,2, '2024-04-10 00:03:00', 'Đang đóng gói', current_timestamp, current_timestamp),
    (9,2,3, '2024-04-10 00:10:00', 'Đang vận chuyển', current_timestamp, current_timestamp),
    (10,3,1, '2024-04-10 00:00:00', 'Chờ Tiki xác nhận', current_timestamp, current_timestamp);


-- don hang xu ly
with tmp as (
select ma_don_hang
from chi_tiet_trang_thai_don_hang
group by 1
having max(ma_trang_thai)=2)
select c.*
from don_hang c
join tmp on tmp.ma_don_hang=c.ma_don_hang;

insert into nguoi_dung(
    ma_dinh_danh_nguoi_dung, thoi_gian_truy_cap_lan_cuoi, ip_address, thiet_bi_su_dung, ma_quoc_gia, quoc_gia, ma_khu_vuc, khu_vuc, mui_gio, tinh_thanh_pho, quan_xa_huyen, kinh_do, vi_do)
values (1, '2024-04-10 00:00:00', '123.123.123.123', 'Iphone 11', 'VN', 'Viet Nam', 'HCM', 'Ho Chi Minh', 'UTC+7', 'Quan 1', 'Phuong Ben Thanh', 106.6992, 10.7716),
       (2, '2024-04-10 00:00:00', '111.111.111.333', 'Samsung Galaxy S21', 'VN', 'Viet Nam', 'HCM', 'Ho Chi Minh', 'UTC+7', 'Quan 2', 'Phuong Thao Dien', 106.7373, 10.8016),
       (3, '2024-04-10 00:00:00', '222.222.222.444', 'Iphone 12', 'VN', 'Viet Nam', 'HCM', 'Ho Chi Minh', 'UTC+7', 'Quan 3', 'Phuong Pham Ngu Lao', 106.6872, 10.7766);

insert into nguoi_dung_tiki(
    ma_nguoi_dung_tiki, ho_va_ten, gioi_tinh, kenh_xac_thuc, ngay_sinh, ten_dang_nhap,
    avatar_url, quoc_tich, mat_khau, email_dang_nhap, sdt_dang_nhap, ma_dinh_danh_nguoi_dung)
values (1, 'Nguyễn Văn A', 'Nam', 'Email', '1990-01-01', 'ngvana', 'avatar-1.jpg', 'Việt Nam', 'P@ssw0rdS3cureAndSafe2024!','vana@gmail.com',
        '0912345678', 1),
         (2, 'Trần Thị B', 'Nữ', 'Email', '1991-02-02', 'tranthb', 'avatar-2.jpg', 'Việt Nam', 'S@feSecureP@ssword2024!','thib@gmail.com',
        '0923456789', 2),
         (3, 'Lê Văn C', 'Nam', 'Email', '1992-03-03', 'levanc', 'avatar-3.jpg', 'Việt Nam', 'An0therS3cureP@ssword!','vanc@gmail.com',
        '0934567890', 3);
