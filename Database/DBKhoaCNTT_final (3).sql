use master
go
alter database DbKhoaCNTT SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
go
drop database DbKhoaCNTT
GO
CREATE DATABASE DbKhoaCNTT
GO
USE DbKhoaCNTT
GO
CREATE TABLE Taikhoan
(	
	Tentaikhoan VARCHAR(100) PRIMARY KEY,
	Matkhau VARCHAR(1000),
	TGdangki datetime,
	Trangthaihd varchar(10), /* ý chỉ trạng thái online */
	Flag BIT,
)
INSERT INTO Taikhoan VALUES( 'IT1','s2Shwzk2H0I=','12-12-2007','Offline',1)
INSERT INTO Taikhoan VALUES( 'IT2','12345','11-2-2012','Offline',1)
INSERT INTO Taikhoan VALUES( 'IT3','12345','3-22-2005','Offline',1)
INSERT INTO Taikhoan VALUES( 'IT4','CAxpn3X++hs=','11-5-2002' ,'Offline',1)
INSERT INTO Taikhoan VALUES( 'IT5','12345','2-1-2007', 'Offline',1)
INSERT INTO Taikhoan VALUES( 'IT6','12345','1-12-2012','Offline',1)
INSERT INTO Taikhoan VALUES( 'IT7','12345','12-2-2015','Offline',1)
INSERT INTO Taikhoan VALUES( 'IT8','12345','11-13-2013','Offline',1)
INSERT INTO Taikhoan VALUES( 'IT9','d5TT6Zse5uU=','11-11-2011', 'Offline',1)
INSERT INTO Taikhoan VALUES( 'IT10','12345','11-20-2005', 'Offline',1)
go	
CREATE TABLE Chucvu
(
	Machucvu VARCHAR(50) PRIMARY KEY,
	Tenchucvu NVARCHAR(100),
	Flag BIT
)
GO
INSERT INTO Chucvu VALUES  ( 'CV1', N'Giáo viên', 1)
INSERT INTO Chucvu VALUES  ( 'CV2', N'Phó trưởng khoa', 1)
INSERT INTO Chucvu VALUES  ( 'CV3', N'Trưởng khoa ', 1)
INSERT INTO Chucvu VALUES  ( 'CV4', N'Trợ lý Khoa học', 1)
INSERT INTO Chucvu VALUES  ( 'CV5', N'Trợ lý Văn thể mỹ', 1)
INSERT INTO Chucvu VALUES  ( 'CV6', N'Trợ lý Phòng máy', 1)
INSERT INTO Chucvu VALUES  ( 'CV7', N'Trợ lý Olymic', 1)
INSERT INTO Chucvu VALUES  ( 'CV8', N'Văn phòng khoa', 1)
go
CREATE TABLE Thongtinnguoidung
(
	STT INT IDENTITY PRIMARY KEY,
	Hoten NVARCHAR(100), 
	Namsinh DATE,
	Sodienthoai VARCHAR(15),
	Gmail varchar(100),
	Quequan NVARCHAR(100),
	Tentaikhoan VARCHAR(100),
	Machucvu varchar(50),
	Flag BIT,
	FOREIGN KEY (Tentaikhoan) REFERENCES Taikhoan(Tentaikhoan),
	FOREIGN KEY (Machucvu) REFERENCES Chucvu(Machucvu)
)
go
INSERT INTO Thongtinnguoidung(Hoten, Namsinh, Sodienthoai,Gmail, Quequan, Tentaikhoan,Machucvu, Flag) 
	VALUES  (N'Trần Minh Phúc' ,'8-2-1990' ,'099533384' ,'tanhtsgu@gmail.com',N'TPHCM', 'IT9','CV1' ,1)

INSERT INTO Thongtinnguoidung(Hoten, Namsinh, Sodienthoai, Gmail,Quequan, Tentaikhoan, Machucvu,Flag) 
	VALUES  (N'Hoàng Ngọc Long' ,'1-5-1988' ,'0947856578' ,'nguyennhus293@gmail.com',N'TPHCM', 'IT10','CV2',1)

INSERT INTO Thongtinnguoidung(Hoten, Namsinh, Sodienthoai, Gmail,Quequan, Tentaikhoan, Machucvu,Flag) 
	VALUES  (N'Thiên Văn Minh' ,'3-6-1970' ,'0987652321' ,'trangtruong166@gmail.com',N'TPHCM', 'IT1' ,'CV3',1)

INSERT INTO Thongtinnguoidung(Hoten, Namsinh, Sodienthoai, Gmail,Quequan, Tentaikhoan, Machucvu,Flag) 
	 VALUES  (N'Đinh Hoàn' ,'12-1-1990' ,'0987854322','tota251297@gmail.com' ,N'TPHCM', 'IT2' ,'CV4',1)

INSERT INTO Thongtinnguoidung(Hoten, Namsinh, Sodienthoai, Gmail,Quequan, Tentaikhoan, Machucvu,Flag) 
	VALUES  (N'Trần Bá Xú' ,'2-11-1988' ,'0987657521' ,'fifaclubfootball2014@gmail.com',N'TPHCM', 'IT3' ,'CV5',1)

INSERT INTO Thongtinnguoidung(Hoten, Namsinh, Sodienthoai, Gmail,Quequan, Tentaikhoan, Machucvu,Flag) 
	VALUES  (N'Nguyễn Ngọc Hải' ,'2-11-1986' ,'0982254321','tota251297@gmail.com' ,N'TPHCM', 'IT4' ,'CV6',1)

INSERT INTO Thongtinnguoidung(Hoten, Namsinh, Sodienthoai, Gmail,Quequan, Tentaikhoan, Machucvu,Flag) 
	VALUES (N'Nguyễn Văn Long' ,'12-8-1990' ,'0366789741' ,'nguyennhus293@gmail.com',N'TPHCM', 'IT6' ,'CV7',1)
 
INSERT INTO Thongtinnguoidung(Hoten, Namsinh, Sodienthoai, Gmail,Quequan, Tentaikhoan, Machucvu,Flag) 
	VALUES  (N'Trần Thị Hồng' , '2-5-1979'  ,'0346804211' ,'minhphuc605@gmail.com',N'TPHCM', 'IT7','CV8' ,1)
INSERT INTO Thongtinnguoidung(Hoten, Namsinh, Sodienthoai, Gmail,Quequan, Tentaikhoan, Machucvu,Flag) 
	VALUES  (N'Trần Thị Bé Ba' , '2-5-1979'  ,'0346804211' ,'minhphuc605@gmail.com',N'TPHCM', 'IT8','CV8' ,1)
