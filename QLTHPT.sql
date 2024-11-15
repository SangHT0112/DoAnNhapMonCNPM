create database QLTHPT
go

USE QLTHPT
GO

-- B?ng NGUOIDUNG không thay ??i
CREATE TABLE NGUOIDUNG (
    MaTK CHAR(10) PRIMARY KEY,
    TenDangNhap NVARCHAR(30),
    MatKhau NVARCHAR(30),
    LoaiTK NVARCHAR(10)
);

insert into NGUOIDUNG values(N'TK01',N'admin',N'123456', 'admin')	
insert into NGUOIDUNG values(N'TK02',N'giaovien',N'123456', 'giaovien')
insert into NGUOIDUNG values(N'TK03',N'giaovu',N'123456', 'giaovu')

-- B?ng CHUCVU không thay ??i
CREATE TABLE CHUCVU (
    MaCV CHAR(10) PRIMARY KEY,
    TenCV NVARCHAR(20)
);
insert into CHUCVU values('GV',N'Giáo viên')
insert into CHUCVU values('HT',N'Hiệu Trưởng')
insert into CHUCVU values('GVu',N'Giáo Vụ')

-- B?ng KHOI không thay ??i
CREATE TABLE KHOI (
    MaKhoi CHAR(10) PRIMARY KEY,
    TenKhoi NVARCHAR(20)
);
insert into KHOI values('K10',N'Khối 10')
insert into KHOI values('K11',N'Khối 11')
insert into KHOI values('K12',N'Khối 12')
select * from KHOI

-- B?ng GIAOVIEN thêm S? ?i?n tho?i
CREATE TABLE GIAOVIEN (
    MaGV CHAR(10) PRIMARY KEY,
    HoTenGV NVARCHAR(50),
    NgaySinh SMALLDATETIME,
    GioiTinh BIT,
    DiaChi NVARCHAR(255),
    SDT NVARCHAR(15),
    MaCV CHAR(10),
    MaKhoi CHAR(10),
    CONSTRAINT FK_giaovien FOREIGN KEY (MaCV) REFERENCES CHUCVU(MaCV)
);

INSERT INTO GIAOVIEN (MaGV, HoTenGV, NgaySinh, GioiTinh, DiaChi, SDT, MaCV, MaKhoi)
VALUES
('GV01', N'Lê Thanh Tùng', '1978-02-10', 1, N'Tiền Giang', '0912345678', 'GV', 'K10'),
('GV02', N'Nguyễn Văn Toàn', '1978-06-09', 1, N'Tiền Giang', '0913456789', 'GV', 'K10'),
('GV03', N'Nguyễn Thị Thu Thủy', '1970-06-04', 0, N'Tiền Giang', '0914567890', 'GV', 'K11'),
('GV04', N'Trần Thị Mỹ Dung', '1979-09-04', 0, N'Tiền Giang', '0915678901', 'GV', 'K11'),
('GV05', N'Lê Thị Thanh Hiền', '1989-03-08', 0, N'Tiền Giang', '0916789012', 'GV', 'K12');
INSERT INTO GIAOVIEN (MaGV, HoTenGV, NgaySinh, GioiTinh, DiaChi, SDT, MaCV, MaKhoi)
VALUES
('GV06', N'Lê Thị Diễm Hương', '1988-10-29', 0, N'Tiền Giang', '0917890123', 'GV', 'K10'),
('GV07', N'Nguyễn Thành Trung', '1969-10-02', 1, N'Tiền Giang', '0918901234', 'GV', 'K10'),
('GV08', N'Nguyễn Thị Thanh Thúy', '1976-07-06', 0, N'Tiền Giang', '0919012345', 'GV', 'K11'),
('GV09', N'Trần Thị Kim Hương', '1989-04-08', 0, N'Tiền Giang', '0920123456', 'GV', 'K11'),
('GV10', N'Lê Thanh Tú', '1969-08-03', 1, N'Tiền Giang', '0921234567', 'GV', 'K12'),
('GV11', N'Trần Thanh Liêm', '1979-08-13', 1, N'Tiền Giang', '0922345678', 'GV', 'K12'),
('GV12', N'Nguyễn Thị Cẩm Tiên', '1989-09-28', 0, N'Tiền Giang', '0923456789', 'GV', 'K10'),
('GV13', N'Nguyễn Thị Kim Chi', '1985-07-16', 0, N'Tiền Giang', '0924567890', 'GV', 'K11'),
('GV14', N'Trần Huỳnh Ngọc Tưởng', '1980-03-26', 1, N'Tiền Giang', '0925678901', 'GV', 'K12'),
('GV15', N'Trần Huỳnh Trang', '1976-09-16', 0, N'Tiền Giang', '0926789012', 'GV', 'K12');

-- B?ng LOP thêm Niên khóa (NamHoc)
CREATE TABLE LOP (
    MaLop CHAR(10) PRIMARY KEY,
    TenLop NVARCHAR(20),
    MaKhoi CHAR(10),
    MaGV CHAR(10),
    SiSo INT,
    NamHoc VARCHAR(50),
    CONSTRAINT FK_lop_khoi FOREIGN KEY (MaKhoi) REFERENCES KHOI(MaKhoi),
    CONSTRAINT FK_lop_giaovien FOREIGN KEY (MaGV) REFERENCES GIAOVIEN(MaGV)
);
INSERT INTO LOP (MaLop, TenLop, MaKhoi, MaGV, SiSo, NamHoc)
VALUES
-- Lớp khối 10
('10A1', N'Lớp 10A1', 'K10', 'GV01', 15, '2020'),
('10A2', N'Lớp 10A2', 'K10', 'GV02', 18, '2020'),
('10A3', N'Lớp 10A3', 'K10', 'GV06', 12, '2020'),
('10A4', N'Lớp 10A4', 'K10', 'GV07', 17, '2020'),
('10A5', N'Lớp 10A5', 'K10', 'GV12', 20, '2020'),

-- Lớp khối 11
('11A1', N'Lớp 11A1', 'K11', 'GV03', 16, '2020'),
('11A2', N'Lớp 11A2', 'K11', 'GV04', 18, '2020'),
('11A3', N'Lớp 11A3', 'K11', 'GV08', 14, '2020'),
('11A4', N'Lớp 11A4', 'K11', 'GV09', 19, '2020'),
('11A5', N'Lớp 11A5', 'K11', 'GV13', 13, '2020'),

-- Lớp khối 12
('12A1', N'Lớp 12A1', 'K12', 'GV05', 17, '2020'),
('12A2', N'Lớp 12A2', 'K12', 'GV10', 19, '2020'),
('12A3', N'Lớp 12A3', 'K12', 'GV11', 15, '2020'),
('12A4', N'Lớp 12A4', 'K12', 'GV14', 18, '2020'),
('12A5', N'Lớp 12A5', 'K12', 'GV15', 20, '2020');

-- B?ng HOCSINH thêm S? ?i?n tho?i ph? huynh
CREATE TABLE HOCSINH (
    MaHS CHAR(10) PRIMARY KEY,
    HoTenHS NVARCHAR(50),
    NgaySinh DATETIME,
    GioiTinh BIT,
    DiaChi NVARCHAR(255),
    SDTPhuHuynh NVARCHAR(15),
    MaKhoi CHAR(10),
    MaLop CHAR(10),
    CONSTRAINT FK_hocsinh_lop FOREIGN KEY (MaLop) REFERENCES LOP(MaLop),
    CONSTRAINT FK_hocsinh_khoi FOREIGN KEY (MaKhoi) REFERENCES KHOI(MaKhoi)
);

