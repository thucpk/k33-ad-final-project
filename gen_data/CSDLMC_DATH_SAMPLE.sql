INSERT INTO Nha_ban_hang
VALUES (1, 'FBT', 'SHOP Laptop', '123456789012', 'P@ssw0rdS3cureAndSafe2024!', 'nva@gmail.com', 'Việt Nam', '0912345678', '1234567890', 'Nguyễn Văn A', 'Gian hàng A', 'link-to-image-a.jpg', 'link-to-logo-a.jpg', 'http://gianhanga.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       (2, 'FBT', 'THE GIO DIEN TUUU', '234567890123', 'S@feSecureP@ssword2024!', 'ttb@gmail.com', 'Việt Nam', '0923456789', '2345678901', 'Trần Thị B', 'Gian hàng B', 'link-to-image-b.jpg', 'link-to-logo-b.jpg', 'http://gianhangb.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       (3, 'FBT', 'SHOP ABC', '345678901234', 'An0therS3cureP@ssword!', 'lvc@gmail.com', 'Việt Nam', '0934567890', '3456789012', 'Lê Văn C', 'Gian hàng C', 'link-to-image-c.jpg', 'link-to-logo-c.jpg', 'http://gianhangc.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       (4, 'FBT', 'DO AN VAT', '456789012345', 'SecureP@ssword2024ForD!', 'ptd@gmail.com', 'Việt Nam', '0945678901', '4567890123', 'Phạm Thị D', 'Gian hàng D', 'link-to-image-d.jpg', 'link-to-logo-d.jpg', 'http://gianhangd.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       (5, 'FBT', 'SHOP XYZ', '567890123456', 'P@ssw0rdV3ryS3cure2024!', 'hme@gmail.com', 'Việt Nam', '0956789012', '5678901234', 'Hoàng Minh E', 'Gian hàng E', 'link-to-image-e.jpg', 'link-to-logo-e.jpg', 'http://gianhange.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


INSERT INTO Loai_san_pham (Ma_loai_san_pham, Ten, Mo_ta, Cap_do_loai_san_pham, Created_date, Modified_date, Ma_loai_san_pham_cha)
VALUES (1, 'Laptop - Máy Vi Tính - Linh kiện', 'Các sản phẩm máy vi tính bao gồm laptop, desktop và linh kiện điện tử.', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1),
       (2, 'Máy Vi Tính', 'Các sản phẩm máy vi tính để bàn.', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1),
       (3, 'Laptop', 'Các mẫu laptop mới nhất từ các thương hiệu hàng đầu.', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1),
       (4, 'Linh Kiện Điện Tử', 'Tất cả linh kiện điện tử cho máy vi tính và các thiết bị điện tử khác.', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1);

-- Laptop
INSERT INTO San_pham (Ma_san_pham, SKU, Ten_san_pham, Mo_ta_san_pham, Thuong_hieu, Ten_tac_gia, Thong_tin_chi_tiet, Thong_tin_bao_hanh, Dac_diem_noi_bat, Thong_tin_an_tam_mua_sam, Han_su_dung, So_luong_ton_kho, So_luong_da_ban, Diem_so_trung_binh, Created_date, Modified_date, Ma_loai_san_pham, Ma_nha_ban_hang)
VALUES (1, 'LAP12345', 'Laptop Gaming XYZ', 'Laptop gaming cao cấp với card đồ họa mạnh mẽ', 'XYZ', NULL, '{"description": "CPU i7, RAM 16GB, SSD 512GB, GPU RTX 3060"}', '{"description": "Bảo hành 2 năm"}', 'Hiệu suất cao, thiết kế mỏng nhẹ', '{"description": "1 đổi 1 trong 30 ngày đầu tiên"}', NULL, 50, 10, 4.5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 3, 1),
       (2, 'LAP23456', 'Laptop Doanh Nhân ABC', 'Laptop doanh nhân, thiết kế sang trọng, bảo mật cao', 'ABC', NULL, '{"description": "CPU i5, RAM 8GB, SSD 256GB"}', '{"description": "Bảo hành 2 năm"}', 'Bảo mật vân tay, trọng lượng nhẹ', '{"description": "Hỗ trợ trả góp 0%"}', NULL, 30, 5, 4.8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 3, 2);

-- Máy Vi Tính (Desktop)
INSERT INTO San_pham (Ma_san_pham, SKU, Ten_san_pham, Mo_ta_san_pham, Thuong_hieu, Ten_tac_gia, Thong_tin_chi_tiet, Thong_tin_bao_hanh, Dac_diem_noi_bat, Thong_tin_an_tam_mua_sam, Han_su_dung, So_luong_ton_kho, So_luong_da_ban, Diem_so_trung_binh, Created_date, Modified_date, Ma_loai_san_pham, Ma_nha_ban_hang)
VALUES (3, 'DESK34567', 'Desktop Gaming Pro', 'Máy tính để bàn chuyên game, cấu hình cao', 'ProGame', NULL, '{"description": "CPU i9, RAM 32GB, SSD 1TB, GPU RTX 3080"}', '{"description": "Bảo hành 3 năm"}', 'Tản nhiệt nước, RGB LED', '{"description": "Miễn phí vận chuyển"}', NULL, 20, 3, 4.9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 1),
       (4, 'DESK45678', 'Desktop Văn Phòng VPRO', 'Máy tính để bàn cho văn phòng, hiệu suất ổn định', 'VPRO', NULL, '{"description": "CPU i5, RAM 8GB, HDD 1TB"}', '{"description": "Bảo hành 2 năm"}', 'Tiết kiệm điện, hoạt động êm ái', '{"description": "Hỗ trợ cài đặt tận nơi"}', NULL, 100, 25, 4.2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 3);

-- Thiết Bị Điện Tử (Linh kiện và phụ kiện)
INSERT INTO San_pham (Ma_san_pham, SKU, Ten_san_pham, Mo_ta_san_pham, Thuong_hieu, Ten_tac_gia, Thong_tin_chi_tiet, Thong_tin_bao_hanh, Dac_diem_noi_bat, Thong_tin_an_tam_mua_sam, Han_su_dung, So_luong_ton_kho, So_luong_da_ban, Diem_so_trung_binh, Created_date, Modified_date, Ma_loai_san_pham, Ma_nha_ban_hang)
VALUES
    (5, 'RAM78901', 'RAM DDR4 8GB XYZ', 'RAM DDR4 8GB cho laptop và desktop', 'XYZ', NULL, '{"description": "DDR4, 8GB, 2666MHz"}', '{"description": "Bảo hành 5 năm"}', 'Tốc độ cao, ổn định', '{"description": "Đổi mới trong 6 tháng đầu"}', NULL, 200, 40, 4.7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 4, 1),
    (6, 'SSD89012', 'SSD 512GB ABC', 'Ổ cứng SSD 512GB tốc độ cao', 'ABC', NULL, '{"description": "512GB, NVMe, tốc độ đọc 3500MB/s"}', '{"description": "Bảo hành 3 năm"}', 'Tốc độ truyền dữ liệu nhanh', '{"description": "Hỗ trợ kỹ thuật miễn phí 12 tháng"}', NULL, 150, 30, 4.9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 4, 2),
    (7, 'GPU90123', 'GPU RTX 3070', 'Card đồ họa RTX 3070 cho gaming và đồ họa', 'Nvidia', NULL, '{"description": "8GB GDDR6, Ray Tracing, DLSS"}', '{"description": "Bảo hành 3 năm"}', 'Hiệu suất đồ họa cao', '{"description": "Hỗ trợ trả góp lãi suất 0%"}', NULL, 25, 7, 4.8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 4, 3),
    (8, 'MON01234', 'Monitor Gaming 144Hz', 'Màn hình gaming 27 inch, độ phân giải 1440p, tần số quét 144Hz', 'GameMax', NULL, '{"description": "27 inch, 1440p, 144Hz"}', '{"description": "Bảo hành 2 năm"}', 'Màu sắc sống động, độ trễ thấp', '{"description": "Hỗ trợ đổi trả trong 15 ngày"}', NULL, 50, 20, 4.6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 4, 1),
    (9, 'KEY34567', 'Bàn Phím Cơ Gaming RGB', 'Bàn phím cơ chuyên game, LED RGB', 'MechKey', NULL, '{"description": "Switch xanh, LED RGB, chống nước"}', '{"description": "Bảo hành 1 năm"}', 'Gõ êm, độ bền cao', '{"description": "Hỗ trợ đổi mới trong 1 tháng"}', NULL, 100, 50, 4.7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 4, 2),
    (10, 'MOU45678', 'Chuột Gaming RGB', 'Chuột gaming không dây, đèn LED RGB', 'Gamer', NULL, '{"description": "DPI có thể điều chỉnh, kết nối không dây"}', '{"description": "Bảo hành 1 năm"}', 'Độ chính xác cao, thiết kế thoải mái', '{"description": "Miễn phí vận chuyển"}', NULL, 150, 75, 4.5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 4, 3);

-- Laptop Xách Tay
INSERT INTO San_pham (Ma_san_pham, SKU, Ten_san_pham, Mo_ta_san_pham, Thuong_hieu, Ten_tac_gia, Thong_tin_chi_tiet, Thong_tin_bao_hanh, Dac_diem_noi_bat, Thong_tin_an_tam_mua_sam, Han_su_dung, So_luong_ton_kho, So_luong_da_ban, Diem_so_trung_binh, Created_date, Modified_date, Ma_loai_san_pham, Ma_nha_ban_hang)
VALUES(11, 'LAPXHT001', 'Laptop Xách Tay Dell XPS', 'Laptop Dell XPS xách tay từ Mỹ, mỏng nhẹ, hiệu suất cao', 'Dell', NULL, '{"description": "CPU i7, RAM 16GB, SSD 1TB, Màn hình 4K"}', '{"description": "Bảo hành quốc tế 1 năm"}', 'Màn hình 4K cảm ứng, thiết kế sang trọng', '{"description": "Cam kết chính hãng, hỗ trợ đổi trả trong 7 ngày"}', NULL, 10, 2, 5.0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 1),
      (12, 'MACXHT002', 'MacBook Pro 16 inch Xách Tay', 'MacBook Pro 16 inch 2021 xách tay từ Mỹ, bản cao cấp nhất', 'Apple', NULL, '{"description": "Apple M1 Pro, RAM 32GB, SSD 1TB"}', '{"description": "Bảo hành quốc tế 1 năm"}', 'Hiệu suất mạnh mẽ, màn hình Retina', '{"description": "Cam kết chính hãng, hỗ trợ đổi trả trong 7 ngày"}', NULL, 5, 1, 5.0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2);


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
-- SELECT sp.*, nbh.*, lsp.*
-- FROM san_pham sp
-- LEFT join Nha_ban_hang nbh on sp.Ma_nha_ban_hang = nbh.Ma_nha_ban_hang
-- left join Loai_san_pham lsp on sp.Ma_loai_san_pham = lsp.Ma_loai_san_pham
-- left join mau_sac_san_pham mssp on sp.Ma_san_pham = mssp.Ma_san_pham
-- WHERE sp.Ma_san_pham = 1;