go
go
CREATE TABLE Quyennguoidung
(
	Maquyen VARCHAR(50) PRIMARY KEY,
	Tenquyen nVARCHAR(100),
	Flag BIT
)
go
INSERT INTO Quyennguoidung VALUES  ( '1', N'Xem tin tức - bài đăng giáo viên',1)
INSERT INTO Quyennguoidung VALUES  ( '2', N'Thêm, Xóa, Sửa bài đăng',1)
INSERT INTO Quyennguoidung VALUES  ( '3', N'Thêm, Xóa, Sửa thông tin khoa',1)
INSERT INTO Quyennguoidung VALUES  ( '4', N'Báo cáo - thống kê',1)
INSERT INTO Quyennguoidung VALUES  ( '5', N'Xem lịch sử bài đăng',1)
INSERT INTO Quyennguoidung VALUES  ( '6', N'Xem lịch sử tin tức khoa',1)
INSERT INTO Quyennguoidung VALUES  ( '7', N'Nhận thông báo tin tức mới',1)
go
CREATE TABLE Chitietquyen
(
	Machucvu VARCHAR(50),
	Maquyen VARCHAR(50),
	Flag BIT,
	PRIMARY KEY (Machucvu,Maquyen),
	FOREIGN KEY (Machucvu) REFERENCES Chucvu(Machucvu),
	FOREIGN KEY (Maquyen) REFERENCES Quyennguoidung(Maquyen)
)
go
INSERT INTO Chitietquyen  VALUES  ( 'CV1','1',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV2','1',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV2','5',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV2','6',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV2','7',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV3','1',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV3','5',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV3','6',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV3','7',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV4','1',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV4','2',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV4','5',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV5','1',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV5','2',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV5','5',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV6','1',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV6','2',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV6','5',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV7','1',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV7','2',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV7','5',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV8','1',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV8','2',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV8','3',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV8','4',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV8','5',1)
INSERT INTO Chitietquyen  VALUES  ( 'CV8','6',1)
go
CREATE TABLE Bieumauthutuc
(
	MaBMTT VARCHAR(50) PRIMARY KEY,
	TenBMTT NVARCHAR(100),
	Flag bit
)
go
INSERT INTO  Bieumauthutuc VALUES  ( 'BMTT1', N'Biểu mẫu' ,1)
INSERT INTO  Bieumauthutuc VALUES  ( 'BMTT2', N'Quy định' ,1)
INSERT INTO  Bieumauthutuc VALUES  ( 'BMTT3', N'Quy trình' ,1)
INSERT INTO  Bieumauthutuc VALUES  ( 'BMTT4', N'Danh sách khóa luận tốt nghiệp' ,1)
GO
CREATE TABLE NoidungBMTT
(
	MaNDBMTT VARCHAR(50) PRIMARY KEY,
	MaBMTT VARCHAR(50),
	Tieude nvarchar(100),
	NoidungBMTT NVARCHAR(MAX),
	Tentaikhoan nVARCHAR(100),
	Ngaydang DATETIME,
	flag BIT,
	FOREIGN KEY (MaBMTT) REFERENCES Bieumauthutuc(MaBMTT),
	
)
GO
INSERT INTO NoidungBMTT( MaNDBMTT , MaBMTT ,Tieude,NoidungBMTT ,Tentaikhoan,Ngaydang , flag )
VALUES   ( 'ND1' , 'BMTT1' , N'Biểu mẫu Chế độ chính sách',N'<p><a href="/Assets/plugins/Uploads/files/DonXinHoTroChiPhiHocTap.docx">1. Đơn xin hỗ trợ chi ph&iacute; học tập</a></p>

<p><a href="/Assets/plugins/Uploads/files/DonXinMienGiamHocPhi.docx.docx">2. DonXinMienGiamHocPhi</a></p>

<p><a href="/Assets/plugins/Uploads/files/DonXinTroCapDanToc.docx">3. DonXinTroCapDanToc</a></p>
',N'Thiên Văn Minh','08-03-2018' , 1)

INSERT INTO NoidungBMTT( MaNDBMTT , MaBMTT ,Tieude,NoidungBMTT ,Tentaikhoan,Ngaydang , flag )
VALUES ( 'ND2' , 'BMTT1' , N'Biểu mẫu Khóa luận tốt nghiệp' ,N'<p>C&aacute;c biểu mẫu d&agrave;nh cho SV</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; + Phụ lục 1:&nbsp;<a href="/Assets/plugins/Uploads/files/04.xlsx"> Mẫu đề cương KLTN</a></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; + Mẫu1:&nbsp;<a href="/Assets/plugins/Uploads/files/01.pdf"> B&igrave;a KLTN</a></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; + Phụ lục 3:&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx"> Mẫu Đăng k&yacute; KLTN</a></p>
',N'Thiên Văn Minh', '08-03-2018'  , 1)

INSERT INTO NoidungBMTT( MaNDBMTT , MaBMTT ,Tieude,NoidungBMTT ,Tentaikhoan,Ngaydang , flag )
VALUES( 'ND3' , 'BMTT2' ,  N'Quy định về khóa luận Tốt Nghiệp',N'<p>Sinh vi&ecirc;n l&agrave;m kh&oacute;a luận tốt nghiệp&nbsp;tham khảo quy định 1516/QĐ-ĐHSG-ĐT ng&agrave;y 27/09/2011&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">tại đ&acirc;y</a>&nbsp;v&agrave; được sửa đổi một số điều theo Quyết định số 2410/QĐ-ĐHSG-ĐT ng&agrave;y 25/11/2015&nbsp;<a href="/Assets/plugins/Uploads/files/04.xlsx">tại đ&acirc;y.</a></p>
' ,N'Đinh Hoàn', '08-03-2018'  , 1 )

INSERT INTO NoidungBMTT( MaNDBMTT , MaBMTT ,Tieude,NoidungBMTT ,Tentaikhoan,Ngaydang , flag )
VALUES ( 'ND4' , 'BMTT2' ,  N'Tài liệu hướng dẫn, quy định và các biểu mẫu thực tập',N'<p>Sinh vi&ecirc;n&nbsp;thực tập&nbsp;tốt nghiệp&nbsp;tham khảo&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">tại đ&acirc;y.</a></p>' , 'Trần Bá Xú','08-03-2018'  , 1)

INSERT INTO NoidungBMTT( MaNDBMTT , MaBMTT ,Tieude,NoidungBMTT ,Tentaikhoan,Ngaydang , flag )
VALUES  ( 'ND5' , 'BMTT3' ,  N'Khóa Luận Tốt Nghiệp' , N'<p><strong>B1:</strong>&nbsp;Sinh vi&ecirc;n xem điều kiện, quy định để được l&agrave;m kh&oacute;a luận tốt nghiệp tại&nbsp;<a href="/Assets/plugins/Uploads/files/03.docx">http:/Assets/plugins/Uploads/files/03.docx</a>.</p>

<p><strong>&nbsp;B2:</strong>&nbsp;Khoảng 1 th&aacute;ng trước khi bắt đầu đợt đăng k&yacute; m&ocirc;n học của học kỳ cuối. Khoa sẽ c&ocirc;ng bố danh s&aacute;ch đề t&agrave;i v&agrave; giảng vi&ecirc;n hướng dẫn kh&oacute;a luận tốt nghiệp. Sinh vi&ecirc;n chủ động li&ecirc;n hệ với giảng vi&ecirc;n để trao đổi về đề t&agrave;i, ngo&agrave;i ra sinh vi&ecirc;n c&oacute; thể li&ecirc;n hệ với c&aacute;c giảng vi&ecirc;n (kể cả giảng vi&ecirc;n kh&ocirc;ng c&oacute; t&ecirc;n trong&nbsp; danh s&aacute;ch) để nhờ hướng dẫn v&agrave; đề xuất đề t&agrave;i.</p>

<p><strong>B3:</strong>&nbsp;Sinh vi&ecirc;n điền v&agrave;o mẫu đăng k&yacute;&nbsp; online( được đăng tải tr&ecirc;n Website khoa ) để khoa duyệt v&agrave; gửi về ph&ograve;ng đ&agrave;o tạo trước đợt đăng k&yacute; m&ocirc;n học.</p>

<p><strong>B4:</strong>&nbsp;Ph&ograve;ng đ&agrave;o tạo sẽ đăng k&yacute; học phần kh&oacute;a luận tốt nghiệp cho c&aacute;c sinh vi&ecirc;n theo danh s&aacute;ch m&agrave; khoa đ&atilde; gửi. Sinh vi&ecirc;n theo d&otilde;i kiểm tra v&agrave; đ&oacute;ng học ph&iacute; theo th&ocirc;ng b&aacute;o của nh&agrave; trường</p>

<p><strong>B5:</strong>&nbsp;Sinh vi&ecirc;n nộp đơn đăng k&yacute; l&agrave;m kh&oacute;a luận tốt nghiệp về văn ph&ograve;ng khoa. Download mẫu đơn tại link&nbsp;<a href="/Assets/plugins/Uploads/files/01.pdf">http:/Assets/plugins/Uploads/files/01.pdf</a>&nbsp; =&gt; phụ lục kh&oacute;a luận (phụ lục 1).</p>
',N'Nguyễn Ngọc Hải','08-03-2018'  , 1)

INSERT INTO NoidungBMTT( MaNDBMTT , MaBMTT ,Tieude,NoidungBMTT ,Tentaikhoan,Ngaydang , flag )
VALUES ( 'ND6' , 'BMTT3' ,  N'Thủ tục xin thôi học',N'<ul>
	<li>Bước 1: Sinh vi&ecirc;n điền th&ocirc;ng tin v&agrave;o đơn th&ocirc;i học (tải mẫu đơn <a href="/Assets/plugins/Uploads/files/04.xlsx">tại đ&acirc;y</a>), đưa cho phụ huynh k&iacute; x&aacute;c nhận sau đ&oacute; nộp về khoa để k&iacute; x&aacute;c nhận.</li>
	<li>Bước 2: Sau khi Khoa x&aacute;c nhận, sinh vi&ecirc;n nộp về Ph&ograve;ng C&ocirc;ng t&aacute;c sinh vi&ecirc;n</li>
	<li>Bước 3: Ph&ograve;ng C&ocirc;ng t&aacute;c sinh vi&ecirc;n l&agrave;m thủ tục ra quyết định th&ocirc;i học cho sinh vi&ecirc;n</li>
</ul>

<p>(Lưu &yacute;: đối với sinh vi&ecirc;n Sư phạm phải l&agrave;m thủ tục bồi ho&agrave;n kinh ph&iacute; đ&agrave;o tạo theo qui định)</p>

<ul>
	<li>Bước 4: Ph&ograve;ng C&ocirc;ng t&aacute;c sinh vi&ecirc;n sẽ th&ocirc;ng b&aacute;o kết quả giải quyết đơn cho Khoa v&agrave; sinh vi&ecirc;n.</li>
</ul>
' ,N'Nguyễn Ngọc Hải', '08-03-2018'  , 1)

INSERT INTO NoidungBMTT( MaNDBMTT , MaBMTT ,Tieude,NoidungBMTT ,Tentaikhoan,Ngaydang , flag )
VALUES ( 'ND7' , 'BMTT4' ,  N'Khóa luận Tốt nghiệp' ,'<p>Sinh vi&ecirc;n xem chi tiết trong&nbsp;<a href="/Assets/plugins/Uploads/files/01.pdf">file đ&iacute;nh k&egrave;m</a></p>',N'Trần Bá Xú', '08-03-2018'  , 1)

go
CREATE TABLE Loaibaidang
(
	Maloai VARCHAR(50) PRIMARY KEY,
	Tenloai NVARCHAR(100),
	Flag BIT
)
GO
INSERT INTO Loaibaidang VALUES  ( 'SK',N'Sự kiện', 1)
INSERT INTO Loaibaidang VALUES  ( 'TT',N'Tin tức', 1)
INSERT INTO Loaibaidang VALUES  ( 'HDSV',N'Hoạt động sinh viên', 1)
INSERT INTO Loaibaidang VALUES  ( 'TS',N'Thông tin tuyển sinh', 1)
INSERT INTO Loaibaidang VALUES  ( 'TB',N'Thông báo', 1)
GO
CREATE TABLE Tag
(
	TagID VARCHAR(50) PRIMARY KEY,
	TenTag NVARCHAR(100),
	Machucvu varchar(50),	
	Flag BIT,
	FOREIGN KEY (Machucvu) REFERENCES Chucvu(Machucvu)
)
go
INSERT INTO Tag VALUES  ( '1', N'Khoa học','CV4', 1)
INSERT INTO Tag VALUES  ( '2', N'Sinh viên','CV5', 1)
INSERT INTO Tag VALUES  ( '3', N'Văn thể mỹ','CV5', 1)
INSERT INTO Tag VALUES  ( '4', N'Phòng máy','CV6', 1)
INSERT INTO Tag VALUES  ( '5', N'Đoàn-hội','CV5', 1)
INSERT INTO Tag VALUES  ( '6', N'Tuyển dụng','CV5', 1)
INSERT INTO Tag VALUES  ( '7', N'Tuyển sinh','CV5', 1)
INSERT INTO Tag VALUES  ( '8', N'Olympic','CV7', 1)
INSERT INTO Tag VALUES  ( '9', N'CLB Sinhvien','CV7', 1)
INSERT INTO Tag VALUES  ( '10', N'Học bổng','CV4', 1)
go
CREATE TABLE Baidang
(
	Mabaidang VARCHAR(50) PRIMARY KEY,
	Maloai varchar(50),
	Tieude NVARCHAR(MAX),
	Noidung NVARCHAR(MAX),
	Ngaydang DATETIME,
	Tennguoidang nvarchar(50),
	Thoigianhieuluc DATETIME,
	ĐoituongHT VARCHAR(50),
	Flag BIT,
	FOREIGN KEY (Maloai) REFERENCES Loaibaidang(Maloai)
)

INSERT INTO Baidang  VALUES ('BD1','TS',N'Thông báo về việc xét tuyến sinh viên từ chương trình đào tạo đại trà qua chương trình đào tạo chất lượng cao ngành Công nghệ thông tin',N'<p>SINH VI&Ecirc;N XEM CHI TIẾT TẠI FILE Đ&Iacute;NH K&Egrave;M&nbsp; <a href="/Assets/plugins/Uploads/files/02.docx">FILE 1 </a>V&Agrave;&nbsp;<a href="/Assets/plugins/Uploads/files/01.pdf">FILE 2</a></p>

<p>C&aacute;c em n&agrave;o c&oacute; nhu cầu chuyển từ lớp đại tr&agrave; sang lớp chất lượng cao vui l&ograve;ng li&ecirc;n hệ văn ph&ograve;ng khoa CNTT. Hạn cuối Thứ hai ng&agrave;y 01/10/2018</p>
','09/28/2018',N'Trần Bá Xú','10/01/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD2','TB',N'Thời khóa biểu lớp kỹ sư CNTT khóa 2018- hệ đào tạo chất lượng cao',N'<p>C&aacute;c bạn sinh vi&ecirc;n xem chi tiết tại&nbsp;<a href="/Assets/plugins/Uploads/files/03.docx">file đ&iacute;nh k&egrave;m</a></p>
','09/08/2018',N'Trần Bá Xú','12/30/2019','ALL',1)

INSERT INTO Baidang  VALUES ('BD3','TS',N'Giới thiệu CTĐT ngành CNTT hệ đào tạo chất lượng cao',N'<p>C&aacute;c bạn sinh vi&ecirc;n xem chi tiết chương tr&igrave;nh đ&agrave;o tạo Kỹ sư ng&agrave;nh C&ocirc;ng nghệ Th&ocirc;ng tin tại&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">file</a></p>
','08/22/2018',N'Trần Bá Xú','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD4','HDSV',N'Khóa luận dành cho K14',N'<p>B1. Sinh vi&ecirc;n kh&oacute;a 14 l&agrave;m kh&oacute;a luận tốt nghiệp tham khảo quy tr&igrave;nh về kh&oacute;a luận&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">tại đ&acirc;y</a></p>

<p>B2. Xem điều kiện l&agrave;m kh&oacute;a luận tốt nghiệp&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">tại đ&acirc;y</a></p>

<p>B3. Sinh vi&ecirc;n c&oacute; thể chọn giảng vi&ecirc;n hướng dẫn theo<a href="/Assets/plugins/Uploads/files/02.docx">&nbsp;</a><a href="/Assets/plugins/Uploads/files/02.docx">danh s&aacute;ch</a>&nbsp;hoặc chủ động t&igrave;m giảng vi&ecirc;n hướng dẫn</p>

<p>B4. Sinh vi&ecirc;n điền th&ocirc;ng tin v&agrave;o&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">danh s&aacute;ch</a>&nbsp; để khoa gửi về ph&ograve;ng đ&agrave;o tạo trước khi tiến h&agrave;nh đăng k&yacute; m&ocirc;n học cho học kỳ 1 năm 2018-2019.</p>

<p>(Hạn Ch&oacute;t ng&agrave;y 15/7/2018)</p>
','07/02/2018',N'Trần Bá Xú','07/25/2019','SV',1)
 
INSERT INTO Baidang  VALUES ('BD5','TB',N'Thay thế các học phần đã hủy ở chu kỳ 2016-2020 (Tiếng Anh1, Tiếng Anh 2, ĐT Căn Bản, Nhập môn máy tính, Phân tích thiết kế giải thuật)',N'
<p>Hiện tại khoa đ&atilde; đề nghị thay thế c&aacute;c học phần đ&atilde; hủy bỏ của chương tr&igrave;nh đ&agrave;o tạo chu kỳ 2016-2010. Sinh vi&ecirc;n xem để đăng k&yacute; v&agrave; quy đổi tương đương thay thế cho c&aacute;c học phần đ&atilde; hủy bỏ. Xem chi tiết&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">Tại đ&acirc;y</a></p>

<p>Mọi thắc mắc li&ecirc;n hệ Thầy Sang: Email: thanhsang@sgu.edu.vn, Điện thoai: 01666686557 hoặc C&ocirc; Uy&ecirc;n Nhi: Email:ntunhi@sgu.edu.vn, Điện thoại: 01233362003</p>

<p>&nbsp;</p>
','05/02/2018',N'Trần Bá Xú','12/30/2019','ALL',1)

INSERT INTO Baidang  VALUES ('BD6','TS',N'Đăng ký học chương trình đào tạo chất lượng cao Kỹ sư CNTT năm 2017',N'<p>Đăng k&yacute; học&nbsp;chương tr&igrave;nh đ&agrave;o tạo chất lượng cao Kỹ sư CNTT năm 2017</p>

<p><a href="/Assets/plugins/Uploads/files/02.docx">chi tiết</a></p>

<p>&nbsp;</p>
','08/31/2017',N'Trần Bá Xú','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD7','SK',N'Đăng kí dự hội thảo Blockchain',N'<p>Năm 2015, khi cơn b&atilde;o Katrina tr&agrave;n v&agrave;o bờ biển nước Mỹ, đ&atilde; g&acirc;y ra những thiệt hại v&ocirc; c&ugrave;ng to lớn. Một trong những tổn thất tồi tệ nhất được nhắc đến l&agrave; c&aacute;c dữ liệu được lưu trữ như ID, hồ sơ bệnh &aacute;n,... được lưu trữ đ&atilde; bị mất ho&agrave;n to&agrave;n, v&agrave; gần như kh&ocirc;ng thể t&igrave;m lại được.</p>

<p>Năm 2016, chuyển 50$ từ New York đến LonDon mất gần 5 ng&agrave;y, với khoảng 30$ ph&iacute; dịch vụ v&agrave; chuyển đổi ngoại tệ.</p>

<p>Hai vấn đề tr&ecirc;n dường như kh&ocirc;ng c&oacute; g&igrave; li&ecirc;n quan, nhưng n&oacute; c&oacute; một điểm chung th&uacute; vị. Đ&oacute; l&agrave; kết quả của hai vấn đề n&agrave;y sẽ kh&aacute;c nhau rất nhiều, tốt đẹp hơn nhiều trong tương lại với một c&ocirc;ng nghệ mới được chia sẻ với t&ecirc;n gọi l&agrave; BLOCKCHAIN.</p>

<p>Ch&agrave;o mừng bạn đến với c&ocirc;ng nghệ mới - BLOCKCHAIN - nhờ v&agrave;o c&ocirc;ng nghệ n&agrave;y m&agrave; dữ liệu được xem như miễn nhiễm với sự mất m&aacute;t, thay đổi, giả mạo,... v&agrave; tiền tệ sẽ được giao dịch nhanh ch&oacute;ng, chi ph&iacute; giao dịch thấp, an to&agrave;n hơn trước đ&acirc;y rất nhiều. Đặc biệt, th&ocirc;ng tin sẽ được c&ocirc;ng khai rộng r&atilde;i, nhưng lại kh&ocirc;ng bị ai kiểm so&aacute;t.</p>

<p>Để t&igrave;m hiểu th&ecirc;m th&ocirc;ng tin về vấn đề n&agrave;y, c&aacute;c bạn sinh vi&ecirc;n h&atilde;y nhanh ch&oacute;ng đăng k&yacute; bằng link dưới đ&acirc;y để đến dự buổi hội thảo BlockChain để nghe c&aacute;c chuy&ecirc;n gia tr&igrave;nh b&agrave;y về vấn đề n&agrave;y.</p>

<p>Thời gian: 7h ng&agrave;y 19/10/2018.</p>

<p>Địa điểm: Hội trường A, cơ sở ch&iacute;nh đại học S&agrave;i G&ograve;n.</p>

<p>Hạn ch&oacute;t đăng k&yacute;: 15/10/2018.</p>

<p>Đối với sinh vi&ecirc;n thuộc khoa CNTT trường đại học S&agrave;i G&ograve;n, phải từ kh&oacute;a 17 trở về trước, v&agrave; sau khi đăng k&yacute; phải c&oacute; mặt đầy đủ.</p>

<p>https://docs.google.com/forms/d/e/1FAIpQLSeJJPrLTv94uGEKkh7-3BoescLuhNdbFkghud9bZLj4bj9coA/viewform</p>

<p>&nbsp;</p>
','09/23/2018',N'Đinh Hoàn','10/15/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD8','SK',N'Hội thảo khoa học "Một số vấn đề chọn lọc về CNTT	và truyền thông',N'
<p>C&aacute;c bạn sinh vi&ecirc;n xem chi tiết&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">tại&nbsp;đ&acirc;y</a></p>
','03/22/2018',N'Đinh Hoàn','12/30/2019','ALL',1)

INSERT INTO Baidang  VALUES ('BD9','TB',N'Về việc học bổng đồng hương Bạc Liêu - Cà Mau năm học 2017-2018',N'<p>C&aacute;c bạn sinh vi&ecirc;n thường tr&uacute; tại 02 tỉnh Bạc Li&ecirc;u, C&agrave; Mau đang học hệ ch&iacute;nh quy tại trường, c&oacute; ho&agrave;n cảnh đặc biệt kh&oacute; khăn, c&oacute; phẩm chất đạo đức tốt, hộ ngh&egrave;o hoặc c&oacute; th&agrave;nh t&iacute;ch đạt điểm trung b&igrave;nh cao, được khen thưởng th&agrave;nh t&iacute;ch kh&aacute;c,....</p>

<p>Chi tiết tại file&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">đ&iacute;nh k&egrave;m</a></p>
','10/05/2017',N'Trần Bá Xú','10/20/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD10','TB',N'Thông báo về việc học bổng Vũ Đình Liệu năm học 2017-2018',N'<p>C&aacute;c bạn sinh vi&ecirc;n l&agrave; :</p>

<p>1. Sinh vi&ecirc;n thường tr&uacute; tại tỉnh Tr&agrave; Vinh đang học hệ ch&iacute;nh quy tại trường</p>

<p>2. Điểm TB năm học 2016-2017 v&agrave; điểm TB chung t&iacute;ch lũy từ 7.5 trở l&ecirc;n</p>

<p>3. Diện ưu ti&ecirc;n: Sinh vi&ecirc;n l&agrave; người d&acirc;n tộc Khmer, hộ ngh&egrave;o/ cận ngh&egrave;o, diện ch&iacute;nh s&aacute;ch ... được x&eacute;t với mức điểm TB từ 6.5 trở l&ecirc;n</p>

<p>- Kh&ocirc;ng x&eacute;t học bổng cho sinh vi&ecirc;n đ&atilde; được đ&agrave;i thọ chi ph&iacute; học tập</p>

<p>Chi tiết c&aacute;c bạn xem th&ocirc;ng b&aacute;o&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">đ&iacute;nh k&egrave;m</a></p>

<p>&nbsp;</p>
','09/19/2017',N'Trần Bá Xú','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD11','TT',N'Tuyển sinh viên thực tập',N'
<p>Hiện tại c&ocirc;ng ty&nbsp;KYANON DIGITAL đang c&oacute; nhu cầu tuyển thực tập. C&aacute;c bạn sinh vi&ecirc;n c&oacute; nhu cầu tham khảo&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">tại đ&acirc;y</a>.</p>
','10/23/2018',N'Trần Bá Xú','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD12','TT',N'Tuyển dụng ở IVC Fresher 2018',N'<p>C&ocirc;ng ty IVC tuyển dụng Fresher năm 2018, với c&aacute;c ng&agrave;nh nghề:&nbsp;</p>

<ul>
	<li>C++</li>
	<li>Frontend (HTML, JS)</li>
	<li>Java</li>
</ul>

<p>Y&ecirc;u cầu: nộp CV + bảng điểm.</p>

<p>Hạn ch&oacute;t đăng k&yacute;: 15/10/2018</p>

<p>C&aacute;c bạn xem th&ecirc;m th&ocirc;ng tin chi tiết ở file đ&iacute;nh k&egrave;m:</p>

<p><a href="/Assets/plugins/Uploads/files/02.docx">files/sinh-vien/IVC-FRESHER-2018-_3rd.docx</a></p>

<p>&nbsp;</p>
','09/25/2018',N'Trần Bá Xú','10/15/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD13','TT',N'Công Ty TMA Tuyển dụng nhân sự',N'<p>Hiện tại c&ocirc;ng ty TMA c&oacute; nhu cầu tuyển dụng nh&acirc;n sự. Sinh vi&ecirc;n quan t&acirc;m tham khảo&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">tại đ&acirc;y.</a></p>

<p>&nbsp;</p>
','04/06/2018',N'Trần Bá Xú','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD14','TT',N'Thông tin tuyển dụng',N'<p>C&ocirc;ng ty Hunter Macdonald cần tuyển juninor&nbsp;, seninor, fresher .NET v&agrave; QC với số lượng nhiều. Sinh vi&ecirc;n n&agrave;o quan t&acirc;m th&igrave; viết CV n&ecirc;u bật nội dung thế mạnh của m&igrave;nh l&agrave; g&igrave;, mong muốn l&agrave;m việc với c&ocirc;ng nghệ n&agrave;o, ... gởi v&agrave;o email&nbsp;<a href="http://fit.sgu.edu.vn/web2017/nhe.ly@huntermacdonald.com">nhe.ly@huntermacdonald.com.</a></p>

<p>Th&ocirc;ng tin chi tiết xem tại:&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">https://itviec.com/nha-tuyen-dung/hunter-macdonald</a></p>

<p>&nbsp;</p>
','09/23/2017',N'Trần Bá Xú','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD15','TB',N'Thông báo về việc nghiệm thu đề tài khoa học 2017-2018 và đăng ký đề tài khoa học 2018-2019',N'
<p>Sinh vi&ecirc;n xem th&ocirc;ng b&aacute;o&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">tại đ&acirc;y</a></p>

<p>&nbsp;</p>
','06/18/2018',N'Trần Bá Xú','12/30/2018','SV',1)

INSERT INTO Baidang  VALUES ('BD16','HDSV',N'Danh sách các đội tuyển Olympic 2018',N'<p>C&Aacute;C BẠN SINH VI&Ecirc;N XEM CHI TIẾT TẠI&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">FILE Đ&Iacute;NH K&Egrave;M</a>.</p>

<p>&nbsp;</p>
','08/27/2018',N'Nguyễn Văn Long','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD17','HDSV',N'Olympic Tin học 2017',N'<p><strong>I. GIỚI THIỆU KỲ THI Olympic sinh vi&ecirc;n Việt Nam&nbsp;2017</strong></p>

<p>- Được sự chấp thuận của Ban Gi&aacute;m Hiệu Nh&agrave; trường, Khoa C&ocirc;ng nghệ Th&ocirc;ng tin đ&atilde; cử đo&agrave;n sinh vi&ecirc;n tham dự Kỳ thi Olympic Tin học Sinh vi&ecirc;n Việt Nam v&agrave; Lập tr&igrave;nh sinh vi&ecirc;n Quốc tế ACM/ICPC năm 2017 được tổ chức tại trường Đại học Sư Phạm TP.HCM từ ng&agrave;y 05 ~/ 08 th&aacute;ng 12 năm 2017; đ&acirc;y l&agrave; cuộc thi lớn nhất v&agrave; uy t&iacute;n nhất về lĩnh vực C&ocirc;ng nghệ th&ocirc;ng tin v&agrave; truyền th&ocirc;ng được tổ chức h&agrave;ng năm.</p>

<p>-Đo&agrave;n Olympic Tin học Sinh vi&ecirc;n của Trường Đại học S&agrave;i G&ograve;n gồm 10 Sinh vi&ecirc;n khoa CNTT v&agrave; khoa To&aacute;n Ứng dụng; dự thi bốn khối thi: Phần Mềm nguồn mở, khối Kh&ocirc;ng chuy&ecirc;n, Khối Chuy&ecirc;n Tin v&agrave; Lập tr&igrave;nh sinh vi&ecirc;n Quốc tế ACM/ICPC.</p>

<p><strong>II. TH&Agrave;NH T&Iacute;CH ĐẠT ĐƯỢC</strong></p>

<p>Đo&agrave;n Trường Đại học S&agrave;i G&ograve;n đ&atilde; đạt được c&aacute;c th&agrave;nh t&iacute;ch sau:</p>

<p>- 01 giải Nh&igrave; khối chuy&ecirc;n tin (Sinh vi&ecirc;n Trương Cẩm Lu&acirc;n).</p>

<p>- 01 giải Ba khối kh&ocirc;ng chuy&ecirc;n tin (Sinh vi&ecirc;n Trần Tiến).</p>

<p>- 01 giải Khuyến Kh&iacute;ch khối Kh&ocirc;ng chuy&ecirc;n (Sinh vi&ecirc;n Trương Ph&aacute;t Lộc).</p>

<p>- 01 giải Khuyến Kh&iacute;ch khối thi lập tr&igrave;nh sinh vi&ecirc;n quốc tế Quốc tế ACM/ICPC (kỳ thi c&oacute; 24 đội tuyển đến từ c&aacute;c nước Ch&acirc;u &Aacute;).</p>

<p>&nbsp;</p>
','07/16/2018',N'Nguyễn Văn Long','12/30/2019','ALL',1)

INSERT INTO Baidang  VALUES ('BD18','HDSV',N'Danh sách sinh viên tham gia lớp bồi dưỡng Olympic Tin học 2018',N'<p>C&Aacute;C BẠN SV XEM DANH S&Aacute;CH TẠI&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">FILE Đ&Iacute;NH K&Egrave;M</a>.</p>

<p>&nbsp;</p>
','07/16/2018',N'Nguyễn Văn Long','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD19','TB',N'THÔNG BÁO Về việc huấn luyện sinh viên tham dự Olympic Tin học sinh viên Việt Nam và Kỳ thi lập trình sinh viên Quốc tế ACM năm 2018',N'<p>Sinh vi&ecirc;n xem&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">chi tiết</a></p>

<p>Lưu &yacute;:</p>

<p>Ng&agrave;y bắt đầu học: Thứ Bảy ng&agrave;y 14/04/2018</p>

<p>Thời gian: Từ 12 giờ 00 đến 16 giờ 30 ph&uacute;t</p>

<p>Ph&ograve;ng học: C.A106&nbsp;</p>

<p>&nbsp;</p>
','04/02/2018',N'Nguyễn Văn Long','12/30/2019','ALL',1)

INSERT INTO Baidang  VALUES ('BD20','TB',N'Thông báo về cuộc thi lập trình Makerthon lần 2 - năm 2018',N'<p>Th&agrave;nh đo&agrave;n Th&agrave;nh phố Hồ Ch&iacute; Minh, Trung t&acirc;m ph&aacute;t triển Khoa học v&agrave; C&ocirc;ng nghệ trẻ th&ocirc;ng b&aacute;o về cuộc thi lập tr&igrave;nh Makerthon lần 2 - 2018.</p>

<p>Sinh vi&ecirc;n vui l&ograve;ng xem file đ&iacute;nh k&egrave;m</p>

<p>C&aacute;c bạn lưu &yacute; thời gian hết hạn đăng k&yacute;</p>

<p><a href="/Assets/plugins/Uploads/files/02.docx">files/sinh-vien/63khtv.-tc-cuoc-thi-lap-trinh-makerthon-lan-2_2.pdf</a></p>

<p><a href="/Assets/plugins/Uploads/files/02.docx">files/sinh-vien/Makerthon-2018---The-le.pdf</a></p>

<p>&nbsp;</p>

<p>&nbsp;</p>
','10/30/2018',N'Đinh Hoàn','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD21','TB',N'Thông báo về việc tập đăng ký môn học cho sinh viên khóa 18',N'<p>C&aacute;c bạn sinh vi&ecirc;n kh&oacute;a 18 xem tại<a href="/Assets/plugins/Uploads/files/02.docx">đ&acirc;y:</a></p>

<p>&nbsp;</p>
','10/29/2018',N'Trần Bá Xú','12/30/2019','ALL',1)

INSERT INTO Baidang  VALUES ('BD22','HDSV',N'Tuần Sinh hoạt CD-SV đầu khóa, Khóa 18 (DCT1182, DCT1183, DCT1184)',N'<p>Thời gian:&nbsp;13g15, thứ ba ng&agrave;y 30 th&aacute;ng 10 năm 2018</p>

<p>Địa điểm:Hội trường A (Cơ sở ch&iacute;nh -273 An Dương Vương, Q.5)</p>

<p>Th&agrave;nh phần tham dự: Khoa CNTT lớp:&nbsp;DCT1182, DCT1183, DCT1184.</p>

<p>Lưu &yacute;: Đề nghị c&aacute;c bạn sinh vi&ecirc;n tham dự đầy đủ, đ&uacute;ng giờ, mang theo thẻ sinh vi&ecirc;n</p>

<p>&nbsp;</p>
','10/29/2018',N'Trần Bá Xú','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD23','TT',N'Kế hoạch Seminar giữa sinh viên khoa Công nghệ thông tin và Fsoft',N'<p>L&uacute;c 9g30 ng&agrave;y 26 th&aacute;ng 10 năm 2018 sẽ diễn ra buổi seminar giữa sinh vi&ecirc;n Khoa C&ocirc;ng nghệ th&ocirc;ng tin v&agrave; C&ocirc;ng ty FSoft.</p>

<p>Địa điểm: Ph&ograve;ng C.C102 - cơ sở ch&iacute;nh đại học S&agrave;i G&ograve;n</p>

<p>Nội dung: chương tr&igrave;nh trao đổi về chương tr&igrave;nh thực tập v&agrave; Fresher tại c&ocirc;ng ty FSoft</p>

<p>Sinh vi&ecirc;n tham dự chương tr&igrave;nh đăng k&yacute; tại&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">link</a>&nbsp;đ&iacute;nh k&egrave;m</p>

<p>Sinh vi&ecirc;n tham gia được cộng điểm r&egrave;n luyện theo quy định</p>

<p>&nbsp;</p>
','10/25/2018',N'Trần Bá Xú','12/30/2019','ALL',1)

INSERT INTO Baidang  VALUES ('BD24','TT',N'Thông tin cuộc thi "HS,SV với ý tưởng khởi nghiệp"',N'<p>Gửi c&aacute;c em th&ocirc;ng tin về&nbsp;Cuộc thi<strong>&nbsp;&ldquo;Học sinh, sinh vi&ecirc;n với &yacute; tưởng khởi nghiệp&rdquo; - SWIS&nbsp;2018</strong>, bao gồm c&aacute;c file (đ&iacute;nh k&egrave;m):</p>

<p>1. Quyết định 3950/QĐ-BGDDT ng&agrave;y 28/09/2018 ban h&agrave;nh thể lệ cuộc thi.&nbsp;&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">TẠI Đ&Acirc;Y</a></p>

<p>2. Thể lệ cuộc thi.&nbsp;<a href="https://drive.google.com/open?id=1BrVQT5LBYL4IbSZBpBe0TskyC50NT4W3">TẠI Đ&Acirc;Y</a></p>

<p>3. Th&ocirc;ng b&aacute;o số 2444/TB-ĐHSG ng&agrave;y 15/10/2018 về việc đăng k&iacute; cuộc thi.&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">TẠI Đ&Acirc;Y</a></p>

<p>TLNCKH.</p>

<p>P/s: Đăng k&yacute; tại khoa CNTT với thời hạn&nbsp;trước ng&agrave;y 30/10/2018. Li&ecirc;n hệ:</p>

<p>TS. Đinh Thị Thu Hương - 0903087599 - E-mail: huongdtt@sgu.edu.vn</p>

<p>&nbsp;</p>
','10/20/2018',N'Đinh Hoàn','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD25','TB',N'Thông báo về việc mở cửa phòng máy phục vụ sinh viên',N'<p>Nhằm n&acirc;ng cao chất lượng học tập v&agrave; tra cứu t&agrave;i liệu của sinh vi&ecirc;n. Theo sự chỉ đạo của Ban Gi&aacute;m Hiệu nh&agrave; trường, hiện nay Khoa C&ocirc;ng Nghệ Th&ocirc;ng Tin đ&atilde; ho&agrave;n th&agrave;nh việc lắp đặt hệ thống m&aacute;y t&iacute;nh phục vụ cho mục đ&iacute;ch nghi&ecirc;n cứu, học tập, tra cứu th&ocirc;ng tin t&agrave;i liệu cho to&agrave;n thể c&aacute;n bộ giảng vi&ecirc;n &ndash; sinh vi&ecirc;n đang c&ocirc;ng t&aacute;c v&agrave; học tập tại trường.</p>

<p>Thời gian mở cửa phục vụ:</p>

<p>Thứ Hai, ph&ograve;ng A109, mở cửa l&uacute;c 12h50 &ndash; đ&oacute;ng cửa l&uacute;c 16h30.</p>

<p>Thứ Năm, ph&ograve;ng A110, mở cửa l&uacute;c 7h50 &ndash; đ&oacute;ng cửa l&uacute;c 11h30.</p>

<p>Th&ocirc;ng tin xem file đ&iacute;nh k&egrave;m.</p>

<p><a href="/Assets/plugins/Uploads/files/02.docx">files/ThongBaomocuaphongmay.pdf</a></p>

<p>&nbsp;</p>
','10/24/2018',N'Nguyễn Ngọc Hải','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD26','TB',N'Thông báo về việc tham gia Chương trình "HCMC Student Forum" năm 2018',N'<p>C&aacute;c bạn sinh vi&ecirc;n năm 3 v&agrave; 4 xem&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">chi tiết tại</a></p>

<p>Bạn n&agrave;o đăng k&yacute; vui l&ograve;ng gửi th&ocirc;ng tin (họ t&ecirc;n, MSSV, số điện thoại, email ) về địa chỉ: vpkcntt@sgu.edu.vn trước ng&agrave;y 11 giờ 30 ng&agrave;y 26/10/2018. Cảm ơn c&aacute;c bạn./.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
','10/25/2018',N'Tràn Bá Xú','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD27','HDSV',N'Khóa 15_ Kế hoạch tổ chức Cuộc thi tìm hiểu về Biên giới và Bộ đội Biên phòng',N'<p>&nbsp;Chi tiết kế hoạch c&aacute;c bạn xem&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">tại:</a></p>

<p>Ghi ch&uacute;: -C&aacute;c bạn sinh vi&ecirc;n nộp b&agrave;i cho lớp trưởng. Lớp trưởng c&aacute;c lớp thu v&agrave; lập danh s&aacute;ch nộp về văn phong khoa trước ng&agrave;y 09/11/2018</p>

<p>- Đ&acirc;y l&agrave;&nbsp; cơ sở để&nbsp; chứng nhận ho&agrave;n tất tuần sinh hoạt C&ocirc;ng d&acirc;n - Sinh vi&ecirc;n v&agrave; đ&aacute;nh gi&aacute; điểm r&egrave;n luyện đề nghị to&agrave;n thể sinh vi&ecirc;n ch&iacute;nh quy kh&oacute;a 15 (bắt buộc) tham gia</p>

<p>Đề nghị c&aacute;c bạn thực hiện nghi&ecirc;m t&uacute;c nội dung th&ocirc;ng b&aacute;o tr&ecirc;n.</p>

<p>&nbsp;</p>
','10/07/2018',N'Trần Bá Xú','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD28','TB',N'Về việc bổ sung hồ sơ nhập học của sinh viên Khóa 18',N'<p>C&aacute;c bạn c&oacute; t&ecirc;n trong danh s&aacute;ch đ&iacute;nh k&egrave;m nộp bổ sung c&aacute;c loại giấy tờ c&ograve;n thiếu tại Ph&ograve;ng C&ocirc;ng t&aacute;c Sinh vi&ecirc;n (HB206) trước ng&agrave;y 15/10/2018. Mọi thắc mắc li&ecirc;n hệ c&ocirc; Nguyễn Ngọc Uyển, số điện thoại :0975.887.964. Qu&aacute; thời hạn tr&ecirc;n nếu sinh vi&ecirc;n kh&ocirc;ng bổ sung được hồ sơ. Nh&agrave; trường sẽ xử l&yacute; theo quy định hiện h&agrave;nh./.</p>

<p>Rất mong c&aacute;c bạn sinh vi&ecirc;n thực hiện tốt nội dung của&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">th&ocirc;ng b&aacute;o</a></p>

<p>&nbsp;</p>
','10/10/2018',N'Trần Bá Xú','10/15/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD29','TB',N'Thông báo Thi khảo sát đầu vào Tiếng Anh không chuyên năm học 2018 – 2019',N'<p>&nbsp;</p>

<p>C&aacute;c bạn sinh vi&ecirc;n xem chi tiết th&ocirc;ng b&aacute;o tại: http://daotao.sgu.edu.vn/daihoc-caodang-chinhquy/thong-bao-thi-khao-sat-dau-vao-tieng-anh-khong-chuyen-dot-1-nam-hoc-2018-2019</p>

<p><strong><em><u>Lưu &yacute;</u></em></strong></p>

<ol>
	<li>Sinh vi&ecirc;n&nbsp; kh&oacute;a 17 trở về trước nộp lệ ph&iacute; thi : 50.000 đ/SV trực tiếp tại văn ph&ograve;ng khoa</li>
	<li>Ri&ecirc;ng c&aacute;c bạn sinh vi&ecirc;n kh&oacute;a 18 nộp lệ ph&iacute; thi &nbsp;cho lớp trưởng c&aacute;c lớp. Lớp trưởng kh&oacute;a 18 thu lệ ph&iacute; thi khảo s&aacute;t &nbsp;đầu v&agrave;o TA ( theo danh s&aacute;ch&nbsp; khoa&nbsp;cấp) v&agrave; &nbsp;nộp lại cho VPkhoa, trước ng&agrave;y &nbsp;<strong>4/11/2018</strong></li>
</ol>

<p>Cảm ơn c&aacute;c bạn. Ch&uacute;c c&aacute;c bạn học tốt</p>
','10/10/2018',N'Trần Bá Xu','11/04/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD30','TB',N'Thông báo chuyển phòng học môn Kiến trúc máy tính thầy Hạp',N'<p>Lớp Kiến tr&uacute;c m&aacute;y t&iacute;nh thầy Huỳnh Tổ Hạp học ng&agrave;y thứ 2 tiết 6,7 chuyển từ HTC&nbsp;sang ph&ograve;ng B109 (chuyển lu&ocirc;n).</p>
','09/14/2018',N'Nguyễn Ngọc Hải','12/30/2019','ALL',1)

INSERT INTO Baidang  VALUES ('BD31','TB',N'Thông báo nghỉ học môn kiến trúc máy tính các lớp thầy Huỳnh Tổ Hạp',N'<p>Thầy Huỳnh Tổ Hạp bận đi c&ocirc;ng t&aacute;c&nbsp;n&ecirc;n&nbsp;sinh vi&ecirc;n nghỉ học c&aacute;c buổi. Cụ thể như sau:</p>

<p>Thứ 2 (10/9/2018): tiết 6-&gt;7&nbsp;ph&ograve;ng C. HTC&nbsp;lớp DCT1181</p>

<p>Thứ 2 (10/9/2018): tiết 11-&gt;12&nbsp;ph&ograve;ng C.A111 lớp DCT1181</p>

<p>Thứ 3 (11/09/2018): tiết 6-&gt;7&nbsp;ph&ograve;ng C.D301&nbsp;lớp DCT1181</p>

<p>Thứ 3 (11/09/2018): tiết 11-&gt;12&nbsp;ph&ograve;ng C.A111 lớp DCT1181</p>

<p>Thứ 5 (13/09/2018): Tiết 6-&gt;7&nbsp;ph&ograve;ng C.C106&nbsp;lớp DCT1181</p>

<p>Thứ 5 (13/09/2018): Tiết 11-&gt;12&nbsp;ph&ograve;ng C.A111 lớp DCT1181</p>

<p>Thứ 7 (15/09/2018): Tiết 1-&gt;3 ph&ograve;ng C.A105 lớp&nbsp;DNA1161</p>

<p>Thứ 7 (15/09/2018): Tiết 4-&gt;5 ph&ograve;ng C.A105 lớp DNA1171&nbsp;</p>
','09/07/2018',N'Nguyễn Ngọc Hải','12/30/2019','ALL',1)
 
INSERT INTO Baidang  VALUES ('BD32','HDSV',N'Tuổi trẻ Đại học Sài Gòn hiến tặng gần 350 đơn vị máu',N'<<p><strong><em>Nối tiếp th&agrave;nh c&ocirc;ng của những chương tr&igrave;nh Hiến m&aacute;u t&igrave;nh nguyện trước, hơn 500 sinh vi&ecirc;n trường ĐH S&agrave;i G&ograve;n đ&atilde; tham gia hiến 350 đơn vị m&aacute;u trong đợt thứ 1 của chương tr&igrave;nh &ldquo;Hiến m&aacute;u t&igrave;nh nguyện&rdquo; lần thứ 21 do Hội Sinh vi&ecirc;n trường phối hợp với ph&ograve;ng Y tế trường, tổ chức v&agrave;o ng&agrave;y 3/11/2018.</em></strong></p>

<p>&ldquo;Hiến m&aacute;u t&igrave;nh nguyện&rdquo; l&agrave; chương tr&igrave;nh được tổ chức thường xuy&ecirc;n v&agrave; nhận được sự quan t&acirc;m đặc biệt của sinh vi&ecirc;n trường trong những năm qua, vừa thể hiện được tinh thần tương th&acirc;n tương &aacute;i tốt đẹp của d&acirc;n tộc, vừa thể hiện bầu nhiệt huyết, sẵn l&ograve;ng chia sẻ của sinh vi&ecirc;n trường ĐH S&agrave;i G&ograve;n với cộng đồng.</p>

<p>Ngay từ s&aacute;ng sớm, c&aacute;c bạn sinh vi&ecirc;n đ&atilde; tập trung đ&ocirc;ng đủ, điền th&ocirc;ng tin v&agrave;o giấy kh&aacute;m sức khỏe, đợi đến lượt được hiến tặng.</p>

<p>Rất nhiều t&acirc;n sinh vi&ecirc;n (kh&oacute;a 18) lần đầu tham gia hiến tặng m&aacute;u, kh&ocirc;ng tr&aacute;nh khỏi hồi hộp, nhưng vẫn lu&ocirc;n nở nụ cười tươi của tuổi trẻ.</p>

<p>B&ecirc;n cạnh đ&oacute;, cũng c&oacute; những anh/chị c&aacute;n bộ vi&ecirc;n chức, sinh vi&ecirc;n năm 3 năm 4, nhiều lần tham gia hiến m&aacute;u.</p>

<p>Điểm nhấn đặc biệt lần n&agrave;y, ch&iacute;nh l&agrave; phần &ldquo;cho chữ&rdquo; thư ph&aacute;p của Trung t&acirc;m hiến m&aacute;u d&agrave;nh tặng cho bạn hiến tặng.<img alt="image010" src="http://youth.sgu.edu.vn/JAdmin/images/BaiVietDangWeb/2018/Hienmautinhnguyen/image010.jpg" />&nbsp;</p>
'
,'11/05/2018',N'Trần Bá Xú','12/30/2019','SV',1)




INSERT INTO Baidang  VALUES ('BD33','HDSV',N'Tham dự buổi gặp gỡ Đoàn lãnh đạo Thành phố',N'<p>Khoa C&ocirc;ng nghệ th&ocirc;ng tin th&ocirc;ng b&aacute;o đến sinh vi&ecirc;n nội dung như sau:</p>

<p>- Mỗi lớp cử lớp trưởng (hoặc lớp ph&oacute;/ b&iacute; thư) tham dự buổi gặp gỡ đo&agrave;n l&atilde;nh đạo th&agrave;nh phố&nbsp;(bắt buộc)</p>

<p>- Sinh vi&ecirc;n tham dự ăn mặc lịch sự, đeo thẻ sinh vi&ecirc;n</p>

<p>- C&oacute; mặt tại hội trường A, cơ sở ch&iacute;nh l&uacute;c 13g30</p>

<p>Đề nghị sinh vi&ecirc;n c&aacute;c lớp thực hiện nghi&ecirc;m t&uacute;c th&ocirc;ng b&aacute;o n&agrave;y.</p>
',
'08/14/2018',N'Trần Bá Xú','12/30/2019','SV',1)


INSERT INTO Baidang  VALUES ('BD34','HDSV',N'Thông báo chương trình sinh viên đến với Bảo tàng năm học 2017-2018',N'<p>ĐỐI TƯỢNG THAM GIA L&Agrave; SINH VI&Ecirc;N NĂM 2 THEO HỌC TẠI TRƯỜNG ĐẠI HỌC S&Agrave;I G&Ograve;N (BẮT BUỘC). SINH VI&Ecirc;N NỘP LẠI DẤU X&Aacute;C NHẬN CỦA BẢO T&Agrave;NG V&Agrave; B&Agrave;I THU HOẠCH CHO LỚP TRƯỞNG. LỚP TRƯỞNG NỘP VỀ&nbsp;VĂN PH&Ograve;NG KHOA HẾT&nbsp;NG&Agrave;Y&nbsp;31/5/2018. SINH VI&Ecirc;N XEM TH&Ecirc;M&nbsp;<a href="http://fit.sgu.edu.vn/web2017/files/DOC050318-003---Copy.pdf">TẠI FILE Đ&Iacute;NH K&Egrave;M</a></p>
','05/03/2018',N'Trần Bá Xú','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD35','HDSV',N'Thử nghiệm sử dụng mẫu thẻ Hội viên loại mới',N'

<p>Thực hiện chủ trương của Trung ương Hội Sinh vi&ecirc;n Việt Nam về việc&nbsp;<strong>thử nghiệm sử dụng mẫu thẻ Hội vi&ecirc;n loại mới</strong>&nbsp;tại trường Đại học S&agrave;i G&ograve;n, tr&acirc;n trọng đề nghị c&aacute;c đồng ch&iacute; phối hợp, thực hiện triển khai c&ocirc;ng t&aacute;c đổi thẻ Hội vi&ecirc;n Hội Sinh vi&ecirc;n Việt Nam tại khoa. Qu&aacute; tr&igrave;nh triển khai thử nghiệm đổi thẻ ho&agrave;n to&agrave;n kh&ocirc;ng ph&aacute;t sinh chi ph&iacute; của sinh vi&ecirc;n.</p>

<p><strong>&nbsp;1. Li&ecirc;n Chi Hội Sinh vi&ecirc;n khoa&nbsp;C&ocirc;ng nghệ Th&ocirc;ng tin&nbsp;được lựa chọn th&iacute; điểm&nbsp;</strong></p>

<p><strong>2. Phạm vị thực hiện:&nbsp;</strong>To&agrave;n bộ c&aacute;c lớp Kh&oacute;a 15, 16, 17 (cả hệ Đại học v&agrave; Cao đẳng)</p>

<p><strong>3. C&aacute;ch thức triển khai như sau:</strong></p>

<p>B1: Chọn mỗi lớp tại đơn vị khoa một đại diện (B&iacute; thư/Chi hội trưởng/Lớp trưởng) c&oacute; năng lực để tổng hợp th&ocirc;ng tin to&agrave;n bộ SV tại lớp. Ai phụ tr&aacute;ch th&igrave; để t&ecirc;n đầu, b&ocirc;i mực đỏ để hệ thống tạo t&agrave;i khoản quản l&yacute; cho bạn đ&oacute;.</p>

<p>B2: Gửi lại danh s&aacute;ch to&agrave;n bộ c&aacute;c lớp, sinh vi&ecirc;n của khoa theo y&ecirc;u cầu mẫu b&ecirc;n dưới về email&nbsp;h<a href="mailto:sv.cntt@sgu.edu.vn">sv.cntt@sgu.edu.vn</a>&nbsp;<strong>trước ng&agrave;y 11/4/2018</strong>.</p>

<p>Ban Chấp h&agrave;nh Li&ecirc;n Chi Hội Sinh vi&ecirc;n khoa ph&acirc;n c&ocirc;ng đồng ch&iacute;&nbsp;<em>Trần Thị Tr&uacute;c Chi</em>&nbsp;(01655080910)&nbsp;phụ tr&aacute;ch nội dung n&agrave;y. Đề nghị c&aacute;c Chi Hội ở c&aacute;c kh&oacute;a&nbsp;15, 16, 17 (cả hệ Đại học v&agrave; Cao đẳng)&nbsp;nghi&ecirc;m t&uacute;c thực hiện v&agrave; triển khai hiệu quả.</p>

<p><a href="/Assets/plugins/Uploads/files/02.docx">files/TheHV-DSSV-ChiHoi.xlsx</a></p>

<p>&nbsp;</p>
','04/09/2018',N'Trần Bá Xú','04/11/2018','SV',1)



INSERT INTO Baidang  VALUES ('BD36','HDSV',N'Thông báo về cuộc thi tuổi trẻ học tập và làm theo tư tưởng đạo đức phong cách Hồ Chí Minh 2018',N'<p>Triển khai cuộc thi tuổi trẻ học tập v&agrave; theo theo tư tưởng , đạo đức, phong c&aacute;ch theo c&ocirc;ng văn số 469/TB-ĐHSG Hiệu trưởng đ&atilde; k&yacute; v&agrave;o ng&agrave;y 28/3/2018. Sinh vi&ecirc;n tham gia cuộc thi bằng 2 c&aacute;ch:</p>

<p>- V&agrave;o trang web ctsc.sgu.edu.vn</p>

<p>- Hoặc trang web hocvalamtheobac.vn</p>

<p>&nbsp;</p>
','04/02/2018',N'Trần Bá Xú','06/30/2019','SV',1)

---clbsv


INSERT INTO Baidang  VALUES ('BD37','HDSV',N'Thông báo về việc đăng ký tham dự cuộc thi Vô địch Tin học văn phòng Thế giới năm 2018',N'<p>Đăng k&yacute; tham dự cuộc thi V&ocirc; địch Tin học văn ph&ograve;ng Thế giới năm 2018.&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">Chi tiết tại đ&acirc;y.</a></p>

<p><a href="http://fit.sgu.edu.vn/web2017/detail/146/thong-bao-v-cu-c-thi-vo-d-ch-tin-h-c-th-gi-i-nam-2019/1">http://fit.sgu.edu.vn/web2017/detail/146/thong-bao-v-cu-c-thi-vo-d-ch-tin-h-c-th-gi-i-nam-2</a></p>

<p>&nbsp;</p>
','02/07/2018',N'Trần Bá Xú','12/30/2019','SV',1)




INSERT INTO Baidang  VALUES ('BD38','HDSV',N'Thông báo về việc triển khai chương trình tìm kiếm Đại sứ Adelaide',N'<p>Mọi chi tiết của th&ocirc;ng b&aacute;o c&aacute;c bạn sinh vi&ecirc;n&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">xem tại:</a></p>

<p>&nbsp;</p>
','09/19/2017',N'Trần Bá Xú','12/30/2019','SV',1)



INSERT INTO Baidang  VALUES ('BD39','HDSV',N'Lớp phổ cập kiến thức chứng khoáng dành cho sinh viên',N'<p>Căn cứ v&agrave;o c&ocirc;ng văn số 107/UBCK ng&agrave;y 15/10/2017 của Uỷ Ban Chứng Kho&aacute;n nh&agrave; nước. Nh&agrave; trường tạo điều kiện để sinh vi&ecirc;n tham gia lớp phổ cập kiến thức về chứng kho&aacute;n. Xem chi tiết&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">tại đ&acirc;y</a>.</p>

<p>&nbsp;</p>
','11/04/2018',N'Trần Bá Xú','12/30/2019','SV',1)


INSERT INTO Baidang  VALUES ('BD40','HDSV',N'Thông tin đăng kí nhận vé tham gia Halloween',N'<p>Hiện tại HSV trường đang giữ trong tay hơn 300 v&eacute; tham quan C&ocirc;ng vi&ecirc;n văn h&oacute;a Đầm Sen HALLOWEEN KỲ B&Iacute; hết sức hấp dẫn.Với nhiều s&acirc;n chơi giao lưu như:&nbsp;<br />
&nbsp;Kh&ocirc;ng gian ma qu&aacute;i.Hoạt động đường phố.&nbsp;H&oacute;a trang best costume.&nbsp;Đ&ecirc;m hội kỳ b&iacute;&nbsp;<br />
- V&eacute; c&oacute; gi&aacute; trị v&agrave;o cổng hoặc giảm 50% gi&aacute; c&aacute;c loại v&eacute; trọn g&oacute;i&nbsp;<br />
- V&eacute; được sử dụng trong ng&agrave;y 31/10/2018&nbsp;<br />
C&ograve;n chần chờ g&igrave; nữa m&agrave; kh&ocirc;ng đăng k&yacute; ngay để nhận v&eacute; ho&agrave;n to&agrave;n miễn ph&iacute;<br />
Thời hạn đăng k&yacute; t&iacute;nh từ b&acirc;y giờ cho đến 12h00 ng&agrave;y 31/10/2018 nha c&aacute;c bạn. Nhanh tay l&ecirc;n v&igrave; số lượng c&oacute; hạn n&egrave;.&nbsp;<br />
Link đăng k&yacute;:&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">/Assets/plugins/Uploads/files/02.docx</a></p>

<p>&nbsp;</p>
','10/29/2018',N'Trần Bá Xú','12/30/2019','SV',1)



INSERT INTO Baidang  VALUES ('BD41','HDSV',N'Hội thi thiết kế nhãn dán STICKER IN LAW',N'<p>Một s&acirc;n chơi mới cho những ai đam m&ecirc; thiết kế v&agrave; hội hoạ đ&atilde; xuất hiện rồi đ&acirc;yyyy&nbsp;</p>

<p>Hưởng ứng Ng&agrave;y Ph&aacute;p luật Việt Nam năm 2018, Ban Thường vụ Đo&agrave;n trường tổ chức Hội thi thiết kế nh&atilde;n d&aacute;n (sticker) tuy&ecirc;n truyền về Luật mang t&ecirc;n &quot;STICKER IN LAW&quot; .&nbsp;Hội thi nhằm ph&aacute;t huy khả năng s&aacute;ng tạo của giới trẻ, đồng thời t&igrave;m ra giải ph&aacute;p tuy&ecirc;n truyền Luật một c&aacute;ch trực quan sinh động, gần gũi v&agrave; hiệu quả với sinh vi&ecirc;n&nbsp;</p>

<p>C&aacute;c bạn sinh vi&ecirc;n của trường hoặc bất cứ c&ocirc;ng d&acirc;n Việt Nam n&agrave;o y&ecirc;u th&iacute;ch thể loại dễ thương n&agrave;y h&atilde;y nhanh ch&oacute;ng thực hiện ho&aacute; &yacute; tưởng v&agrave; gửi sản phẩm về cho BTC nh&eacute; .</p>

<p>Kh&ocirc;ng chỉ giải thưởng hấp dẫn m&agrave; bộ sticker đạt giải cao nhất sẽ được Đo&agrave;n trường đăng tải tr&ecirc;n hệ thống Zalo v&agrave; đưa v&agrave;o sử dụng rộng r&atilde;i nữa c&aacute;c bạn nhaaa.</p>

<p>&nbsp;Muốn c&oacute; bộ sản phẩm mang t&ecirc;n của m&igrave;nh th&igrave; h&atilde;y thể hiện khả năng s&aacute;ng tạo ngay v&agrave; lu&ocirc;n n&agrave;o, tụi m&igrave;nh chờ c&aacute;c bạn&nbsp;<br />
----<br />
Th&ocirc;ng tin chi tiết hội thi&nbsp;<a href="https://l.facebook.com/l.php?u=https%3A%2F%2Fgoo.gl%2FnT6vbX%3Ffbclid%3DIwAR1lRdTAOgY52XuIjTyiUsx7f0ofrmOz4VQGxpitBEupRWraKwRcOaky1J8&amp;h=AT1z9cDH0xR28zpoTpDtwuiE3am5Xgm5SynYq2qEDpJ16WZ0aVJtFQgTjLushrddYXwbIgYN2rVfZtKJKBOJKaJiwxovbC4Oj558bdfookpF0QfHuqtzytgWUKDtu20Y9SPTglTFzclJyj7v-RPzT9mpTEA">https://goo.gl/nT6vbX</a></p>
','10/22/2018',N'Trần Bá Xú','12/30/2019','SV',1)



INSERT INTO Baidang  VALUES ('BD42','HDSV',N'THE WINNER - Trận đấu đầy gay cấn và hồi hộp dành cho những chiến binh đã trở lại',N'

<p>Bạn muốn trau dồi v&agrave; n&acirc;ng cao vốn tiếng Anh?</p>

<p>Bạn muốn thử th&aacute;ch m&igrave;nh, vượt qua giới hạn của bản th&acirc;n v&agrave; đương đầu với những v&ograve;ng đấu h&oacute;c b&uacute;a, c&acirc;n n&atilde;o?</p>

<p>Bạn muốn mở rộng c&aacute;c mối quan hệ, r&egrave;n luyện kĩ năng l&agrave;m việc nh&oacute;m, t&agrave;i h&ugrave;ng biện cũng như c&aacute;c kĩ năng mềm cần thiết kh&aacute;c?</p>

<p>Bạn muốn tham gia một cuộc thi c&oacute; quy m&ocirc; lớn, được đầu tư ho&agrave;nh tr&aacute;ng với giải thưởng hấp dẫn?</p>

<p>C&aacute;c chiến binh của ch&uacute;ng ta c&ograve;n chờ đợi g&igrave; m&agrave; kh&ocirc;ng nhanh tay đăng k&yacute; tham gia c&ugrave;ng tụi m&igrave;nh n&agrave;o<br />
----------------<br />
The Winner l&agrave; một cuộc thi học thuật được tổ chức chuy&ecirc;n nghiệp với h&igrave;nh thức đổi mới đầy th&uacute; vị v&agrave; đặc sắc.<br />
Đ&acirc;y kh&ocirc;ng chỉ l&agrave; cơ hội để giao lưu v&agrave; học hỏi với c&aacute;c bạn sinh vi&ecirc;n khoa kh&aacute;c m&agrave; c&ograve;n l&agrave; nơi r&egrave;n luyện bản lĩnh, thể hiện sự tự tin, s&aacute;ng tạo v&agrave; năng động của sinh vi&ecirc;n thời k&igrave; hội nhập.<br />
Đặc biệt, 400 th&iacute; sinh vượt qua v&ograve;ng Loại 2 (kiến thức TA B1 chuẩn ch&acirc;u &Acirc;u) th&igrave; sẽ được cấp giấy chứng nhận c&oacute; gi&aacute; trị x&eacute;t SV 5 tốt cấp trường cũng như cấp khoa<br />
&nbsp;Chưa hết, lần đầu ti&ecirc;n tại The Winner, bạn c&oacute; thể tr&igrave;nh b&agrave;y &yacute; tưởng giải ph&aacute;p của m&igrave;nh về một vấn đề chung v&agrave; biến n&oacute; th&agrave;nh hiện thực nếu giải ph&aacute;p của bạn c&oacute; khả thi.<br />
-----------------</p>

<p>Đối tượng: tất cả sinh vi&ecirc;n trường ĐH S&agrave;i G&ograve;n</p>

<p>H&igrave;nh thức:&nbsp;<br />
V&ograve;ng loại 1 : Thi trực tuyến - Kiến thức tiếng anh tr&igrave;nh độ A2<br />
V&ograve;ng loại 2: Thi trực tuyến - Kiến thức tiếng anh tr&igrave;nh độ B1<br />
V&ograve;ng b&aacute;n kết 1:Thi trực tuyến - Kiến thức tiếng anh tr&igrave;nh độ C1<br />
V&ograve;ng b&aacute;n kết 2: Thuyết tr&igrave;nh nh&oacute;m<br />
V&ograve;ng chung kết: H&ugrave;ng biện tiếng Anh</p>

<p>C&aacute;ch thức đăng k&iacute;:<br />
Đăng k&iacute; trực tiếp v&agrave;o link&nbsp;<a href="https://l.facebook.com/l.php?u=https%3A%2F%2Fdrive.google.com%2Fopen%3Fid%3D1Rw3HohQR1I-5rzZra0UtVmpr9Qfy3dcGCbyT6XKEdbU%26fbclid%3DIwAR2Pi2fyKTFLLK0SfA_QTM9fJRRFh5z4R7HSqQEdlWYpwZaSY-pXJyvJItU&amp;h=AT3mqmH9bfCjIIVxU9ZPREFpMxNaLSp2xGAfXIgKWzXzSeGSQjeafKSW2J7Y3HSfZlRevVPqdTF06-w53HG4rV8MFx8_jskeB900dztWnJhgqAzHlQ_G_5UeohS0dyiL_kJG3OACnuyQs-91WJqGGh8e">https://drive.google.com/open&hellip;</a></p>

<p>Lệ ph&iacute;: 10.000 đ/ sv</p>

<p>Thời gian nhận lệ ph&iacute; thi v&agrave; danh s&aacute;ch: từ 15/10 - 22/10/2018</p>

<p>Mọi thắc mắc v&agrave; đ&oacute;ng lệ ph&iacute; xin li&ecirc;n hệ:&nbsp;<br />
- Đ/c Tr&uacute;c Chi: 01655080910 (LCHT LCH SV khoa)<br />
---------------<br />
✔Kế hoạch chi tiết v&agrave; mẫu danh s&aacute;ch:&nbsp;<br />
<a href="https://l.facebook.com/l.php?u=https%3A%2F%2Fgoo.gl%2FZY35wu%3Ffbclid%3DIwAR3jCBVQ4B3pVAM2joERxybUsI49Dc2n3803yvvFSvGIY7TiLWUOX0ww4oA&amp;h=AT3mgIXbPjq5GPcQa7kg5nyGrxZbwOy1yVRdwV3xPPh2fcSgV_NTCFraYgjvXvzgKAbz8vT52r6ZdwSmdkSopD8dm8rpiLGVMLS8IuxV4bR2pxMa_aun-oViUdi2K5HYiL5yo5Cz3u_wV0S6avpAHYay">goo.gl/ZY35wu</a></p>

<p>✔Mọi thắc mắc cần giải đ&aacute;p li&ecirc;n hệ Trang th&ocirc;ng tin Đo&agrave;n khoa Ngoại ngữ:&nbsp;<br />
<a href="https://www.facebook.com/doankhoangoaingusgu/">https://www.facebook.com/doankhoangoaingusgu/</a><br />
-----------------<br />
H&atilde;y c&ugrave;ng The Winner chiến đấu v&agrave; chiến thắng như những chiến binh mạnh mẽ nh&eacute;!!!<br />
✔Mọi thắc mắc cần giải đ&aacute;p li&ecirc;n hệ Trang th&ocirc;ng tin Đo&agrave;n khoa Ngoại ngữ:&nbsp;<br />
<a href="https://www.facebook.com/doankhoangoaingusgu/">https://www.facebook.com/doankhoangoaingusgu/</a><br />
-----------------<br />
H&atilde;y c&ugrave;ng The Winner chiến đấu v&agrave; chiến thắng như những chiến binh mạnh mẽ nh&eacute;!!!</p>

<p>&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;<br />
Xin ch&acirc;n th&agrave;nh cảm ơn&nbsp;</p>

<p>&nbsp;</p>
','10/16/2018',N'Trần Bá Xú','12/30/2019','SV',1)


INSERT INTO Baidang  VALUES ('BD43','TB',N'Trao học bổng cho đối tượng tân sinh viên vượt khó học giỏi',N'<p>Nhằm hỗ trợ những sinh vi&ecirc;n c&oacute; ho&agrave;n cảnh kh&oacute; khăn c&oacute; th&ecirc;m động lực để vươn l&ecirc;n trong học tập v&agrave; r&egrave;n luyện, Trung t&acirc;m H&ocirc;̃ trợ học sinh, sinh vi&ecirc;n Th&agrave;nh phố tổ chức trao học bổng cho đối tượng t&acirc;n sinh vi&ecirc;n vượt kh&oacute; học giỏi đang theo học tại c&aacute;c trường Đại học, Học viện, Cao đẳng tr&ecirc;n địa b&agrave;n TP.HCM trong năm học 2018 &ndash; 2019.<br />
&nbsp;Đối tượng:&nbsp;<br />
- C&oacute; ho&agrave;n cảnh kh&oacute; khăn, gia đ&igrave;nh ch&iacute;nh s&aacute;ch hoặc sổ hộ ngh&egrave;o (bản sao c&oacute; c&ocirc;ng chứng).<br />
- Mồ c&ocirc;i cha lẫn mẹ (thể hiện trong thư giới thiệu).<br />
* Đối với t&acirc;n sinh vi&ecirc;n kh&oacute;a 18, c&oacute; tổng điểm thi 3 m&ocirc;n tr&ecirc;n 20 điểm (kh&ocirc;ng nh&acirc;n hệ số, kh&ocirc;ng t&iacute;nh điểm ưu ti&ecirc;n).<br />
&nbsp;*Đối với sinh vi&ecirc;n năm 2 trở l&ecirc;n c&oacute; tổng điểm trung b&igrave;nh năm học 2017 - 2018 đạt từ 2.5 trở l&ecirc;n.<br />
Thời gian nộp hồ sơ: Trước 12 giờ ng&agrave;y 20/9/2018. (Li&ecirc;n hệ Thảo Đo&agrave;n - 0973472871)<br />
Th&ocirc;ng tin chi tiết vui l&ograve;ng xem th&ecirc;m tại link cuối b&agrave;i.<br />
<a href="http://www.sac.vn/article/tiep-nhan-ho-so-du-xet-hoc-bong-nam-hoc-2018-2019-danh-cho-tan-sinh-vien?fbclid=IwAR3gj16WPRKntOMA046zsjT0TQOCKHMmqQCK00s-UBV6Q1qA7ggmGbsA3H8">http://www.sac.vn/&hellip;/tiep-nhan-ho-so-du-xet-hoc-bong-nam-hoc&hellip;</a><br />
<a href="http://www.sac.vn/article/tiep-nhan-ho-so-du-xet-hoc-bong-nam-hoc-2018-2019-danh-cho-tan-sinh-vien?fbclid=IwAR2C7HqtYRPKzzZrB8sNJnzGRJLisVMNkLL3r7ZPrqmzF74FUF2JIpAl6PI">http://www.sac.vn/&hellip;/tiep-nhan-ho-so-du-xet-hoc-bong-nam-hoc&hellip;</a><br />
<a href="http://www.sac.vn/article/thong-bao-trien-khai-quy-hoc-bong-unilever-khoi-dau-thanh-cong-nam-2018?fbclid=IwAR2RgFBqCjqXuNrvv_Icuf6p20TgsfUMzZdB62gozCP1DUEb8nxHdhPDnEE">http://www.sac.vn/&hellip;/thong-bao-trien-khai-quy-hoc-bong-unile&hellip;</a></p>
','09/18/2018',N'Đinh Hoàn','10/20/2019','SV',1)


INSERT INTO Baidang  VALUES ('BD44','TB',N'Học bổng thắp sáng ước mơ cho Tuổi trẻ khoa Công nghệ thông tin',N'<p>Nhằm hỗ trợ sinh vi&ecirc;n c&oacute; ho&agrave;n cảnh kh&oacute; khăn c&oacute; th&ecirc;m động lực để vươn l&ecirc;n trong học tập v&agrave; r&egrave;n luyện, BCH d&agrave;nh tặng 05 suất học bổng cho 05 bạn sinh vi&ecirc;n khoa C&ocirc;ng nghệ Th&ocirc;ng tin c&oacute; ho&agrave;n cảnh kh&oacute; khăn.</p>

<p>Đối tượng: - Sinh vi&ecirc;n, c&aacute;n bộ Đo&agrave;n - Hội c&oacute; ho&agrave;n cảnh gia đ&igrave;nh kh&oacute; khăn, thuộc diện ch&iacute;nh s&aacute;ch, sinh vi&ecirc;n mồ c&ocirc;i, khuyết tật.</p>

<p>Hồ sơ bao gồm:&nbsp;<br />
- Thư đ&ecirc;̀ đạt nguy&ecirc;̣n vọng c&oacute; d&aacute;n ảnh 3x4 (mẫu đ&iacute;nh k&egrave;m).<br />
- Thư giới thi&ecirc;̣u tr&igrave;nh b&agrave;y v&ecirc;̀ hoàn cảnh gia đình và khát vọng học t&acirc;̣p.<br />
- Photo thẻ sinh vi&ecirc;n, chứng minh nh&acirc;n d&acirc;n.<br />
- Photo Gi&acirc;́y xác nh&acirc;̣n gia đình khó khăn, gia đình chính sách hoặc s&ocirc;̉ h&ocirc;̣ nghèo.&nbsp;<br />
(mọi giấy tờ tr&ecirc;n kh&ocirc;ng cần c&ocirc;ng chứng)</p>

<p>Mọi thắc mắc v&agrave; Hồ sơ sẽ gửi trực tiếp cho bạn&nbsp;<a href="https://www.facebook.com/ngoc.chuot.50767?__tn__=%2CdKH-R-R&amp;eid=ARBJSO4e9wp1FOAfo5eoxPkfP9eiw3NuftNRKaZHbvBSKaw1S2O1caEanhSu8HVHEm_XvNX-1yJlsKyu&amp;fref=mentions&amp;hc_location=group">Tr&uacute;c Chi</a>, sđt li&ecirc;n hệ: 01655080910</p>

<p>Hạn ch&oacute;t nhận hồ sơ l&agrave; 12 giờ ng&agrave;y 06/04/2018 (thứ 6)</p>

<p><a href="https://drive.google.com/file/d/1BstVQiyJTWnWnJ_0ZcESkMT8rGswCDuc/view?usp=sharing&amp;fbclid=IwAR3Hh5fNT69C7ewFQckM9waNT_EgUC_zetFPI43VC2LDTlT5ad3mlhH4las">https://drive.google.com/&hellip;/1BstVQiyJTWnWnJ_0ZcESkMT8r&hellip;/view&hellip;</a></p>

<p>&nbsp;</p>
','04/04/2018',N'Đinh Hoàn','10/20/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD45','TB',N'Thông báo học bổng Viso - Khởi đầu ngời sáng dành cho sinh viên',N'<p>Nhằm hỗ trợ những sinh vi&ecirc;n c&oacute; ho&agrave;n cảnh đặc biệt kh&oacute; khăn, tiếp th&ecirc;m động lực để vươn l&ecirc;n trong học tập v&agrave; r&egrave;n luyện, Trung t&acirc;m H&ocirc;̃ trợ học sinh, sinh vi&ecirc;n Th&agrave;nh phố phối hợp với C&ocirc;ng&nbsp;ty TNHH Quốc tế Unilever Việt Nam tổ chức trao quỹ học bổng &ldquo;Viso - Khởi đầu ngời s&aacute;ng&rdquo; cho sinh vi&ecirc;n vượt kh&oacute;, học giỏi đang theo học tại c&aacute;c trường tr&ecirc;n địa b&agrave;n TP.HCM năm học 2017 &ndash; 2018.<br />
II. Đối tượng &ndash; ti&ecirc;u chuẩn<br />
- Sinh vi&ecirc;n năm 2,3,4 đang theo học tại c&aacute;c trường Đại học, Học viện, Cao đẳng tr&ecirc;n địa bàn TP.HCM.<br />
- Ho&agrave;n cảnh gia đ&igrave;nh kh&oacute; khăn, diện ch&iacute;nh s&aacute;ch.&nbsp;<br />
- C&oacute; điểm trung b&igrave;nh năm học 2016 &ndash; 2017 đạt từ 7.0 (đối với c&aacute;c trường đ&agrave;o tạo theo ni&ecirc;n chế), 2.8 điểm trở l&ecirc;n (đối với c&aacute;c trường đ&agrave;o tạo theo t&iacute;n chỉ) v&agrave; c&oacute; tổng điểm tr&uacute;ng tuyển từ 19 điểm trở l&ecirc;n (đối với t&acirc;n sinh vi&ecirc;n).<br />
- Ưu ti&ecirc;n sinh vi&ecirc;n mồ c&ocirc;i, khuyết tật.<br />
- Chưa nhận học bổng x&atilde; hội trong năm 2017.<br />
III. Hồ sơ x&eacute;t trao học bổng bao gồm:<br />
- Thư đ&ecirc;̀ đạt nguy&ecirc;̣n vọng c&oacute; d&aacute;n ảnh 3x4 v&agrave; có xác nh&acirc;̣n của Đoàn Thanh ni&ecirc;n &ndash; Hội Sinh vi&ecirc;n trường&nbsp;<br />
- Thư giới thi&ecirc;̣u tr&igrave;nh b&agrave;y v&ecirc;̀ hoàn cảnh gia đình và khát vọng học t&acirc;̣p.<br />
- Bản sao bảng điểm năm học 2016 &ndash; 2017 hoặc gi&acirc;́y báo nh&acirc;̣p học, gi&acirc;́y báo trúng tuy&ecirc;̉n có th&ecirc;̉ hi&ecirc;̣n s&ocirc;́ đi&ecirc;̉m đạt được (đối với t&acirc;n sinh vi&ecirc;n) do trường ban h&agrave;nh hoặc bản sao có c&ocirc;ng chứng.<br />
- Bản sao CMND, thẻ sinh vi&ecirc;n (hoặc giấy x&aacute;c nhận sinh vi&ecirc;n)<br />
- Bản sao Gi&acirc;́y xác nh&acirc;̣n gia đình khó khăn, gia đình chính sách hoặc s&ocirc;̉ h&ocirc;̣ nghèo c&oacute; c&ocirc;ng chứng.&nbsp;<br />
Hạn ch&oacute;t gửi hồ sơ v&agrave; mail về: bichchiit1701@gmail.com l&uacute;c 8h ng&agrave;y 27/10/2017</p>
','10/26/2018',N'Đinh Hoàn','10/20/2019','SV',1)


INSERT INTO Baidang  VALUES ('BD46','TB',N'Thông báo tuyển sinh đào tạo trình độ thạc sĩ đợt 2 năm 2018',N'<p>Trường Đại học C&ocirc;ng nghệ Th&ocirc;ng tin-Đại học S&agrave;i G&ograve;n&nbsp;th&ocirc;ng b&aacute;o tuyển sinh đ&agrave;o tạo tr&igrave;nh độ thạc sĩ đợt 2&nbsp;năm 2018 như sau:</p>

<p><strong>NG&Agrave;NH TUYỂN SINH</strong></p>

<ul>
	<li>C&ocirc;ng nghệ th&ocirc;ng tin, m&atilde; ng&agrave;nh: 848 02 01.</li>
	<li>Khoa học m&aacute;y t&iacute;nh, m&atilde; ng&agrave;nh: 848 01 01.</li>
</ul>

<p><strong>H&Igrave;NH THỨC Đ&Agrave;O TẠO, THỜI GIAN Đ&Agrave;O TẠO</strong></p>

<p>Học tập trung, thời gian đ&agrave;o tạo 02 (hai) năm</p>

<p><strong>M&Ocirc;N THI TUYỂN V&Agrave; THỜI GIAN THI TUYỂN</strong></p>

<ol>
	<li><strong>C&aacute;c m&ocirc;n thi tuyển:</strong></li>
</ol>

<ul>
	<li>M&ocirc;n cơ bản (To&aacute;n cho m&aacute;y t&iacute;nh): thi tự luận.</li>
	<li>M&ocirc;n cơ sở (Tin học cơ sở): thi tự luận.</li>
	<li>M&ocirc;n&nbsp;tiếng Anh: thi trắc nghiệm.</li>
</ul>

<p>Nếu th&iacute; sinh đăng k&yacute; thi m&ocirc;n ngoại ngữ kh&aacute;c (tiếng Ph&aacute;p, Nga, Đức, Trung, Nhật) th&igrave; c&oacute; thể đăng k&yacute; thi tại c&aacute;c điểm thi ngoại ngữ trong kỳ tuyển sinh sau đại học do ĐHQG-HCM tổ chức.</p>

<ol>
	<li><strong>Ng&agrave;y thi tuyển:&nbsp;</strong>dự kiến&nbsp;<strong>20-21/10/2018</strong></li>
	<li><strong>Lệ ph&iacute; thi:&nbsp;</strong>120.000đ/m&ocirc;n.</li>
</ol>

<p><strong>CHỈ TI&Ecirc;U TUYỂN SINH</strong></p>

<ul>
	<li>Ng&agrave;nh Khoa học m&aacute;y t&iacute;nh: 24&nbsp;học vi&ecirc;n.</li>
	<li>Ng&agrave;nh C&ocirc;ng nghệ th&ocirc;ng tin: 53&nbsp;học vi&ecirc;n.</li>
</ul>

<p><strong>ƯU Đ&Atilde;I HỌC PH&Iacute; SAU KHI TH&Iacute; SINH TR&Uacute;NG TUYỂN</strong></p>

<p>Giảm 10% học ph&iacute; đối với sinh vi&ecirc;n tốt nghiệp đại học tại Trường Đại học S&agrave;i G&ograve;n; giảng vi&ecirc;n c&aacute;c Trường Đại học, Cao đẳng, Trung học Phổ th&ocirc;ng.</p>

<p>Giảm 5% học ph&iacute; đối với c&aacute;c đối tượng kh&aacute;c.</p>

<p>Chế độ ưu đ&atilde;i học ph&iacute; căn cứ theo Quy định h&agrave;ng năm của Trường.</p>

<p><strong>THỜI GIAN C&Ocirc;NG BỐ KẾT QUẢ THI V&Agrave; NG&Agrave;Y KHAI GIẢNG</strong></p>

<p>Thời gian c&ocirc;ng bố kết quả: dự kiến ng&agrave;y 21/11/2018.</p>

<p>Ng&agrave;y khai giảng, nhập học: dự kiến đầu th&aacute;ng 12/2018.</p>

<p><strong>ĐIỀU KIỆN DỰ TUYỂN</strong></p>

<p>Người dự tuyển đ&agrave;o tạo tr&igrave;nh độ thạc sĩ phải thoả c&aacute;c điều kiện sau:</p>

<ol>
	<li>Văn bằng&nbsp;tốt nghiệp đại học:&nbsp;phải thoả một trong c&aacute;c điều kiện như sau:</li>
</ol>

<ul>
	<li>Đ&atilde; tốt nghiệp đại học ng&agrave;nh đ&uacute;ng, ng&agrave;nh ph&ugrave; hợp với ng&agrave;nh đăng k&yacute; dự thi&nbsp;<a href="https://sdh.uit.edu.vn/sites/default/files/uploads/files/201802/phu_luc_1.docx">(Phụ lục 1)</a>.</li>
	<li>Th&iacute; sinh tốt nghiệp đại học ng&agrave;nh gần, ng&agrave;nh kh&aacute;c với ng&agrave;nh đăng k&yacute; dự thi phải học bổ sung kiến thức để đạt y&ecirc;u cầu chuy&ecirc;n m&ocirc;n dự thi đ&agrave;o tạo tr&igrave;nh độ thạc sĩ&nbsp;<a href="https://sdh.uit.edu.vn/sites/default/files/uploads/files/201802/phu_luc_1.docx">(Phụ lục 1)</a>.</li>
	<li>Phải c&oacute; đủ tr&igrave;nh độ ngoại ngữ để tham khảo t&agrave;i liệu, tham gia hoạt động chuy&ecirc;n m&ocirc;n phục vụ nghi&ecirc;n cứu v&agrave; thực hiện đề t&agrave;i luận văn.</li>
</ul>

<ol>
	<li>C&oacute; đủ sức khỏe để học tập.</li>
</ol>

<p><strong>ĐIỀU KIỆN MIỄN THI M&Ocirc;N TIẾNG ANH</strong></p>

<p>Người dự tuyển được miễn thi m&ocirc;n tiếng Anh nếu đ&aacute;p ứng một trong c&aacute;c y&ecirc;u cầu sau:</p>

<ul>
	<li>C&oacute; bằng tốt nghiệp đại học ng&agrave;nh&nbsp;ng&ocirc;n ngữ nước ngo&agrave;i (Anh, Ph&aacute;p, Nga, Đức, Trung, Nhật)&nbsp;do c&aacute;c cơ sở đ&agrave;o tạo của Việt Nam cấp;</li>
	<li>C&oacute; bằng tốt nghiệp đại học hay sau đại học&nbsp;được đ&agrave;o tạo to&agrave;n thời gian ở&nbsp;nước ngo&agrave;i m&agrave; ng&ocirc;n ngữ&nbsp;sử dụng trong đ&agrave;o tạo&nbsp;l&agrave; tiếng&nbsp;Anh v&agrave; được cơ quan c&oacute; thẩm quyền c&ocirc;ng nhận văn bằng theo quy định hiện h&agrave;nh;</li>
	<li>C&oacute; bằng tốt nghiệp đại học&nbsp;của&nbsp;c&aacute;c chương tr&igrave;nh&nbsp;ti&ecirc;n tiến theo Đề &aacute;n của Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo, trong đ&oacute; chương tr&igrave;nh giảng dạy ho&agrave;n to&agrave;n bằng tiếng Anh được Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo hoặc ĐHSG c&ocirc;ng nhận;</li>
	<li>C&oacute; một trong c&aacute;c&nbsp;chứng&nbsp;chỉ, chứng nhận tr&igrave;nh độ ngoại ngữ được quy định tối thiểu cấp độ B1, c&ograve;n hiệu lực 2 năm t&iacute;nh từ ng&agrave;y cấp chứng chỉ/ chứng nhận đến ng&agrave;y 20/10/2018:</li>
</ul>

<p>Tiếng Anh&nbsp;Cấp&nbsp;độ CEFR B1:</p>

<table align="center" style="width:612px">
	<tbody>
		<tr>
			<td>
			<p><strong>IELTS</strong></p>
			</td>
			<td>
			<p><strong>TOEFL</strong></p>
			</td>
			<td>
			<p><strong>TOEIC</strong></p>
			</td>
			<td>
			<p><strong>Cambridge Exam</strong></p>
			</td>
			<td>
			<p><strong>BEC</strong></p>
			</td>
			<td>
			<p><strong>BULATS</strong></p>
			</td>
			<td>
			<p><strong>VNU-EPT</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p>4.5</p>
			</td>
			<td>
			<p>450 PBT/ITP</p>

			<p>133 CBT</p>

			<p>45 iBT</p>
			</td>
			<td>
			<p>450</p>
			</td>
			<td>
			<p>Preliminary PET</p>
			</td>
			<td>
			<p>Business Preliminary</p>
			</td>
			<td>
			<p>40</p>
			</td>
			<td>
			<p>201</p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p>Một số tiếng kh&aacute;c:</p>

<table style="width:624px">
	<tbody>
		<tr>
			<td>
			<p><strong>Cấp độ (CEFR)</strong></p>
			</td>
			<td>
			<p><strong>Tiếng Nga</strong></p>
			</td>
			<td>
			<p><strong>Tiếng Ph&aacute;p</strong></p>
			</td>
			<td>
			<p><strong>Tiếng Đức</strong></p>
			</td>
			<td>
			<p><strong>Tiếng Trung</strong></p>
			</td>
			<td>
			<p><strong>Tiếng Nhật</strong></p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>B1</strong></p>
			</td>
			<td>
			<p>TRKI 1</p>
			</td>
			<td>
			<p>DELF B1<br />
			TCF niveau B1</p>
			</td>
			<td>
			<p>B1<br />
			ZD</p>
			</td>
			<td>
			<p>HSK<br />
			cấp độ 3</p>
			</td>
			<td>
			<p>JLPT N3</p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<ul>
	<li>Chứng chỉ tiếng Anh tr&igrave;nh độ B1 của Trường Đại học Ngoại ngữ-Đại học Quốc gia H&agrave; Nội; Trường Đại học H&agrave; Nội; Trường Đại học Ngoại ngữ-Đại học Đ&agrave; Nẵng; Trường Đại học Ngoại ngữ-Đại học Huế; Trường Đại học Sư phạm Tp.HCM; Trường Đại học Th&aacute;i Nguy&ecirc;n; Trường Đại học Sư phạm H&agrave; Nội; Trường Đại học Vinh; Trường Đại học Cần Thơ; Trung t&acirc;m SEAMEO RETRAC.</li>
	<li>Giấy&nbsp;chứng&nbsp;nhận điểm m&ocirc;n thi tiếng Anh đạt từ 50 điểm trở l&ecirc;n trong kỳ thi tuyển sinh sau đại học do ĐHSG tổ chức (từ đợt&nbsp;12&nbsp;năm 2016).</li>
</ul>

<p><strong>HỒ SƠ ĐĂNG K&Yacute; DỰ TUYỂN</strong></p>

<ol>
	<li><strong>Thời gian nhận hồ sơ:</strong><strong>&nbsp;</strong><strong>từ ng&agrave;y ra th&ocirc;ng b&aacute;o đến hết ng&agrave;y&nbsp;</strong><strong>02/10/2018</strong>.</li>
	<li><strong>Lệ ph&iacute; hồ sơ:&nbsp;</strong>60.000 đ/ bộ.</li>
	<li><strong>Hồ sơ đăng k&yacute; dự tuyển&nbsp;gồm:</strong>
	<ol>
		<li>Đơn xin&nbsp;dự&nbsp;tuyển&nbsp;</li>
		<li>L&yacute; lịch&nbsp;khoa học&nbsp;</li>
		<li>Bản sao bằng tốt nghiệp đại học;</li>
		<li>Bản sao bảng điểm đại học;</li>
		<li>Bản sao bằng tốt nghiệp cao đẳng (nếu c&oacute;);</li>
		<li>Bản sao bảng điểm cao đẳng (nếu c&oacute;);</li>
		<li>Bảng điểm&nbsp;c&aacute;c m&ocirc;n học&nbsp;bổ t&uacute;c kiến thức (nếu thuộc đối tượng ng&agrave;nh gần);</li>
		<li>Bản sao văn bằng, chứng chỉ ngoại ngữ (nếu c&oacute;);</li>
		<li>Giấy chứng nhận&nbsp;sức khỏe;</li>
		<li>Giấy chứng nhận đối tượng ch&iacute;nh s&aacute;ch (nếu c&oacute;);</li>
		<li>2 tấm ảnh 3x4&nbsp;(<em>ghi r&otilde; họ t&ecirc;n, ng&agrave;y sinh</em>).</li>
	</ol>
	</li>
</ol>

<p><strong>ĐỐI&nbsp;TƯỢNG&nbsp;V&Agrave; CH&Iacute;NH S&Aacute;CH ƯU TI&Ecirc;N</strong></p>

<ol>
	<li><strong>Đối tượng ưu ti&ecirc;n:</strong></li>
</ol>

<p>Người c&oacute; thời gian c&ocirc;ng t&aacute;c li&ecirc;n tục từ 2 năm trở l&ecirc;n (t&iacute;nh đến ng&agrave;y hết hạn nộp hồ sơ đăng k&yacute; dự tuyển) tại c&aacute;c địa phương được quy định l&agrave; Khu vực 1 trong Quy chế thi trung học phổ th&ocirc;ng quốc gia v&agrave; phải c&oacute; quyết định tiếp nhận c&ocirc;ng t&aacute;c hoặc điều động, biệt ph&aacute;i c&ocirc;ng t&aacute;c của cơ quan, tổ chức c&oacute; thẩm quyền;</p>

<p>Thương binh, người hưởng ch&iacute;nh s&aacute;ch thương binh;</p>

<p>Con liệt sĩ;</p>

<p>Anh h&ugrave;ng lực lượng vũ trang, anh h&ugrave;ng lao động;</p>

<p>Con đẻ của người hoạt động kh&aacute;ng chiến bị nhiễm chất độc ho&aacute; học, được Uỷ ban nh&acirc;n d&acirc;n cấp tỉnh c&ocirc;ng nhận bị dị dạng, dị tật, suy giảm khả năng tự lực trong sinh hoạt, học tập do hậu quả của chất độc ho&aacute; học;</p>

<p>Người thuộc d&acirc;n tộc thiểu số.</p>

<p><strong>&nbsp; &nbsp;</strong> 2.<strong> Mức ưu ti&ecirc;n:</strong></p>

<p>Người thuộc diện ưu ti&ecirc;n được cộng v&agrave;o kết quả thi 10 điểm (thang điểm 100) cho m&ocirc;n tiếng Anh nếu kh&ocirc;ng thuộc diện được miễn thi tiếng Anh, v&agrave; cộng 1.0 điểm (thang điểm 10) cho một trong hai m&ocirc;n thi theo nguy&ecirc;n tắc ưu ti&ecirc;n m&ocirc;n thi c&oacute; điểm &lt;5.0. C&aacute;c trường hợp c&ograve;n lại th&igrave; cộng 1.0 điểm v&agrave;o m&ocirc;n cơ sở.</p>
','09/13/2018',N'Trần Bá Xú','10/01/2019','GV',1)



INSERT INTO Baidang  VALUES ('BD47','TB',N'Thông báo sinh hoạt đầu khoá cao học khoá 13 đợt 2 năm 2018',N'<p>Trường Đại học S&agrave;i G&ograve;n&nbsp;th&ocirc;ng b&aacute;o đến c&aacute;c Anh/Chị học vi&ecirc;n đ&atilde; tr&uacute;ng tuyển chương tr&igrave;nh đ&agrave;o tạo tr&igrave;nh độ thạc sĩ kho&aacute; 13 đợt 2&nbsp;bao gồm: 35&nbsp;học vi&ecirc;n lớp C&ocirc;ng nghệ Th&ocirc;ng tin, 23&nbsp;học vi&ecirc;n lớp Khoa học M&aacute;y t&iacute;nh tham gia buổi sinh hoạt đầu kh&oacute;a như sau:</p>

<p>Thời gian: L&uacute;c&nbsp;<strong>14&nbsp;giờ 00</strong>&nbsp;s&aacute;ng ng&agrave;y&nbsp;<strong>08/12/2018</strong>.</p>

<p>Địa điểm:Khu A&nbsp;Ph&ograve;ng A107,&nbsp; 273 An Dương Vương, P.3, Q.5&nbsp;TP.HCM</p>

<p>Th&agrave;nh phần tham dự: Trưởng khoa- Khoa học m&aacute;y t&iacute;nh, Trưởng Bộ m&ocirc;n- Khoa học v&agrave; Kỹ thuật th&ocirc;ng tin, Trưởng ph&ograve;ng- ĐTSĐH&amp;KHCN, v&agrave; c&aacute;c Thầy/C&ocirc; trong ph&ograve;ng, khoa, bộ m&ocirc;n.</p>

<p>Đề nghị c&aacute;c Anh/Chị thu xếp thời gian tham dự đầy đủ v&agrave; đ&uacute;ng giờ.</p>

<p>Tr&acirc;n trọng.</p>

<p>Ph&ograve;ng ĐTSĐH&amp;KHCN.</p>

<p>P/S: Anh/Chị học vi&ecirc;n c&oacute; thể đến l&agrave;m thủ tục nhập học v&agrave; nộp minh chứng miễn giảm s&aacute;ng ng&agrave;y 08/12/2018.</p>
','11/28/2018',N'Trần Bá Xú','10/20/2019','GV',1)

INSERT INTO Baidang  VALUES ('BD48','SK',N'Thư mời tham gia Giải thưởng Nhân tài Đất Việt 2018',N'<p>K&iacute;nh gửi Qu&yacute; Thầy/C&ocirc;,</p>

<p>&nbsp;</p>

<p>Ph&ograve;ng ĐTSĐH&amp;KHCN k&iacute;nh gửi Qu&yacute; Thầy/C&ocirc; &quot;Thư mời tham gia giải thưởng Nh&acirc;n t&agrave;i Đất Việt 2018&quot; của Tập đo&agrave;n Bưu ch&iacute;nh Viễn th&ocirc;ng Việt Nam (VNPT) v&agrave; B&aacute;o D&acirc;n tr&iacute; đồng tổ chức.</p>

<p>&nbsp;</p>

<p>Nội dung chi tiết: Qu&yacute; Thầy/C&ocirc; vui l&ograve;ng xem file đ&iacute;nh k&egrave;m.</p>

<p>&nbsp;</p>

<p>Tr&acirc;n trọng.</p>

<p>Ph&ograve;ng ĐTSĐH&amp;KHCN.</p>

<p>File đ&iacute;nh k&egrave;m:&nbsp;</p>
','08/06/2018',N'Đinh Hoàn','10/20/2019','GV',1)

INSERT INTO Baidang  VALUES ('BD49','TB',N'Thông báo về việc khảo sát HVCH khóa 2018 đợt 1 về hoạt động giảng dạy của GV năm 2018',N'<p>Ph&ograve;ng ĐTSĐH&amp;KHCN th&ocirc;ng b&aacute;o đến c&aacute;c học vi&ecirc;n kh&oacute;a tuyển 2018 đợt 1 khảo s&aacute;t HVCH về hoạt động của Giảng vi&ecirc;n năm 2018 (chi tiết cụ thể xem trong file đ&iacute;nh k&egrave;m).</p>

<p>Đề nghị c&aacute;c Anh/Chị học vi&ecirc;n thực hiện theo y&ecirc;u cầu của th&ocirc;ng b&aacute;o số 130/TB-ĐHSG, ng&agrave;y 25 th&aacute;ng 10 năm 2018.</p>

<p>Tr&acirc;n trọng.</p>

<p>Ph&ograve;ng ĐTSĐH&amp;KHCN.</p>

<p>File đ&iacute;nh k&egrave;m:&nbsp;</p>
','10/31/2018',N'Trần Bá Xú','10/20/2019','GV',1)

INSERT INTO Baidang  VALUES ('BD50','TB',N'Thông báo tuyển Intership và Postdoc',N'<p>Ch&agrave;o&nbsp;c&aacute;c bạn sinh vi&ecirc;n, học vi&ecirc;n cao học, nghi&ecirc;n cứu sinh&nbsp;v&agrave; c&aacute;c giảng vi&ecirc;n,</p>

<p>Hiện tại Ph&ograve;ng th&iacute; nghiệm ph&acirc;n t&iacute;ch dữ liệu lớn, Viện Tin học v&agrave; Truyền th&ocirc;ng, Nhật bản (NICT) đang tuyển 2 sinh vi&ecirc;n l&agrave;m 3-6 th&aacute;ng intership (sinh vi&ecirc;n đại học, học vi&ecirc;n cao học, NCS), v&agrave; 1-2 năm post-doc (giảng vi&ecirc;n, nghi&ecirc;n cứu vi&ecirc;n c&oacute; bằng tiến sĩ).</p>

<p>Y&ecirc;u cầu như sau:</p>

<p>A.</p>

<p>- C&oacute; nền tảng về m&aacute;y học (machine learning), khai kho&aacute;ng dữ liệu (data mining), học s&acirc;u (deep learning), thị gi&aacute;c m&aacute;y t&iacute;nh (computer vision)</p>

<p>Hoặc&nbsp;</p>

<p>- IoT (lắp đặt c&aacute;c sensor từ c&aacute;c bộ phận ri&ecirc;ng rẽ + kiến thức networking)</p>

<p>B.</p>

<p>- Th&agrave;nh thạo lập tr&igrave;nh với 1 hoặc nhiều ng&ocirc;n ngữ như Python, Java, R, SQL</p>

<p>C.</p>

<p>- Tiếng Anh giao tiếp c&ocirc;ng việc, đọc v&agrave; viết tốt</p>

<p>Ứng vi&ecirc;n c&oacute; nguyện vọng xin gửi email (bằng tiếng Anh) k&egrave;m CV về:</p>

<p>Đ&agrave;o Minh Sơn, Senior Researcher, NICT</p>

<p><a href="mailto:dao@nict.go.jp">dao@nict.go.jp</a></p>

<p>Tr&acirc;n trọng.</p>

<p>Ph&ograve;ng ĐTSĐH&amp;KHCN.</p>
','11/09/2018',N'Trần Bá Xú','10/20/2019','GV',1)

INSERT INTO Baidang  VALUES ('BD51','TB',N'Thông báo lịch thi môn Công nghệ mạng và truyền thông hiện đại',N'<p>Ph&ograve;ng ĐTSĐH&amp;KHCN th&ocirc;ng b&aacute;o đến Anh/Chị học vi&ecirc;n cao học lịch thi&nbsp;cụ thể như sau:</p>

<p>Thời gian:&nbsp;<strong>tối thứ năm ng&agrave;y 31/5/2018, t</strong><strong>ừ 18g00 đến 20g00, thời gian thi&nbsp;</strong>120 ph&uacute;t. Danh s&aacute;ch ph&ograve;ng thi xem&nbsp;<a href="https://sdh.uit.edu.vn/sites/default/files/uploads/images/201805/kq_dkhp_cong_nghe_mang_va_truyen_thong_hien_dai.xlsx">tại đ&acirc;y</a>.</p>

<p>Địa điểm : Hội trường B<strong>,&nbsp;</strong>273 An Dương Vương, P.3, Q.5&nbsp;TP.HCM</p>

<p>Lưu &yacute;: Học vi&ecirc;n c&oacute; mặt tại ph&ograve;ng thi đ&uacute;ng giờ, mang theo thẻ học vi&ecirc;n (CMND) tr&igrave;nh c&aacute;n bộ coi thi.</p>

<p>Tr&acirc;n trọng</p>

<p>Ph&ograve;ng ĐTSĐH&amp;KHCN</p>
','05/29/2018',N'Trần Bá Xú','10/20/2019','GV',1)

INSERT INTO Baidang  VALUES ('BD52','TB',N'Thông báo về lệ phí tốt nghiệp thạc sĩ đợt 2 năm 2018',N'<p>Ph&ograve;ng ĐTSĐH&amp;KHCN th&ocirc;ng b&aacute;o đến c&aacute;c Anh/Chị học vi&ecirc;n đ&atilde; đăng k&yacute; x&eacute;t tốt nghiệp thạc sĩ về thời gian dự kiến tổ chức lễ tốt nghiệp đợt 2 v&agrave;o th&aacute;ng 12/2018 (chi tiết cụ thể sẽ th&ocirc;ng b&aacute;o sau).</p>

<p>Đề nghị c&aacute;c học vi&ecirc;n ho&agrave;n tất việc nộp lệ ph&iacute; tốt nghiệp theo th&ocirc;ng b&aacute;o 134/TB-ĐHSG, ng&agrave;y 15 th&aacute;ng 11 năm 2018 của Ph&ograve;ng Kế hoạch - T&agrave;i ch&iacute;nh. (xem file đ&iacute;nh k&egrave;m)</p>

<p>Thời hạn: từ ng&agrave;y ra th&ocirc;ng b&aacute;o đến ng&agrave;y 30/11/2018.</p>

<p>Nộp trực tiếp tại: Ph&ograve;ng Kế hoạch - T&agrave;i ch&iacute;nh, 273 An Dương Vương, P.3, Q.5&nbsp;TPHCM. (c&oacute; thể nhờ bạn b&egrave; trong c&ugrave;ng nh&oacute;m đ&oacute;ng gi&uacute;p).</p>

<p>Đề nghị c&aacute;c Anh/ Chị thực hiện theo đ&uacute;ng quy định.</p>

<p>Ph&ograve;ng ĐTSĐH&amp;KHCN.</p>

<p>File đ&iacute;nh k&egrave;m:&nbsp;</p>
','11/21/2018',N'Trần Bá Xú','10/20/2019','GV',1)


INSERT INTO Baidang  VALUES ('BD53','TB',N'Thông tin học bổng DAAD scholarship Programmes for Vietnam',N'<p>Ph&ograve;ng ĐTSĐH&amp;KHCN nhận được th&ocirc;ng tin của chương tr&igrave;nh học bổng của Cơ quan trao đổi h&agrave;n l&acirc;m Đức (DAAD)&nbsp;<strong>&quot; DAAD scholarship Programmes for Vietnam&quot;&nbsp;</strong>từ Ph&ograve;ng QHĐN. Nay, Ph&ograve;ng th&ocirc;ng b&aacute;o đến c&aacute;c Anh/Chị học vi&ecirc;n c&oacute; quan t&acirc;m về chương tr&igrave;nh học bổng tại file đ&iacute;nh k&egrave;m.</p>

<p>- Tham khảo tại website:&nbsp;<a href="https://deref-web-02.de/mail/client/jtweyOFjJw0/dereferrer/?redirectUrl=http%3A%2F%2Fwww.daad-vietnam.vn">www.daad-vietnam.vn</a>&nbsp;.</p>

<p><strong>- Chi tiết li&ecirc;n hệ; Mr B&igrave;nh theo email:&nbsp;</strong>&lt;<a href="mailto:binh@daadvn.org">binh@daadvn.org</a>.</p>

<p>Ph&ograve;ng ĐTSĐH&amp;KHCN.</p>

<p>File đ&iacute;nh k&egrave;m:&nbsp;</p>

<p><img alt="PDF icon" src="https://sdh.uit.edu.vn/modules/file/icons/application-pdf.png" />&nbsp;<a href="https://sdh.uit.edu.vn/sites/default/files/201810/daad_scholarship_programmes_for_vietnam.pdf">daad_scholarship_programmes_for_vietnam.pdf</a></p>
','10/03/2018',N'Đinh Hoàn','10/20/2019','GV',1)


INSERT INTO Baidang  VALUES ('BD54','TB',N'Thông báo chương trình học bổng TOSHIBA năm 2018',N'<p>Thực hiện tại c&ocirc;ng văn số 1330/ ĐHQG- QHĐN, ng&agrave;y 17 th&aacute;ng 7 năm 2018 của Đại học Quốc gia Th&agrave;nh phố Hồ Ch&iacute; Minh (ĐHQG-HCM), Trường Đại học S&agrave;i G&ograve;n&nbsp;tr&acirc;n trọng&nbsp;th&ocirc;ng b&aacute;o đến c&aacute;c Anh/ Chị học vi&ecirc;n về chương tr&igrave;nh học&nbsp;&nbsp;bổng Toshiba năm học 2018 như sau:</p>

<p>Chương tr&igrave;nh học bổng Toshiba nhằm hỗ trợ những học vi&ecirc;n xuất sắc, c&oacute; ho&agrave;n cảnh kh&oacute; khăn về kinh tế, sẽ hoặc đang học chương tr&igrave;nh Thạc sĩ/Tiến sĩ tại Đại học Quốc gia Th&agrave;nh phố Hồ Ch&iacute; Minh (ĐHQG-HCM) v&agrave; c&oacute; triển vọng trở th&agrave;nh những người l&atilde;nh đạo tiềm năng trong tương lai. Chương tr&igrave;nh học bổng Toshiba năm 2018 sẽ cấp học bổng trong nước cho c&aacute;c học vi&ecirc;n thuộc c&aacute;c ng&agrave;nh khoa học, kỹ thuật v&agrave; c&aacute;c chuy&ecirc;n ng&agrave;nh kh&aacute;c.&nbsp;</p>

<p>Trong năm 2018 (t&iacute;nh từ ng&agrave;y khai giảng năm học 2018-2019), chương tr&igrave;nh học bổng Toshiba sẽ cấp c&aacute;c suất học bổng bao gồm: năm (05) học bổng to&agrave;n phần trị gi&aacute; 200,000 JPY/năm học v&agrave; năm (05) học bổng b&aacute;n phần trị gi&aacute; 100,000 JPY/năm học. &nbsp;&nbsp;</p>

<p>Hồ sơ ứng tuyển vui l&ograve;ng&nbsp;<strong>nộp tại Văn ph&ograve;ng khoa,&nbsp;Trường Đại học S&agrave;i G&ograve;n&nbsp;(A107) trước ng&agrave;y 02/08/2018</strong>&nbsp;để Ph&ograve;ng l&agrave;m c&ocirc;ng văn gửi ĐHQG.</p>

<p>Th&ocirc;ng tin chi tiết, vui l&ograve;ng xem th&ecirc;m file đ&iacute;nh k&egrave;m.</p>

<p>Ph&ograve;ng ĐTSĐH&amp;KHCN.</p>

<p>File đ&iacute;nh k&egrave;m:&nbsp;</p>

<p>&nbsp;</p>
','07/18/2018',N'Đinh Hoàn','10/20/2019','GV',1)


INSERT INTO Baidang  VALUES ('BD55','TB',N'Thông báo về chương trình thực tập và postdoc tại Nhật',N'<p>Ph&ograve;ng ĐTSĐH&amp;KHCN th&ocirc;ng b&aacute;o đến c&aacute;c Anh/ Chị học vi&ecirc;n cao học v&agrave; Nghi&ecirc;n cứu sinh quan t&acirc;m về chương tr&igrave;nh thực tập v&agrave; postdoc tại Nhật (intership 6 th&aacute;ng thực tập ở Nhật) với đề t&agrave;i nghi&ecirc;n cứu li&ecirc;n quan tới Machine Learning, Computer Vision, Data Science.</p>

<p>Ngo&agrave;i ra, c&ograve;n một suất postdoc tai đại học Osaka, về Media Clone, c&oacute; thể l&agrave;m ngắn hạn 6 th&aacute;ng hoặc d&agrave;i hạn 3 năm.</p>

<p>Anh/Chị học vi&ecirc;n n&agrave;o quan t&acirc;m, vui l&ograve;ng li&ecirc;n lạc với TS. Đ&agrave;o Minh Sơn (<a href="mailto:sondm@uit.edu.vn">sondm@uit.edu.vn</a>) để biết th&ecirc;m chi tiết.</p>

<p>&nbsp;</p>

<p>Ph&ograve;ng ĐTSĐH&amp;KHCN.</p>
','06/22/2018',N'Trần Bá Xú','10/20/2019','GV',1)

INSERT INTO Baidang  VALUES ('BD56','TT',N'Trường ĐH Sài Gòn tổ chức Hội thảo Nhà tuyển dụng và người giỏi nghề phân tích năng lực phục vụ cải tiến chất lượng chương trình đào tạo
',N'<p>V&agrave;o ng&agrave;y 17 th&aacute;ng 11 năm 2018, tại số 273 An Dương Vương, Phường 3, Quận 5, Th&agrave;nh phố Hồ Chí Minh, Trường Đại học S&agrave;i G&ograve;n đ&atilde; tổ chức Hội thảo &ldquo;Hội thảo Nh&agrave; tuyển dụng v&agrave; người giỏi nghề ph&acirc;n t&iacute;ch năng lực phục vụ cải tiến chất lượng chương tr&igrave;nh đ&agrave;o tạo&rdquo;.<br />
Hội thảo được tổ chức với sự phối hợp của trường Đại học S&agrave;i G&ograve;n v&agrave; Trung t&acirc;m Đ&agrave;o tạo Quản l&yacute; Ti&ecirc;n tiến (TCAM) Đại học Quốc Gia Th&agrave;nh phố Hồ Ch&iacute; Minh.<br />
Hội thảo n&agrave;y tập trung thảo luận v&agrave; lắng nghe &yacute; kiến của c&aacute;c chuy&ecirc;n gia, nh&agrave; tuyển dụng, những người lao động l&agrave;nh nghề m&ocirc; tả y&ecirc;u cầu đối với th&aacute;i độ, kỹ năng, kiến thức, năng lực của người học theo phương ph&aacute;p DACUM.<br />
Hội thảo gồm ba phi&ecirc;n: DACUM 1 li&ecirc;n quan đến ng&agrave;nh Khoa học M&ocirc;i trường, DACUM 2 li&ecirc;n quan đến ng&agrave;nh Sư ph&aacute;p To&aacute;n học v&agrave; DACUM 3 li&ecirc;n quan đến ng&agrave;nh C&ocirc;ng nghệ th&ocirc;ng tin.<br />
Đến với Hội thảo, về ph&iacute;a Nh&agrave; trường c&oacute; TS. L&ecirc; Chi Lan, Ph&oacute; Hiệu trưởng Nh&agrave; trường chủ tr&igrave; Hội thảo, về ph&iacute;a kh&aacute;ch mời c&oacute; c&aacute;c nh&agrave; quản l&yacute; doanh nghiệp, c&aacute;c nh&acirc;n vi&ecirc;n giỏi việc, Ban gi&aacute;m hiệu v&agrave; gi&aacute;o vi&ecirc;n của c&aacute;c trường Phổ th&ocirc;ng v&agrave; 1 số chuy&ecirc;n gia của Trung t&acirc;m Đ&agrave;o tạo Quản l&yacute; Ti&ecirc;n tiến (TCAM) Đại học Quốc Gia Th&agrave;nh phố Hồ Ch&iacute; Minh.<br />
Trong nhiều năm qua, hệ thống đảm bảo chất lượng của trường Đại học S&agrave;i G&ograve;n c&oacute; sự ph&aacute;t triển đồng bộ giữa c&aacute;c mặt: đảm bảo chất lượng b&ecirc;n trong, đảm bảo chất lượng b&ecirc;n ngo&agrave;i v&agrave; kiểm định chất lượng. Đồng thời, c&oacute; sự kết hợp giữa y&ecirc;u cầu đảm bảo chất lượng của Bộ GD&amp;ĐT v&agrave; Mạng lưới c&aacute;c trường đại học Đ&ocirc;ng Nam &Aacute; (AUN). Chuẩn kiểm định chất lượng AUN l&agrave; mục ti&ecirc;u m&agrave; trường ĐH S&agrave;i G&ograve;n hướng tới. Phương ch&acirc;m phấn đấu của Nh&agrave; trường kh&ocirc;ng chỉ l&agrave; thu h&uacute;t học vi&ecirc;n m&agrave; c&ograve;n khẳng định chất lượng đ&agrave;o tạo v&agrave; dần tiến tới l&agrave; việc x&acirc;y dựng văn h&oacute;a chất lượng của một trường ĐH.<br />
&ldquo;Hội thảo Nh&agrave; tuyển dụng v&agrave; người giỏi nghề ph&acirc;n t&iacute;ch năng lực phục vụ cải tiến chất lượng chương tr&igrave;nh đ&agrave;o tạo&rdquo; theo chuẩn AUN-QA của Trường Đại học S&agrave;i G&ograve;n l&agrave; một hoạt động quan trọng trong lộ tr&igrave;nh cải tiến chất lượng hệ thống đảm bảo chất lượng của m&igrave;nh, phấn đấu c&oacute; &iacute;t nhất 2 chương đ&agrave;o tạo được đ&aacute;nh gi&aacute; chất lượng theo chuẩn AUN-QA v&agrave;o năm 2020 v&agrave; Nh&agrave; trường được đ&aacute;nh gi&aacute; cấp cơ sở theo chuẩn AUN-QA v&agrave;o năm 2025.<br />
Gi&aacute; trị cốt l&otilde;i của Hội thảo bao gồm thứ nhất t&igrave;m hiểu nhu cầu v&agrave; y&ecirc;u cầu nghề nghiệp trong thực tế, đ&aacute;p ứng được y&ecirc;u cầu của nh&agrave; tuyển dụng, thứ hai t&igrave;m hiểu thị phần v&agrave; xu thế ph&aacute;t triển trong 3 &ndash; 5 năm tới từ đ&oacute; thiết kế v&agrave; cải tiến chương tr&igrave;nh đ&agrave;o tạo. Sau đ&acirc;y l&agrave; một số h&igrave;nh ảnh của Hội thảo.</p>

<p><img alt="" src="http://sgu.edu.vn/wp-content/uploads/2018/11/image001-6-1024x683.jpg" style="height:683px; width:1024px" />H&igrave;nh 1: TS. L&ecirc; Chi Lan, Ph&oacute; Hiệu trưởng Nh&agrave; trường ph&aacute;t biểu khai mạc Hội thảo</p>

<p>&nbsp;</p>

<p><img alt="" src="http://sgu.edu.vn/wp-content/uploads/2018/11/image002-4-1024x683.jpg" style="height:683px; width:1024px" />H&igrave;nh 2: TS. Nguyễn Thanh Thủy chuy&ecirc;n gia TCAM triển khai Hội thảo, hướng dẫn phương ph&aacute;p DACUM.</p>

<p>&nbsp;</p>

<p><img alt="" src="http://sgu.edu.vn/wp-content/uploads/2018/11/image003-8-1024x683.jpg" style="height:683px; width:1024px" />H&igrave;nh 3: C&aacute;c đại biểu n&ecirc;u c&aacute;c y&ecirc;u cầu chuy&ecirc;n m&ocirc;n của nh&agrave; tuyển dụng tại phi&ecirc;n DACUM 1</p>

<p>&nbsp;</p>

<p><img alt="" src="http://sgu.edu.vn/wp-content/uploads/2018/11/image004-2-1024x684.jpg" style="height:684px; width:1024px" />H&igrave;nh 4: Ban Gi&aacute;m hiệu v&agrave; c&aacute;c gi&aacute;o vi&ecirc;n của trường Phổ th&ocirc;ng thực hiện biểu mẫu khảo s&aacute;t tại phi&ecirc;n DACUM 2.</p>

<p>&nbsp;</p>

<p><img alt="" src="http://sgu.edu.vn/wp-content/uploads/2018/11/image005-4-1024x683.jpg" style="height:683px; width:1024px" />H&igrave;nh 5: TS. Nguyễn Thanh Thủy thảo luận c&ugrave;ng c&aacute;c gi&aacute;o vi&ecirc;n trường Phổ th&ocirc;ng tại phi&ecirc;n DACUM 2.</p>

<p>&nbsp;</p>

<p><img alt="" src="http://sgu.edu.vn/wp-content/uploads/2018/11/image006-3-1024x683.jpg" style="height:683px; width:1024px" />H&igrave;nh 6: TS. L&ecirc; Chi Lan giải đ&aacute;p c&aacute;c c&acirc;u hỏi của c&aacute;c gi&aacute;o vi&ecirc;n trường Phổ th&ocirc;ng tại phi&ecirc;n DACUM 2</p>

<p>&nbsp;</p>

<p><img alt="" src="http://sgu.edu.vn/wp-content/uploads/2018/11/image007-3-1024x684.jpg" style="height:684px; width:1024px" />H&igrave;nh 7: Nh&agrave; quản l&yacute; v&agrave; người giỏi việc trao đổi &yacute; kiến về lĩnh vực c&ocirc;ng nghệ th&ocirc;ng tin trong phi&ecirc;n DACUM 3.</p>

<p>&nbsp;</p>

<p><img alt="" src="http://sgu.edu.vn/wp-content/uploads/2018/11/image008-2-1024x684.jpg" style="height:684px; width:1024px" />H&igrave;nh 8: &Yacute; kiến của c&aacute;c đại biểu về c&aacute;c kỹ năng cần thiết được thể hiện tr&ecirc;n c&aacute;c bảng.</p>

<p>&nbsp;</p>

<p><img alt="" src="http://sgu.edu.vn/wp-content/uploads/2018/11/image009-3-1024x683.jpg" style="height:683px; width:1024px" />H&igrave;nh 9: Ban Gi&aacute;m hiệu, l&atilde;nh đạo khoa trao đổi th&ocirc;ng tin với nh&agrave; tuyển dụng b&ecirc;n lề Hội thảo.</p>

<p>&nbsp;</p>

<p><img alt="" src="http://sgu.edu.vn/wp-content/uploads/2018/11/image010-2-1024x683.jpg" style="height:683px; width:1024px" />H&igrave;nh 10: Giảng vi&ecirc;n Khoa Khoa học M&ocirc;i trường chụp h&igrave;nh lưu niệm với c&aacute;c đại biểu.</p>

<p>&nbsp;</p>

<p><img alt="" src="http://sgu.edu.vn/wp-content/uploads/2018/11/image011-2-1024x684.jpg" style="height:684px; width:1024px" />H&igrave;nh 11: C&aacute;c giảng vi&ecirc;n Khoa C&ocirc;ng nghệ th&ocirc;ng tin chụp h&igrave;nh lưu niệm với c&aacute;c đại biểu.</p>
','11/22/2018',N'Đinh Hoàn','12/20/2019','GV',1)

INSERT INTO Baidang  VALUES ('BD57','TT',N'Lễ trao Quyết định bổ nhiệm chức danh Phó Giáo sư năm 2018',N'<p>S&aacute;ng ng&agrave;y 19/06/2018, tại Ph&ograve;ng HB.406 trường Đại học S&agrave;i G&ograve;n đ&atilde; diễn ra lễ trao Quyết định bổ nhiệm chức danh cho c&aacute;c nh&agrave; gi&aacute;o vừa được Hội đồng Chức danh Gi&aacute;o sư Nh&agrave; nước c&ocirc;ng nhận đạt ti&ecirc;u chuẩn chức danh Ph&oacute; Gi&aacute;o sư năm 2018.<br />
Trong dịp n&agrave;y, trường Đại học S&agrave;i G&ograve;n c&oacute; 5 nh&agrave; gi&aacute;o được bổ nhiệm chức danh Ph&oacute; Gi&aacute;o sư. Buổi lễ trao Quyết định bổ nhiệm chức danh Ph&oacute; Gi&aacute;o sư trường Đại học S&agrave;i G&ograve;n đ&atilde; diễn ra trong kh&ocirc;ng kh&iacute; trang trọng v&agrave; th&acirc;n t&igrave;nh.<br />
Mở đầu buổi lễ, TS.Th&aacute;i Huy Bảo &ndash; Trưởng Ph&ograve;ng Tổ chức c&aacute;n bộ thừa uỷ nhiệm Hiệu trưởng Nh&agrave; trường c&ocirc;ng bố c&aacute;c quyết định bổ nhiệm c&aacute;c t&acirc;n Ph&oacute; Gi&aacute;o sư của trường Đại học S&agrave;i g&ograve;n bao gồm:<br />
1. PGS.TS.Trần Th&aacute;i H&agrave; &ndash; Giảng vi&ecirc;n Khoa Sư phạm X&atilde; hội.<br />
2. PGS.TS.Nguyễn Ho&agrave; &ndash; Ph&oacute; Trưởng Khoa C&ocirc;ng nghệ Th&ocirc;ng tin<br />
3. PGS.TS.V&otilde; Th&agrave;nh L&acirc;m &ndash; Trưởng Khoa Sư phạm Khoa học Tự nhi&ecirc;n<br />
4. PGS.TS.Mỵ Giang Sơn &ndash; Trưởng Ph&ograve;ng Đ&agrave;o tạo<br />
5. PGS.TS.Vũ C&ocirc;ng Thương &ndash; Giảng vi&ecirc;n Khoa Gi&aacute;o dục Ch&iacute;nh trị<br />
Thay mặt ban l&atilde;nh đạo Nh&agrave; trường, PGS.TS.Phạm Ho&agrave;ng Qu&acirc;n &ndash; Hiệu trưởng trường Đại học S&agrave;i G&ograve;n đ&atilde; trao quyết định, PGS.TS.Nguyễn Khắc H&ugrave;ng, Ph&oacute; Hiệu trưởng trao tặng hoa v&agrave; ch&uacute;c mừng c&aacute;c Ph&oacute; Gi&aacute;o sư mới được bổ nhiệm. Đ&acirc;y kh&ocirc;ng chỉ l&agrave; niềm vui, niềm tự h&agrave;o của c&aacute;c c&aacute; nh&acirc;n được vinh danh, m&agrave; c&ograve;n l&agrave; niềm vinh dự của trường Đại học S&agrave;i G&ograve;n. Việc bổ sung đội ngũ những nh&agrave; khoa học c&oacute; tr&igrave;nh độ chuy&ecirc;n m&ocirc;n s&acirc;u sẽ g&oacute;p phần khẳng định t&ecirc;n tuổi v&agrave; vị tr&iacute; của trường Đại học S&agrave;i G&ograve;n trong lộ tr&igrave;nh ph&aacute;t triển trường theo định hướng nghi&ecirc;n cứu, chuy&ecirc;n nghiệp, hiện đại, hội nhập khu vực v&agrave; quốc tế.</p>

<p><img alt="" src="http://sgu.edu.vn/wp-content/uploads/2018/06/TanPGS-1024x768.jpg" style="height:768px; width:1024px" /></p>

<p>Ban Gi&aacute;m hiệu Nh&agrave; trường c&ugrave;ng c&aacute;c t&acirc;n Ph&oacute; Gi&aacute;o sư</p>

<p>Trong kh&ocirc;ng kh&iacute; h&acirc;n hoan của buổi lễ, PGS.TS.Mỵ Giang Sơn, thay mặt c&aacute;c t&acirc;n Ph&oacute; Gi&aacute;o sư gửi lời cảm ơn tới Ban Gi&aacute;m hiệu, c&aacute;c thầy c&ocirc; đ&atilde; hỗ trợ, động vi&ecirc;n v&igrave; một tập thể đo&agrave;n kết v&agrave; ph&aacute;t triển.</p>

<p><img alt="" src="http://sgu.edu.vn/wp-content/uploads/2018/06/ThaySon-608x1024.jpg" style="height:1024px; width:608px" /></p>

<p>PGS.TS.Mỵ Giang Sơn thay mặt c&aacute;c t&acirc;n Ph&oacute; Gi&aacute;o sư gửi lời cảm ơn.</p>

<p>Việc x&eacute;t c&ocirc;ng nhận đạt ti&ecirc;u chuẩn chức danh Ph&oacute; Gi&aacute;o sư l&agrave; một chủ trương lớn của Đảng v&agrave; Nh&agrave; nước nhằm n&acirc;ng cao chất lượng gi&aacute;o dục bậc đại học v&agrave; sau đại học trong nước theo hướng hội nhập, ph&ugrave; hợp với th&ocirc;ng lệ quốc tế.</p>

<p>Ban Gi&aacute;m hiệu Nh&agrave; trường cũng ch&acirc;n th&agrave;nh nhắn nhủ với c&aacute;c t&acirc;n Ph&oacute; Gi&aacute;o sư h&atilde;y tiếp tục c&ocirc;ng t&aacute;c, giảng dạy, nghi&ecirc;n cứu khoa học l&agrave; đ&oacute;ng g&oacute;p thiết thực nhất cho sự nghiệp ph&aacute;t triển của Trường v&agrave; của Th&agrave;nh phố Hồ Ch&iacute; Minh.</p>
','06/19/2018',N'Trần Bá Xú','10/20/2019','GV',1)

INSERT INTO Baidang  VALUES ('BD58','TT',N'Tham gia thi trực tuyến Hội thi "Công chức - Viên chức - Người lao động ĐHSG-HCM hưởng ứng ngày pháp luật Việt Nam"',N'<p>K&iacute;nh gửi qu&yacute; Thầy C&ocirc;,<br />
Văn ph&ograve;ng C&ocirc;ng đo&agrave;n tr&acirc;n trọng k&iacute;nh mời qu&yacute; Thầy C&ocirc; tham gia&nbsp;thi&nbsp;trực tuyến&nbsp;Hội&nbsp;thi&nbsp;&quot;C&ocirc;ng chức, vi&ecirc;n chức, người lao động ĐHSG-HCM hưởng ứng Ng&agrave;y&nbsp;Ph&aacute;p&nbsp;luật&nbsp;Việt Nam&quot;.<br />
- Địa chỉ tham gia&nbsp;Hội&nbsp;thi&nbsp;:&nbsp;<a href="http://congdoan.vnuhcm.edu.vn/tracnghiem"><strong>http://congdoan.vnuhcm.edu.vn/tracnghiem</strong></a><br />
- Thời gian&nbsp;thi&nbsp;bắt đầu từ:&nbsp;<strong>08g00 ng&agrave;y 22/10/2018 đến 24g00 ng&agrave;y 24/10/2018.</strong></p>

<p>Tr&acirc;n trọng.</p>

<p>File đ&iacute;nh k&egrave;m:&nbsp;</p>

<p><img alt="Microsoft Office document icon" src="http://congdoan.uit.edu.vn/modules/file/icons/x-office-document.png" />&nbsp;<a href="http://congdoan.uit.edu.vn/sites/congdoan/files/uploads/files/201810/thele_thihuongung_ngayphapluat_thoai.doc">thele_thihuongung_ngayphapluat_thoai.doc</a></p>

<p><img alt="PDF icon" src="http://congdoan.uit.edu.vn/modules/file/icons/application-pdf.png" />&nbsp;<a href="http://congdoan.uit.edu.vn/sites/congdoan/files/uploads/files/201810/to_chuc_hoi_thi_phap_luat.pdf">to_chuc_hoi_thi_phap_luat.pdf</a></p>

<p><img alt="PDF icon" src="http://congdoan.uit.edu.vn/modules/file/icons/application-pdf.png" />&nbsp;<a href="http://congdoan.uit.edu.vn/sites/congdoan/files/uploads/files/201810/cv_1904_ve_viec_to_chuc_hoi_thi_cc.vc_.nld_huong_ung_ngay_phap_luat.pdf">cv_1904_ve_viec_to_chuc_hoi_thi_cc.vc_.nld_huong_ung_ngay_phap_luat.pdf</a></p>

<p>&nbsp;</p>
','10/22/2018',N'Trần Bá Xú','10/20/2019','GV',1)


INSERT INTO Baidang  VALUES ('BD59','TT',N'Mời tham dự Chuyên đề "Chế độ chính sách đối với cán bộ, công chức, viên chức và người lao động"',N'<p>K&iacute;nh gửi qu&yacute; Thầy C&ocirc;,</p>

<p>Thực hiện&nbsp;C&ocirc;ng văn số 147/CĐ-ĐHQG ng&agrave;y 06/10/2016 của&nbsp;C&ocirc;ng&nbsp;đo&agrave;n&nbsp;ĐHQG-HCM về&nbsp;việc hưởng ứng ng&agrave;y ph&aacute;p luật Việt Nam, Ban Chấp h&agrave;nh&nbsp;C&ocirc;ng&nbsp;đo&agrave;n&nbsp;Trường phối hợp Ph&ograve;ng Thanh tra - Ph&aacute;p chế - Đảm bảo Chất lượng&nbsp;x&acirc;y dựng Kế hoạch tổ chức&nbsp;Chuy&ecirc;n đề&nbsp;<strong>&quot;Chế độ ch&iacute;nh s&aacute;ch đối với c&aacute;n bộ,&nbsp;c&ocirc;ng&nbsp;chức, vi&ecirc;n chức v&agrave; người lao động&quot;</strong>&nbsp;năm 2016, cụ thể như sau;</p>

<p>1. Đối tượng tham dự:&nbsp;<strong>C&aacute;n bộ,&nbsp;c&ocirc;ng&nbsp;chức, vi&ecirc;n chức,&nbsp;</strong><strong>người&nbsp;lao động của Trường.</strong></p>

<p>2. Thời gian tổ chức:<strong>&nbsp;14h00 ng&agrave;y 08/11/2016 tại ph&ograve;ng A116.</strong></p>

<p>3. B&aacute;o c&aacute;o vi&ecirc;n&nbsp;tr&igrave;nh b&agrave;y:<strong>&nbsp;ThS. L&acirc;m Tường Thoại, Chủ tịch&nbsp;C&ocirc;ng&nbsp;đo&agrave;n&nbsp;ĐHQG-HCM</strong><strong>,&nbsp;Trưởng ban Thanh tra&nbsp;-&nbsp;Ph&aacute;p chế&nbsp;ĐHQG-HCM.</strong></p>

<p>4.&nbsp;<strong>Nội dung:</strong></p>

<p><strong>-&nbsp;</strong>B&aacute;o c&aacute;o chuy&ecirc;n đề &ldquo;Chế độ ch&iacute;nh s&aacute;ch đối với c&aacute;n bộ,&nbsp;c&ocirc;ng&nbsp;chức, vi&ecirc;n chức v&agrave; người lao động&quot;</p>

<p>- Trao đổi thắc mắc về c&aacute;c chế độ, ch&iacute;nh s&aacute;ch với&nbsp;c&aacute;n bộ,&nbsp;c&ocirc;ng&nbsp;chức, vi&ecirc;n chức,&nbsp;ngườilao động.</p>

<p>C&ocirc;ng&nbsp;đo&agrave;n&nbsp;Trường k&iacute;nh đề nghị qu&yacute; Thầy C&ocirc; sắp xếp thời gian tham dự. K&iacute;nh đề nghị C&ocirc;ng&nbsp;đo&agrave;n&nbsp;Bộ phận lập danh s&aacute;ch qu&yacute; Thầy C&ocirc; tham dự gửi về Văn ph&ograve;ng&nbsp;C&ocirc;ng&nbsp;đo&agrave;ncho anh Vũ Văn Điệp trước&nbsp;<strong>12h00 ng&agrave;y 7/11/2016</strong>.</p>

<p>Tr&acirc;n trọng.</p>

<p>File đ&iacute;nh k&egrave;m:&nbsp;</p>

<p><img alt="Tập tin" src="http://congdoan.uit.edu.vn/modules/file/icons/x-office-document.png" />&nbsp;<a href="http://congdoan.uit.edu.vn/sites/congdoan/files/uploads/files/201611/kh_to_chuc_bao_cao_chuyen_de_ngay_phap_luat_vn.docx">kh_to_chuc_bao_cao_chuyen_de_ngay_phap_luat_vn.docx</a></p>
','11/03/2018',N'Trần Bá Xú','10/20/2019','GV',1)

INSERT INTO Baidang  VALUES ('BD60','TT',N'Công chức TP.HCM phải mặc quần tây, áo sơ mi đi làm',N'<p>Ng&agrave;y 29-12, UBND TP.HCM đ&atilde; c&oacute; quyết định về việc ban h&agrave;nh quy định li&ecirc;n quan đến quy tắc ứng xử của c&aacute;n bộ, c&ocirc;ng chức, vi&ecirc;n chức v&agrave; người lao động l&agrave;m việc trong c&aacute;c cơ quan h&agrave;nh ch&iacute;nh, đơn vị sự nghiệp c&ocirc;ng lập tr&ecirc;n địa b&agrave;n TP.HCM.</p>

<p>Trong đ&oacute;, quần t&acirc;y, &aacute;o sơ mi, &aacute;o d&agrave;i được quy định l&agrave; trang phục c&ocirc;ng sở của c&aacute;n bộ c&ocirc;ng chức TP.HCM.</p>

<p><strong>Phải l&agrave;m đủ 8 giờ/ng&agrave;y</strong></p>

<p>Về thời gian l&agrave;m việc, UBND TP.HCM y&ecirc;u cầu c&aacute;n bộ, c&ocirc;ng chức, vi&ecirc;n chức chấp h&agrave;nh nghi&ecirc;m quy định về thời gian l&agrave;m việc của Nh&agrave; nước, sử dụng hiệu quả giờ l&agrave;m việc.&nbsp;</p>

<p>Buổi s&aacute;ng từ 7h30 đến 11h30. Chiều từ 13h đến 17h. Giờ l&agrave;m việc n&agrave;y c&oacute; thể điều chỉnh ph&ugrave; hợp với đặc th&ugrave;, y&ecirc;u cầu c&ocirc;ng t&aacute;c của từng cơ quan, đơn vị nhưng phải đảm bảo đủ 8 giờ l&agrave;m việc/ng&agrave;y.</p>

<p>Đối với c&aacute;c đơn vị sự nghiệp c&ocirc;ng lập, căn cứ t&igrave;nh h&igrave;nh thực tế bố tr&iacute; thời gian l&agrave;m việc ph&ugrave; hợp, đảm bảo đ&uacute;ng quy định của Bộ Luật Lao động. Đối với cơ quan, đơn vị được quy định phải tổ chức l&agrave;m việc s&aacute;ng thứ bảy h&agrave;ng tuần để tiếp nhận, giải quyết thủ tục h&agrave;nh ch&iacute;nh.</p>

<p><strong>Kh&ocirc;ng xem quần jean, &aacute;o thun l&agrave; trang phục c&ocirc;ng sở</strong></p>

<p>Khi thực hiện nhiệm vụ, c&ocirc;ng chức phải mặc trang phục lịch sự, đầu t&oacute;c gọn g&agrave;ng, đi gi&agrave;y hoặc d&eacute;p c&oacute; quai hậu.&nbsp;&nbsp;</p>

<p>Đối với nam: mặc quần t&acirc;y, &aacute;o sơmi. Nữ mặc quần t&acirc;y; v&aacute;y d&agrave;i (chiều d&agrave;i v&aacute;y tối thiểu ngang gối), &aacute;o sơmi (&aacute;o c&oacute; tay); comple; bộ &aacute;o d&agrave;i truyền thống.</p>

<p>Những ng&agrave;nh c&oacute; quy định ri&ecirc;ng về đồng phục th&igrave; thực hiện theo quy định của ng&agrave;nh.</p>

<p>Ngo&agrave;i ra, lễ phục của c&ocirc;ng chức l&agrave; trang phục ch&iacute;nh thức được sử dụng trong những buổi lễ, cuộc họp trọng thể. Đối với nam: quần t&acirc;y, &aacute;o sơmi, c&agrave; vạt hoặc bộ comple. Đối với nữ: &aacute;o d&agrave;i truyền thống hoặc bộ comple nữ.</p>

<p>C&ocirc;ng chức phải đeo thẻ c&ocirc;ng chức khi l&agrave;m việc v&agrave; khi thực hiện nhiệm vụ b&ecirc;n ngo&agrave;i cơ quan.</p>

<p><strong>Kh&ocirc;ng đeo tai nghe, chơi game trong giờ l&agrave;m việc</strong></p>

<p>C&aacute;n bộ, c&ocirc;ng chức, vi&ecirc;n chức kh&ocirc;ng được uống bia, rượu, đồ uống c&oacute; cồn trong giờ l&agrave;m việc, giờ nghỉ trưa của ng&agrave;y l&agrave;m việc, ng&agrave;y trực.</p>

<p>Kh&ocirc;ng h&uacute;t thuốc l&aacute; trong khu&ocirc;n vi&ecirc;n&nbsp;trụ sở cơ quan, ph&ograve;ng l&agrave;m việc, ph&ograve;ng họp v&agrave; hội trường. Kh&ocirc;ng đ&aacute;nh bạc,&nbsp;tham gia c&aacute;c tệ nạn hoặc c&aacute;c h&agrave;nh vi kh&aacute;c tr&aacute;i với quy định ph&aacute;p luật dưới mọi h&igrave;nh thức.</p>

<p>Đặc biệt, kh&ocirc;ng đeo tai nghe, bật nhạc, nghe nhạc, chơi điện tử v&agrave; c&aacute;c thiết bị&nbsp;giải tr&iacute; c&aacute; nh&acirc;n trong giờ l&agrave;m việc; kh&ocirc;ng truy cập c&aacute;c trang mạng c&oacute; nội dung kh&ocirc;ng li&ecirc;n quan đến việc thực hiện nhiệm vụ, c&ocirc;ng vụ.&nbsp;</p>

<p>Hoạt động thờ c&uacute;ng trong ph&ograve;ng l&agrave;m việc v&agrave; hoạt động m&ecirc; t&iacute;n dị đoan kh&ocirc;ng được chấp nhận.</p>

<p>Khi giao tiếp v&agrave; ứng xử với nh&acirc;n d&acirc;n phải c&oacute; th&aacute;i độ niềm nở, nh&atilde; nhặn, lắng nghe &yacute; kiến, giải th&iacute;ch, hướng dẫn r&otilde; r&agrave;ng, cụ thể về c&aacute;c quy định li&ecirc;n quan đến giải quyết c&ocirc;ng việc. Kh&ocirc;ng được c&oacute; th&aacute;i độ h&aacute;ch dịch, nhũng nhiễu; kh&ocirc;ng g&acirc;y căng thẳng, bức x&uacute;c, dọa nạt người d&acirc;n.</p>

<p>Ngo&agrave;i ra, khi giao tiếp qua điện thoại, c&ocirc;ng chức phải xưng t&ecirc;n, chức danh, chức vụ, cơ quan, đơn vị nơi c&ocirc;ng t&aacute;c; trao đổi ngắn gọn, tập trung v&agrave;o nội dung c&ocirc;ng việc; &acirc;m lượng vừa đủ nghe; kh&ocirc;ng tỏ th&aacute;i độ thiếu lịch sự, kh&ocirc;ng gắt gỏng hay n&oacute;i trống kh&ocirc;ng; kh&ocirc;ng ngắt điện thoại đột ngột.</p>
','06/10/2018',N'Trần Bá Xú','10/20/2019','GV',1)

GO
CREATE TABLE Chitietbaidang
(	
	Mabaidang varchar(50),
	TagID VARCHAR(50),
	Flag BIT,
	PRIMARY KEY (Mabaidang,TagID),
	FOREIGN KEY (TagID) REFERENCES Tag(TagID),
	FOREIGN KEY (Mabaidang) REFERENCES Baidang (Mabaidang)
)
INSERT INTO Chitietbaidang VALUES ('BD1','7',1)
INSERT INTO Chitietbaidang VALUES ('BD2','2',1)
INSERT INTO Chitietbaidang VALUES ('BD3','7',1)
INSERT INTO Chitietbaidang VALUES ('BD4','2',1)
INSERT INTO Chitietbaidang VALUES ('BD5','2',1)
INSERT INTO Chitietbaidang VALUES ('BD6','3',1)
INSERT INTO Chitietbaidang VALUES ('BD7','1',1)
INSERT INTO Chitietbaidang VALUES ('BD8','1',1)
INSERT INTO Chitietbaidang VALUES ('BD9','10',1)
INSERT INTO Chitietbaidang VALUES ('BD10','10',1)
INSERT INTO Chitietbaidang VALUES ('BD11','6',1)
INSERT INTO Chitietbaidang VALUES ('BD12','6',1)
INSERT INTO Chitietbaidang VALUES ('BD13','6',1)
INSERT INTO Chitietbaidang VALUES ('BD14','6',1)
INSERT INTO Chitietbaidang VALUES ('BD15','5',1)
INSERT INTO Chitietbaidang VALUES ('BD16','8',1)
INSERT INTO Chitietbaidang VALUES ('BD17','8',1)
INSERT INTO Chitietbaidang VALUES ('BD18','8',1)
INSERT INTO Chitietbaidang VALUES ('BD19','8',1)
INSERT INTO Chitietbaidang VALUES ('BD20','1',1)
INSERT INTO Chitietbaidang VALUES ('BD21','2',1)
INSERT INTO Chitietbaidang VALUES ('BD22','2',1)
INSERT INTO Chitietbaidang VALUES ('BD23','3',1)
INSERT INTO Chitietbaidang VALUES ('BD24','1',1)
INSERT INTO Chitietbaidang VALUES ('BD25','4',1)
INSERT INTO Chitietbaidang VALUES ('BD26','2',1)
INSERT INTO Chitietbaidang VALUES ('BD27','2',1)
INSERT INTO Chitietbaidang VALUES ('BD28','2',1)
INSERT INTO Chitietbaidang VALUES ('BD29','2',1)
INSERT INTO Chitietbaidang VALUES ('BD30','4',1)
INSERT INTO Chitietbaidang VALUES ('BD31','4',1)
INSERT INTO Chitietbaidang VALUES ('BD32','5',1)
INSERT INTO Chitietbaidang VALUES ('BD33','5',1)
INSERT INTO Chitietbaidang VALUES ('BD34','5',1)
INSERT INTO Chitietbaidang VALUES ('BD35','5',1)
INSERT INTO Chitietbaidang VALUES ('BD36','5',1)
INSERT INTO Chitietbaidang VALUES ('BD37','9',1)
INSERT INTO Chitietbaidang VALUES ('BD38','9',1)
INSERT INTO Chitietbaidang VALUES ('BD39','9',1)
INSERT INTO Chitietbaidang VALUES ('BD40','5',1)
INSERT INTO Chitietbaidang VALUES ('BD41','9',1)
INSERT INTO Chitietbaidang VALUES ('BD42','9',1)
INSERT INTO Chitietbaidang VALUES ('BD43','10',1)
INSERT INTO Chitietbaidang VALUES ('BD44','10',1)
INSERT INTO Chitietbaidang VALUES ('BD45','10',1)
INSERT INTO Chitietbaidang VALUES ('BD46','7',1)
INSERT INTO Chitietbaidang VALUES ('BD47','7',1)
INSERT INTO Chitietbaidang VALUES ('BD48','1',1)
INSERT INTO Chitietbaidang VALUES ('BD49','3',1)
INSERT INTO Chitietbaidang VALUES ('BD50','7',1)
INSERT INTO Chitietbaidang VALUES ('BD51','3',1)
INSERT INTO Chitietbaidang VALUES ('BD52','3',1)
INSERT INTO Chitietbaidang VALUES ('BD53','10',1)
INSERT INTO Chitietbaidang VALUES ('BD54','10',1)
INSERT INTO Chitietbaidang VALUES ('BD55','6',1)
INSERT INTO Chitietbaidang VALUES ('BD56','1',1)
INSERT INTO Chitietbaidang VALUES ('BD57','2',1)
INSERT INTO Chitietbaidang VALUES ('BD58','2',1)
INSERT INTO Chitietbaidang VALUES ('BD59','2',1)
INSERT INTO Chitietbaidang VALUES ('BD60','2',1)



GO

CREATE TABLE Loaidaotao
(
	MaloaiDT VARCHAR(50) PRIMARY KEY,
	Tenloai NVARCHAR(100),
	Flag BIT,
)
go
INSERT INTO LoaiDaotao  VALUES  ( 'DH', N'Trình độ Đại học ',1)

INSERT INTO LoaiDaotao  VALUES  ( 'TS', N'Trình độ Thạc sĩ ',1)

INSERT INTO LoaiDaotao  VALUES  ( 'TiS', N'Trình độ Tiến sĩ ',1)
GO
CREATE TABLE NoidungDT
(
	MaNDDT VARCHAR(50) PRIMARY KEY,
	MaloaiDT VARCHAR(50),
	Tieude NVARCHAR(100),
	NoidungDT NVARCHAR(MAX),
	Ngaydang DATETIME,
	Tentaikhoan VARCHAR(100),	
	Flag BIT,
	FOREIGN KEY (MaloaiDT) REFERENCES LoaiDaotao(MaloaiDT),
	FOREIGN KEY (Tentaikhoan) REFERENCES Taikhoan (Tentaikhoan)
)
go
INSERT INTO NoidungDT	VALUES  ( 'NDDT1' ,'DH' ,N'Ngành Công nghệ thông tin - Hệ chính quy',N'<p>&nbsp;Đ&agrave;o tạo Kỹ sư ng&agrave;nh C&ocirc;ng nghệ th&ocirc;ng tin; c&aacute;c kỹ sư ng&agrave;nh C&ocirc;ng nghệ th&ocirc;ng tin của Trường Đai học S&agrave;i G&ograve;n c&oacute; thể đảm nhiệm tốt một số vai tr&ograve; trong c&aacute;c c&ocirc;ng ty phần mềm, c&aacute;c c&ocirc;ng ty chuy&ecirc;n về Mạng v&agrave; Hệ thống m&aacute;y t&iacute;nh, nh&acirc;n vi&ecirc;n phụ tr&aacute;ch C&ocirc;ng nghệ th&ocirc;ng tin ở c&aacute;c cơ quan ban ng&agrave;nh nh&agrave; nước v&agrave; doanh nghiệp. C&aacute;c kỹ sư ng&agrave;nh C&ocirc;ng nghệ th&ocirc;ng tin của Trường c&oacute; thể học l&ecirc;n ở c&aacute;c bậc học cao hơn như cao học, tiến sĩ hoặc tham gia giảng dạy, nghi&ecirc;n cứu ở c&aacute;c Trường Đại học, cao đẳng hoặc cũng c&oacute; thể tham gia c&aacute;c dự &aacute;n C&ocirc;ng nghệ th&ocirc;ng tin với c&aacute;c đối t&aacute;c Quốc tế.</p>

<p><strong>1. Chương tr&igrave;nh đ&agrave;o tạo chuẩn</strong></p>

<p>- Chương tr&igrave;nh đ&agrave;o tạo chu kỳ 2012-2016.&nbsp;<a href="/Assets/plugins/Uploads/files/02.docx">Xem tại đ&acirc;y</a></p>

<p>- Chương tr&igrave;nh đ&agrave;o tạo chu kỳ 2016 - 2020.&nbsp;<a href="/Assets/plugins/Uploads/files/04.xlsx">Xem tai đ&acirc;y</a></p>

<p>- Chương tr&igrave;nh đ&agrave;o tạo theo cơ chế đặc th&ugrave;.&nbsp;<a href="/Assets/plugins/Uploads/files/01.pdf">Xem tại đ&acirc;y</a></p>
' ,'07-19-2018','IT2' ,1 )
INSERT INTO NoidungDT	VALUES  ( 'NDDT2' ,'DH' ,N'Ngành Công nghệ thông tin - Hệ liên thông',N'<p><strong>Hệ li&ecirc;n th&ocirc;ng tr&igrave;nh độ đại&nbsp;học</strong></p>

<ul>
	<li>Li&ecirc;n th&ocirc;ng từ Trung cấp l&ecirc;n Đại học.&nbsp;<a href="/Assets/plugins/Uploads/files/03.docx">Xem tại đ&acirc;y.</a></li>
	<li>Li&ecirc;n th&ocirc;ng từ Cao đẳng l&ecirc;n Đại học.&nbsp;<a href="/Assets/plugins/Uploads/files/04.xlsx">Xem tại đ&acirc;y</a></li>
</ul>

<p>&nbsp;(Th&ocirc;ng tin tuyển sinh chi tiết xem tại website của Ph&ograve;ng đ&agrave;o tạo v&agrave; ph&ograve;ng Gi&aacute;o dục thường xuy&ecirc;n)</p>
' ,'07-19-2018','IT2' ,1 )
INSERT INTO NoidungDT	VALUES  ( 'NDDT3' ,'TS' ,N'[Thạc sỹ] Ngành Khoa học máy tính',N'<p>+Th&ocirc;ng tin chi tiết chương tr&igrave;nh đ&agrave;o tạo thạc sĩ KHMT&nbsp;<a href="/Assets/plugins/Uploads/files/01.pdf">Xem tại đ&acirc;y</a></p>

<p>(Th&ocirc;ng tin tuyển sinh chi tiết xem tại website của Ph&ograve;ng đ&agrave;o tạo Sau đại học)</p>

<p><img alt="" src="~/Files/khoa-hoc-may-tinh.png" style="height:300px; width:592px" /></p>
' ,'07-19-2018','IT2' ,1 )


INSERT INTO NoidungDT	VALUES  ( 'NDDT4' ,'TiS' ,N'Đào tạo tiến sĩ Khoa học máy tính',N'<p><strong>1. GIỚI THIỆU CHUNG</strong></p>

<p><strong>1.1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mục ti&ecirc;u đ&agrave;o tạo</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Đ&agrave;o tạo tr&igrave;nh độ ti&ecirc;́n sĩ gi&uacute;p học vi&ecirc;n nắm vững l&yacute; thuyết, c&oacute; tr&igrave;nh độ cao, c&oacute; khả năng l&agrave;m việc độc lập, s&aacute;ng tạo v&agrave; c&oacute; năng lực ph&aacute;t hiện, giải quyết những vấn đề thuộc chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo. Chương tr&igrave;nh đào tạo phải đảm bảo kiến thức cốt l&otilde;i cho ng&agrave;nh KHMT, v&agrave; ph&aacute;t huy thế mạnh về t&iacute;nh chuy&ecirc;n s&acirc;u của c&aacute;c chuy&ecirc;n ng&agrave;nh KHMT của nh&agrave; trường, bao gồm: C&ocirc;ng nghệ tri thức v&agrave; m&aacute;y học; Xử l&yacute; ng&ocirc;n ngữ tự nhi&ecirc;n.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Nghi&ecirc;n cứu sinh c&oacute; kiến thức nền tảng v&agrave; chuy&ecirc;n s&acirc;u, c&oacute; phương ph&aacute;p luận vững chắc, c&oacute; khả năng ứng dụng c&aacute;c th&agrave;nh quả hiện đại của KHMT v&agrave;o thực tiễn đ&aacute;p ứng c&aacute;c nhu cầu cao của x&atilde; hội, c&oacute; khả năng nghi&ecirc;n cứu v&agrave; ph&aacute;t triển ở tr&igrave;nh độ cao, cũng như c&oacute; khả năng đ&oacute;ng vai tr&ograve; l&atilde;nh đạo quản l&yacute; v&agrave; đ&oacute;ng g&oacute;p t&iacute;ch cực cho sự tiến bộ của khoa học v&agrave; c&ocirc;ng nghệ.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Chương tr&igrave;nh đ&agrave;o tạo cung cấp cho người học&nbsp;kiến thức chuy&ecirc;n s&acirc;u của ng&agrave;nh, chuy&ecirc;n ng&agrave;nh v&agrave; phương ph&aacute;p nghi&ecirc;n cứu khoa học ph&ugrave; hợp để c&oacute; thể độc lập nghi&ecirc;n cứu, ph&aacute;t triển c&aacute;c quan điểm, luận thuyết khoa học, bước đầu c&oacute; thể h&igrave;nh th&agrave;nh &yacute; tưởng khoa học, ph&aacute;t hiện, kh&aacute;m ph&aacute; v&agrave; thử nghiệm kiến thức mới; c&oacute; khả năng thực hiện c&ocirc;ng việc ở c&aacute;c vị tr&iacute; nghi&ecirc;n cứu, giảng dạy, tư vấn v&agrave; hoạch định ch&iacute;nh s&aacute;ch hoặc c&aacute;c vị tr&iacute; kh&aacute;c thuộc lĩnh vực ng&agrave;nh, chuy&ecirc;n ng&agrave;nh đ&agrave;o tạo.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Chương trình cũng gi&uacute;p cho&nbsp;người học n&acirc;ng cao kiến thức chuy&ecirc;n m&ocirc;n v&agrave; kỹ năng hoạt động nghề nghiệp; c&oacute; năng lực l&agrave;m việc độc lập, s&aacute;ng tạo; c&oacute; khả năng thiết kế sản phẩm, ứng dụng kết quả nghi&ecirc;n cứu, ph&aacute;t hiện v&agrave; tổ chức thực hiện c&aacute;c c&ocirc;ng việc phức tạp trong hoạt động chuy&ecirc;n m&ocirc;n nghề nghiệp.</p>

<p><strong>1.2&nbsp;&nbsp;&nbsp; Quan điểm x&acirc;y dựng chương tr&igrave;nh đ&agrave;o tạo</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Chương tr&igrave;nh đ&agrave;o tạo tiến sĩ ng&agrave;nh khoa học m&aacute;y t&iacute;nh (KHTM) được x&acirc;y dựng theo định hướng nghi&ecirc;n cứu với sự hướng dẫn của người hướng dẫn khoa học (NHD) v&agrave; đơn vị chuy&ecirc;n m&ocirc;n (ĐVCM) phụ tr&aacute;ch quản l&yacute;; coi trọng r&egrave;n luyện phương ph&aacute;p, th&oacute;i quen nghi&ecirc;n cứu khoa học, ph&aacute;t triển tư duy s&aacute;ng tạo trong ph&aacute;t hiện, giải quyết những vấn đề chuy&ecirc;n m&ocirc;n.</p>

<p><strong>1.3&nbsp;&nbsp;&nbsp; T</strong><strong>hời gian đ&agrave;o tạo:</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Thực hiện theo điều 3 của quy chế đ&agrave;o tạo tiến sĩ ban h&agrave;nh k&egrave;m theo quyết định số 25/QĐ-ĐHCNTT-ĐTSĐH ng&agrave;y 15 th&aacute;ng 04 năm 2014 của Hiệu trưởng Trường Đại học S&agrave;i G&ograve;n</p>

<h1><strong>2. CHƯƠNG TR&Igrave;NH Đ&Agrave;O TẠO</strong></h1>

<p><strong>2.1&nbsp;&nbsp; C&aacute;c học phần bổ sung</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; C&aacute;c học phần bổ sung d&agrave;nh cho c&aacute;c NCS chưa c&oacute; bằng thạc sĩ hoặc c&oacute; bằng thạc sĩ c&aacute;c ng&agrave;nh gần ph&ugrave; hợp, c&aacute;c học phần n&agrave;y gi&uacute;p NCS c&oacute; đủ kiến thức v&agrave; tr&igrave;nh độ chuy&ecirc;n m&ocirc;n để thực hiện nhiệm vụ của NCS.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; NCS chưa c&oacute; bằng thạc sĩ phải học bổ sung&nbsp;<strong>học phần cơ sở&nbsp;</strong>v&agrave;&nbsp;<strong>chuy&ecirc;n ng&agrave;nh&nbsp;</strong>trong CTĐT Thạc sĩ hiện h&agrave;nh ng&agrave;nh KHMT chưa kể c&aacute;c m&ocirc;n Triết học để ho&agrave;n th&agrave;nh c&aacute;c học phần tr&igrave;nh độ thạc sĩ KHMT.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; NCS c&oacute; bằng thạc sĩ c&aacute;c ng&agrave;nh gần với ng&agrave;nh Khoa học m&aacute;y t&iacute;nh, sau đi đối chiếu với bảng điểm thạc sĩ đ&atilde; c&oacute;, NCS phải học c&aacute;c m&ocirc;n học c&ograve;n thiếu của c&aacute;c học phần cơ sở v&agrave; chuy&ecirc;n ng&agrave;nh trong CTĐT thạc sĩ ng&agrave;nh Khoa học m&aacute;y t&iacute;nh. Danh s&aacute;ch m&ocirc;n học bổ sung sẽ dựa v&agrave;o chương tr&igrave;nh đ&agrave;o tạo thạc sĩ ng&agrave;nh Khoa học m&aacute;y t&iacute;nhhiện h&agrave;nh c&ugrave;ng kh&oacute;a với đợt tuyển sinh tiến sĩ.</p>

<p><strong>2.2&nbsp;&nbsp; C&aacute;c học phần tr&igrave;nh độ tiến sĩ, c&aacute;c chuy&ecirc;n đề tiến sĩ, tiểu luận tổng quan</strong></p>

<p><strong>2.2.1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C&aacute;c học phần tr&igrave;nh độ tiến sĩ</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Mục đ&iacute;ch của c&aacute;c học phần tr&igrave;nh độ tiến sĩ l&agrave; gi&uacute;p NCS cập nhật kiến thức mới trong lĩnh vực chuy&ecirc;n m&ocirc;n; n&acirc;ng cao tr&igrave;nh độ l&yacute; thuyết, phương ph&aacute;p luận nghi&ecirc;n cứu v&agrave; khả năng ứng dụng c&aacute;c phương ph&aacute;p nghi&ecirc;n cứu khoa học quan trọng, thiết yếu của lĩnh vực nghi&ecirc;n cứu.</p>

<p><strong>2.2.2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C&aacute;c chuy&ecirc;n đề tiến sĩ</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; C&aacute;c chuy&ecirc;n đề tiến sĩ (CĐTS) đ&ograve;i hỏi NCS tự cập nhật kiến thức mới, c&oacute; độ s&acirc;u về chuy&ecirc;n ng&agrave;nh, c&oacute; bề rộng về c&aacute;c ng&agrave;nh li&ecirc;n quan v&agrave; c&oacute; li&ecirc;n quan trực tiếp đến đề t&agrave;i của NCS, gi&uacute;p n&acirc;ng cao năng lực NCKH của NCS; gi&uacute;p NCS giải quyết một số nội dung của đề t&agrave;i luận &aacute;n.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Mỗi NCS phải ho&agrave;n th&agrave;nh 03 CĐTS, mỗi chuy&ecirc;n đề 02 t&iacute;n chỉ. NCS phải đăng k&yacute; thực hiện c&aacute;c CĐTS ph&ugrave; hợp với hướng nghi&ecirc;n cứu của m&igrave;nh với ph&ecirc; duyệt của người hướng dẫn v&agrave; đơn vị chuy&ecirc;n m&ocirc;n.</p>

<p><strong>2.2.3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tiểu luận tổng quan</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; NCS phải thực hiện 01 tiểu luận tổng quan về t&igrave;nh h&igrave;nh nghi&ecirc;n cứu v&agrave; c&aacute;c vấn đề li&ecirc;n quan đến đề t&agrave;i luận &aacute;n, tiểu luận tổng quan đ&ograve;i hỏi NCS thể hiện khả năng ph&acirc;n t&iacute;ch, đ&aacute;nh gi&aacute; c&aacute;c c&ocirc;ng tr&igrave;nh nghi&ecirc;n cứu đ&atilde; c&oacute; của c&aacute;c t&aacute;c giả trong v&agrave; ngo&agrave;i nước li&ecirc;n quan mật thiết đến đề t&agrave;i luận &aacute;n, n&ecirc;u những vấn đề c&ograve;n tồn tại, chỉ ra những vấn đề m&agrave; luận &aacute;n cần tập trung nghi&ecirc;n cứu giải quyết.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; NCS thực hiện, b&aacute;o c&aacute;o tiểu luận tổng quan sau khi ho&agrave;n th&agrave;nh c&aacute;c chuy&ecirc;n đề tiến sĩ v&agrave; cần phải bảo vệ th&agrave;nh c&ocirc;ng tiểu luận tổng quan trước khi tr&igrave;nh luận &aacute;n tiến sĩ.</p>

<p><strong>2.3&nbsp;&nbsp;&nbsp;Nghi&ecirc;n cứu khoa học v&agrave; luận &aacute;n tiến sĩ</strong></p>

<p><strong>2.3.1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nghi&ecirc;n cứu khoa học</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; 1. Nghi&ecirc;n cứu khoa học l&agrave; nhiệm vụ bắt buộc của NCS trong qu&aacute; tr&igrave;nh nghi&ecirc;n cứu thực hiện LATS. Từ khi c&oacute; quyết định c&ocirc;ng nhận NCS, trong thời gian 12 th&aacute;ng đối với người đ&atilde; c&oacute; bằng thạc sĩ hoặc 24 th&aacute;ng với người chỉ c&oacute; bằng đại học, NCS đối chiếu với t&igrave;nh h&igrave;nh ph&aacute;t triển khoa học thuộc hướng nghi&ecirc;n cứu của m&igrave;nh nhằm cập nhật, bổ sung đề cương dự định nghi&ecirc;n cứu l&uacute;c dự tuyển NCS để bảo vệ tại một hội đồng x&eacute;t duyệt đề cương đề t&agrave;i LATS do ĐVCM đề nghị v&agrave; Hiệu trưởng xem x&eacute;t, quyết định.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; 2. T&ugrave;y t&iacute;nh chất của lĩnh vực nghi&ecirc;n cứu m&agrave; ĐVCM c&oacute; y&ecirc;u cầu kh&aacute;c nhau đối với việc đ&aacute;nh gi&aacute; hiện trạng tri thức, c&aacute;c giải ph&aacute;p c&ocirc;ng nghệ li&ecirc;n quan đến đề t&agrave;i LATS, y&ecirc;u cầu điều tra, thực nghiệm để bổ sung dữ liệu cần thiết, y&ecirc;u cầu suy luận khoa học v&agrave; thiết kế giải ph&aacute;p, thực nghiệm để từ đ&oacute; NCS đạt tới tri thức mới, giải ph&aacute;p mới. Đ&acirc;y l&agrave; những cơ sở quan trọng để NCS viết LATS.&nbsp;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; 3. Nội dung, quy m&ocirc; NCKH phải ph&ugrave; hợp với mục ti&ecirc;u của LATS. T&ugrave;y theo t&iacute;nh chất của đề t&agrave;i nghi&ecirc;n cứu luận &aacute;n, Trường v&agrave; NHD c&oacute; thể tạo điều kiện kinh ph&iacute;, cơ sở vật chất, ph&ograve;ng th&iacute; nghiệm để NCS ho&agrave;n th&agrave;nh c&aacute;c nghi&ecirc;n cứu cần thiết. NCS phải đảm bảo t&iacute;nh trung thực, ch&iacute;nh x&aacute;c, t&iacute;nh mới của kết quả NCKH của m&igrave;nh, chấp h&agrave;nh những quy định về sở hữu tr&iacute; tuệ của Việt Nam v&agrave; quốc tế.&nbsp;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; 4. Thời gian NCKH được bố tr&iacute; trong thời gian ĐTTS. Nếu v&igrave; l&yacute; do kh&aacute;ch quan hay chủ quan, việc NCKH kh&ocirc;ng thể ho&agrave;n th&agrave;nh trong thời gian dự kiến th&igrave; NCS c&oacute; thể đăng k&yacute; k&eacute;o d&agrave;i thời gian nghi&ecirc;n cứu. Chi ph&iacute; đ&agrave;o tạo trong thời gian k&eacute;o d&agrave;i do NCS tự trang trải hoặc do đơn vị cử đi học hỗ trợ nếu c&oacute; điều kiện.&nbsp;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; 5. Trường v&agrave; ĐVCM tạo điều kiện để NCS chủ tr&igrave; hoặc tham gia thực hiện c&aacute;c đề t&agrave;i, c&aacute;c chương tr&igrave;nh NCKH c&aacute;c cấp do Trường chủ tr&igrave; v&agrave; c&oacute; li&ecirc;n quan đến lĩnh vực đề t&agrave;i LATS của NCS.</p>

<p><strong>2.3.2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Luận &aacute;n tiến sĩ</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Luận &aacute;n tiến sĩ phải l&agrave; một c&ocirc;ng tr&igrave;nh nghi&ecirc;n cứu khoa học s&aacute;ng tạo của ch&iacute;nh NCS, t&igrave;m ra kết quả mới, kh&ocirc;ng tr&ugrave;ng lặp với c&aacute;c nghi&ecirc;n cứu của người kh&aacute;c, giải quyết được trọn vẹn một vấn đề khoa học, l&agrave; một c&ocirc;ng tr&igrave;nh NCKH độc đ&aacute;o, mang t&iacute;nh ch&iacute;nh x&aacute;c, trung thực, s&aacute;ng tạo trong lĩnh vực nghi&ecirc;n cứu, c&oacute; đ&oacute;ng g&oacute;p về mặt l&yacute; luận, chứa đựng những tri thức hoặc giải ph&aacute;p mới c&oacute; gi&aacute; trị trong việc ph&aacute;t triển, gia tăng tri thức khoa học của lĩnh vực nghi&ecirc;n cứu hoặc giải quyết s&aacute;ng tạo c&aacute;c vấn đề đang đặt ra với một ng&agrave;nh khoa học hoặc thực tiễn x&atilde; hội, chấp h&agrave;nh c&aacute;c quy định về sở hữu tr&iacute; tuệ của Việt Nam v&agrave; quốc tế.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Luận &aacute;n tiến sĩ kh&ocirc;ng vượt qu&aacute; 200 trang A4 (kh&ocirc;ng kể phần phụ lục), trong đ&oacute; tr&ecirc;n 50% l&agrave; tr&igrave;nh b&agrave;y c&aacute;c kết quả nghi&ecirc;n cứu v&agrave; biện luận của ri&ecirc;ng NCS.</p>

<p>&nbsp;&nbsp;&nbsp; Nội dung chủ yếu v&agrave; c&aacute;c kết quả nghi&ecirc;n cứu của luận &aacute;n phải được b&aacute;o c&aacute;o tại&nbsp; c&aacute;c hội nghị khoa học chuy&ecirc;n ng&agrave;nh; được c&ocirc;ng bố &iacute;t nhất trong hai b&agrave;i b&aacute;o tr&ecirc;n tạp ch&iacute;,&nbsp; hội nghị khoa học chuy&ecirc;n ng&agrave;nh c&oacute; phản biện độc lập, được Hội đồng chức danh gi&aacute;o sư Nh&agrave; nước t&iacute;nh điểm, c&oacute; trong danh mục c&aacute;c tạp ch&iacute; khoa học v&agrave; c&aacute;c hội nghị khoa học ph&ugrave; hợp với chuy&ecirc;n ng&agrave;nh đ&agrave;o tạo tiến sĩ.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; NCS phải bảo vệ luận &aacute;n trước hội đồng cấp đơn vị chuy&ecirc;n m&ocirc;n v&agrave; hội đồng cấp Trường theo quy định.</p>

<h1><strong>3. KẾ HOẠCH Đ&Agrave;O TẠO DỰ KIẾN</strong></h1>

<p>&nbsp;&nbsp;&nbsp;&nbsp; To&agrave;n bộ chương tr&igrave;nh đ&agrave;o tạo tr&igrave;nh độ tiến sĩ đối với người c&oacute; bằng thạc sĩ l&agrave; 3 năm học tập trung li&ecirc;n tục; đối với người c&oacute; bằng tốt nghiệp đại học nhưng chưa c&oacute; bằng thạc sĩ chuy&ecirc;n ng&agrave;nh ph&ugrave; hợp l&agrave; 5 năm học tập trung li&ecirc;n tục.</p>
' ,'05-20-2015','IT2' ,1 )

INSERT INTO NoidungDT	VALUES  ( 'NDDT5' ,'TiS' ,N'Đào tạo tiến sĩ Công nghệ thông tin',N'<h1><strong>1. GIỚI THIỆU CHUNG</strong></h1>

<p>.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Chương tr&igrave;nh đ&agrave;o tạo được cập nhật căn cứ tr&ecirc;n sứ mệnh v&agrave; mục ti&ecirc;u đ&agrave;o tạo của ng&agrave;nh học, đối chiếu với c&aacute;c chương tr&igrave;nh đ&agrave;o tạo tiến sĩ thuộc lĩnh vực CNTT tại Đại học Quốc gia TP. Hồ Ch&iacute; Minh cũng như một số đại học kh&aacute;c trong khu vực v&agrave; tr&ecirc;n thế giới.</p>

<p><strong>1.1 Mục ti&ecirc;u đ&agrave;o tạo</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Mục ti&ecirc;u chung của chương tr&igrave;nh đ&agrave;o tạo tiến sĩ&nbsp; CNTT l&agrave; đ&agrave;o tạo những nh&agrave; khoa học trong lĩnh vực CNTT c&oacute; tr&igrave;nh độ cao về l&yacute; thuyết v&agrave; năng lực thực h&agrave;nh ph&ugrave; hợp, c&oacute; tư duy khoa học, c&oacute; khả năng nghi&ecirc;n cứu độc lập, s&aacute;ng tạo, khả năng ph&aacute;t hiện v&agrave; giải quyết được những vấn đề mới c&oacute; &yacute; nghĩa về khoa học, c&ocirc;ng nghệ v&agrave; hướng dẫn NCKH, c&oacute; khả năng tiếp cận v&agrave; giải quyết c&aacute;c vấn đề khoa học chuy&ecirc;n ng&agrave;nh.</p>

<p><strong>1.2 Quan điểm x&acirc;y dựng chương tr&igrave;nh đ&agrave;o tạo</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Chương tr&igrave;nh đ&agrave;o tạo tiến sĩ CNTT được x&acirc;y dựng theo định hướng tự nghi&ecirc;n cứu với sự hướng dẫn của người hướng dẫn khoa học (NHD) v&agrave; đơn vị chuy&ecirc;n m&ocirc;n (ĐVCM) phụ tr&aacute;ch; coi trọng r&egrave;n luyện phương ph&aacute;p, th&oacute;i quen nghi&ecirc;n cứu khoa học, ph&aacute;t triển tư duy s&aacute;ng tạo trong ph&aacute;t hiện, giải quyết những vấn đề chuy&ecirc;n m&ocirc;n.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Chương tr&igrave;nh được thiết kế v&agrave; x&acirc;y dựng dựa tr&ecirc;n:</p>

<ul>
	<li>Tham khảo các chương trình đào tạo tiến sĩ thu&ocirc;̣c lĩnh vực c&ocirc;ng nghệ th&ocirc;ng tin v&agrave; truyền th&ocirc;ng của c&aacute;c trường th&agrave;nh vi&ecirc;n Đại Học Quốc Gia TP. Hồ Ch&iacute; Minh và Đại Học Quốc Gia H&agrave; Nội.</li>
	<li>Chương trình đào tạo tiến sĩ li&ecirc;n kết giữa ĐH B&aacute;ch Khoa H&agrave; Nội v&agrave; ĐH C&ocirc;ng nghệ Sydney.</li>
	<li>Tham khảo chương trình đào tạo sau đại học ng&agrave;nh CNTT của các trường Đại học tr&ecirc;n thế giới như:</li>
	<li>Virginia Tech University, USA</li>
	<li>University of Technology, Sydney</li>
	<li>Queensland University of Technology, Australia</li>
</ul>

<p><strong>1.3 Phương thức v&agrave; thời gian đ&agrave;o tạo</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Thời gian đ&agrave;o tạo tr&igrave;nh độ tiến sĩ đối với người c&oacute; bằng thạc sĩ l&agrave; 3 năm tập trung li&ecirc;n tục; đối với người c&oacute; bằng tốt nghiệp đại học nhưng chưa c&oacute; bằng thạc sĩ chuy&ecirc;n ng&agrave;nh ph&ugrave; hợp l&agrave; 5 năm tập trung li&ecirc;n tục.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Trường hợp NCS kh&ocirc;ng theo học tập trung li&ecirc;n tục được v&agrave; được Trường chấp nhận th&igrave; chương tr&igrave;nh đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu của NCS phải c&oacute; tổng thời gian học v&agrave; nghi&ecirc;n cứu như quy định tr&ecirc;n, trong đ&oacute; c&oacute; &iacute;t nhất 12 th&aacute;ng tập trung li&ecirc;n tục tại cơ sở đ&agrave;o tạo để thực hiện đề t&agrave;i nghi&ecirc;n cứu. Trong trường hợp n&agrave;y thời gian đ&agrave;o tạo được cộng th&ecirc;m 1 năm tương ứng với từng đối tượng.</p>

<h1><strong>2. ĐỐI TƯỢNG &Aacute;P DỤNG</strong></h1>

<p>&nbsp;&nbsp;&nbsp;&nbsp; C&aacute;c kh&oacute;a tuyển sinh tiến sĩ ng&agrave;nh CNTT từ &nbsp;năm 2014.</p>

<h1><strong>3. QUY CHẾ Đ&Agrave;O TẠO</strong></h1>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Chương tr&igrave;nh đ&agrave;o tạo tiến sĩ ng&agrave;nh CNTT của trường Đại học S&agrave;i G&ograve;n&nbsp;được thực hiện căn cứ v&agrave;o:</p>

<ul>
	<li>Quy chế đ&agrave;o tạo tiến sĩ ban h&agrave;nh k&egrave;m theo Quyết định số 25/QĐ-ĐHSG-ĐTSĐH ng&agrave;y 15 th&aacute;ng 04 năm 2014 của Hiệu trưởng Trường Đại học S&agrave;i G&ograve;n&nbsp;(gọi tắt l&agrave; Quy chế đ&agrave;o tạo tiến sĩ của trường ĐHSG).</li>
	<li>Quy&nbsp; định&nbsp; về&nbsp; đ&agrave;o&nbsp; tạo&nbsp; tr&igrave;nh&nbsp; độ&nbsp; tiến&nbsp; sĩ,&nbsp; theo&nbsp; Quyết&nbsp; định&nbsp; số 1020/QĐ-ĐHQG-ĐH&amp;SĐH 10/09/2010 của Gi&aacute;m đốc ĐHQG-HCM.</li>
	<li>Quy chế đ&agrave;o tạo tr&igrave;nh độ tiến sĩ ban h&agrave;nh k&egrave;m theo th&ocirc;ng tư số 10/2009/TT-BGD&amp;ĐT ng&agrave;y 07/5/2009 của Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo; v&agrave; Th&ocirc;ng tư số 05/2012/TT-BGDĐT ng&agrave;y 15/2/2012 của Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo về việc Sửa đổi, bổ sung Th&ocirc;ng tư 10/2009/TT-BGDĐT, c&oacute; hiệu lực từ 2/4/2012.</li>
</ul>

<h1><strong>4. CHUẨN ĐẦU RA</strong></h1>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Học vi&ecirc;n tốt nghiệp chương tr&igrave;nh đ&agrave;o tạo sau đại học tiến sĩ ng&agrave;nh CNTT phải đ&aacute;p ứng c&aacute;c y&ecirc;u cầu về ti&ecirc;u chuẩn đầu ra (k&yacute; hiệu LO &ndash; Learning Outcomes) sau:</p>

<p><strong>4.1 Về kiến thức</strong></p>

<ul>
	<li>LO 1: C&oacute; kiến thức chuy&ecirc;n s&acirc;u, ti&ecirc;n tiến, to&agrave;n diện v&agrave; hệ thống về CNTT.</li>
	<li>LO 2: C&oacute; tư duy nghi&ecirc;n cứu độc lập, s&aacute;ng tạo, l&agrave;m chủ được c&aacute;c gi&aacute; trị cố l&otilde;i, quan trọng trong học thuật, ph&aacute;t triển c&aacute;c nguy&ecirc;n l&yacute;, học thuyết của chuy&ecirc;n ng&agrave;nh CNTT.</li>
	<li>LO 3: C&oacute; kiến thức, khả năng ph&aacute;t hiện hoặc biết tổ chức c&ocirc;ng việc, chuy&ecirc;n m&ocirc;n, trực tiếp giải quyết c&aacute;c vấn đề khoa học thuộc lĩnh vực CNTT. C&oacute; kiến thức trong c&aacute;c hệ thống CNTT t&iacute;ch hợp hay c&aacute;c hệ thống li&ecirc;n ng&agrave;nh c&oacute; li&ecirc;n quan đến CNTT.</li>
</ul>

<p><strong>4.2 Về kỹ năng</strong></p>

<ul>
	<li>LO 4: C&oacute; kỹ năng ph&aacute;t hiện, ph&acirc;n t&iacute;ch c&aacute;c vấn đề phức tạp v&agrave; đưa ra c&aacute;c giải ph&aacute;p s&aacute;ng tạo giải quyết vấn đề.</li>
	<li>LO 5: C&oacute; kỹ năng c&aacute; nh&acirc;n về tư duy logic, nghi&ecirc;n cứu độc lập, s&aacute;ng tạo v&agrave; th&aacute;i độ học tập suốt đời.</li>
	<li>LO 6: C&oacute; kỹ năng giao tiếp, h&igrave;nh th&agrave;nh nh&oacute;m ớ mức quốc gia hay quốc tế v&agrave; l&atilde;nh đạo nh&oacute;m hiệu quả.</li>
	<li>LO 7: C&oacute; khả năng cao để tr&igrave;nh b&agrave;y, giới thiệu (bằng c&aacute;c h&igrave;nh thức b&agrave;i viết, b&aacute;o c&aacute;o hội nghị, giảng dạy đại học v&agrave; sau đại học) c&aacute;c vấn đề khoa học thuộc lĩnh vực CNTT.</li>
	<li>LO 8: C&oacute; kỹ năng tốt về tiếng Anh, c&oacute; thể giao tiếp, thảo luận với c&aacute;c nh&agrave; khoa học, c&aacute;c chuy&ecirc;n gia bằng tiếng anh trong lĩnh vực CNTT. C&oacute; thể viết c&aacute;c b&aacute;o c&aacute;o khoa học, b&aacute;o c&aacute;o chuy&ecirc;n ng&agrave;nh.</li>
	<li>LO 9: C&oacute; năng lực tổng hợp tr&iacute; tuệ tập thể, dẫn dắt chuy&ecirc;n m&ocirc;n, xử l&yacute; c&aacute;c vấn đề qui m&ocirc; quốc tế.</li>
</ul>

<p><strong>4.3 Về th&aacute;i độ</strong></p>

<ul>
	<li>LO 10: &Yacute; thức tr&aacute;ch nhiệm c&ocirc;ng d&acirc;n; c&oacute; th&aacute;i độ v&agrave; đạo đức nghề nghiệp đ&uacute;ng đắn.</li>
	<li>LO 11: C&oacute; tr&aacute;ch nhiệm, c&oacute; thể l&agrave;m việc độc lập hoặc l&agrave;m việc nh&oacute;m, c&oacute; h&agrave;nh xử chuy&ecirc;n nghiệp.</li>
</ul>

<p><strong>4.4 Năng lực v&agrave; vị tr&iacute; c&ocirc;ng t&aacute;c</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Sau khi t&ocirc;́t nghi&ecirc;̣p, các tiến sĩ ng&agrave;nh CNTT:</p>

<ul>
	<li>C&oacute; tr&igrave;nh độ cao v&agrave; kiến thức chuy&ecirc;n s&acirc;u, nắm bắt c&aacute;c c&ocirc;ng nghệ mới về CNTT.</li>
	<li>C&oacute; năng lực dẫn dắt trong lẫn vực CNTT đ&atilde; được đ&agrave;o tạo.</li>
	<li>C&oacute; năng lực s&aacute;ng tạo trọng qu&aacute; tr&igrave;nh thực hiện nhiệm vụ; c&oacute; năng lực tự định hướng, th&iacute;ch nghi với m&ocirc;i trường CNTT.</li>
	<li>C&oacute; năng lực tự học tập, t&iacute;ch lũy kiến thức, kinh nghiệm để n&acirc;ng cao tr&igrave;nh độ.</li>
	<li>C&oacute; khả năng ph&acirc;n t&iacute;ch, đ&aacute;nh gi&aacute; đưa ra c&aacute;c kết luận về chuy&ecirc;n m&ocirc;n v&agrave; một số vấn đề phức tạp về hệ thống CNTT.</li>
	<li>C&oacute; năng lực lập kế hoạch về hệ thống CNTT, điều phối, ph&aacute;t huy tr&iacute; tuệ tập thể.</li>
	<li>C&oacute; năng lực cải tiến, đ&aacute;nh gi&aacute; c&aacute;c hoạt động CNTT ở qui m&ocirc; trung b&igrave;nh.</li>
	<li>Có khả năng l&agrave;m trưởng nh&oacute;m nghi&ecirc;n cứu và vận dụng được c&aacute;c kiến thức c&ocirc;ng nghệ mới, đa lĩnh vực v&agrave;o ph&aacute;t triển c&aacute;c sản phẩm v&agrave; ứng dụng CNTT trong c&aacute;c doanh nghiệp, viện nghi&ecirc;n cứu hay cố vấn, chuy&ecirc;n gia cao cấp trong c&aacute;c tổ chức.</li>
	<li>C&oacute; khả năng ph&acirc;n t&iacute;ch thực tiễn để x&aacute;c định c&aacute;c thiết kế ph&ugrave; hợp cho một hệ thống CNTT t&iacute;ch hợp.</li>
	<li>C&oacute; thể giảng dạy hệ Đại học, Sau Đại học ng&agrave;nh CNTT tại c&aacute;c trường Đại học.</li>
</ul>

<h1><strong>5. CHƯƠNG TR&Igrave;NH Đ&Agrave;O TẠO</strong></h1>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Căn cứ v&agrave;o Quy chế đ&agrave;o tạo tiến sĩ của trường ĐH.SG, NCS phải thực hiện 3 phần nội dung của chương tr&igrave;nh đ&agrave;o tạo sau đ&acirc;y:</p>

<ul>
	<li>Phần 1: C&aacute;c học phần bổ sung.</li>
	<li>Phần 2: C&aacute;c học phần tr&igrave;nh độ tiến sĩ, c&aacute;c chuy&ecirc;n đề tiến sĩ, tiểu luận tổng quan.</li>
	<li>Phần 3: Nghi&ecirc;n cứu khoa học v&agrave; luận &aacute;n tiến sĩ.</li>
</ul>

<p><strong>5.1) Phần 1. C&aacute;c học phần bổ sung</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; C&aacute;c học phần bổ sung d&agrave;nh cho c&aacute;c NCS chưa c&oacute; bằng thạc sĩ hoặc c&oacute; bằng thạc sĩ c&aacute;c ng&agrave;nh gần ph&ugrave; hợp, c&aacute;c học phần n&agrave;y gi&uacute;p NCS c&oacute; đủ kiến thức v&agrave; tr&igrave;nh độ chuy&ecirc;n m&ocirc;n để thực hiện nhiệm vụ của NCS.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; NCS chưa c&oacute; bằng thạc sĩ phải học bổ sung&nbsp;<strong>học phần cơ sở</strong>&nbsp;v&agrave;&nbsp;<strong>chuy&ecirc;n ng&agrave;nh</strong>&nbsp;trong CTĐT Thạc sĩ hiện h&agrave;nh ng&agrave;nh CNTT chưa kể c&aacute;c m&ocirc;n Triết học để ho&agrave;n th&agrave;nh c&aacute;c học phần tr&igrave;nh độ thạc sĩ CNTT.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; NCS c&oacute; bằng thạc sĩ c&aacute;c ng&agrave;nh gần ph&ugrave; hợp, sau đi đối chiếu với bảng điểm thạc sĩ đ&atilde; c&oacute;, NCS phải học c&aacute;c m&ocirc;n học c&ograve;n thiếu của c&aacute;c học phần cơ sở v&agrave; chuy&ecirc;n ng&agrave;nh trong CTĐT Thạc sĩ ng&agrave;nh CNTT. Danh s&aacute;ch m&ocirc;n học bổ sung sẽ dựa v&agrave;o chương tr&igrave;nh đ&agrave;o tạo thạc sĩ ng&agrave;nh CNTT hiện h&agrave;nh c&ugrave;ng kh&oacute;a với đợt tuyển sinh tiến sĩ.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Điểm ho&agrave;n th&agrave;nh c&aacute;c học phần bổ sung l&agrave; từ 5.0 trở l&ecirc;n.</p>

<p><strong>5.2) Phần 2. C&aacute;c học phần tr&igrave;nh độ tiến sĩ, c&aacute;c chuy&ecirc;n đề tiến sĩ, tiểu luận tổng quan</strong></p>

<p><strong>5.2.1 C&aacute;c học phần tr&igrave;nh độ tiến sĩ</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Mục đ&iacute;ch của c&aacute;c học phần tr&igrave;nh độ tiến sĩ l&agrave; gi&uacute;p NCS cập nhật kiến thức mới trong lĩnh vực chuy&ecirc;n m&ocirc;n; n&acirc;ng cao tr&igrave;nh độ l&yacute; thuyết, phương ph&aacute;p luận nghi&ecirc;n cứu v&agrave; khả năng ứng dụng c&aacute;c phương ph&aacute;p NCKH quan trọng, thiết yếu của lĩnh vực nghi&ecirc;n cứu. Gồm 12 t&iacute;n chỉ trong đ&oacute; 6 t&iacute;n chỉ bắt buộc v&agrave; 6 t&iacute;n chỉ tự chọn.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; Điểm ho&agrave;n th&agrave;nh c&aacute;c học phần tr&igrave;nh độ tiến sĩ l&agrave; từ 7.0 trở l&ecirc;n.</p>
' ,'05-20-2014','IT2' ,1 )
GO
CREATE TABLE Thongbaochuyentiep
(
	Machuyentiep int identity(1,1) primary key,
	Taikhoangui VARCHAR(100),
	Tieude NVARCHAR(100),
	Noidung NVARCHAR(MAX),
	Ngaychuyen DATETIME,
	Flag INT,
	FOREIGN KEY (Taikhoangui) REFERENCES Taikhoan(Tentaikhoan)
)
go
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag) VALUES  ( 'IT3'  ,N'Đăng bài', N'<p>Tuyển dụng ở IVC Freshser 2018</p>'  , '09-20-2018' , 1 )
INSERT INTO Thongbaochuyentiep(Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag) VALUES  (  'IT9',N'Xóa bài' , N'<p>Xóa bài đăng Nghiên cứu BD3</p>' , '12-25-2018', 1 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT3',N'Sửa bài' , N'<p>Sửa bài đăng Bộ môn Hệ thống thông tin BD4</p>'  ,  '8-5-2018' , 1 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  (  'IT10'  ,N'Xóa bài' , N'<p>Xóa bài đăng Bộ môn Kỹ thuật phần mềm BD5</p>' , '12-5-2018' , 1 )
INSERT INTO Thongbaochuyentiep(Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag) VALUES  ( 'IT4',N'Đăng bài' , N'<p>Quy định về khóa luận Tốt Nghiệp</p>'  , '11-20-2018'  , 1 )

INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT3',N'Đăng bài' , N'<p>Thông báo về việc xét tuyến sinh viên từ chương trình đào tạo đại trà qua chương trình đào tạo chất lượng cao ngành Công nghệ thông tin</p>'  , '09-23-2018'  , 2 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT5',N'Sửa bài' , N'<p>Sửa BD2:Thời khóa biểu lớp kỹ sư CNTT khóa 2018- hệ đào tạo chất lượng cao </p>'  , '09-05-2018'  , 1 )
INSERT INTO Thongbaochuyentiep(Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag) VALUES  ( 'IT1',N'Đăng bài' , N'<p>Giới thiệu CTĐT ngành CNTT hệ đào tạo chất lượng cao</p>'  , '08-18-2018'  , 2 )
INSERT INTO Thongbaochuyentiep(Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag) VALUES  ( 'IT7',N'Đăng bài' , N'<p>Khóa luận dành cho K14</p>'  , '06-30-2018'  , 3 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT3',N'Sửa bài' , N'<p>Sửa BD5: Thay thế các học phần đã hủy ở chu kỳ 2016-2020 (Tiếng Anh1, Tiếng Anh 2, ĐT Căn Bản, Nhập môn máy tính, Phân tích thiết kế giải thuật) </p>'  , '04-30-2018'  , 3 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT8',N'Xóa bài' , N'<p>Xóa BD6: Đăng ký học chương trình đào tạo chất lượng cao Kỹ sư CNTT năm 2017 </p>'  , '12-20-2018'  , 1 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT7',N' Sửa bài' , N'<p>Sửa BD7: Đăng kí dự hội thảo Blockchain</p>'  , '10-15-2018'  , 2 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT2',N'Đăng bài' , N'<p>Hội thảo khoa học "Một số vấn đề chọn lọc về CNTT	và truyền thông</p>'  , '03-20-2018'  , 1 )
INSERT INTO Thongbaochuyentiep(Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag) VALUES  ( 'IT6',N'Xóa bài' , N'<p>Xóa BD9: Về việc học bổng đồng hương Bạc Liêu - Cà Mau năm học 2017-2018</p>'  , '05-10-2018'  , 1 )
INSERT INTO Thongbaochuyentiep(Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag) VALUES  ( 'IT5',N'Xóa bài' , N'<p>Xóa BD10: Thông báo về việc học bổng Vũ Đình Liệu năm học 2017-2018</p>'  , '03-20-2018'  , 1 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT3',N'Đăng bài' , N'<p>Tuyển sinh viên thực tập</p>'  , '10-22-2018'  , 2 )
INSERT INTO Thongbaochuyentiep(Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag) VALUES  ( 'IT4',N'Đăng bài' , N'<p>Công Ty TMA Tuyển dụng nhân sự</p>'  , '04-02-2018'  , 2 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT1',N'Xóa bài' , N'<p>Xóa BD14: Thông tin tuyển dụng</p>'  , '05-20-2018'  , 2 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT10',N'Đăng bài' , N'<p>Thông báo về việc nghiệm thu đề tài khoa học 2017-2018 và đăng ký đề tài khoa học 2018-2019</p>'  , '06-15-2018'  , 3 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT6',N'Sửa bài' , N'<p>Sửa BD16: Danh sách các đội tuyển Olympic 2018</p>'  , '08-29-2018'  , 1 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT8',N'Đăng bài' , N'<p>Olympic Tin học 2017</p>'  , '07-10-2018'  , 2 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT6',N'Xóa bài' , N'<p>Xóa BD18: Danh sách sinh viên tham gia lớp bồi dưỡng Olympic Tin học 2018</p>'  , '12-20-2018'  , 0 )
INSERT INTO Thongbaochuyentiep(Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag) VALUES  ( 'IT1',N'Đăng bài' , N'<p>THÔNG BÁO Về việc huấn luyện sinh viên tham dự Olympic Tin học sinh viên Việt Nam và Kỳ thi lập trình sinh viên Quốc tế ACM năm 2018</p>'  , '03-30-2018'  , 2 )
INSERT INTO Thongbaochuyentiep(Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag) VALUES  ( 'IT2',N'Đăng bài' , N'<p>Thông báo về cuộc thi lập trình Makerthon lần 2 - năm 2018</p>'  , '10-28-2018'  , 2 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT10',N'Sửa bài' , N'<p>Sửa BD22: Tuần Sinh hoạt CD-SV đầu khóa, Khóa 18 (DCT1182, DCT1183, DCT1184)</p>'  , '10-30-2018'  , 3 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT9',N'Sửa bài' , N'<p>Sửa BD23: Kế hoạch Seminar giữa sinh viên khoa Công nghệ thông tin và Fsoft</p>'  , '10-26-2018'  , 3 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT7',N'Xóa bài' , N'<p>Xóa BD24: Thông tin cuộc thi "HS,SV với ý tưởng khởi nghiệp</p>'  , '05-30-2018'  , 0 )
INSERT INTO Thongbaochuyentiep(Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag) VALUES  ( 'IT4',N'Sửa bài' , N'<p>Sửa BD25: Thông báo về việc mở cửa phòng máy phục vụ sinh viên</p>'  , '10-30-2018'  , 2 )
INSERT INTO Thongbaochuyentiep(Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag) VALUES  ( 'IT5',N'Đăng bài' , N'<p>Thông báo nghỉ học môn kiến trúc máy tính các lớp thầy Huỳnh Tổ Hạp</p>'  , '09-06-2018'  , 3 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT6',N'Xóa bài' , N'<p>Xóa BD39: Lớp phổ cập kiến thức chứng khoáng dành cho sinh viên</p>'  , '03-20-2018'  , 1 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT3',N'Đăng bài' , N'<p>Thông tin đăng kí nhận vé tham gia Halloween</p>'  , '10-27-2018'  , 2 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT2',N'Đăng bài' , N'<p>Hội thi thiết kế nhãn dán STICKER IN LAW</p>'  , '10-20-2018'  , 2 )
INSERT INTO Thongbaochuyentiep(Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag) VALUES  ( 'IT8',N'Sửa bài' , N'<p>Sửa BD43: Trao học bổng cho đối tượng tân sinh viên vượt khó học giỏi</p>'  , '09-30-2018'  , 1 )
INSERT INTO Thongbaochuyentiep(Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag) VALUES  ( 'IT3',N' Đăng bài' , N'<p>Thông báo tuyển sinh đào tạo trình độ thạc sĩ đợt 2 năm 2018</p>'  , '09-09-2018'  , 2 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT1',N'Sửa bài' , N'<p>Sửa BD47: Thông báo sinh hoạt đầu khoá cao học khoá 13 đợt 2 năm 2018</p>'  , '11-30-2018'  , 3 )
INSERT INTO Thongbaochuyentiep(Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag) VALUES  ( 'IT10',N'Đăng bài' , N'<p>Thư mời tham gia Giải thưởng Nhân tài Đất Việt 2018</p>'  , '08-04-2018'  , 1 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT4',N'Đăng bài' , N'<p>Thông báo lịch thi môn Công nghệ mạng và truyền thông hiện đại</p>'  , '05-26-2018'  , 0 )
INSERT INTO Thongbaochuyentiep(Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag) VALUES  ( 'IT3',N'Sửa bài' , N'<p>Sửa BD52: Thông báo về lệ phí tốt nghiệp thạc sĩ đợt 2 năm 2018</p>'  , '11-25-2018'  , 1 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT7',N'Xóa bài' , N'<p>Xóa BD53: Thông tin học bổng DAAD scholarship Programmes for Vietnam</p>'  , '12-30-2018'  , 0 )
INSERT INTO Thongbaochuyentiep (Taikhoangui,Tieude,Noidung,Ngaychuyen,Flag)VALUES  ( 'IT2',N'Đăng bài' , N'<p>Thông báo về chương trình thực tập và postdoc tại Nhật</p>'  , '06-20-2018'  , 2 )
go
CREATE TABLE Chitietchuyentiep
(
	Machuyentiep int,
	Taikhoannhan VARCHAR(100),
	Ngaynhan datetime,
	Trangthaixem NVARCHAR(20),
	Trangthaichuyen NVARCHAR(20),
	Flag INT,
	PRIMARY KEY (Machuyentiep,Taikhoannhan),
	FOREIGN KEY (Machuyentiep) REFERENCES Thongbaochuyentiep(Machuyentiep),
	FOREIGN KEY (Taikhoannhan) REFERENCES Taikhoan(Tentaikhoan)
)
go
INSERT INTO Chitietchuyentiep  VALUES  (1 ,'IT4','09-22-2018', N'Đã xem', N'Đã chuyển',1 )
INSERT INTO Chitietchuyentiep  VALUES  ( 2 ,'IT10' ,'12-27-2018', N'Đã xem', N'Đã chuyển',1  )
INSERT INTO Chitietchuyentiep  VALUES  ( 3 ,'IT4' ,'8-8-2018', N'Đã xem', N'Đã chuyển',1  )
INSERT INTO Chitietchuyentiep  VALUES  ( 4 ,'IT5','12-8-2018', N'Đã xem', N'Đã chuyển',1  )
INSERT INTO Chitietchuyentiep  VALUES  ( 5 ,'IT3','11-22-2018' , N'Đã xem', N'Đã chuyển',1  )

INSERT INTO Chitietchuyentiep  VALUES  ( 6 ,'IT9','09-25-2018' , N'Đã xem', N'Đã chuyển',2  )
INSERT INTO Chitietchuyentiep  VALUES  ( 7 ,'IT8','09-07-2018' , N'Đã xem', N'Đã chuyển',  1)
INSERT INTO Chitietchuyentiep  VALUES  ( 8 ,'IT10','08-20-2018' , N'Đã xem', N'Đã chuyển',  2)
INSERT INTO Chitietchuyentiep  VALUES  ( 9 ,'IT9','07-02-2018' , N'Đã xem', N'Đã chuyển',  3)
INSERT INTO Chitietchuyentiep  VALUES  ( 10 ,'IT9','05-02-2018' , N'Đã xem', N'Đã chuyển',  3)
INSERT INTO Chitietchuyentiep  VALUES  ( 11,'IT2','12-22-2018' , N'Đã xem', N'Đã chuyển',  1)
INSERT INTO Chitietchuyentiep  VALUES  ( 12 ,'IT1','10-17-2018' , N'Đã xem', N'Đã chuyển',  2)
INSERT INTO Chitietchuyentiep  VALUES  ( 13 ,'IT10','03-22-2018' , N'Đã xem', N'Đã chuyển', 1 )
INSERT INTO Chitietchuyentiep  VALUES  ( 14 ,'IT5','05-12-2018' , N'Đã xem', N'Đã chuyển',  1)
INSERT INTO Chitietchuyentiep  VALUES  ( 15 ,'IT3','03-22-2018' , N'Đã xem', N'Đã chuyển', 1 )
INSERT INTO Chitietchuyentiep  VALUES  ( 16,'IT8','10-22-2018' , N'Đã xem', N'Đã chuyển', 2 )
INSERT INTO Chitietchuyentiep  VALUES  ( 17 ,'IT2','04-04-2018' , N'Đã xem', N'Đã chuyển', 2 )
INSERT INTO Chitietchuyentiep  VALUES  ( 18 ,'IT9','05-22-2018' , N'Đã xem', N'Đã chuyển',  2)
INSERT INTO Chitietchuyentiep  VALUES  ( 19,'IT7','06-17-2018' , N'Đã xem', N'Đã chuyển',  3)
INSERT INTO Chitietchuyentiep  VALUES  ( 20,'IT3','09-01-2018' , N'Đã xem', N'Đã chuyển',  1)
INSERT INTO Chitietchuyentiep  VALUES  ( 21 ,'IT4','07-12-2018' , N'Đã xem', N'Đã chuyển', 2 )
INSERT INTO Chitietchuyentiep  VALUES  ( 22 ,'IT10','12-22-2018' , N'Đã xem', N'Đã chuyển',  1)
INSERT INTO Chitietchuyentiep  VALUES  ( 23,'IT7','04-02-2018' , N'Đã xem', N'Đã chuyển',  2)
INSERT INTO Chitietchuyentiep  VALUES  ( 24 ,'IT8','10-30-2018' , N'Đã xem', N'Đã chuyển',  2)
INSERT INTO Chitietchuyentiep  VALUES  ( 25 ,'IT3','11-01-2018' , N'Đã xem', N'Đã chuyển',  3)
INSERT INTO Chitietchuyentiep  VALUES  ( 26 ,'IT10','10-28-2018' , N'Đã xem', N'Đã chuyển',  3)
INSERT INTO Chitietchuyentiep  VALUES  ( 27 ,'IT1','06-02-2018' , N'Đã xem', N'Đã chuyển',1  )
INSERT INTO Chitietchuyentiep  VALUES  ( 28,'IT10','11-02-2018' , N'Đã xem', N'Đã chuyển',  2)
INSERT INTO Chitietchuyentiep  VALUES  ( 29 ,'IT9','09-08-2018' , N'Đã xem', N'Đã chuyển', 3 )
INSERT INTO Chitietchuyentiep  VALUES  ( 30 ,'IT5','03-22-2018' , N'Đã xem', N'Đã chuyển',  1)
INSERT INTO Chitietchuyentiep  VALUES  ( 31,'IT7','10-29-2018' , N'Đã xem', N'Đã chuyển', 2 )
INSERT INTO Chitietchuyentiep  VALUES  ( 32 ,'IT9','10-22-2018' , N'Đã xem', N'Đã chuyển',  2)
INSERT INTO Chitietchuyentiep  VALUES  ( 33 ,'IT3','10-02-2018' , N'Đã xem', N'Đã chuyển',  1)
INSERT INTO Chitietchuyentiep  VALUES  ( 34 ,'IT1','09-11-2018' , N'Đã xem', N'Đã chuyển',  2)
INSERT INTO Chitietchuyentiep  VALUES  ( 35 ,'IT8','12-01-2018' , N'Đã xem', N'Đã chuyển', 3 )
INSERT INTO Chitietchuyentiep  VALUES  ( 36 ,'IT2','08-06-2018' , N'Đã xem', N'Đã chuyển',  1)
INSERT INTO Chitietchuyentiep  VALUES  ( 37 ,'IT7','05-28-2018' , N'Đã xem', N'Đã chuyển',  2)
INSERT INTO Chitietchuyentiep  VALUES  ( 38 ,'IT7','11-27-2018' , N'Đã xem', N'Đã chuyển',  1)
INSERT INTO Chitietchuyentiep  VALUES  ( 39 ,'IT3','12-03-2018' , N'Đã xem', N'Đã chuyển', 1 )
INSERT INTO Chitietchuyentiep  VALUES  ( 40,'IT9','06-22-2018' , N'Đã xem', N'Đã chuyển',  2)
go
CREATE TABLE Bomon
(
	MaBM VARCHAR(50) PRIMARY KEY,
	TenBM nVARCHAR(100),
	Noidung nvarchar(max),
	Flag bit
)
go
INSERT INTO Bomon( MaBM, TenBM ,NoiDung,Flag) VALUES ( 'BM1',  N'Hệ thống thông tin',N'<p>Hiểu một các đơn giản, Hệ thống thông tin là ngành học về con người, thiết bị và quy trình thu thập, phân tích, đánh giá và phân phối những thông tin chính xác cho những người soạn thảo các quyết định trong tổ chức - doanh nghiệp.
Nhiều người cho rằng MIS giống với ngành Công nghệ thông tin hay khoa học máy tính, nhưng thực tế không hẳn vậy. MIS tập trung vào thiết kế, quản trị và vận hành các hệ thống thông tin, phân tích dữ liệu, kết nối giữa các bên liên quan trong tổ chức, doanh nghiệp với các chuyên gia công nghệ thông tin, cũng như biết các làm thế nào để doanh nghiệp hoạt động hiệu quả và có lợi thế cạnh tranh hơn.</p>',1)
INSERT INTO Bomon( MaBM, TenBM ,NoiDung,Flag) VALUES ( 'BM2',  N'Kỹ thuật phần mềm',N'<p>Nhiệm vụ của Bộ môn Kỹ thuật phần mềm là trang bị kiến thức vững chắc và kỹ năng chuyên nghiệp cho các sinh viên tốt nghiệp, nhằm đáp ứng những đòi hỏi hiện tại, tương lai và thách thức về kỹ nghệ phần mềm, để các kỹ sư tương lai có khả năng làm việc trong các môi trường chuyên nghiệp, nhằm phục vụ của xã hội ngày một tốt hơn. Cụ thể như sinh viên nắm vững đầy đủ kiến thức về ngành kỹ thuật phần mềm bao gồm: kiến thức cơ sở khoa học của ngành, kỹ thuật và phương pháp phân tích, thiết kế, triển khai và bảo trì một hệ thống phần mềm an toàn theo chuẩn quốc tế, để đảm bảo áp dụng thành công khi đi làm ở công ty hoặc tiếp tục học lên những bậc học cao hơn, từ đó hình thành các kỹ năng giải quyết vấn đề. Sinh viên được trang bị kỹ năng làm việc chuyên nghiệp thông qua các hoạt động tham gia nhóm thực hành, đồ án, khoá luận và giao lưu với doanh nghiệp qua công tác thực tập. Để sau khi tốt nghiệp, sinh viên vững vàng tham gia các dự án lớn nhỏ, trở thành kỹ sư toàn cầu cũng như khả năng nghiên cứu lên các bậc học Thạc sĩ và Tiến sĩ.</p>',1)
INSERT INTO Bomon( MaBM, TenBM ,NoiDung,Flag) VALUES ( 'BM3',  N'Khoa học máy tính',N'<p>Khoa học máy tính là ngành nghiên cứu các cơ sở lý thuyết về thông tin và tính toán cùng sự thực hiện và ứng dụng của chúng trong các hệ thống máy tính. Khoa học máy tính là cách tiếp cận khoa học và thực tiễn để tính toán và các ứng dụng của nó và nghiên cứu có hệ thống về tính khả thi, cấu trúc, biểu hiện và cơ giới hóa các thủ tục (hoặc các thuật toán) cơ bản làm cơ sở cho việc thu thập, đại diện, xử lý, lưu trữ, truyền thông và truy cập thông tin. Một định nghĩa thay thế, gọn gàng hơn về khoa học máy tính là nghiên cứu về các quy trình thuật toán tự động hóa mà có thể nhân rộng trên quy mô lớn. Một nhà khoa học máy tính là chuyên gia về lý thuyết tính toán và thiết kế các hệ thống tính toán.</p>',1)
INSERT INTO Bomon( MaBM, TenBM ,NoiDung,Flag) VALUES ( 'BM4',  N'Mạng và hệ thống máy tính',N'<p>Mục tiêu lớn nhất của bộ môn là đào tạo nhũng sinh viên có khả năng triển khai và xây dựng và phát triển các ứng dụng trên các hệ thống mạng trong các doanh nghiệp. Sinh viên sẽ được học các môn học tiên quyết để hiểu về sự vận hành của hệ thống mạng như Mạng máy tính, Quản trị mạng và Kiến trúc máy tính. Từ các môn tiên đề này sinh viên sẽ phát triển hoàn thiện kỹ năng của mình thông qua các môn chuyên ngành. Ví dụ, sinh viên đam mê các vấn đề về an ninh và bảo mật trên mạng có thể theo học môn định hướng như An toàn và Bảo mật mạng.</p><p>Ngoài mục tiêu đào tạo các kỹ sư mạng cung cấp cho xã hội, bộ môn còn quan tâm đến các vấn đề nghiên cứu và học thuật để kịp thời cập nhật các xu hướng mới của công nghệ nhằm nâng cao chất lượng giảng dạy. Chính vì thế, định hướng cho sinh viên tham gia các đề tài nghiên cứu cũng là một mục tiêu khác được bộ môn quan tâm.  Các sinh viên sẽ được hổ trợ tham gia nghiên cứu cùng giáo viên, giáo viên sẽ định hướng cho các em nghiên cứu. Sau quá trình nghiên cứu, sinh viên có thể viết bài và đăng bài ở các hội thảo khoa học trong và ngoài nước. Đây là bước khởi đầu tốt cho sự nghiệp nghiên cứu của các em sinh viên sau này.</p>',1)

go
CREATE TABLE Monhoc 
(
	MaMH VARCHAR(50) PRIMARY KEY,
	MaBM VARCHAR(50),
	TenMH NVARCHAR(100),
	Flag bit,
	FOREIGN KEY (MaBM) REFERENCES Bomon(MaBM)
)
go
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841109', 'BM1',  N'Cơ sở dữ liệu',1)
INSERT INTO Monhoc ( MaMH, MaBM, TenMH,Flag ) VALUES  ( '841065', 'BM1',  N'Các hệ quản trị CSDL' ,1)
INSERT INTO Monhoc ( MaMH, MaBM, TenMH,Flag ) VALUES  ( '841048', 'BM1',  N'Phân tích thiết kế hệ thống thông tin',1)
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841111', 'BM1',  N'Phân tích thiết kế hướng đối tượng' ,1)
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841068', 'BM1',  N'Hệ thống thông tin doanh nghiệp' ,1)
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841120', 'BM1',  N'An toàn và bảo mật dữ liệu trong hệ thống thông tin', 1)
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841121', 'BM1',  N'Cơ sở dữ liệu phân tán',1)
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841067', 'BM1',  N'Thương mại điện tử và ứng dụng' ,1)
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841073', 'BM1',  N'Seminar chuyên đề (hướng Hệ thống thông tin)',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841044', 'BM2',  N'Lập trình hướng đối tượng',  1)
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841107', 'BM2',  N'Lập trình Java', 1)
INSERT INTO Monhoc ( MaMH, MaBM, TenMH,Flag ) VALUES  ( '841304', 'BM2',  N'Phát triển ứng dụng web 1',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841046', 'BM2',  N'Phát triển ứng dụng web 2',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841047', 'BM2',  N'Công nghệ phần mềm',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841050', 'BM2',  N'Kiểm thử phần mềm',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841051', 'BM2',  N'Thiết kế giao diện',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841113', 'BM2',  N'Phát triển phần mềm mã nguồn mở',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841052', 'BM2',  N'Xây dựng phần mềm theo mô hình lớp',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841114', 'BM2',  N'Phát triển ứng dụng trên thiết bị di động',  1)
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841072', 'BM2',  N'Các công nghệ lập trình hiện đại', 1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841301', 'BM3',  N'Giải tích (Khoa Toán Ứng dụng GD)',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841302', 'BM3',  N'Đại số (Khoa Toán Ứng dụng GD)',  1)
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841101', 'BM3',  N'Tiếng Anh chuyên ngành 1',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841106', 'BM3',  N'Tiếng Anh chuyên ngành 2',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841020', 'BM3',  N'Cơ sở lập trình',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841040', 'BM3',  N'Kỹ thuật lập trình',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841102', 'BM3',  N'Toán rời rạc',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841103', 'BM3',  N'Lý thuyết đồ thị',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841108', 'BM3',  N'Cấu trúc dữ liệu và giải thuật',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841110', 'BM3',  N'Cơ sở trí tuệ nhân tạo',  1)
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841308', 'BM3',  N'Khai phá dữ liệu',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841021', 'BM4',  N'Kiến trúc máy tính',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841022', 'BM4',  N'Hệ điều hành',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841058', 'BM4',  N'Hệ điều hành mã nguồn mở',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841104', 'BM4',  N'Mạng máy tính',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841059', 'BM4',  N'Quản trị mạng',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841117', 'BM4',  N'Lập trình ứng dụng mạng',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841118', 'BM4',  N'Lập trình hệ thống mạng',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841061', 'BM4',  N'Mạng máy tính nâng cao',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841119', 'BM4',  N'An ninh mạng máy tính',  1 )
INSERT INTO Monhoc ( MaMH, MaBM, TenMH ,Flag) VALUES  ( '841074', 'BM4',  N'Seminar chuyên đề (hướng Mạng và hệ thống máy tính)',  1 )

go
CREATE TABLE ThongtinGV
(
	MaGV VARCHAR(50) PRIMARY KEY,
	MaBM VARCHAR(50),
	TenGV NVARCHAR(100),
	Chucvu nVARCHAR(50),
	Chucdanh nvarchar(50),
	ThongtinGV nvarchar(max),
	Diachimail VARCHAR(100),
	Flag BIT,
	FOREIGN KEY (MaBM) REFERENCES Bomon(MaBM)
)
go
INSERT INTO ThongtinGV ( MaGV ,MaBM , TenGV,Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES ( 'GV1' , 'BM1',N'Nguyễn Quốc Huy',N'Tiến sĩ',N'Trưởng bộ môn','','nqhuy@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES  ( 'GV2' , 'BM1',N'Đinh Thị Ngọc Loan' ,N'Thạc sĩ',N'Giảng viên','','', 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES ( 'GV3' , 'BM1'  ,N'Nguyễn Thị Uyên Nhi',N'Thạc sĩ',N'Giảng viên','','ntunhi@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES ( 'GV4' , 'BM1' ,N'Lê Nhị Lãm Thúy ',N'Thạc sĩ',N'Giảng viên','','thuylnl@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES ( 'GV5' , 'BM1' ,N'Phan Thị Kim Loan',N'Thạc sĩ',N'Giảnng viên','',' ptkloan@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES ( 'GV6' , 'BM2' ,N'Phùng Thái Thiên Trang',N'Thạc sĩ',N'Giảng viên',N'<table border="1" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td>
			<p><strong>Email&nbsp;</strong></p>
			</td>
			<td>
			<p>thientrang@sgu.edu.vn</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>C&aacute;c m&ocirc;n đ&atilde; giảng</strong></p>
			</td>
			<td>
			<ul>
				<li>Lập tr&igrave;nh hướng đối tượng</li>
				<li>Lập tr&igrave;nh Java</li>
				<li>Kỹ thuật lập tr&igrave;nh</li>
				<li>To&aacute;n rời rạc</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Hướng nghi&ecirc;n cứu hiện tại</strong></p>
			</td>
			<td>
			<ul>
				<li>Ph&acirc;n loại ảnh số</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>C&aacute;c c&ocirc;ng tr&igrave;nh NC đ&atilde; c&ocirc;ng bố</strong></p>

			<p>&nbsp;</p>
			</td>
			<td>
			<p>&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>C&aacute;c gi&aacute;o tr&igrave;nh/Đề t&agrave;i đ&atilde; nghiệm thu</strong></p>
			</td>
			<td>
			<ul>
				<li>C&aacute;c ng&ocirc;n ngữ m&ocirc; h&igrave;nh ho&aacute; (2011-&nbsp; th&agrave;nh vi&ecirc;n)</li>
				<li>X&acirc;y dựng website ph&ograve;ng khoa học c&ocirc;ng ngh&ecirc; Đại học S&agrave;i G&ograve;n (2012- t&aacute;c giả)</li>
				<li>Gi&aacute;o tr&igrave;nh To&aacute;n rời rạc (2013- th&agrave;nh vi&ecirc;n)</li>
				<li>So s&aacute;nh c&aacute;c giải thuật ph&acirc;n loại ảnh số (2014- t&aacute;c giả)</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>C&aacute;c s&aacute;ch đ&atilde; xuất bản</strong></p>
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
			<p><strong>Học vi&ecirc;n cao học đang hướng dẫn</strong></p>
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
			<p><strong>Nghi&ecirc;n cứu sinh đang hướng dẫn</strong></p>
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
			<p><strong>C&aacute;c Th&ocirc;ng tin kh&aacute;c (nếu c&oacute;)</strong></p>
			</td>
			<td>
			<p>&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>
' ,'thientrang@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES ( 'GV7' , 'BM2' ,N'Huỳnh Thắng Được',N'Thạc sĩ',N'Giảng viên','' ,' duochuynh@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES  ( 'GV8' , 'BM2' ,N'Đỗ Ngọc Như Loan',N'Thạc sĩ',N'Giảng viên','','loandnn@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES ( 'GV9' , 'BM2'  ,N'Đỗ Đình Trang',N'Thạc sĩ',N'Giảng viên','','dodinhtrang@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES ( 'GV10' , 'BM2'  ,N'Nguyễn Thanh Sang',N'Thạc sĩ',N'Giảng viên','','thanhsang@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES  ( 'GV11' , 'BM2' ,N'Cao Thái Phương Thanh',N'Tiến sĩ',N'Giảng viên','',' ctpthanh@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES  ( 'GV12' , 'BM3' ,N'Lê Minh Nhựt Triều',N'Tiến sĩ',N'Trưởng bộ môn','','trieule@sgu.edu.vn,' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES  ( 'GV13' , 'BM3' ,N'Huỳnh Minh Trí',N'Tiến sĩ',N'Giảng viên chính','' ,'hmtri@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES  ( 'GV14' , 'BM3' ,N'Nguyễn Nhựt Đông',N'Thạc sĩ',N'Phó trưởng khoa','','nndong@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES ( 'GV15' , 'BM3' ,N'Phan Tấn Quốc',N'Tiến sĩ',N'Phó khoa phụ trách',N'<table border="1" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td>
			<p><strong>Họ v&agrave; t&ecirc;n</strong></p>
			</td>
			<td>
			<p>Phan Tấn Quốc</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Địa chỉ nơi l&agrave;m việc</strong></p>
			</td>
			<td>
			<p>Ph&ograve;ng C.A108</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Email/website</strong></p>
			</td>
			<td>
			<p><a href="mailto:quocpt@sgu.edu.vn">quocpt@sgu.edu.vn</a>; https://sites.google.com/site/phantanquoc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>C&aacute;c m&ocirc;n đ&atilde; giảng</strong></p>
			</td>
			<td>
			<ul>
				<li>Kỹ thuật lập tr&igrave;nh</li>
				<li>L&yacute; thuyết đồ thị</li>
				<li>Cấu tr&uacute;c dữ liệu v&agrave; giải thuật, Ph&acirc;n t&iacute;ch thiết kế giải thuật</li>
				<li>Cơ sở tr&iacute; tuệ nh&acirc;n tạo</li>
				<li>Khai ph&aacute; dữ liệu (CH), T&iacute;nh to&aacute;n khoa học (CH), Giải thuật n&acirc;ng cao (CH).</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Hướng nghi&ecirc;n cứu hiện tại</strong></p>
			</td>
			<td>
			<ul>
				<li>Thuật to&aacute;n metaheuristic.</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>C&aacute;c c&ocirc;ng tr&igrave;nh NC đ&atilde; c&ocirc;ng bố</strong></p>

			<p>&nbsp;</p>
			</td>
			<td>
			<ul>
				<li>Phan Tan Quoc (2012). A Heuristic approach for solving the minimum routing cost spanning tree problem. International Journal of Machine Learning and Computing (IJMLC), IACSIT, ISSN: 2010-3700, volume 2, pp.406-409.</li>
				<li>Phan Tan Quoc (2012). A Genetic approach for solving the minimum routing cost spanning tree problem. International Journal of Machine Learning and Computing (IJMLC), IACSIT, ISSN: 2010-3700, volume 2, pp.410-414.</li>
				<li>Phan Tấn Quốc, Nguyễn Đức Nghĩa (2012). Thuật to&aacute;n bầy ong giải b&agrave;i to&aacute;n c&acirc;y khung với chi ph&iacute; định tuyến nhỏ nhất. ICTFIT (ĐH KHTN ĐHQG TPHCM), Tuyển tập c&ocirc;ng tr&igrave;nh nghi&ecirc;n cứu C&ocirc;ng nghệ th&ocirc;ng tin &amp; Truyền th&ocirc;ng, Nh&agrave; xuất bản Khoa học Kỹ thuật, pp.73-81.</li>
				<li>Phan Tấn Quốc, Nguyễn Đức Nghĩa (2013). Thuật to&aacute;n t&igrave;m kiếm Tabu giải b&agrave;i to&aacute;n c&acirc;y khung với chi ph&iacute; định tuyến nhỏ nhất. Tạp ch&iacute; th&ocirc;ng tin, khoa học c&ocirc;ng nghệ, chuy&ecirc;n san: C&aacute;c c&ocirc;ng tr&igrave;nh nghi&ecirc;n cứu, ph&aacute;t triển v&agrave; Ứng dụng CNTT-TT&rdquo;, Bộ Th&ocirc;ng tin v&agrave; Truyền Th&ocirc;ng, ISSN: 1589-3526, Số 3, pp.5-13.</li>
				<li>Phan Tấn Quốc, Nguyễn Đức Nghĩa (2013). Thuật to&aacute;n bầy ong giải b&agrave;i to&aacute;n c&acirc;y khung với chi ph&iacute; định tuyến nhỏ nhất. Tạp ch&iacute; Tin học v&agrave; điều khiển học, Viện H&agrave;n L&acirc;m KH &amp; CN Việt Nam. ISSN: 1813-9663, T.29, S3, 2013, pp.265-276.</li>
				<li>Phan Tan Quoc, Nguyen Duc Nghia (2013). An Experimental Study of Minimum Routing Cost Spanning Tree Algorithms. IEEE, SoCPaR, 2013, pp.164-171.</li>
				<li>Phan Tấn Quốc (2015), Ph&acirc;n t&iacute;ch t&iacute;nh tăng cường v&agrave; t&iacute;nh đa dạng trong c&aacute;c thuật to&aacute;n metaheuristic giải b&agrave;i to&aacute;n tối ưu, Hội thảo to&agrave;n quốc về C&ocirc;ng nghệ Th&ocirc;ng tin &amp; Truyền Th&ocirc;ng (ISBN:978-604-919-456-6), Đại học Cần Thơ, 2015.</li>
				<li>Phan Tấn Quốc, Đề xuất thuật to&aacute;n mới giải b&agrave;i to&aacute;n c&acirc;y khung với chi ph&iacute; định tuyến nhỏ nhất trong trường hợp đồ thị thưa, Tạp ch&iacute; khoa học Trường Đại học Cần Thơ, ISSN:1859-2333, Số chuy&ecirc;n đề C&ocirc;ng nghệ th&ocirc;ng tin 2015, Trang 61-68.</li>
				<li>Phan Tấn Quốc(2016), R&uacute;t gọn đồ thị cho b&agrave;i to&aacute;n c&acirc;y Steiner nhỏ nhất, Kỷ yếu Hội nghị Quốc gia lần thứ IX về Nghi&ecirc;n cứu cơ bản v&agrave; ứng dụng C&ocirc;ng nghệ th&ocirc;ng tin (FAIR); Trường Đại học Cần Thơ, ng&agrave;y 04-05/08/2016, ISBN: 978-604-913-472-2, Trang 638-644.</li>
				<li>Trần Việt Chương, Phan Tấn Quốc, H&agrave; Hải Nam (2017),&nbsp;Đề xuất một số thuật to&aacute;n heuristic giải b&agrave;i to&aacute;n c&acirc;y steiner nhỏ nhất, Kỷ yếu Hội nghị Quốc gia lần thứ X về Nghi&ecirc;n cứu cơ bản v&agrave; ứng dụng C&ocirc;ng nghệ th&ocirc;ng tin (FAIR); Trường Đại học Đ&agrave; Nẳng, ng&agrave;y 17-18/08/2017, ISBN: 978-604-913-614-6, Trang 138-147.</li>
				<li>Trần Việt Chương, Phan Tấn Quốc, H&agrave; Hải Nam (2017), Thuật to&aacute;n Bees giải b&agrave;i to&aacute;n&nbsp; c&acirc;y steiner nhỏ nhất trong trường hợp đồ thị thưa, Tạp ch&iacute; khoa học c&ocirc;ng nghệ th&ocirc;ng tin v&agrave; truyền th&ocirc;ng, số 2&amp;3; th&aacute;ng 12/2017; Học vi&ecirc;n C&ocirc;ng nghệ bưu ch&iacute;nh viễn th&ocirc;ng, Bộ Th&ocirc;ng tin v&agrave; truyền th&ocirc;ng.ISSN: 2525-2224, Trang 24-29.</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>C&aacute;c gi&aacute;o tr&igrave;nh/Đề t&agrave;i đ&atilde; nghiệm thu</strong></p>
			</td>
			<td>
			<ul>
				<li><em>Gi&aacute;o tr&igrave;nh tuyển tập c&aacute;c b&agrave;i tập lập tr&igrave;nh căn bản, Gi&aacute;o tr&igrave;nh cấp Trường năm 2011 (đồng t&aacute;c giả)</em></li>
				<li><em>Gi&aacute;o tr&igrave;nh T&agrave;i liệu tham khảo B&agrave;i tập Cơ sở dữ liệu, Gi&aacute;o tr&igrave;nh cấp Trường năm 2012 (chủ bi&ecirc;n)</em></li>
				<li><em>T&agrave;i liệu tham khảo B&agrave;i tập Tr&iacute; tuệ nh&acirc;n tạo, Gi&aacute;o tr&igrave;nh cấp khoa năm 2013 (đồng t&aacute;c giả)</em></li>
				<li><em>Gi&aacute;o tr&igrave;nh Cơ sở lập tr&igrave;nh, Gi&aacute;o tr&igrave;nh cấp Trường năm 2014 (đồng t&aacute;c giả)</em></li>
				<li><em>X&acirc;y dựng nội dung c&aacute;c chuy&ecirc;n đề giảng dạy c&aacute;c lớp chuy&ecirc;n tin ở trường Trung học thực h&agrave;nh S&agrave;i G&ograve;n, 2014 (đề t&agrave;i NCKH cấp Trường, chủ nhiệm)</em></li>
				<li><em>Gi&aacute;o tr&igrave;nh Kỹ thuật lập tr&igrave;nh, Gi&aacute;o tr&igrave;nh cấp Trường năm 2015 (đồng t&aacute;c giả)</em></li>
				<li><em>N&acirc;ng cao năng lực c&ocirc;ng nghệ th&ocirc;ng tin qua việc khai th&aacute;c c&aacute;c sản phẩm ứng dụng của Google cho c&aacute;n bộ, giảng vi&ecirc;n trường Đại học S&agrave;i G&ograve;n, 2016 (đề t&agrave;i NCKH cấp Trường, chủ nhiệm).</em></li>
				<li><em>Gi&aacute;o tr&igrave;nh Cơ sở tr&iacute; tuệ nh&acirc;n tạo, Gi&aacute;o tr&igrave;nh cấp Trường năm 2017 (đồng t&aacute;c giả)</em></li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>C&aacute;c s&aacute;ch đ&atilde; xuất bản</strong></p>
			</td>
			<td>
			<ul>
				<li><em>Gi&aacute;o tr&igrave;nh Kỹ thuật lập tr&igrave;nh</em>, 277 trang, NXB ĐHQG TPHCM, ISBN: 978-604-73-4633-2, 2016 (đồng t&aacute;c giả).</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Học vi&ecirc;n cao học đang hướng dẫn</strong></p>
			</td>
			<td>
			<ul>
				<li>L&ecirc; Ho&agrave;ng Kh&ocirc;i (KHMT16.2), &Acirc;u Th&aacute;i Ngọc (KHMT16.2), Trần Anh Chương (KHMT16.2)</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Nghi&ecirc;n cứu sinh đang hướng dẫn</strong></p>
			</td>
			<td>
			<ul>
				<li>Kh&ocirc;ng c&oacute;</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>
			<p><strong>Nghi&ecirc;n cứu sinh TS chuy&ecirc;n ng&agrave;nh Khoa học m&aacute;y t&iacute;nh&nbsp;</strong>(05/2010&reg;07/2015)</p>

			<p><strong>Cao học Tin học&nbsp;</strong>(12/1999&reg;01/2003)</p>
			</td>
			<td>
			<ul>
				<li>Phan Tấn Quốc,&nbsp;<em>C&aacute;c thuật to&aacute;n gần đ&uacute;ng giải b&agrave;i to&aacute;n c&acirc;y khung với chi ph&iacute; định tuyến nhỏ nhất</em>, Tiến sĩ chuy&ecirc;n ng&agrave;nh Khoa học m&aacute;y t&iacute;nh, ĐH B&aacute;ch Khoa H&agrave; Nội, Việt Nam, 2015 (Luận &aacute;n tiến sĩ chuy&ecirc;n ng&agrave;nh khoa học m&aacute;y t&iacute;nh. GVHD PGS.TS Nguyễn Đức Nghĩa).</li>
				<li>Phan Tấn Quốc,&nbsp;<em>Tiếp cận b&agrave;i to&aacute;n luồng tr&ecirc;n mạng v&agrave; b&agrave;i to&aacute;n gh&eacute;p cặp để x&acirc;y dựng thuật giải v&agrave; chương tr&igrave;nh cho lớp b&agrave;i to&aacute;n tối ưu tuyến t&iacute;nh</em>, ĐH KHTN, ĐHQG TPHCM, 2003 (Luận văn thạc sĩ Tin học. GVHD. PGS.TS Trần Văn Hạo).</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
' ,' quocpt@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES ( 'GV16' , 'BM3' ,N'Nguyễn Hòa',N'Phó giáo sư/Tiến sĩ',N'Phó trưởng khoa','','nguyenhoa@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES ( 'GV17' , 'BM3'  ,N'Đinh Thị Thu Hương',N'Tiến sĩ',N'Giảng viên chính','' ,'huongdtt@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES ( 'GV18' , 'BM3'  ,N'Lê Ngọc Anh' ,N'Tiến sĩ',N'Giảng viên','' ,'khong co' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES  ( 'GV19' , 'BM4'  ,N'Lê Ngọc Kim Khánh' ,N'Thạc sĩ',N'Trưởng bộ môn','',' lnkkhanh@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES ( 'GV20' , 'BM4'  ,N'Nguyễn Minh Thi' ,N'Thạc sĩ',N'Giảng viên','','khong co' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES  ( 'GV21' , 'BM4'  ,N'Lương Minh Huấn' ,N'Thạc sĩ',N'Giảng viên','','huanlm@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES  ( 'GV22' , 'BM4'  ,N'Nguyễn Võ Lam Giang',N'Thạc sĩ',N'Giảng viên','','khong co' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES ( 'GV23' , 'BM4'  ,N'Kiều My',N'Thạc sĩ',N'Giảng viên','','' , 1 )

go
create table CongtacGV
(
	MaCT varchar(50) primary key,
	TenCT nvarchar(50),
	Flag bit
)
go
INSERT INTO CongtacGV values('CTGV1',N'Họp',1)
INSERT INTO CongtacGV values('CTGV2',N'Lịch công tác',1)
go
create table ChitietCTGV
(
	MaCTCTGV varchar(50) primary key,
	MaCT varchar(50),
	NgayCT datetime,
	Noidung nvarchar(max),
	Thanhphan nvarchar(max),
	Diadiem nvarchar(50),
	Chutri nvarchar(50),
	Bosung nvarchar(max),
	Tentaikhoan varchar(100),
	Flag bit,
	FOREIGN KEY (MaCT) REFERENCES CongtacGV(MaCT),
	FOREIGN KEY (Tentaikhoan) REFERENCES Taikhoan(Tentaikhoan)
)
go

insert into ChitietCTGV values('CTCT1','CTGV1','11/06/2018 7:30:00',N'<p>Họp online dự án BUILD-IT</p>',N'<p>- Đại diện Đại học bang Arizona;</p>

<p>- Ph&oacute; Khoa&nbsp;Phan Tấn Quốc;</p>
',N'Hội trường A',N'Phó khoa - TS. Phan Tấn Quốc','','IT2',1)
insert into ChitietCTGV values('CTCT2','CTGV1','11/06/2018 10:00:00',N'<p>Họp rà soát Dự thảo 1 “Quy định hoạt động Đảm bảo chất lượng giáo dục Trường ĐHBK”</p>',N'<p>- Ph&oacute; Khoa Phan Tấn Quốc;</p>

<p>- Ph&ograve;ng Khoa C&ocirc;ng Nghệ Th&ocirc;ng Tin: Trưởng ph&ograve;ng</p>
',N'Hội trường A',N'Phó khoa - TS. Phan Tấn Quốc','','IT2',1)

insert into ChitietCTGV values('CTCT3','CTGV1','11/06/2018 14:00:00',N'<p>Họp Ban thư k&yacute; để hỗ trợ c&aacute;c đơn vị hệ thống c&aacute;c c&ocirc;ng việc thuộc chức năng, nhiệm vụ hiện h&agrave;nh</p>'
,N'<p>- Ban chỉ đạo ISO: Trưởng Ban; Ủy vi&ecirc;n thường trực ;</p>
<p>- Ban Thư k&yacute;: Tất cả th&agrave;nh vi&ecirc;n</p>'
,N'Hội trường A',N'Phó trưởng khoa - PGS.TS Nguyễn Hòa','','IT2',1)

insert into ChitietCTGV values('CTCT4','CTGV2','11/07/2018 8:30:00',N'<p>Khoa CNTT đ&oacute;n T&acirc;n sinh vi&ecirc;n kh&oacute;a 2018</p>'
,N'<p>- Ban l&atilde;nh đạo Khoa CNTT;</p>

<p>- Li&ecirc;n chi đo&agrave;n Khoa CNTT;</p>

<p>- Đại biểu kh&aacute;ch mời;</p>

<p>- C&aacute;n bộ, giảng vi&ecirc;n &amp; sinh vi&ecirc;n Khoa CNTT;</p>

<p>- T&acirc;n sinh vi&ecirc;n Khoa CNTT kh&oacute;a 2018.</p>'
,N'Hội trường A',N'Khoa CNTT','','IT2',1)

insert into ChitietCTGV values('CTCT5','CTGV2','11/07/2018 14:30:00',N'<p>Thi đấu Giải B&oacute;ng chuyền truyền thống Trường S&agrave;i G&ograve;n năm 2018</p>
',N'<p>- Ban Văn thể C&ocirc;ng đo&agrave;n;</p>

<p>- C&aacute;c đội thi đấu;</p>

<p>- CBVC quan t&acirc;m cổ vũ.</p>'
,N'Sân bóng chuyền 1 & 2',N'Ban văn thể mỹ','','IT2',1)

insert into ChitietCTGV values('CTCT6','CTGV2','11/08/2018 7:30:00',N'<p>Hiến m&aacute;u nh&acirc;n đạo đợt 3-2018</p>'
,N'<p>-BCH Đo&agrave;n Thanh Ni&ecirc;n;</p>

<p>-BCH Hội Sinh vi&ecirc;n;</p>

<p>- Ban Tổ chức hiến m&aacute;u;</p>

<p>- C&aacute;c bạn t&igrave;nh nguyện vi&ecirc;n tham gia hiến m&aacute;u.</p>
',N'Sân GDCT khu A',N'Đoàn Thanh niên - Hội sinh viên','','IT2',1)

insert into ChitietCTGV values('CTCT7','CTGV2','11/08/2018 7:30:00',N'<p>Khai mạc Ng&agrave;y Giao lưu Doanh nghiệp v&agrave; SV CNTT 2018</p>'
,N'<p>- C&aacute;n bộ Khoa CNTT;</p>

<p>- Sinh vi&ecirc;n Khoa CNTT;</p>

<p>- C&aacute;c Doanh nghiệp tham gia.</p>'
,N'Trung tâm học liệu KLF',N'Khoa CNTT','','IT2',1)

insert into ChitietCTGV values('CTCT8','CTGV1','11/09/2018 8:00:00',N'<p>Họp về Hội thảo quốc tế &ldquo;Khởi tạo doanh nghiệp cho sinh vi&ecirc;n c&aacute;c trường ĐH, CĐ tr&ecirc;n địa b&agrave;n TPHCM&rdquo;</p>
',N'<p>Trưởng c&aacute;c đơn vị: Văn ph&ograve;ng, Ph&ograve;ng QLKH, Trung t&acirc;m ĐTQT, Ph&ograve;ng HTQT&amp;DN, Viện C&ocirc;ng nghệ M&ocirc;i trường &ndash; Năng lượng, Đo&agrave;n Trường, Trung t&acirc;m HTSV, Khoa QTKD, Khoa TC-KT, Khoa CNTT, Khoa ĐT-VT, Khoa KHMT, Khoa SPKT, Khoa QHQT.</p>
',N'Phòng họp BGH',N'Ban giám hiệu','','IT2',1)

INSERT into ChitietCTGV values('CTCT9','CTGV2','11/09/2018 14:00:00',N'<p>Hội nghị đại biểu C&aacute;n bộ, C&ocirc;ng chức, Vi&ecirc;n chức năm học 2018-2019</p>',N'<p>Đảng ủy;</p>

<p>Ban Gi&aacute;m hiệu;</p>

<p>Ban chấp h&agrave;nh C&ocirc;ng đo&agrave;n trường;</p>

<p>B&iacute; thư Đo&agrave;n trường;</p>

<p>Trưởng, Ph&oacute; c&aacute;c đơn vị;</p>

<p>B&iacute; thư chi bộ;</p>

<p>Chủ tịch C&ocirc;ng đo&agrave;n bộ phận v&agrave; c&aacute;c đại biểu được đơn vị cơ sở bầu.</p>
',N'Hội trường A',N'Hiệu trưởng','','IT2',1)

INSERT INTO ChitietCTGV values('CTCT10','CTGV2','11/09/2018 14:30:00',N'<p>Buổi giao lưu văn nghệ, giới thiệu cơ hội việc l&agrave;m v&agrave; đ&oacute;n t&acirc;n sinh vi&ecirc;n Khoa CNTT</p>
',N'<p>- K&iacute;nh mời đại diện Ban gi&aacute;m hiệu, ph&ograve;ng đ&agrave;o tạo, ph&ograve;ng CTSV, Trung t&acirc;m hỗ trợ sv v&agrave; quan hệ doanh nghiệp;</p>

<p>- Tất cả thầy c&ocirc; Khoa CNTT;</p>

<p>- Sinh vi&ecirc;n c&aacute;c kh&oacute;a của Khoa CNTT;</p>

<p>- Đại diện c&aacute;c doanh nghiệp.</p>
',N'Hội trường B',N'Ban lãnh đạo khoa CNTT','','IT2',1)

INSERT INTO ChitietCTGV VALUES ('CTCT11','CTGV2','11/10/2018 8:00:00',N'<p>Seminar định hướng c&ocirc;ng nghệ của Tập đo&agrave;n VNPT v&agrave; triển khai chương tr&igrave;nh học bổng &ldquo;Sinh vi&ecirc;n t&agrave;i năng VNPT&rdquo;</p>
',N'<p>- L&atilde;nh đạo Khoa CNTT;</p>

<p>- L&atilde;nh đạo C&ocirc;ng ty VNPT;</p>

<p>- C&aacute;c c&aacute;n bộ giảng vi&ecirc;n v&agrave; sinh vi&ecirc;n c&oacute; quan t&acirc;m</p>
',N'Hội trường A',N'Lãnh đạo khoa CNTT','','IT2',1)

INSERT INTO ChitietCTGV VALUES ('CTCT12','CTGV1','11/10/2018 8:00:00',N'Họp giao ban công tác trường',N'<p>- Ban Gi&aacute;m hiệu;</p>

<p>- Chủ tịch, Ph&oacute; Chủ tịch C&ocirc;ng đo&agrave;n; B&iacute; thư ĐTN; Chủ tịch Hội sinh vi&ecirc;n;</p>

<p>- Trưởng, Ph&oacute; c&aacute;c Khoa, Ph&ograve;ng;</p>

<p>- Gi&aacute;m đốc Trung t&acirc;m Học liệu &amp;TT; Gi&aacute;m đốc c&aacute;c trung t&acirc;m, Viện; Tổ trưởng Tổ CNTT;</p>

<p>- Trưởng Bộ m&ocirc;n NN chuy&ecirc;n ng&agrave;nh.</p>
',N'Phòng họp BGH',N'Hiệu trưởng','','IT2',1)

INSERT INTO ChitietCTGV VALUES ('CTCT13','CTGV2','11/10/2018 14:00:00',N'Thảo luận xây dựng quy định về tổ chức hoạt động, quản lý trang tin điện tử & email của Trường.'
,N'<p>- Đại diện Ban Gi&aacute;m hiệu;</p>

<p>- Tổ trưởng Tổ CNTT;</p>

<p>- Đại diện l&atilde;nh đạo c&aacute;c Ph&ograve;ng, Trung t&acirc;m, Viện;</p>

<p>- Đại diện l&atilde;nh đạo khoa;</p>

<p>- C&aacute;c c&aacute; nh&acirc;n CBVC c&oacute; quan t&acirc;m.</p>
',N'Hội trường B',N'Phoa hiệu trưởng - TS. Hoàng Hữu Lượng','','IT2',1)

INSERT INTO ChitietCTGV VALUES ('CTCT14','CTGV2','11/12/2018 7:30:00',N'<p>Hội thảo Khoa học cấp trường &ldquo;Hội thảo Nh&agrave; tuyển dụng v&agrave; người giỏi nghề ph&acirc;n t&iacute;ch năng lực phục vụ cải tiến chất lượng chương tr&igrave;nh đ&agrave;o tạo&rdquo;</p>

<p>&#39;</p>
',N'<p>Giảng vi&ecirc;n Khoa To&aacute;n Ứng dụng;</p>

<p>Giảng vi&ecirc;n Khoa Khoa học M&ocirc;i trường;</p>

<p>Giảng vi&ecirc;n Khoa C&ocirc;ng nghệ Th&ocirc;ng tin;</p>

<p>C&aacute;n bộ, giảng vi&ecirc;n quan t&acirc;m.</p>
',N'Hội trường B',N'Ban Tổ chức - Ban chuyên môn','','IT2',1)

INSERT INTO ChitietCTGV VALUES ('CTCT15','CTGV2','11/12/2018 9:30:00',N'Setup Hội trường A và các công tác chuẩn bị cho việc tổ chức sự kiện: TECHNOLOGY – LEADING THE WAY TO JAPAN',N'<p>- C&ocirc;ng ty FPT Việt Nam;</p>

<p>- Khoa CNTT, c&aacute;c Ph&ograve;ng TCHC, CSVC hỗ trợ.;</p>

<p>- Mở của Hội trường từ 07h30; sắp xếp cho xe chở trang thiết bị v&agrave;o để chuẩn bị</p>
',N'Hội trường A',N'Khoa CNTT, FPT','','IT2',1)

INSERT INTO ChitietCTGV VALUES ('CTCT16','CTGV2','11/13/2018 8:30:00',N'Tổ chức sự kiện: TECHNOLOGY – LEADING THE WAY TO JAPAN',N'<p>- C&ocirc;ng ty FPT Việt Nam;</p>

<p>- Khoa CNTT, c&aacute;c Ph&ograve;ng TCHC, CSVC;</p>

<p>- Mở của Hội trường từ 07h30 để chạy thử chương tr&igrave;nh</p>
',N'Hội trường A',N'Khoa CNTT, FPT','','IT2',1)

INSERT INTO ChitietCTGV VALUES ('CTCT17','CTGV1','11/14/2018 7:30:00',N'Khoa CNTT Hội nghị CBCCVC năm 2018',N'<p>- Đại diện BGH;</p>

<p>- To&agrave;n thể CBVC Khoa CNTT.</p>
',N'Hội trường B',N'Trưởng khoa CNTT','','IT2',1)


go
create table NghiencuuKH
(
	MaNCKH varchar(50) primary key,
	TenNCKH nvarchar(50),
	Flag bit
)
INSERT INTO NghiencuuKH VALUES  ('SK','Sự kiện',1)
INSERT INTO NghiencuuKH VALUES  ('BB','Bài báo',1)

GO
create table ChitietNCKH
(
	MaCTNCKH varchar(50) primary key,
	MaNCKH varchar(50),
	Tieude nvarchar(max),
	Noidung nvarchar(max),
	Ngaydang datetime,
	NgaySK datetime,
	Tentaikhoan varchar(100),
	Flag bit,
	FOREIGN KEY (MaNCKH) REFERENCES NghiencuuKH(MaNCKH),
	FOREIGN KEY (Tentaikhoan) REFERENCES Taikhoan(Tentaikhoan)
)
INSERT INTO ChitietNCKH VALUES  ('NCKH1','SK',N'Đăng kí dự hội thảo Blockchain',N'<p>Năm 2015, khi cơn b&atilde;o Katrina tr&agrave;n v&agrave;o bờ biển nước Mỹ, đ&atilde; g&acirc;y ra những thiệt hại v&ocirc; c&ugrave;ng to lớn. Một trong những tổn thất tồi tệ nhất được nhắc đến l&agrave; c&aacute;c dữ liệu được lưu trữ như ID, hồ sơ bệnh &aacute;n,... được lưu trữ đ&atilde; bị mất ho&agrave;n to&agrave;n, v&agrave; gần như kh&ocirc;ng thể t&igrave;m lại được.</p>

<p>Năm 2016, chuyển 50$ từ New York đến LonDon mất gần 5 ng&agrave;y, với khoảng 30$ ph&iacute; dịch vụ v&agrave; chuyển đổi ngoại tệ.</p>

<p>Hai vấn đề tr&ecirc;n dường như kh&ocirc;ng c&oacute; g&igrave; li&ecirc;n quan, nhưng n&oacute; c&oacute; một điểm chung th&uacute; vị. Đ&oacute; l&agrave; kết quả của hai vấn đề n&agrave;y sẽ kh&aacute;c nhau rất nhiều, tốt đẹp hơn nhiều trong tương lại với một c&ocirc;ng nghệ mới được chia sẻ với t&ecirc;n gọi l&agrave; BLOCKCHAIN.</p>

<p>Ch&agrave;o mừng bạn đến với c&ocirc;ng nghệ mới - BLOCKCHAIN - nhờ v&agrave;o c&ocirc;ng nghệ n&agrave;y m&agrave; dữ liệu được xem như miễn nhiễm với sự mất m&aacute;t, thay đổi, giả mạo,... v&agrave; tiền tệ sẽ được giao dịch nhanh ch&oacute;ng, chi ph&iacute; giao dịch thấp, an to&agrave;n hơn trước đ&acirc;y rất nhiều. Đặc biệt, th&ocirc;ng tin sẽ được c&ocirc;ng khai rộng r&atilde;i, nhưng lại kh&ocirc;ng bị ai kiểm so&aacute;t.</p>

<p>Để t&igrave;m hiểu th&ecirc;m th&ocirc;ng tin về vấn đề n&agrave;y, c&aacute;c bạn sinh vi&ecirc;n h&atilde;y nhanh ch&oacute;ng đăng k&yacute; bằng link dưới đ&acirc;y để đến dự buổi hội thảo BlockChain để nghe c&aacute;c chuy&ecirc;n gia tr&igrave;nh b&agrave;y về vấn đề n&agrave;y.</p>

<p>Thời gian: 7h ng&agrave;y 10/19/2018.</p>

<p>Địa điểm: Hội trường A, cơ sở ch&iacute;nh đại học S&agrave;i G&ograve;n.</p>

<p>Hạn ch&oacute;t đăng k&yacute;: 10/15/2018.</p>

<p>Đối với sinh vi&ecirc;n thuộc khoa CNTT trường đại học S&agrave;i G&ograve;n, phải từ kh&oacute;a 17 trở về trước, v&agrave; sau khi đăng k&yacute; phải c&oacute; mặt đầy đủ.</p>

<p><a href="https://docs.google.com/forms/d/e/1FAIpQLSeJJPrLTv94uGEKkh7-3BoescLuhNdbFkghud9bZLj4bj9coA/viewform">https://docs.google.com/forms/d/e/1FAIpQLSeJJPrLTv94uGEKkh7-3BoescLuhNdbFkghud9bZLj4bj9coA/viewform</a></p>'
,'09/23/2018','10/19/2018','IT2',1)

INSERT INTO ChitietNCKH VALUES ('NCKH2','SK',N'Hội thảo khoa học "Một số vấn đề chọn lọc về CNTT và truyền thông',N'Các bạn xem chi tiết tại đây','03/22/2018','','IT2',1)
INSERT INTO ChitietNCKH VALUES ('NCKH3','SK',N'Nghiên cứu khoa học',N'','09/09/2018','','IT2',1)

go
create table LoaiGT
(
	MaGT varchar(50) primary key,
	TenGT nvarchar(100),
	Flag bit
)

INSERT INTO LoaiGT VALUES  ('TTC', N'Thông tin chung',1)
INSERT INTO LoaiGT VALUES  ('CCTC',N'Cơ cấu tổ chức',1)
go
create table NoidungGT
(
	MaNDGT varchar(50) primary key,
	MaGT varchar(50),
	Tieude nvarchar(50),
	Noidung nvarchar(max),
	Ngaydang datetime,
	Tentaikhoan varchar(100),
	Flag bit,
	FOREIGN KEY (MaGT) REFERENCES LoaiGT(MaGT),
	FOREIGN KEY (Tentaikhoan) REFERENCES Taikhoan(Tentaikhoan)
)

INSERT INTO NoidungGT VALUES ('GT1','TTC',N'Giới thiệu chung',N'','07/08/2017','IT2',1)

INSERT INTO NoidungGT VALUES ('GT2','TTC',N'Cơ sở vật chất',N'<p>Khoa C&ocirc;ng nghệ th&ocirc;ng tin hiện đang được Nh&agrave; Trường giao quản l&yacute; 08 ph&ograve;ng m&aacute;y t&iacute;nh; mỗi ph&ograve;ng c&oacute; 40 m&aacute;y. C&aacute;c ph&ograve;ng m&aacute;y t&iacute;nh n&agrave;y c&oacute; chức năng phục vụ c&aacute;c giờ học thực h&agrave;nh cho c&aacute;c m&ocirc;n học từ cơ bản đến chuy&ecirc;n ng&agrave;nh của khoa C&ocirc;ng nghệ th&ocirc;ng tin cũng như c&aacute;c khoa kh&aacute;c.</p>

<p>&nbsp;</p>

<p>Sau đ&acirc;y l&agrave; danh s&aacute;ch c&aacute;c ph&ograve;ng m&aacute;y do khoa quản l&yacute;: C.A019, C.A101, C.A102, C.A105, C.A106, C.A109, C.A110, C.A111 (Lầu 1, d&atilde;y A, Cơ sở ch&iacute;nh).</p>

<p><u>Quản l&yacute; ph&ograve;ng m&aacute;y:</u></p>

<p>&nbsp;</p>

<ol>
	<li>CN.Ng&ocirc;&nbsp;Hữu Thanh, Email: thanhnh@sgu.edu.vn</li>
</ol>'
,'03/08/2017','IT2',1)

INSERT INTO NoidungGT VALUES ('GT3','CCTC',N'Chi bộ khoa',N'

<p>Nh&acirc;n sự Chi bộ Khoa CNTT- TT CNTT:</p>

<p>Danh s&aacute;ch đảng vi&ecirc;n thuộc Chi bộ Khoa CNTT TT CNTT gồm c&aacute;c đồng ch&iacute; sau:</p>

<ol>
	<li>Đ/c Phan Thị Kim Loan (Đảng ủy vi&ecirc;n, B&iacute; thư Chi bộ)</li>
	<li>Đ/c Nguyễn Thị Uy&ecirc;n Nhi (Thư k&yacute;)</li>
	<li>Đ/c Đinh Thị Thu Hương</li>
	<li>Đ/c Kiều My</li>
	<li>Đ/c L&ecirc; H&ugrave;ng Thanh Nhựt</li>
	<li>Đ/c Phan Tấn Quốc</li>
	<li>Đ/c Ph&ugrave;ng Th&aacute;i Thi&ecirc;n Trang</li>
	<li>Đ/c Huỳnh Minh Tr&iacute;</li>
</ol>
','03/08/2017','IT2',1)

INSERT INTO NoidungGT VALUES ('GT4','CCTC',N'Ban chủ nhiệm khoa',N'

<table align="center" border="1" cellpadding="0.5" cellspacing="0.5" style="width:630px">
	<thead>
		<tr>
			<th scope="row">L&atilde;nh đạo khoa</th>
			<th scope="col">Phụ tr&aacute;ch c&ocirc;ng t&aacute;c</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th scope="row">
			<p>TS. Phan Tấn Quốc</p>

			<p>Ph&oacute; khoa phụ tr&aacute;ch</p>

			<p><strong>Email:quocpt@sgu.edu.vn</strong></p>
			</th>
			<td>
			<ol>
				<li>Quản l&yacute; nh&acirc;n sự, c&ocirc;ng t&aacute;c thi đua - khen thưởng, c&ocirc;ng t&aacute;c lưu trữ hồ sơ c&ocirc;ng văn, quỹ khoa;</li>
				<li>Quản l&yacute; việc ph&aacute;t triển c&aacute;c chương tr&igrave;nh đ&agrave;o tạo.&nbsp;Triển khai đ&agrave;o tạo chương tr&igrave;nh&nbsp;hệ Chất lượng cao, hệ vừa l&agrave;m vừa học, đ&agrave;o tạo ngắn hạn;</li>
				<li>Quản l&yacute; v&agrave; ph&aacute;t triển c&aacute;c quy tr&igrave;nh l&agrave;m việc của khoa;</li>
				<li>Quản l&yacute; đội tuyển Olympic tin học sinh vi&ecirc;n;</li>
			</ol>
			</td>
		</tr>
		<tr>
			<th scope="row">
			<p><strong>PGS.TS&nbsp;Nguyễn H&ograve;a</strong></p>

			<p><strong>Ph&oacute; trưởng khoa</strong></p>

			<p><strong>Email:nguyenhoa@sgu.edu.vn</strong></p>
			</th>
			<td>
			<ol>
				<li>Quản l&yacute; c&ocirc;ng t&aacute;c nghi&ecirc;n cứu khoa học</li>
				<li>Quản l&yacute; c&ocirc;ng t&aacute;c ph&aacute;t triển gi&aacute;o tr&igrave;nh, s&aacute;ch, t&agrave;i liệu tham khảo;</li>
				<li>Quản l&yacute;, triển khai c&ocirc;ng t&aacute;c đ&agrave;o tạo đại học hệ ch&iacute;nh quy;</li>
				<li>Quản l&yacute; c&ocirc;ng t&aacute;c sự vụ li&ecirc;n quan đến việc học tập của sinh vi&ecirc;n hệ đại học ch&iacute;nh quy.</li>
			</ol>
			</td>
		</tr>
		<tr>
			<th scope="row">
			<p><strong>ThS. Nguyễn Nhựt Đ&ocirc;ng</strong></p>

			<p><strong>Ph&oacute; trưởng khoa</strong></p>

			<p><strong>Email:nndong@sgu.edu.vn</strong></p>
			</th>
			<td>
			<ol>
				<li>Quản l&yacute; t&agrave;i sản, cơ sở vật chất;</li>
				<li>Quản l&yacute; c&ocirc;ng t&aacute;c khảo th&iacute;;</li>
				<li>Quản l&yacute; c&ocirc;ng t&aacute;c đ&aacute;nh gi&aacute; kết quả r&egrave;n luyện của sinh vi&ecirc;n;</li>
				<li>Quản l&yacute; c&ocirc;ng t&aacute;c sinh vi&ecirc;n, Đo&agrave;n thanh ni&ecirc;n, Hội sinh vi&ecirc;n, Hội cựu sinh vi&ecirc;n;</li>
				<li>Quản l&yacute; việc ph&aacute;t triển quan hệ với c&aacute;c doanh nghiệp.</li>
			</ol>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<h1><strong>Danh s&aacute;ch c&aacute;c trợ l&yacute; l&atilde;nh đạo Khoa</strong></h1>

<table align="left" border="1" cellpadding="0.5" cellspacing="0.5" style="width:630px">
	<thead>
	</thead>
	<tbody>
		<tr>
			<th scope="row">Trợ l&yacute; đ&agrave;o tạo</th>
			<td>ThS. Nguyễn Thanh Sang, &nbsp;thanhsang@sgu.edu.vn<br />
			&nbsp;NCS. Nguyễn Thị Uy&ecirc;n Nhi, ntunhi@sgu.edu.vn</td>
		</tr>
		<tr>
			<th scope="row"><strong>Trợ l&yacute; nghi&ecirc;n cứu khoa học</strong></th>
			<td>TS. GVC Đinh Thị Thu Hương,&nbsp;huongdtt@sgu.edu.vn</td>
		</tr>
		<tr>
			<th scope="row"><strong>Trợ l&yacute; văn thể mỹ</strong></th>
			<td>ThS. L&ecirc; Nhị L&atilde;m Th&uacute;y, thuylnl@sgu.edu.vn</td>
		</tr>
		<tr>
			<th scope="row"><strong>Quản l&yacute; sinh vi&ecirc;n v&agrave; văn ph&ograve;ng</strong></th>
			<td>&nbsp;Cử nh&acirc;n T&ocirc; Thị Ngọc Ch&acirc;u,&nbsp;ngocchau@sgu.edu.vn<br />
			&nbsp;Cử nh&acirc;n L&ecirc; Ngọc Kim Ng&acirc;n,&nbsp;nganlnk@sgu.edu.vn</td>
		</tr>
		<tr>
			<th scope="row"><strong>Trợ l&yacute; ph&ograve;ng m&aacute;y</strong></th>
			<td>Cử nh&acirc;n Ng&ocirc; Hữu Thanh, thanhnh@sgu.edu.vn<br />
			ThS. Lương Minh Huấn, lmhuan@sgu.edu.vn</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>'
,'03/08/2017','IT2',1)

INSERT INTO NoidungGT VALUES ('GT5','CCTC',N'Hội đồng khoa học',N'

<p>1. TS Huỳnh Minh Tr&iacute;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; - Chủ tịch</p>

<p>2. TS Nguyễn H&ograve;a&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; - P.CT</p>

<p>3. ThS Nguyễn Nhựt Đ&ocirc;ng&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; - UV</p>

<p>4. TS Cao Th&aacute;i Phương Thanh&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; - UV</p>

<p>5. ThS L&ecirc; Ngọc Kim Kh&aacute;nh&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;- UV</p>

<p>6. TS Phan Tấn Quốc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;- UV</p>

<p>7. ThS Ph&ugrave;ng Th&aacute;i Thi&ecirc;n Trang&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;- Thư k&yacute;</p>
','03/08/2018','IT2',1)

INSERT INTO NoidungGT VALUES ('GT6','CCTC',N'Công đoàn khoa',N'

<p>1. C&ocirc; Ph&ugrave;ng Th&aacute;i Thi&ecirc;n Trang &ndash; Chủ tịch</p>

<p>2. Thầy L&ecirc; Minh Nhựt Triều - Ủy vi&ecirc;n</p>

<p>3. C&ocirc; T&ocirc; Thị Ngọc Ch&acirc;u -Ủy vi&ecirc;n</p>
','03/08/2017','IT2',1)

INSERT INTO NoidungGT VALUES ('GT7','CCTC',N'Văn phòng khoa',N'','03/08/2017','IT2',1)


INSERT INTO NoidungGT VALUES ('GT8','CCTC',N'Cựu viên chức khoa',N'
<p>1. C&ocirc; PhanThị Cảnh</p>

<p>2. Thầy Nguyễn Đăng Quan</p>

<p>3. Thầy Nguyễn Xu&acirc;n Mẫu</p>

<p>4. Thầy T&ocirc; Ho&agrave;i Việt</p>
','03/08/2017','IT2',1)


--go
--CREATE table Files
--(
--	IDfile int IDENTITY(1,1) primary key,
--	Mabaidang varchar(50),
--	MaNDBMTT varchar(50),
--	MaNDDT VARCHAR(50),
--	MaCTNCKH varchar(50),
--	MaNDGT varchar(50),
--	Machuyentiep varchar(50),
--	TenFile nvarchar(max),
--	FilePath nvarchar(max),
--	Flag bit,
--	FOREIGN KEY (Mabaidang) REFERENCES Baidang(Mabaidang),
--	FOREIGN KEY (MaNDBMTT) REFERENCES NoidungBMTT(MaNDBMTT),
--	FOREIGN KEY (MaNDDT) REFERENCES NoidungDT(MaNDDT),
--	FOREIGN KEY (MaCTNCKH) REFERENCES ChitietNCKH(MaCTNCKH),
--	FOREIGN KEY (Machuyentiep) REFERENCES Thongbaochuyentiep(Machuyentiep),
--	FOREIGN KEY (MaNDGT) REFERENCES NoidungGT(MaNDGT)
--)
--go
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD1','ND2','NDDT1',null,null,'CT1','File 1','/Assets/plugins/Uploads/files/01.pdf',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values (null,'ND5','NDDT3','NCKH3','GT1','CT1','File 1','/Assets/plugins/Uploads/files/01.pdf',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values (null,'ND7',null,'NCKH3',null,'CT2','File 1','/Assets/plugins/Uploads/files/01.pdf',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD1','ND2','NDDT1',null,null,'CT3','File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD3','ND3',null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD4','ND4',null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD5',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD6',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD7',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD8',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD9',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD10',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD11',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD11',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD12',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD13',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD14',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD15',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD16',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD17',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD18',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD19',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD20',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD21',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD22',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD23',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD24',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD25',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD26',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD27',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD28',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD29',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD30',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD31',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD35',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD37',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD38',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD39',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD40',null,null,null,null,null,'File 2','/Assets/plugins/Uploads/files/02.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD2','ND5',null,null,null,null,'File 3','/Assets/plugins/Uploads/files/03.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values ('BD2','ND5','NDDT2',null,null,null,'File 3','/Assets/plugins/Uploads/files/03.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values (null,'ND2','NDDT1',null,null,null,'File 4','/Assets/plugins/Uploads/files/04.xlsx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values (null,'ND3','NDDT2',null,null,null,'File 4','/Assets/plugins/Uploads/files/04.xlsx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values (null,'ND6',null,null,null,null,'File 4','/Assets/plugins/Uploads/files/04.xlsx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values (null,'ND1',null,null,null,null,'DonXinHoTroChiPhiHocTap','/Assets/plugins/Uploads/files/DonXinHoTroChiPhiHocTap.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values (null,'ND1',null,null,null,null,'DonXinMienGiamHocPhi','/Assets/plugins/Uploads/files/DonXinMienGiamHocPhi.docx.docx',1)
--insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
--values (null,'ND1',null,null,null,null,'DonXinTroCapDanToc','/Assets/plugins/Uploads/files/DonXinTroCapDanToc.docx',1)

--go
--create table Hinhanh
--(
--	Id int IDENTITY(1,1) PRIMARY KEY,
--	Mabaidang varchar(50),
--	MaNDDT varchar(50),
--	MaCTNCKH VARCHAR(50),
--	Machuyentiep varchar(50),
--	MaNDGT varchar(50),
--	Tenfile nvarchar(max),
--	FilePath varchar(max),
--	Flag bit,
--	FOREIGN KEY (MaNDDT) REFERENCES NoidungDT(MaNDDT),
--	FOREIGN KEY (Mabaidang) REFERENCES Baidang(Mabaidang),
--	FOREIGN KEY (MaCTNCKH) REFERENCES ChitietNCKH(MaCTNCKH),
--	FOREIGN KEY (Machuyentiep) REFERENCES Thongbaochuyentiep(Machuyentiep),
--	FOREIGN KEY (MaNDGT) REFERENCES NoidungGT(MaNDGT)
--)
--insert into Hinhanh(Mabaidang,MaNDDT,MaCTNCKH,Machuyentiep,MaNDGT,TenFile,FilePath,Flag)
--values(null,'NDDT3',null,null,null,'khoa-hoc-may-tinh','~/Image/khoa-hoc-may-tinh.jpg',1)

--SELECT * FROM ThongtinGV 

--select *  from ThongTinGV
--where MaBM='BM2' and Chucvu like 'Tiến sĩ'
--select * from Bomon

--select * from Thongbaochuyentiep WHERE Taikhoangui='IT4'
--select* from Chitietchuyentiep WHERE Taikhoannhan='IT4' and Machuyentiep=1

select * 
from Thongbaochuyentiep a,Chitietchuyentiep b, Thongtinnguoidung c
where a.Machuyentiep=b.Machuyentiep and a.Taikhoangui= c.Tentaikhoan and  b.Taikhoannhan='IT4' and (b.Flag=2 or b.Flag=3)

--select * from Thongtinnguoidung
select * from Baidang where (ĐoituongHT='GV' or ĐoituongHT='ALL') and Maloai='TT'