-- Insert học sinh vào lớp 10A1
INSERT INTO HOCSINH (MaHS, HoTenHS, NgaySinh, GioiTinh, DiaChi, SDTPhuHuynh, MaKhoi, MaLop)
VALUES
('HS001', N'Nguyễn Minh Anh', '2005-05-01', 1, N'Số 1, phố Lê Duẩn, Hà Nội', N'0123456789', 'K10', '10A1'),
('HS002', N'Phan Thị Mai', '2005-06-02', 0, N'Số 2, phố Nguyễn Trãi, Hà Nội', N'0123456790', 'K10', '10A1'),
('HS003', N'Lê Quang Duy', '2005-07-03', 1, N'Số 3, phố Hàng Bạc, Hà Nội', N'0123456791', 'K10', '10A1'),
('HS004', N'Vũ Thị Thuỳ Dung', '2005-08-04', 0, N'Số 4, phố Bùi Thị Xuân, Hà Nội', N'0123456792', 'K10', '10A1'),
('HS005', N'Nguyễn Đức Anh', '2005-09-05', 1, N'Số 5, phố Trần Phú, Hà Nội', N'0123456793', 'K10', '10A1'),
('HS006', N'Trần Minh Tú', '2005-10-06', 0, N'Số 6, phố Phạm Ngọc Thạch, Hà Nội', N'0123456794', 'K10', '10A1'),
('HS007', N'Hoàng Thiên Minh', '2005-11-07', 1, N'Số 7, phố Xã Đàn, Hà Nội', N'0123456795', 'K10', '10A1'),
('HS008', N'Ngô Thị Lan Anh', '2005-12-08', 0, N'Số 8, phố Minh Khai, Hà Nội', N'0123456796', 'K10', '10A1'),
('HS009', N'Phạm Đức Nam', '2006-01-09', 1, N'Số 9, phố Cầu Giấy, Hà Nội', N'0123456797', 'K10', '10A1'),
('HS010', N'Bùi Thị Thanh Hương', '2006-02-10', 0, N'Số 10, phố Nguyễn Đình Chiểu, Hà Nội', N'0123456798', 'K10', '10A1'),
('HS011', N'Nguyễn Văn Long', '2006-03-11', 1, N'Số 11, phố Đinh Tiên Hoàng, Hà Nội', N'0123456799', 'K10', '10A1'),
('HS012', N'Phan Hoàng Lan', '2006-04-12', 0, N'Số 12, phố Hoàng Cầu, Hà Nội', N'0123456800', 'K10', '10A1'),
('HS013', N'Vũ Minh Quân', '2006-05-13', 1, N'Số 13, phố Láng Hạ, Hà Nội', N'0123456801', 'K10', '10A1'),
('HS014', N'Lê Thị Bích Ngọc', '2006-06-14', 0, N'Số 14, phố Thái Hà, Hà Nội', N'0123456802', 'K10', '10A1'),
('HS015', N'Hoàng Minh Hoàng', '2006-07-15', 1, N'Số 15, phố Nguyễn Văn Cừ, Hà Nội', N'0123456803', 'K10', '10A1');

-- Insert học sinh vào lớp 10A2
INSERT INTO HOCSINH (MaHS, HoTenHS, NgaySinh, GioiTinh, DiaChi, SDTPhuHuynh, MaKhoi, MaLop)
VALUES
('HS016', N'Nguyễn Thị Bảo Ngọc', '2005-05-02', 0, N'Số 16, phố Kim Mã, Hà Nội', N'0123456804', 'K10', '10A2'),
('HS017', N'Phan Quang Vũ', '2005-06-03', 1, N'Số 17, phố Lý Thái Tổ, Hà Nội', N'0123456805', 'K10', '10A2'),
('HS018', N'Lê Thiên Minh', '2005-07-04', 1, N'Số 18, phố Chùa Bộc, Hà Nội', N'0123456806', 'K10', '10A2'),
('HS019', N'Vũ Thị Kim Dung', '2005-08-05', 0, N'Số 19, phố Nguyễn Khuyến, Hà Nội', N'0123456807', 'K10', '10A2'),
('HS020', N'Nguyễn Thị Lan', '2005-09-06', 0, N'Số 20, phố Hoàng Cầu, Hà Nội', N'0123456808', 'K10', '10A2'),
('HS021', N'Trần Đình Quân', '2005-10-07', 1, N'Số 21, phố Hòa Mã, Hà Nội', N'0123456809', 'K10', '10A2'),
('HS022', N'Hoàng Linh Chi', '2005-11-08', 0, N'Số 22, phố Lê Văn Lương, Hà Nội', N'0123456810', 'K10', '10A2'),
('HS023', N'Ngô Thị Bích Ngọc', '2005-12-09', 0, N'Số 23, phố Tây Sơn, Hà Nội', N'0123456811', 'K10', '10A2'),
('HS024', N'Phạm Hoàng Thiên', '2006-01-10', 1, N'Số 24, phố Chùa Láng, Hà Nội', N'0123456812', 'K10', '10A2'),
('HS025', N'Đoàn Minh Tuấn', '2006-02-11', 1, N'Số 25, phố Trần Duy Hưng, Hà Nội', N'0123456813', 'K10', '10A2'),
('HS026', N'Trần Minh Anh', '2006-03-12', 0, N'Số 26, phố Minh Khai, Hà Nội', N'0123456814', 'K10', '10A2'),
('HS027', N'Nguyễn Thiện Lộc', '2006-04-13', 1, N'Số 27, phố Kim Ngưu, Hà Nội', N'0123456815', 'K10', '10A2'),
('HS028', N'Phan Mai Phương', '2006-05-14', 0, N'Số 28, phố Lý Nam Đế, Hà Nội', N'0123456816', 'K10', '10A2'),
('HS029', N'Trương Hoàng Quý', '2006-06-15', 1, N'Số 29, phố Trường Chinh, Hà Nội', N'0123456817', 'K10', '10A2'),
('HS030', N'Nguyễn Hữu Quân', '2006-07-16', 1, N'Số 30, phố Thái Thịnh, Hà Nội', N'0123456818', 'K10', '10A2'),
('HS031', N'Hoàng Kim Ngân', '2006-08-17', 0, N'Số 31, phố Phan Đình Phùng, Hà Nội', N'0123456819', 'K10', '10A2'),
('HS032', N'Lê Minh Quang', '2006-09-18', 1, N'Số 32, phố Hoàng Mai, Hà Nội', N'0123456820', 'K10', '10A2'),
('HS033', N'Vũ Thiên Kim', '2006-10-19', 0, N'Số 33, phố Tạ Quang Bửu, Hà Nội', N'0123456821', 'K10', '10A2');

-- Insert học sinh vào lớp 10A3 (SiSo = 12)
INSERT INTO HOCSINH (MaHS, HoTenHS, NgaySinh, GioiTinh, DiaChi, SDTPhuHuynh, MaKhoi, MaLop)
VALUES
('HS034', N'Nguyễn Thị Thu Hà', '2005-05-01', 0, N'Số 34, phố Đào Tấn, Hà Nội', N'0123456822', 'K10', '10A3'),
('HS035', N'Phan Quang Huy', '2005-06-02', 1, N'Số 35, phố Bà Triệu, Hà Nội', N'0123456823', 'K10', '10A3'),
('HS036', N'Lê Thiên Kim', '2005-07-03', 0, N'Số 36, phố Đại Cồ Việt, Hà Nội', N'0123456824', 'K10', '10A3'),
('HS037', N'Vũ Minh Tiến', '2005-08-04', 1, N'Số 37, phố Trần Hưng Đạo, Hà Nội', N'0123456825', 'K10', '10A3'),
('HS038', N'Nguyễn Thị Lan', '2005-09-05', 0, N'Số 38, phố Trần Phú, Hà Nội', N'0123456826', 'K10', '10A3'),
('HS039', N'Trần Thiếu Anh', '2005-10-06', 1, N'Số 39, phố Phố Huế, Hà Nội', N'0123456827', 'K10', '10A3'),
('HS040', N'Hoàng Mai Hương', '2005-11-07', 0, N'Số 40, phố Xuân Thủy, Hà Nội', N'0123456828', 'K10', '10A3'),
('HS041', N'Ngô Duy Minh', '2005-12-08', 1, N'Số 41, phố Yên Hòa, Hà Nội', N'0123456829', 'K10', '10A3'),
('HS042', N'Phan Minh Quang', '2006-01-09', 1, N'Số 42, phố Nguyễn Văn Cừ, Hà Nội', N'0123456830', 'K10', '10A3'),
('HS043', N'Trương Thị Mai', '2006-02-10', 0, N'Số 43, phố Hoàng Mai, Hà Nội', N'0123456831', 'K10', '10A3'),
('HS044', N'Nguyễn Đức Quân', '2006-03-11', 1, N'Số 44, phố Cầu Giấy, Hà Nội', N'0123456832', 'K10', '10A3'),
('HS045', N'Lê Thị Lan Anh', '2006-04-12', 0, N'Số 45, phố Láng Hạ, Hà Nội', N'0123456833', 'K10', '10A3');

-- Insert học sinh vào lớp 10A4 (SiSo = 17)
INSERT INTO HOCSINH (MaHS, HoTenHS, NgaySinh, GioiTinh, DiaChi, SDTPhuHuynh, MaKhoi, MaLop)
VALUES
('HS046', N'Nguyễn Hữu Tài', '2005-05-01', 1, N'Số 46, phố Vĩnh Hồ, Hà Nội', N'0123456834', 'K10', '10A4'),
('HS047', N'Trần Thị Lan', '2005-06-02', 0, N'Số 47, phố Phạm Ngọc Thạch, Hà Nội', N'0123456835', 'K10', '10A4'),
('HS048', N'Hoàng Thanh Vân', '2005-07-03', 0, N'Số 48, phố Hàng Bạc, Hà Nội', N'0123456836', 'K10', '10A4'),
('HS049', N'Vũ Minh Lương', '2005-08-04', 1, N'Số 49, phố Kim Mã, Hà Nội', N'0123456837', 'K10', '10A4'),
('HS050', N'Lê Tiến Đạt', '2005-09-05', 1, N'Số 50, phố Định Công, Hà Nội', N'0123456838', 'K10', '10A4'),
('HS051', N'Nguyễn Huy Trường', '2005-10-06', 1, N'Số 51, phố Tây Sơn, Hà Nội', N'0123456839', 'K10', '10A4'),
('HS052', N'Phạm Thanh Tùng', '2005-11-07', 1, N'Số 52, phố Trường Chinh, Hà Nội', N'0123456840', 'K10', '10A4'),
('HS053', N'Nguyễn Thị Linh', '2005-12-08', 0, N'Số 53, phố Láng, Hà Nội', N'0123456841', 'K10', '10A4'),
('HS054', N'Trần Duy Thanh', '2006-01-09', 1, N'Số 54, phố Cầu Giấy, Hà Nội', N'0123456842', 'K10', '10A4'),
('HS055', N'Vũ Minh Tâm', '2006-02-10', 1, N'Số 55, phố Đại La, Hà Nội', N'0123456843', 'K10', '10A4'),
('HS056', N'Hoàng Thiên Quân', '2006-03-11', 1, N'Số 56, phố Nguyễn Chí Thanh, Hà Nội', N'0123456844', 'K10', '10A4'),
('HS057', N'Nguyễn Duy Tân', '2006-04-12', 1, N'Số 57, phố Phan Đình Phùng, Hà Nội', N'0123456845', 'K10', '10A4'),
('HS058', N'Lê Quang Hòa', '2006-05-13', 1, N'Số 58, phố Minh Khai, Hà Nội', N'0123456846', 'K10', '10A4'),
('HS059', N'Trương Ngọc Vương', '2006-06-14', 1, N'Số 59, phố Nguyễn Đình Chiểu, Hà Nội', N'0123456847', 'K10', '10A4'),
('HS060', N'Nguyễn Thị Mai', '2006-07-15', 0, N'Số 60, phố Đoàn Thị Điểm, Hà Nội', N'0123456848', 'K10', '10A4');

-- Insert học sinh vào lớp 10A5 (SiSo = 20)
INSERT INTO HOCSINH (MaHS, HoTenHS, NgaySinh, GioiTinh, DiaChi, SDTPhuHuynh, MaKhoi, MaLop)
VALUES
('HS061', N'Nguyễn Hoàng Nam', '2005-05-01', 1, N'Số 61, phố Bạch Mai, Hà Nội', N'0123456849', 'K10', '10A5'),
('HS062', N'Lê Thị Minh', '2005-06-02', 0, N'Số 62, phố Nguyễn Tuân, Hà Nội', N'0123456850', 'K10', '10A5'),
('HS063', N'Hoàng Hữu Bảo', '2005-07-03', 1, N'Số 63, phố Láng Hạ, Hà Nội', N'0123456851', 'K10', '10A5'),
('HS064', N'Vũ Quang Duy', '2005-08-04', 1, N'Số 64, phố Hòa Mã, Hà Nội', N'0123456852', 'K10', '10A5'),
('HS065', N'Nguyễn Minh Thi', '2005-09-05', 0, N'Số 65, phố Phan Huy Chú, Hà Nội', N'0123456853', 'K10', '10A5'),
('HS066', N'Trần Quang Sơn', '2005-10-06', 1, N'Số 66, phố Trần Quốc Toản, Hà Nội', N'0123456854', 'K10', '10A5'),
('HS067', N'Hoàng Linh Quỳnh', '2005-11-07', 0, N'Số 67, phố Hồ Tùng Mậu, Hà Nội', N'0123456855', 'K10', '10A5'),
('HS068', N'Nguyễn Duy Anh', '2005-12-08', 1, N'Số 68, phố Lý Nam Đế, Hà Nội', N'0123456856', 'K10', '10A5'),
('HS069', N'Vũ Thi Thanh', '2006-01-09', 0, N'Số 69, phố Đại La, Hà Nội', N'0123456857', 'K10', '10A5'),
('HS070', N'Nguyễn Quang Tuấn', '2006-02-10', 1, N'Số 70, phố Tây Sơn, Hà Nội', N'0123456858', 'K10', '10A5'),
('HS071', N'Hoàng Ngọc Linh', '2006-03-11', 0, N'Số 71, phố Thái Hà, Hà Nội', N'0123456859', 'K10', '10A5'),
('HS072', N'Nguyễn Thị Kim', '2006-04-12', 0, N'Số 72, phố Lê Lợi, Hà Nội', N'0123456860', 'K10', '10A5'),
('HS073', N'Vũ Tường Vy', '2006-05-13', 0, N'Số 73, phố Phan Đình Phùng, Hà Nội', N'0123456861', 'K10', '10A5'),
('HS074', N'Trương Minh Hòa', '2006-06-14', 1, N'Số 74, phố Hồng Mai, Hà Nội', N'0123456862', 'K10', '10A5'),
('HS075', N'Nguyễn Tường Vi', '2006-07-15', 0, N'Số 75, phố Lê Quang Đạo, Hà Nội', N'0123456863', 'K10', '10A5'),
('HS076', N'Hoàng Mai Linh', '2006-08-16', 0, N'Số 76, phố Đại Cổ Việt, Hà Nội', N'0123456864', 'K10', '10A5'),
('HS077', N'Trần Anh Tú', '2006-09-17', 1, N'Số 77, phố Bùi Thị Xuân, Hà Nội', N'0123456865', 'K10', '10A5'),
('HS078', N'Lê Minh Quân', '2006-10-18', 1, N'Số 78, phố Khâm Thiên, Hà Nội', N'0123456866', 'K10', '10A5'),
('HS079', N'Nguyễn Quang Huy', '2006-11-19', 1, N'Số 79, phố Trần Bình, Hà Nội', N'0123456867', 'K10', '10A5');


-- Insert học sinh vào lớp 11A1 (SiSo = 16)
INSERT INTO HOCSINH (MaHS, HoTenHS, NgaySinh, GioiTinh, DiaChi, SDTPhuHuynh, MaKhoi, MaLop)
VALUES
('HS080', N'Nguyễn Thiện Tâm', '2004-05-01', 0, N'Số 80, phố Thái Hà, Hà Nội', N'0123456868', 'K11', '11A1'),
('HS081', N'Vũ Thanh Sơn', '2004-06-02', 1, N'Số 81, phố Hàng Cót, Hà Nội', N'0123456869', 'K11', '11A1'),
('HS082', N'Lê Thiên Lan', '2004-07-03', 0, N'Số 82, phố Hàng Gai, Hà Nội', N'0123456870', 'K11', '11A1'),
('HS083', N'Nguyễn Phúc Khoa', '2004-08-04', 1, N'Số 83, phố Hoàng Hoa Thám, Hà Nội', N'0123456871', 'K11', '11A1'),
('HS084', N'Trần Bảo Huy', '2004-09-05', 1, N'Số 84, phố Trần Phú, Hà Nội', N'0123456872', 'K11', '11A1'),
('HS085', N'Phan Minh Tuấn', '2004-10-06', 1, N'Số 85, phố Nguyễn Trãi, Hà Nội', N'0123456873', 'K11', '11A1'),
('HS086', N'Vũ Thị Thùy', '2004-11-07', 0, N'Số 86, phố Nguyễn Ái Quốc, Hà Nội', N'0123456874', 'K11', '11A1'),
('HS087', N'Nguyễn Đức Trung', '2004-12-08', 1, N'Số 87, phố Phạm Ngọc Thạch, Hà Nội', N'0123456875', 'K11', '11A1'),
('HS088', N'Lê Huy Hữu', '2005-01-09', 1, N'Số 88, phố Tràng Tiền, Hà Nội', N'0123456876', 'K11', '11A1'),
('HS089', N'Hoàng Tiến Thành', '2005-02-10', 1, N'Số 89, phố Bà Triệu, Hà Nội', N'0123456877', 'K11', '11A1'),
('HS090', N'Trương Thảo Nguyên', '2005-03-11', 0, N'Số 90, phố Mã Mây, Hà Nội', N'0123456878', 'K11', '11A1'),
('HS091', N'Nguyễn Thái Học', '2005-04-12', 1, N'Số 91, phố Lý Thường Kiệt, Hà Nội', N'0123456879', 'K11', '11A1'),
('HS092', N'Phan Minh Duy', '2005-05-13', 1, N'Số 92, phố Bạch Mai, Hà Nội', N'0123456880', 'K11', '11A1'),
('HS093', N'Vũ Tiến Tùng', '2005-06-14', 1, N'Số 93, phố Láng, Hà Nội', N'0123456881', 'K11', '11A1'),
('HS094', N'Lê Quang Hải', '2005-07-15', 1, N'Số 94, phố Hoàng Mai, Hà Nội', N'0123456882', 'K11', '11A1'),
('HS095', N'Nguyễn Thanh Hải', '2005-08-16', 0, N'Số 95, phố Trương Định, Hà Nội', N'0123456883', 'K11', '11A1');

-- Insert học sinh vào lớp 11A2 (SiSo = 18)
INSERT INTO HOCSINH (MaHS, HoTenHS, NgaySinh, GioiTinh, DiaChi, SDTPhuHuynh, MaKhoi, MaLop)
VALUES
('HS096', N'Nguyễn Thiết Hạ', '2004-09-01', 0, N'Số 96, phố Quang Trung, Hà Nội', N'0123456884', 'K11', '11A2'),
('HS097', N'Hoàng Tuấn Anh', '2004-10-02', 1, N'Số 97, phố Tây Sơn, Hà Nội', N'0123456885', 'K11', '11A2'),
('HS098', N'Lê Thị Lan Anh', '2004-11-03', 0, N'Số 98, phố Đại La, Hà Nội', N'0123456886', 'K11', '11A2'),
('HS099', N'Nguyễn Trung Hiếu', '2004-12-04', 1, N'Số 99, phố Nguyễn Chí Thanh, Hà Nội', N'0123456887', 'K11', '11A2'),
('HS100', N'Trần Hữu Thái', '2005-01-05', 1, N'Số 100, phố Chùa Bộc, Hà Nội', N'0123456888', 'K11', '11A2'),
('HS101', N'Vũ Thi Lan', '2005-02-06', 0, N'Số 101, phố Kim Mã, Hà Nội', N'0123456889', 'K11', '11A2'),
('HS102', N'Phan Thi Thu', '2005-03-07', 0, N'Số 102, phố Hồng Mai, Hà Nội', N'0123456890', 'K11', '11A2'),
('HS103', N'Nguyễn Thanh Huy', '2005-04-08', 1, N'Số 103, phố Phan Đình Phùng, Hà Nội', N'0123456891', 'K11', '11A2'),
('HS104', N'Hoàng Duy Quang', '2005-05-09', 1, N'Số 104, phố Nguyễn Lương Bằng, Hà Nội', N'0123456892', 'K11', '11A2'),
('HS105', N'Lê Quang Huy', '2005-06-10', 1, N'Số 105, phố Lê Duẩn, Hà Nội', N'0123456893', 'K11', '11A2'),
('HS106', N'Nguyễn Hương Giang', '2005-07-11', 0, N'Số 106, phố Tôn Đức Thắng, Hà Nội', N'0123456894', 'K11', '11A2'),
('HS107', N'Trương Minh Khuê', '2005-08-12', 0, N'Số 107, phố Hàng Mã, Hà Nội', N'0123456895', 'K11', '11A2'),
('HS108', N'Phan Minh Khôi', '2005-09-13', 1, N'Số 108, phố Trần Hưng Đạo, Hà Nội', N'0123456896', 'K11', '11A2'),
('HS109', N'Vũ Tiến Vũ', '2005-10-14', 1, N'Số 109, phố Láng Hạ, Hà Nội', N'0123456897', 'K11', '11A2'),
('HS110', N'Nguyễn Đình Tuấn', '2005-11-15', 1, N'Số 110, phố Bến Bưởi, Hà Nội', N'0123456898', 'K11', '11A2'),
('HS111', N'Lê Thị Bích', '2005-12-16', 0, N'Số 111, phố Lý Thái Tổ, Hà Nội', N'0123456899', 'K11', '11A2'),
('HS112', N'Hoàng Minh Thu', '2006-01-17', 0, N'Số 112, phố Hoàng Văn Thụ, Hà Nội', N'0123456900', 'K11', '11A2');

-- Insert học sinh vào lớp 11A3 (SiSo = 14)
INSERT INTO HOCSINH (MaHS, HoTenHS, NgaySinh, GioiTinh, DiaChi, SDTPhuHuynh, MaKhoi, MaLop)
VALUES
('HS144', N'Nguyễn Thị Mai', '2004-01-01', 0, N'Số 144, phố Tôn Đức Thắng, Hà Nội', N'0123456932', 'K11', '11A3'),
('HS145', N'Hoàng Minh Tâm', '2004-02-02', 1, N'Số 145, phố Trần Nhân Tông, Hà Nội', N'0123456933', 'K11', '11A3'),
('HS146', N'Lê Thị Hằng', '2004-03-03', 0, N'Số 146, phố Nguyễn Thái Học, Hà Nội', N'0123456934', 'K11', '11A3'),
('HS147', N'Nguyễn Hoàng Hải', '2004-04-04', 1, N'Số 147, phố Bạch Mai, Hà Nội', N'0123456935', 'K11', '11A3'),
('HS148', N'Trần Thi Bảo', '2004-05-05', 0, N'Số 148, phố Lê Văn Lương, Hà Nội', N'0123456936', 'K11', '11A3'),
('HS149', N'Vũ Minh Khoa', '2004-06-06', 1, N'Số 149, phố Láng Hạ, Hà Nội', N'0123456937', 'K11', '11A3'),
('HS150', N'Phan Thị Lan', '2004-07-07', 0, N'Số 150, phố Hoàng Quốc Việt, Hà Nội', N'0123456938', 'K11', '11A3'),
('HS151', N'Lê Thành Sơn', '2004-08-08', 1, N'Số 151, phố Đội Cấn, Hà Nội', N'0123456939', 'K11', '11A3'),
('HS152', N'Trương Minh Nhật', '2004-09-09', 1, N'Số 152, phố Ngọc Hà, Hà Nội', N'0123456940', 'K11', '11A3'),
('HS153', N'Nguyễn Minh Quang', '2004-10-10', 1, N'Số 153, phố Kim Mã, Hà Nội', N'0123456941', 'K11', '11A3'),
('HS154', N'Lê Quang Huy', '2004-11-11', 1, N'Số 154, phố Chùa Láng, Hà Nội', N'0123456942', 'K11', '11A3'),
('HS155', N'Trần Thúy Quyên', '2004-12-12', 0, N'Số 155, phố Hoàng Mai, Hà Nội', N'0123456943', 'K11', '11A3'),
('HS156', N'Vũ Tiến Thành', '2005-01-13', 1, N'Số 156, phố Cát Linh, Hà Nội', N'0123456944', 'K11', '11A3'),
('HS157', N'Nguyễn Tâm Anh', '2005-02-14', 0, N'Số 157, phố Trường Chinh, Hà Nội', N'0123456945', 'K11', '11A3');

-- Insert học sinh vào lớp 11A4 (SiSo = 19)
INSERT INTO HOCSINH (MaHS, HoTenHS, NgaySinh, GioiTinh, DiaChi, SDTPhuHuynh, MaKhoi, MaLop)
VALUES
('HS113', N'Nguyễn Thiết Bảo', '2004-01-01', 0, N'Số 113, phố Hoàng Mai, Hà Nội', N'0123456901', 'K11', '11A4'),
('HS114', N'Hoàng Thuận Duy', '2004-02-02', 1, N'Số 114, phố Trần Duy Hưng, Hà Nội', N'0123456902', 'K11', '11A4'),
('HS115', N'Lê Khánh Linh', '2004-03-03', 0, N'Số 115, phố Nguyễn Khuyến, Hà Nội', N'0123456903', 'K11', '11A4'),
('HS116', N'Nguyễn Thanh Mai', '2004-04-04', 0, N'Số 116, phố Nguyễn Công Trứ, Hà Nội', N'0123456904', 'K11', '11A4'),
('HS117', N'Trần Hoàng Nam', '2004-05-05', 1, N'Số 117, phố Lê Duẩn, Hà Nội', N'0123456905', 'K11', '11A4'),
('HS118', N'Vũ Minh Quân', '2004-06-06', 1, N'Số 118, phố Cầu Giấy, Hà Nội', N'0123456906', 'K11', '11A4'),
('HS119', N'Lê Thành Lợi', '2004-07-07', 1, N'Số 119, phố Hòa Bình, Hà Nội', N'0123456907', 'K11', '11A4'),
('HS120', N'Nguyễn Tiến Dũng', '2004-08-08', 1, N'Số 120, phố Trần Hưng Đạo, Hà Nội', N'0123456908', 'K11', '11A4'),
('HS121', N'Trương Hữu Thành', '2004-09-09', 1, N'Số 121, phố Lý Thường Kiệt, Hà Nội', N'0123456909', 'K11', '11A4'),
('HS122', N'Phan Minh Ánh', '2004-10-10', 0, N'Số 122, phố Phạm Ngọc Thạch, Hà Nội', N'0123456910', 'K11', '11A4'),
('HS123', N'Vũ Đình Phúc', '2004-11-11', 1, N'Số 123, phố Đặng Tiến Đông, Hà Nội', N'0123456911', 'K11', '11A4'),
('HS124', N'Nguyễn Hồng Lan', '2004-12-12', 0, N'Số 124, phố Cát Linh, Hà Nội', N'0123456912', 'K11', '11A4'),
('HS125', N'Lê Tiến Dũng', '2005-01-13', 1, N'Số 125, phố Đường Láng, Hà Nội', N'0123456913', 'K11', '11A4'),
('HS126', N'Trần Đình Tuấn', '2005-02-14', 1, N'Số 126, phố Nguyễn Hữu Thọ, Hà Nội', N'0123456914', 'K11', '11A4'),
('HS127', N'Phan Minh Trí', '2005-03-15', 1, N'Số 127, phố Lý Đạo Thành, Hà Nội', N'0123456915', 'K11', '11A4'),
('HS128', N'Vũ Thái Bình', '2005-04-16', 1, N'Số 128, phố Kim Mã, Hà Nội', N'0123456916', 'K11', '11A4'),
('HS129', N'Nguyễn Tâm Hương', '2005-05-17', 0, N'Số 129, phố Đại Cồ Việt, Hà Nội', N'0123456917', 'K11', '11A4'),
('HS130', N'Lê Đình Khang', '2005-06-18', 1, N'Số 130, phố Ngọc Hà, Hà Nội', N'0123456918', 'K11', '11A4');

-- Insert học sinh vào lớp 11A5 (SiSo = 13)
INSERT INTO HOCSINH (MaHS, HoTenHS, NgaySinh, GioiTinh, DiaChi, SDTPhuHuynh, MaKhoi, MaLop)
VALUES
('HS131', N'Nguyễn Bảo An', '2004-07-01', 0, N'Số 131, phố Bà Triệu, Hà Nội', N'0123456919', 'K11', '11A5'),
('HS132', N'Hoàng Thanh Hương', '2004-08-02', 0, N'Số 132, phố Minh Khai, Hà Nội', N'0123456920', 'K11', '11A5'),
('HS133', N'Lê Thi Hoài', '2004-09-03', 0, N'Số 133, phố Vân Hồ, Hà Nội', N'0123456921', 'K11', '11A5'),
('HS134', N'Nguyễn Quang Bình', '2004-10-04', 1, N'Số 134, phố Đào Tấn, Hà Nội', N'0123456922', 'K11', '11A5'),
('HS135', N'Trần Thúy Nga', '2004-11-05', 0, N'Số 135, phố Quán Thánh, Hà Nội', N'0123456923', 'K11', '11A5'),
('HS136', N'Vũ Văn Bảo', '2004-12-06', 1, N'Số 136, phố Nguyễn Lương Bằng, Hà Nội', N'0123456924', 'K11', '11A5'),
('HS137', N'Lê Thanh Mạnh', '2005-01-07', 1, N'Số 137, phố Chùa Bộc, Hà Nội', N'0123456925', 'K11', '11A5'),
('HS138', N'Nguyễn Thi Hoài', '2005-02-08', 0, N'Số 138, phố Trần Phú, Hà Nội', N'0123456926', 'K11', '11A5'),
('HS139', N'Trương Minh Lâm', '2005-03-09', 1, N'Số 139, phố Lý Thái Tổ, Hà Nội', N'0123456927', 'K11', '11A5'),
('HS140', N'Phan Tiến Duy', '2005-04-10', 1, N'Số 140, phố Hoàng Cầu, Hà Nội', N'0123456928', 'K11', '11A5'),
('HS141', N'Vũ Tiến Tuấn', '2005-05-11', 1, N'Số 141, phố Lê Quang Đạo, Hà Nội', N'0123456929', 'K11', '11A5'),
('HS142', N'Nguyễn Quang Huy', '2005-06-12', 1, N'Số 142, phố Mai Dịch, Hà Nội', N'0123456930', 'K11', '11A5'),
('HS143', N'Lê Hồng Quân', '2005-07-13', 1, N'Số 143, phố Cầu Giấy, Hà Nội', N'0123456931', 'K11', '11A5');


-- Lớp 12A1 (SiSo = 17)
INSERT INTO HOCSINH (MaHS, HoTenHS, NgaySinh, GioiTinh, DiaChi, SDTPhuHuynh, MaKhoi, MaLop)
VALUES
('HS171', N'Nguyễn Thị Lan', '2003-01-01', 0, N'Số 171, đường Nguyễn Thị Minh Khai, TP.HCM', N'0123457011', 'K12', '12A1'),
('HS172', N'Hoàng Quang Hải', '2003-02-02', 1, N'Số 172, đường Phan Đình Phùng, TP.HCM', N'0123457012', 'K12', '12A1'),
('HS173', N'Lê Thị Lan', '2003-03-03', 0, N'Số 173, đường Lê Quang Định, TP.HCM', N'0123457013', 'K12', '12A1'),
('HS174', N'Nguyễn Minh Đức', '2003-04-04', 1, N'Số 174, đường Võ Văn Tần, TP.HCM', N'0123457014', 'K12', '12A1'),
('HS175', N'Vũ Minh Thi', '2003-05-05', 0, N'Số 175, đường Trần Quốc Thảo, TP.HCM', N'0123457015', 'K12', '12A1'),
('HS176', N'Phan Anh Duy', '2003-06-06', 1, N'Số 176, đường Cộng Hòa, TP.HCM', N'0123457016', 'K12', '12A1'),
('HS177', N'Nguyễn Tâm Anh', '2003-07-07', 0, N'Số 177, đường Tân Bình, TP.HCM', N'0123457017', 'K12', '12A1'),
('HS178', N'Trần Thảo Uyên', '2003-08-08', 0, N'Số 178, đường Nguyễn Trãi, TP.HCM', N'0123457018', 'K12', '12A1'),
('HS179', N'Lê Quang Hải', '2003-09-09', 1, N'Số 179, đường Lý Thường Kiệt, TP.HCM', N'0123457019', 'K12', '12A1'),
('HS180', N'Nguyễn Hữu Hùng', '2003-10-10', 1, N'Số 180, đường Nguyễn Huệ, TP.HCM', N'0123457020', 'K12', '12A1'),
('HS181', N'Trần Minh Tâm', '2003-11-11', 1, N'Số 181, đường Lê Thị Hồng Gấm, TP.HCM', N'0123457021', 'K12', '12A1'),
('HS182', N'Phan Minh Duy', '2003-12-12', 1, N'Số 182, đường Đồng Nai, TP.HCM', N'0123457022', 'K12', '12A1'),
('HS183', N'Vũ Thị Mai', '2004-01-13', 0, N'Số 183, đường Hà Huy Tập, TP.HCM', N'0123457023', 'K12', '12A1'),
('HS184', N'Nguyễn Thị Quỳnh', '2004-02-14', 0, N'Số 184, đường Nguyễn Văn Cừ, TP.HCM', N'0123457024', 'K12', '12A1');

-- Lớp 12A2 (SiSo = 19)
INSERT INTO HOCSINH (MaHS, HoTenHS, NgaySinh, GioiTinh, DiaChi, SDTPhuHuynh, MaKhoi, MaLop)
VALUES
('HS191', N'Hoàng Thị Bích', '2003-01-01', 0, N'Số 191, đường Phan Văn Trị, TP.HCM', N'0123457031', 'K12', '12A2'),
('HS192', N'Lê Quang Huy', '2003-02-02', 1, N'Số 192, đường Nguyễn Kiệm, TP.HCM', N'0123457032', 'K12', '12A2'),
('HS193', N'Nguyễn Minh Tâm', '2003-03-03', 1, N'Số 193, đường Đinh Tiên Hoàng, TP.HCM', N'0123457033', 'K12', '12A2'),
('HS194', N'Trần Thi Lan', '2003-04-04', 0, N'Số 194, đường Lê Hồng Phong, TP.HCM', N'0123457034', 'K12', '12A2'),
('HS195', N'Phan Minh Quang', '2003-05-05', 1, N'Số 195, đường Trần Phú, TP.HCM', N'0123457035', 'K12', '12A2'),
('HS196', N'Trương Minh Uyên', '2003-06-06', 0, N'Số 196, đường Nam Kỳ Khởi Nghĩa, TP.HCM', N'0123457036', 'K12', '12A2'),
('HS197', N'Nguyễn Thị Mai', '2003-07-07', 0, N'Số 197, đường Hoàng Sa, TP.HCM', N'0123457037', 'K12', '12A2'),
('HS198', N'Lê Minh Tâm', '2003-08-08', 1, N'Số 198, đường Bình Thạnh, TP.HCM', N'0123457038', 'K12', '12A2'),
('HS199', N'Nguyễn Hữu Hưng', '2003-09-09', 1, N'Số 199, đường Trường Chinh, TP.HCM', N'0123457039', 'K12', '12A2'),
('HS200', N'Trần Thị Mai', '2003-10-10', 0, N'Số 200, đường Hồng Bàng, TP.HCM', N'0123457040', 'K12', '12A2'),
('HS201', N'Vũ Minh Phúc', '2003-11-11', 1, N'Số 201, đường Đoàn Văn Bơ, TP.HCM', N'0123457041', 'K12', '12A2'),
('HS202', N'Nguyễn Thị Minh', '2003-12-12', 0, N'Số 202, đường Nguyễn Văn Quá, TP.HCM', N'0123457042', 'K12', '12A2'),
('HS203', N'Phan Anh Tâm', '2004-01-13', 1, N'Số 203, đường Lý Tự Trọng, TP.HCM', N'0123457043', 'K12', '12A2'),
('HS204', N'Nguyễn Hồng Anh', '2004-02-14', 0, N'Số 204, đường Nguyễn Tri Phương, TP.HCM', N'0123457044', 'K12', '12A2'),
('HS205', N'Lê Thị Thanh', '2004-03-15', 0, N'Số 205, đường Lê Thị Riêng, TP.HCM', N'0123457045', 'K12', '12A2'),
('HS206', N'Nguyễn Thái Sơn', '2004-04-16', 1, N'Số 206, đường Trần Hưng Đạo, TP.HCM', N'0123457046', 'K12', '12A2'),
('HS207', N'Trương Hồng Bảo', '2004-05-17', 0, N'Số 207, đường Đinh Bộ Lĩnh, TP.HCM', N'0123457047', 'K12', '12A2'),
('HS208', N'Phan Quang Minh', '2004-06-18', 1, N'Số 208, đường Ngô Quyền, TP.HCM', N'0123457048', 'K12', '12A2');

-- Lớp 12A3 (SiSo = 15)
INSERT INTO HOCSINH (MaHS, HoTenHS, NgaySinh, GioiTinh, DiaChi, SDTPhuHuynh, MaKhoi, MaLop)
VALUES
('HS211', N'Nguyễn Thị Mai', '2003-01-01', 0, N'Số 211, đường Nguyễn Lâm, TP.HCM', N'0123457051', 'K12', '12A3'),
('HS212', N'Phan Minh Sơn', '2003-02-02', 1, N'Số 212, đường Quang Trung, TP.HCM', N'0123457052', 'K12', '12A3'),
('HS213', N'Lê Quang Hải', '2003-03-03', 1, N'Số 213, đường Hàm Nghi, TP.HCM', N'0123457053', 'K12', '12A3'),
('HS214', N'Trần Minh Thư', '2003-04-04', 0, N'Số 214, đường Phạm Hùng, TP.HCM', N'0123457054', 'K12', '12A3'),
('HS215', N'Vũ Minh Tâm', '2003-05-05', 1, N'Số 215, đường Nguyễn Công Trứ, TP.HCM', N'0123457055', 'K12', '12A3'),
('HS216', N'Nguyễn Thị Hoa', '2003-06-06', 0, N'Số 216, đường Nguyễn Bỉnh Khiêm, TP.HCM', N'0123457056', 'K12', '12A3'),
('HS217', N'Lê Thị Thanh', '2003-07-07', 0, N'Số 217, đường Cộng Hòa, TP.HCM', N'0123457057', 'K12', '12A3'),
('HS218', N'Phan Anh Khoa', '2003-08-08', 1, N'Số 218, đường Trường Chinh, TP.HCM', N'0123457058', 'K12', '12A3'),
('HS219', N'Nguyễn Minh Sơn', '2003-09-09', 1, N'Số 219, đường Trần Quốc Thảo, TP.HCM', N'0123457059', 'K12', '12A3'),
('HS220', N'Nguyễn Thị Thảo', '2003-10-10', 0, N'Số 220, đường Nguyễn Văn Cừ, TP.HCM', N'0123457060', 'K12', '12A3'),
('HS221', N'Phan Minh Quân', '2003-11-11', 1, N'Số 221, đường Lý Chính Thắng, TP.HCM', N'0123457061', 'K12', '12A3'),
('HS222', N'Vũ Minh Anh', '2003-12-12', 1, N'Số 222, đường Bạch Đằng, TP.HCM', N'0123457062', 'K12', '12A3'),
('HS223', N'Nguyễn Thị Quỳnh', '2004-01-13', 0, N'Số 223, đường Hoàng Sa, TP.HCM', N'0123457063', 'K12', '12A3'),
('HS224', N'Trương Minh Quang', '2004-02-14', 1, N'Số 224, đường Lý Tự Trọng, TP.HCM', N'0123457064', 'K12', '12A3'),
('HS225', N'Lê Minh Tâm', '2004-03-15', 1, N'Số 225, đường Đông Sơn, TP.HCM', N'0123457065', 'K12', '12A3');

-- Lớp 12A4 (SiSo = 18)
INSERT INTO HOCSINH (MaHS, HoTenHS, NgaySinh, GioiTinh, DiaChi, SDTPhuHuynh, MaKhoi, MaLop)
VALUES
('HS231', N'Trần Thị Uyên', '2003-01-01', 0, N'Số 231, đường Bùi Hữu Nghĩa, TP.HCM', N'0123457071', 'K12', '12A4'),
('HS232', N'Nguyễn Thị Thùy', '2003-02-02', 0, N'Số 232, đường Võ Thị Sáu, TP.HCM', N'0123457072', 'K12', '12A4'),
('HS233', N'Phan Minh Tài', '2003-03-03', 1, N'Số 233, đường Nguyễn Huệ, TP.HCM', N'0123457073', 'K12', '12A4'),
('HS234', N'Lê Quang Hải', '2003-04-04', 1, N'Số 234, đường Lê Văn Sỹ, TP.HCM', N'0123457074', 'K12', '12A4'),
('HS235', N'Trương Thị Phương', '2003-05-05', 0, N'Số 235, đường Nguyễn Lâm, TP.HCM', N'0123457075', 'K12', '12A4'),
('HS236', N'Nguyễn Minh Tâm', '2003-06-06', 1, N'Số 236, đường Trần Cao Vân, TP.HCM', N'0123457076', 'K12', '12A4'),
('HS237', N'Phan Minh Tâm', '2003-07-07', 1, N'Số 237, đường Cách Mạng Tháng Tám, TP.HCM', N'0123457077', 'K12', '12A4'),
('HS238', N'Lê Thị Lan', '2003-08-08', 0, N'Số 238, đường Lý Thường Kiệt, TP.HCM', N'0123457078', 'K12', '12A4'),
('HS239', N'Nguyễn Minh Tình', '2003-09-09', 1, N'Số 239, đường Nguyễn Du, TP.HCM', N'0123457079', 'K12', '12A4'),
('HS240', N'Trần Thi Lan', '2003-10-10', 0, N'Số 240, đường Trương Định, TP.HCM', N'0123457080', 'K12', '12A4'),
('HS241', N'Phan Anh Quân', '2003-11-11', 1, N'Số 241, đường Phú Nhuận, TP.HCM', N'0123457081', 'K12', '12A4'),
('HS242', N'Lê Thị Hồng', '2003-12-12', 0, N'Số 242, đường Hoàng Văn Thụ, TP.HCM', N'0123457082', 'K12', '12A4'),
('HS243', N'Nguyễn Minh Lâm', '2004-01-13', 1, N'Số 243, đường Tân Kỳ Tân Quý, TP.HCM', N'0123457083', 'K12', '12A4'),
('HS244', N'Vũ Minh Khánh', '2004-02-14', 1, N'Số 244, đường Bến Vân Đồn, TP.HCM', N'0123457084', 'K12', '12A4'),
('HS245', N'Trương Thị Thùy', '2004-03-15', 0, N'Số 245, đường Tân Bình, TP.HCM', N'0123457085', 'K12', '12A4'),
('HS246', N'Phan Thị Mai', '2004-04-16', 0, N'Số 246, đường Hồng Bàng, TP.HCM', N'0123457086', 'K12', '12A4');

-- Lớp 12A5 (SiSo = 20)
INSERT INTO HOCSINH (MaHS, HoTenHS, NgaySinh, GioiTinh, DiaChi, SDTPhuHuynh, MaKhoi, MaLop)
VALUES
('HS251', N'Nguyễn Thị Mai', '2003-01-01', 0, N'Số 251, đường Tân An, TP.HCM', N'0123457091', 'K12', '12A5'),
('HS252', N'Phan Thị Bích', '2003-02-02', 0, N'Số 252, đường Hoàng Sa, TP.HCM', N'0123457092', 'K12', '12A5'),
('HS253', N'Lê Minh Quân', '2003-03-03', 1, N'Số 253, đường Nguyễn Trãi, TP.HCM', N'0123457093', 'K12', '12A5'),
('HS254', N'Nguyễn Minh Quang', '2003-04-04', 1, N'Số 254, đường Nguyễn Xí, TP.HCM', N'0123457094', 'K12', '12A5'),
('HS255', N'Trương Minh Tâm', '2003-05-05', 1, N'Số 255, đường Phạm Văn Đồng, TP.HCM', N'0123457095', 'K12', '12A5'),
('HS256', N'Phan Anh Phúc', '2003-06-06', 1, N'Số 256, đường Lê Hồng Phong, TP.HCM', N'0123457096', 'K12', '12A5'),
('HS257', N'Lê Quang Huy', '2003-07-07', 1, N'Số 257, đường Trần Bình Trọng, TP.HCM', N'0123457097', 'K12', '12A5'),
('HS258', N'Nguyễn Thị Thảo', '2003-08-08', 0, N'Số 258, đường Hồ Văn Huê, TP.HCM', N'0123457098', 'K12', '12A5'),
('HS259', N'Phan Minh Duy', '2003-09-09', 1, N'Số 259, đường Cống Quỳnh, TP.HCM', N'0123457099', 'K12', '12A5'),
('HS260', N'Trần Minh Nhân', '2003-10-10', 1, N'Số 260, đường Cao Thắng, TP.HCM', N'0123457100', 'K12', '12A5'),
('HS261', N'Lê Thị Duy', '2003-11-11', 0, N'Số 261, đường Phú Nhuận, TP.HCM', N'0123457101', 'K12', '12A5'),
('HS262', N'Nguyễn Hồng Nhung', '2003-12-12', 0, N'Số 262, đường Lý Thái Tổ, TP.HCM', N'0123457102', 'K12', '12A5'),
('HS263', N'Trương Minh Thi', '2004-01-13', 1, N'Số 263, đường Nam Kỳ Khởi Nghĩa, TP.HCM', N'0123457103', 'K12', '12A5'),
('HS264', N'Phan Thị Mai', '2004-02-14', 0, N'Số 264, đường Trần Cao Vân, TP.HCM', N'0123457104', 'K12', '12A5'),
('HS265', N'Lê Minh An', '2004-03-15', 1, N'Số 265, đường Lý Tự Trọng, TP.HCM', N'0123457105', 'K12', '12A5'),
('HS266', N'Nguyễn Quang Minh', '2004-04-16', 1, N'Số 266, đường Võ Văn Tần, TP.HCM', N'0123457106', 'K12', '12A5'),
('HS267', N'Trương Quỳnh Anh', '2004-05-17', 0, N'Số 267, đường Đường 3/2, TP.HCM', N'0123457107', 'K12', '12A5');

-- B?ng MON thêm Mã kh?i (MaKh)
CREATE TABLE MON (
    MaMon CHAR(10) PRIMARY KEY,
    TenMon NVARCHAR(50),
    MaKhoi CHAR(10),
    CONSTRAINT FK_mon_khoi FOREIGN KEY (MaKhoi) REFERENCES KHOI(MaKhoi)
);

-- Các môn học phổ biến tại THPT
INSERT INTO MON (MaMon, TenMon, MaKhoi)
VALUES
-- Môn khối 10
('MON01', N'Môn Toán 10', 'K10'),
('MON02', N'Môn Văn 10', 'K10'),
('MON03', N'Môn Anh Văn 10', 'K10'),
('MON04', N'Môn Lý 10', 'K10'),
('MON05', N'Môn Hóa 10', 'K10'),
('MON06', N'Môn Sinh 10', 'K10'),
('MON07', N'Môn Sử 10', 'K10'),
('MON08', N'Môn Địa 10', 'K10'),
('MON09', N'Môn Giáo dục công dân 10', 'K10'),
('MON10', N'Môn Thể dục 10', 'K10'),

-- Môn khối 11
('MON11', N'Môn Toán 11', 'K11'),
('MON12', N'Môn Văn 11', 'K11'),
('MON13', N'Môn Anh Văn 11', 'K11'),
('MON14', N'Môn Lý 11', 'K11'),
('MON15', N'Môn Hóa 11', 'K11'),
('MON16', N'Môn Sinh 11', 'K11'),
('MON17', N'Môn Sử 11', 'K11'),
('MON18', N'Môn Địa 11', 'K11'),
('MON19', N'Môn Giáo dục công dân 11', 'K11'),
('MON20', N'Môn Thể dục 11', 'K11'),

-- Môn khối 12
('MON21', N'Môn Toán 12', 'K12'),
('MON22', N'Môn Văn 12', 'K12'),
('MON23', N'Môn Anh Văn 12', 'K12'),
('MON24', N'Môn Lý 12', 'K12'),
('MON25', N'Môn Hóa 12', 'K12'),
('MON26', N'Môn Sinh 12', 'K12'),
('MON27', N'Môn Sử 12', 'K12'),
('MON28', N'Môn Địa 12', 'K12'),
('MON29', N'Môn Giáo dục công dân 12', 'K12'),
('MON30', N'Môn Thể dục 12', 'K12');



-- B?ng GVCN thêm n?m h?c
CREATE TABLE GVCN (
    MaGV CHAR(10),
    MaLop CHAR(10),
    NamHoc VARCHAR(50),
    CONSTRAINT FK_gvcn_giaovien FOREIGN KEY (MaGV) REFERENCES GIAOVIEN(MaGV),
    CONSTRAINT FK_gvcn_lop FOREIGN KEY (MaLop) REFERENCES LOP(MaLop)
);
-- Thêm giáo viên chủ nhiệm (GVCN)
INSERT INTO GVCN (MaGV, MaLop, NamHoc)
VALUES
-- Lớp khối 10
('GV01', '10A1', '2020'),
('GV02', '10A2', '2020'),
('GV06', '10A3', '2020'),
('GV07', '10A4', '2020'),
('GV12', '10A5', '2020'),

-- Lớp khối 11
('GV03', '11A1', '2020'),
('GV04', '11A2', '2020'),
('GV08', '11A3', '2020'),
('GV09', '11A4', '2020'),
('GV13', '11A5', '2020'),

-- Lớp khối 12
('GV05', '12A1', '2020'),
('GV10', '12A2', '2020'),
('GV11', '12A3', '2020'),
('GV14', '12A4', '2020'),
('GV15', '12A5', '2020');

-- B?ng DIEM thay ??i c?u trúc ?i?m theo các lo?i ?i?m yêu c?u
CREATE TABLE DIEM (
    MaHS CHAR(10),
    MaMon CHAR(10),
    DiemMieng decimal,
    Diem15Phut decimal,
    Diem1Tiet decimal,
    DiemHocKy decimal,
    PRIMARY KEY (MaHS, MaMon),
    CONSTRAINT FK_diem_hocsinh FOREIGN KEY (MaHS) REFERENCES HOCSINH(MaHS),
    CONSTRAINT FK_diem_mon FOREIGN KEY (MaMon) REFERENCES MON(MaMon)
);

GO
-- Insert điểm cho các học sinh lớp 10A1 môn Toán 10
INSERT INTO DIEM (MaHS, MaMon, DiemMieng, Diem15Phut, Diem1Tiet, DiemHocKy)
VALUES
('HS001', 'MON01', 8.0, 7.5, 8.0, 8.5), -- Học sinh 1
('HS002', 'MON04', 7.0, 6.5, 7.0, 7.5), -- Học sinh 2
('HS003', 'MON07', 8.5, 8.0, 8.5, 9.0), -- Học sinh 3
('HS004', 'MON01', 6.0, 7.0, 6.5, 7.0), -- Học sinh 4
('HS005', 'MON07', 7.5, 7.0, 7.5, 8.0), -- Học sinh 5
('HS006', 'MON09', 9.0, 8.5, 9.0, 9.5), -- Học sinh 6
('HS007', 'MON10', 6.5, 6.0, 7.0, 7.5), -- Học sinh 7
('HS008', 'MON03', 8.0, 7.5, 8.0, 8.5), -- Học sinh 8
('HS009', 'MON02', 7.0, 6.5, 7.0, 7.5), -- Học sinh 9
('HS010', 'MON01', 9.0, 8.5, 9.0, 9.5), -- Học sinh 10
('HS011', 'MON01', 7.5, 7.0, 7.5, 8.0), -- Học sinh 11
('HS012', 'MON06', 6.5, 6.0, 6.5, 7.0), -- Học sinh 12
('HS013', 'MON04', 8.0, 7.5, 8.0, 8.5), -- Học sinh 13
('HS014', 'MON07', 7.0, 6.5, 7.0, 7.5), -- Học sinh 14
('HS015', 'MON02', 8.5, 8.0, 8.5, 9.0); -- Học sinh 15



select * from HOCSINH where MaKhoi = 'K10' and MaLop ='10A2'