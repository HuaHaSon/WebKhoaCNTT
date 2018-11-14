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
INSERT INTO Taikhoan VALUES( 'IT1','12345','12-12-2007','Offline',1)
INSERT INTO Taikhoan VALUES( 'IT2','12345','11-2-2012','Offline',1)
INSERT INTO Taikhoan VALUES( 'IT3','12345','3-22-2005','Offline',1)
INSERT INTO Taikhoan VALUES( 'IT4','12345','11-5-2002' ,'Offline',1)
INSERT INTO Taikhoan VALUES( 'IT5','12345','2-1-2007', 'Offline',1)
INSERT INTO Taikhoan VALUES( 'IT6','12345','1-12-2012','Offline',1)
INSERT INTO Taikhoan VALUES( 'IT7','12345','12-2-2015','Offline',1)
INSERT INTO Taikhoan VALUES( 'IT8','12345','11-13-2013','Offline',1)
INSERT INTO Taikhoan VALUES( 'IT9','12345','11-11-2011', 'Offline',1)
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
	VALUES  (N'Trần Bá Xú' ,'2-11-1988' ,'0987657521' ,'tanhtsgu@gmail.com',N'TPHCM', 'IT3' ,'CV5',1)

INSERT INTO Thongtinnguoidung(Hoten, Namsinh, Sodienthoai, Gmail,Quequan, Tentaikhoan, Machucvu,Flag) 
	VALUES  (N'Nguyễn Ngọc Hải' ,'2-11-1986' ,'0982254321','tota251297@gmail.com' ,N'TPHCM', 'IT4' ,'CV6',1)

INSERT INTO Thongtinnguoidung(Hoten, Namsinh, Sodienthoai, Gmail,Quequan, Tentaikhoan, Machucvu,Flag) 
	VALUES (N'Nguyễn Văn Long' ,'12-8-1990' ,'0366789741' ,'nguyennhus293@gmail.com',N'TPHCM', 'IT6' ,'CV7',1)
 
INSERT INTO Thongtinnguoidung(Hoten, Namsinh, Sodienthoai, Gmail,Quequan, Tentaikhoan, Machucvu,Flag) 
	VALUES  (N'Trần Thị Hồng' , '2-5-1979'  ,'0346804211' ,'tanhtsgu@gmail.com',N'TPHCM', 'IT7','CV8' ,1)
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
	Tentaikhoan VARCHAR(100),
	Ngaydang DATETIME,
	flag BIT,
	FOREIGN KEY (MaBMTT) REFERENCES Bieumauthutuc(MaBMTT),
	FOREIGN KEY (Tentaikhoan) REFERENCES Taikhoan(Tentaikhoan)
)
GO
INSERT INTO NoidungBMTT( MaNDBMTT , MaBMTT ,Tieude,NoidungBMTT ,Tentaikhoan,Ngaydang , flag )
VALUES   ( 'ND1' , 'BMTT1' , N'Biểu mẫu Chế độ chính sách',N'<p><a href="~/Files/DonXinHoTroChiPhiHocTap.docx">1. Đơn xin hỗ trợ chi ph&iacute; học tập</a></p>

<p><a href="~/Files/DonXinMienGiamHocPhi.docx">2. DonXinMienGiamHocPhi</a></p>

<p><a href="~/Files/DonXinTroCapDanToc.docx">3. DonXinTroCapDanToc</a></p>
','IT1','08-03-2018' , 1)

INSERT INTO NoidungBMTT( MaNDBMTT , MaBMTT ,Tieude,NoidungBMTT ,Tentaikhoan,Ngaydang , flag )
VALUES ( 'ND2' , 'BMTT1' , N'Biểu mẫu Khóa luận tốt nghiệp' ,N'<p>C&aacute;c biểu mẫu d&agrave;nh cho SV</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; + Phụ lục 1:&nbsp;<a href="~/Files/04.xlsx"> Mẫu đề cương KLTN</a></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; + Mẫu1:&nbsp;<a href="~/Files/01.pdf"> B&igrave;a KLTN</a></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; + Phụ lục 3:&nbsp;<a href="~/Files/02.docx"> Mẫu Đăng k&yacute; KLTN</a></p>
','IT1', '08-03-2018'  , 1)

INSERT INTO NoidungBMTT( MaNDBMTT , MaBMTT ,Tieude,NoidungBMTT ,Tentaikhoan,Ngaydang , flag )
VALUES( 'ND3' , 'BMTT2' ,  N'Quy định về khóa luận Tốt Nghiệp',N'<p>Sinh vi&ecirc;n l&agrave;m kh&oacute;a luận tốt nghiệp&nbsp;tham khảo quy định 1516/QĐ-ĐHSG-ĐT ng&agrave;y 27/09/2011&nbsp;<a href="~/Files/02.docx">tại đ&acirc;y</a>&nbsp;v&agrave; được sửa đổi một số điều theo Quyết định số 2410/QĐ-ĐHSG-ĐT ng&agrave;y 25/11/2015&nbsp;<a href="~/Files/04.xlsx">tại đ&acirc;y.</a></p>
' ,'IT2', '08-03-2018'  , 1 )

INSERT INTO NoidungBMTT( MaNDBMTT , MaBMTT ,Tieude,NoidungBMTT ,Tentaikhoan,Ngaydang , flag )
VALUES ( 'ND4' , 'BMTT2' ,  N'Tài liệu hướng dẫn, quy định và các biểu mẫu thực tập',N'<p>Sinh vi&ecirc;n&nbsp;thực tập&nbsp;tốt nghiệp&nbsp;tham khảo&nbsp;<a href="~/Files/02.docx">tại đ&acirc;y.</a></p>' , 'IT3','08-03-2018'  , 1)

INSERT INTO NoidungBMTT( MaNDBMTT , MaBMTT ,Tieude,NoidungBMTT ,Tentaikhoan,Ngaydang , flag )
VALUES  ( 'ND5' , 'BMTT3' ,  N'Khóa Luận Tốt Nghiệp' , N'<p><strong>B1:</strong>&nbsp;Sinh vi&ecirc;n xem điều kiện, quy định để được l&agrave;m kh&oacute;a luận tốt nghiệp tại&nbsp;<a href="~/Files/03.docx">http:~/Files/03.docx</a>.</p>

<p><strong>&nbsp;B2:</strong>&nbsp;Khoảng 1 th&aacute;ng trước khi bắt đầu đợt đăng k&yacute; m&ocirc;n học của học kỳ cuối. Khoa sẽ c&ocirc;ng bố danh s&aacute;ch đề t&agrave;i v&agrave; giảng vi&ecirc;n hướng dẫn kh&oacute;a luận tốt nghiệp. Sinh vi&ecirc;n chủ động li&ecirc;n hệ với giảng vi&ecirc;n để trao đổi về đề t&agrave;i, ngo&agrave;i ra sinh vi&ecirc;n c&oacute; thể li&ecirc;n hệ với c&aacute;c giảng vi&ecirc;n (kể cả giảng vi&ecirc;n kh&ocirc;ng c&oacute; t&ecirc;n trong&nbsp; danh s&aacute;ch) để nhờ hướng dẫn v&agrave; đề xuất đề t&agrave;i.</p>

<p><strong>B3:</strong>&nbsp;Sinh vi&ecirc;n điền v&agrave;o mẫu đăng k&yacute;&nbsp; online( được đăng tải tr&ecirc;n Website khoa ) để khoa duyệt v&agrave; gửi về ph&ograve;ng đ&agrave;o tạo trước đợt đăng k&yacute; m&ocirc;n học.</p>

<p><strong>B4:</strong>&nbsp;Ph&ograve;ng đ&agrave;o tạo sẽ đăng k&yacute; học phần kh&oacute;a luận tốt nghiệp cho c&aacute;c sinh vi&ecirc;n theo danh s&aacute;ch m&agrave; khoa đ&atilde; gửi. Sinh vi&ecirc;n theo d&otilde;i kiểm tra v&agrave; đ&oacute;ng học ph&iacute; theo th&ocirc;ng b&aacute;o của nh&agrave; trường</p>

<p><strong>B5:</strong>&nbsp;Sinh vi&ecirc;n nộp đơn đăng k&yacute; l&agrave;m kh&oacute;a luận tốt nghiệp về văn ph&ograve;ng khoa. Download mẫu đơn tại link&nbsp;<a href="~/Files/01.pdf">http:~/Files/01.pdf</a>&nbsp; =&gt; phụ lục kh&oacute;a luận (phụ lục 1).</p>
','IT4','08-03-2018'  , 1)

INSERT INTO NoidungBMTT( MaNDBMTT , MaBMTT ,Tieude,NoidungBMTT ,Tentaikhoan,Ngaydang , flag )
VALUES ( 'ND6' , 'BMTT3' ,  N'Thủ tục xin thôi học',N'<ul>
	<li>Bước 1: Sinh vi&ecirc;n điền th&ocirc;ng tin v&agrave;o đơn th&ocirc;i học (tải mẫu đơn <a href="~/Files/04.xlsx">tại đ&acirc;y</a>), đưa cho phụ huynh k&iacute; x&aacute;c nhận sau đ&oacute; nộp về khoa để k&iacute; x&aacute;c nhận.</li>
	<li>Bước 2: Sau khi Khoa x&aacute;c nhận, sinh vi&ecirc;n nộp về Ph&ograve;ng C&ocirc;ng t&aacute;c sinh vi&ecirc;n</li>
	<li>Bước 3: Ph&ograve;ng C&ocirc;ng t&aacute;c sinh vi&ecirc;n l&agrave;m thủ tục ra quyết định th&ocirc;i học cho sinh vi&ecirc;n</li>
</ul>

<p>(Lưu &yacute;: đối với sinh vi&ecirc;n Sư phạm phải l&agrave;m thủ tục bồi ho&agrave;n kinh ph&iacute; đ&agrave;o tạo theo qui định)</p>

<ul>
	<li>Bước 4: Ph&ograve;ng C&ocirc;ng t&aacute;c sinh vi&ecirc;n sẽ th&ocirc;ng b&aacute;o kết quả giải quyết đơn cho Khoa v&agrave; sinh vi&ecirc;n.</li>
</ul>
' ,'IT4', '08-03-2018'  , 1)

INSERT INTO NoidungBMTT( MaNDBMTT , MaBMTT ,Tieude,NoidungBMTT ,Tentaikhoan,Ngaydang , flag )
VALUES ( 'ND7' , 'BMTT4' ,  N'Khóa luận Tốt nghiệp' ,'<p>Sinh vi&ecirc;n xem chi tiết trong&nbsp;<a href="~/Files/01.pdf">file đ&iacute;nh k&egrave;m</a></p>','IT3', '08-03-2018'  , 1)

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

INSERT INTO Baidang  VALUES ('BD1','TS',N'Thông báo về việc xét tuyến sinh viên từ chương trình đào tạo đại trà qua chương trình đào tạo chất lượng cao ngành Công nghệ thông tin',N'<p>SINH VI&Ecirc;N XEM CHI TIẾT TẠI FILE Đ&Iacute;NH K&Egrave;M&nbsp; <a href="~/Files/02.docx">FILE 1</a>V&Agrave;&nbsp;<a href="~/Files/01.pdf">FILE 2</a></p>

<p>C&aacute;c em n&agrave;o c&oacute; nhu cầu chuyển từ lớp đại tr&agrave; sang lớp chất lượng cao vui l&ograve;ng li&ecirc;n hệ văn ph&ograve;ng khoa CNTT. Hạn cuối Thứ hai ng&agrave;y 01/10/2018</p>
','09/28/2018',N'Trần Bá Xú','10/01/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD2','TB',N'Thời khóa biểu lớp kỹ sư CNTT khóa 2018- hệ đào tạo chất lượng cao',N'<p>C&aacute;c bạn sinh vi&ecirc;n xem chi tiết tại&nbsp;<a href="~/Files/03.docx">file đ&iacute;nh k&egrave;m</a></p>
','09/08/2018',N'Trần Bá Xú','12/30/2019','ALL',1)

INSERT INTO Baidang  VALUES ('BD3','TS',N'Giới thiệu CTĐT ngành CNTT hệ đào tạo chất lượng cao',N'<p>C&aacute;c bạn sinh vi&ecirc;n xem chi tiết chương tr&igrave;nh đ&agrave;o tạo Kỹ sư ng&agrave;nh C&ocirc;ng nghệ Th&ocirc;ng tin tại&nbsp;<a href="~/Files/02.docx">file</a></p>
','08/22/2018',N'Trần Bá Xú','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD4','HDSV',N'Khóa luận dành cho K14',N'<p>B1. Sinh vi&ecirc;n kh&oacute;a 14 l&agrave;m kh&oacute;a luận tốt nghiệp tham khảo quy tr&igrave;nh về kh&oacute;a luận&nbsp;<a href="~/Files/02.docx">tại đ&acirc;y</a></p>

<p>B2. Xem điều kiện l&agrave;m kh&oacute;a luận tốt nghiệp&nbsp;<a href="~/Files/02.docx">tại đ&acirc;y</a></p>

<p>B3. Sinh vi&ecirc;n c&oacute; thể chọn giảng vi&ecirc;n hướng dẫn theo<a href="~/Files/02.docx">&nbsp;</a><a href="~/Files/02.docx">danh s&aacute;ch</a>&nbsp;hoặc chủ động t&igrave;m giảng vi&ecirc;n hướng dẫn</p>

<p>B4. Sinh vi&ecirc;n điền th&ocirc;ng tin v&agrave;o&nbsp;<a href="~/Files/02.docx">danh s&aacute;ch</a>&nbsp; để khoa gửi về ph&ograve;ng đ&agrave;o tạo trước khi tiến h&agrave;nh đăng k&yacute; m&ocirc;n học cho học kỳ 1 năm 2018-2019.</p>

<p>(Hạn Ch&oacute;t ng&agrave;y 15/7/2018)</p>
','07/02/2018',N'Trần Bá Xú','07/25/2019','SV',1)
 
INSERT INTO Baidang  VALUES ('BD5','TB',N'Thay thế các học phần đã hủy ở chu kỳ 2016-2020 (Tiếng Anh1, Tiếng Anh 2, ĐT Căn Bản, Nhập môn máy tính, Phân tích thiết kế giải thuật)',N'
<p>Hiện tại khoa đ&atilde; đề nghị thay thế c&aacute;c học phần đ&atilde; hủy bỏ của chương tr&igrave;nh đ&agrave;o tạo chu kỳ 2016-2010. Sinh vi&ecirc;n xem để đăng k&yacute; v&agrave; quy đổi tương đương thay thế cho c&aacute;c học phần đ&atilde; hủy bỏ. Xem chi tiết&nbsp;<a href="~/Files/02.docx">Tại đ&acirc;y</a></p>

<p>Mọi thắc mắc li&ecirc;n hệ Thầy Sang: Email: thanhsang@sgu.edu.vn, Điện thoai: 01666686557 hoặc C&ocirc; Uy&ecirc;n Nhi: Email:ntunhi@sgu.edu.vn, Điện thoại: 01233362003</p>

<p>&nbsp;</p>
','05/02/2018',N'Trần Bá Xú','12/30/2019','ALL',1)

INSERT INTO Baidang  VALUES ('BD6','TS',N'Đăng ký học chương trình đào tạo chất lượng cao Kỹ sư CNTT năm 2017',N'<p>Đăng k&yacute; học&nbsp;chương tr&igrave;nh đ&agrave;o tạo chất lượng cao Kỹ sư CNTT năm 2017</p>

<p><a href="~/Files/02.docx">chi tiết</a></p>

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
<p>C&aacute;c bạn sinh vi&ecirc;n xem chi tiết&nbsp;<a href="~/Files/02.docx">tại&nbsp;đ&acirc;y</a></p>
','03/22/2018',N'Đinh Hoàn','12/30/2019','ALL',1)

INSERT INTO Baidang  VALUES ('BD9','TB',N'Về việc học bổng đồng hương Bạc Liêu - Cà Mau năm học 2017-2018',N'<p>C&aacute;c bạn sinh vi&ecirc;n thường tr&uacute; tại 02 tỉnh Bạc Li&ecirc;u, C&agrave; Mau đang học hệ ch&iacute;nh quy tại trường, c&oacute; ho&agrave;n cảnh đặc biệt kh&oacute; khăn, c&oacute; phẩm chất đạo đức tốt, hộ ngh&egrave;o hoặc c&oacute; th&agrave;nh t&iacute;ch đạt điểm trung b&igrave;nh cao, được khen thưởng th&agrave;nh t&iacute;ch kh&aacute;c,....</p>

<p>Chi tiết tại file&nbsp;<a href="~/Files/02.docx">đ&iacute;nh k&egrave;m</a></p>
','10/05/2017',N'Trần Bá Xú','10/20/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD10','TB',N'Thông báo về việc học bổng Vũ Đình Liệu năm học 2017-2018',N'<p>C&aacute;c bạn sinh vi&ecirc;n l&agrave; :</p>

<p>1. Sinh vi&ecirc;n thường tr&uacute; tại tỉnh Tr&agrave; Vinh đang học hệ ch&iacute;nh quy tại trường</p>

<p>2. Điểm TB năm học 2016-2017 v&agrave; điểm TB chung t&iacute;ch lũy từ 7.5 trở l&ecirc;n</p>

<p>3. Diện ưu ti&ecirc;n: Sinh vi&ecirc;n l&agrave; người d&acirc;n tộc Khmer, hộ ngh&egrave;o/ cận ngh&egrave;o, diện ch&iacute;nh s&aacute;ch ... được x&eacute;t với mức điểm TB từ 6.5 trở l&ecirc;n</p>

<p>- Kh&ocirc;ng x&eacute;t học bổng cho sinh vi&ecirc;n đ&atilde; được đ&agrave;i thọ chi ph&iacute; học tập</p>

<p>Chi tiết c&aacute;c bạn xem th&ocirc;ng b&aacute;o&nbsp;<a href="~/Files/02.docx">đ&iacute;nh k&egrave;m</a></p>

<p>&nbsp;</p>
','09/19/2017',N'Trần Bá Xú','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD11','TT',N'Tuyển sinh viên thực tập',N'
<p>Hiện tại c&ocirc;ng ty&nbsp;KYANON DIGITAL đang c&oacute; nhu cầu tuyển thực tập. C&aacute;c bạn sinh vi&ecirc;n c&oacute; nhu cầu tham khảo&nbsp;<a href="~/Files/02.docx">tại đ&acirc;y</a>.</p>
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

<p><a href="~/Files/02.docx">files/sinh-vien/IVC-FRESHER-2018-_3rd.docx</a></p>

<p>&nbsp;</p>
','09/25/2018',N'Trần Bá Xú','10/15/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD13','TT',N'Công Ty TMA Tuyển dụng nhân sự',N'<p>Hiện tại c&ocirc;ng ty TMA c&oacute; nhu cầu tuyển dụng nh&acirc;n sự. Sinh vi&ecirc;n quan t&acirc;m tham khảo&nbsp;<a href="~/Files/02.docx">tại đ&acirc;y.</a></p>

<p>&nbsp;</p>
','04/06/2018',N'Trần Bá Xú','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD14','TT',N'Thông tin tuyển dụng',N'<p>C&ocirc;ng ty Hunter Macdonald cần tuyển juninor&nbsp;, seninor, fresher .NET v&agrave; QC với số lượng nhiều. Sinh vi&ecirc;n n&agrave;o quan t&acirc;m th&igrave; viết CV n&ecirc;u bật nội dung thế mạnh của m&igrave;nh l&agrave; g&igrave;, mong muốn l&agrave;m việc với c&ocirc;ng nghệ n&agrave;o, ... gởi v&agrave;o email&nbsp;<a href="http://fit.sgu.edu.vn/web2017/nhe.ly@huntermacdonald.com">nhe.ly@huntermacdonald.com.</a></p>

<p>Th&ocirc;ng tin chi tiết xem tại:&nbsp;<a href="~/Files/02.docx">https://itviec.com/nha-tuyen-dung/hunter-macdonald</a></p>

<p>&nbsp;</p>
','09/23/2017',N'Trần Bá Xú','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD15','TB',N'Thông báo về việc nghiệm thu đề tài khoa học 2017-2018 và đăng ký đề tài khoa học 2018-2019',N'
<p>Sinh vi&ecirc;n xem th&ocirc;ng b&aacute;o&nbsp;<a href="~/Files/02.docx">tại đ&acirc;y</a></p>

<p>&nbsp;</p>
','06/18/2018',N'Trần Bá Xú','12/30/2018','SV',1)

INSERT INTO Baidang  VALUES ('BD16','HDSV',N'Danh sách các đội tuyển Olympic 2018',N'<p>C&Aacute;C BẠN SINH VI&Ecirc;N XEM CHI TIẾT TẠI&nbsp;<a href="~/Files/02.docx">FILE Đ&Iacute;NH K&Egrave;M</a>.</p>

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

INSERT INTO Baidang  VALUES ('BD18','HDSV',N'Danh sách sinh viên tham gia lớp bồi dưỡng Olympic Tin học 2018',N'<p>C&Aacute;C BẠN SV XEM DANH S&Aacute;CH TẠI&nbsp;<a href="~/Files/02.docx">FILE Đ&Iacute;NH K&Egrave;M</a>.</p>

<p>&nbsp;</p>
','07/16/2018',N'Nguyễn Văn Long','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD19','TB',N'THÔNG BÁO Về việc huấn luyện sinh viên tham dự Olympic Tin học sinh viên Việt Nam và Kỳ thi lập trình sinh viên Quốc tế ACM năm 2018',N'<p>Sinh vi&ecirc;n xem&nbsp;<a href="~/Files/02.docx">chi tiết</a></p>

<p>Lưu &yacute;:</p>

<p>Ng&agrave;y bắt đầu học: Thứ Bảy ng&agrave;y 14/04/2018</p>

<p>Thời gian: Từ 12 giờ 00 đến 16 giờ 30 ph&uacute;t</p>

<p>Ph&ograve;ng học: C.A106&nbsp;</p>

<p>&nbsp;</p>
','04/02/2018',N'Nguyễn Văn Long','12/30/2019','ALL',1)

INSERT INTO Baidang  VALUES ('BD20','TB',N'Thông báo về cuộc thi lập trình Makerthon lần 2 - năm 2018',N'<p>Th&agrave;nh đo&agrave;n Th&agrave;nh phố Hồ Ch&iacute; Minh, Trung t&acirc;m ph&aacute;t triển Khoa học v&agrave; C&ocirc;ng nghệ trẻ th&ocirc;ng b&aacute;o về cuộc thi lập tr&igrave;nh Makerthon lần 2 - 2018.</p>

<p>Sinh vi&ecirc;n vui l&ograve;ng xem file đ&iacute;nh k&egrave;m</p>

<p>C&aacute;c bạn lưu &yacute; thời gian hết hạn đăng k&yacute;</p>

<p><a href="~/Files/02.docx">files/sinh-vien/63khtv.-tc-cuoc-thi-lap-trinh-makerthon-lan-2_2.pdf</a></p>

<p><a href="~/Files/02.docx">files/sinh-vien/Makerthon-2018---The-le.pdf</a></p>

<p>&nbsp;</p>

<p>&nbsp;</p>
','10/30/2018',N'Đinh Hoàn','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD21','TB',N'Thông báo về việc tập đăng ký môn học cho sinh viên khóa 18',N'<p>C&aacute;c bạn sinh vi&ecirc;n kh&oacute;a 18 xem tại<a href="~/Files/02.docx">đ&acirc;y:</a></p>

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

<p>Sinh vi&ecirc;n tham dự chương tr&igrave;nh đăng k&yacute; tại&nbsp;<a href="~/Files/02.docx">link</a>&nbsp;đ&iacute;nh k&egrave;m</p>

<p>Sinh vi&ecirc;n tham gia được cộng điểm r&egrave;n luyện theo quy định</p>

<p>&nbsp;</p>
','10/25/2018',N'Trần Bá Xú','12/30/2019','ALL',1)

INSERT INTO Baidang  VALUES ('BD24','TT',N'Thông tin cuộc thi "HS,SV với ý tưởng khởi nghiệp"',N'<p>Gửi c&aacute;c em th&ocirc;ng tin về&nbsp;Cuộc thi<strong>&nbsp;&ldquo;Học sinh, sinh vi&ecirc;n với &yacute; tưởng khởi nghiệp&rdquo; - SWIS&nbsp;2018</strong>, bao gồm c&aacute;c file (đ&iacute;nh k&egrave;m):</p>

<p>1. Quyết định 3950/QĐ-BGDDT ng&agrave;y 28/09/2018 ban h&agrave;nh thể lệ cuộc thi.&nbsp;&nbsp;<a href="~/Files/02.docx">TẠI Đ&Acirc;Y</a></p>

<p>2. Thể lệ cuộc thi.&nbsp;<a href="https://drive.google.com/open?id=1BrVQT5LBYL4IbSZBpBe0TskyC50NT4W3">TẠI Đ&Acirc;Y</a></p>

<p>3. Th&ocirc;ng b&aacute;o số 2444/TB-ĐHSG ng&agrave;y 15/10/2018 về việc đăng k&iacute; cuộc thi.&nbsp;<a href="~/Files/02.docx">TẠI Đ&Acirc;Y</a></p>

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

<p><a href="~/Files/02.docx">files/ThongBaomocuaphongmay.pdf</a></p>

<p>&nbsp;</p>
','10/24/2018',N'Nguyễn Ngọc Hải','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD26','TB',N'Thông báo về việc tham gia Chương trình "HCMC Student Forum" năm 2018',N'<p>C&aacute;c bạn sinh vi&ecirc;n năm 3 v&agrave; 4 xem&nbsp;<a href="~/Files/02.docx">chi tiết tại</a></p>

<p>Bạn n&agrave;o đăng k&yacute; vui l&ograve;ng gửi th&ocirc;ng tin (họ t&ecirc;n, MSSV, số điện thoại, email ) về địa chỉ: vpkcntt@sgu.edu.vn trước ng&agrave;y 11 giờ 30 ng&agrave;y 26/10/2018. Cảm ơn c&aacute;c bạn./.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
','10/25/2018',N'Tràn Bá Xú','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD27','HDSV',N'Khóa 15_ Kế hoạch tổ chức Cuộc thi tìm hiểu về Biên giới và Bộ đội Biên phòng',N'<p>&nbsp;Chi tiết kế hoạch c&aacute;c bạn xem&nbsp;<a href="~/Files/02.docx">tại:</a></p>

<p>Ghi ch&uacute;: -C&aacute;c bạn sinh vi&ecirc;n nộp b&agrave;i cho lớp trưởng. Lớp trưởng c&aacute;c lớp thu v&agrave; lập danh s&aacute;ch nộp về văn phong khoa trước ng&agrave;y 09/11/2018</p>

<p>- Đ&acirc;y l&agrave;&nbsp; cơ sở để&nbsp; chứng nhận ho&agrave;n tất tuần sinh hoạt C&ocirc;ng d&acirc;n - Sinh vi&ecirc;n v&agrave; đ&aacute;nh gi&aacute; điểm r&egrave;n luyện đề nghị to&agrave;n thể sinh vi&ecirc;n ch&iacute;nh quy kh&oacute;a 15 (bắt buộc) tham gia</p>

<p>Đề nghị c&aacute;c bạn thực hiện nghi&ecirc;m t&uacute;c nội dung th&ocirc;ng b&aacute;o tr&ecirc;n.</p>

<p>&nbsp;</p>
','10/07/2018',N'Trần Bá Xú','12/30/2019','SV',1)

INSERT INTO Baidang  VALUES ('BD28','TB',N'Về việc bổ sung hồ sơ nhập học của sinh viên Khóa 18',N'<p>C&aacute;c bạn c&oacute; t&ecirc;n trong danh s&aacute;ch đ&iacute;nh k&egrave;m nộp bổ sung c&aacute;c loại giấy tờ c&ograve;n thiếu tại Ph&ograve;ng C&ocirc;ng t&aacute;c Sinh vi&ecirc;n (HB206) trước ng&agrave;y 15/10/2018. Mọi thắc mắc li&ecirc;n hệ c&ocirc; Nguyễn Ngọc Uyển, số điện thoại :0975.887.964. Qu&aacute; thời hạn tr&ecirc;n nếu sinh vi&ecirc;n kh&ocirc;ng bổ sung được hồ sơ. Nh&agrave; trường sẽ xử l&yacute; theo quy định hiện h&agrave;nh./.</p>

<p>Rất mong c&aacute;c bạn sinh vi&ecirc;n thực hiện tốt nội dung của&nbsp;<a href="~/Files/02.docx">th&ocirc;ng b&aacute;o</a></p>

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

INSERT INTO Baidang  VALUES ('BD35','HDSV',N'Thử nghiệm sử dụng mẫu thẻ Hội viên loại mới',N'<h1>TH&Ocirc;NG B&Aacute;O QUAN TRỌNG V&Agrave; BẮT BUỘC</h1>

<p>Thực hiện chủ trương của Trung ương Hội Sinh vi&ecirc;n Việt Nam về việc&nbsp;<strong>thử nghiệm sử dụng mẫu thẻ Hội vi&ecirc;n loại mới</strong>&nbsp;tại trường Đại học S&agrave;i G&ograve;n, tr&acirc;n trọng đề nghị c&aacute;c đồng ch&iacute; phối hợp, thực hiện triển khai c&ocirc;ng t&aacute;c đổi thẻ Hội vi&ecirc;n Hội Sinh vi&ecirc;n Việt Nam tại khoa. Qu&aacute; tr&igrave;nh triển khai thử nghiệm đổi thẻ ho&agrave;n to&agrave;n kh&ocirc;ng ph&aacute;t sinh chi ph&iacute; của sinh vi&ecirc;n.</p>

<p><strong>&nbsp;1. Li&ecirc;n Chi Hội Sinh vi&ecirc;n khoa&nbsp;C&ocirc;ng nghệ Th&ocirc;ng tin&nbsp;được lựa chọn th&iacute; điểm&nbsp;</strong></p>

<p><strong>2. Phạm vị thực hiện:&nbsp;</strong>To&agrave;n bộ c&aacute;c lớp Kh&oacute;a 15, 16, 17 (cả hệ Đại học v&agrave; Cao đẳng)</p>

<p><strong>3. C&aacute;ch thức triển khai như sau:</strong></p>

<p>B1: Chọn mỗi lớp tại đơn vị khoa một đại diện (B&iacute; thư/Chi hội trưởng/Lớp trưởng) c&oacute; năng lực để tổng hợp th&ocirc;ng tin to&agrave;n bộ SV tại lớp. Ai phụ tr&aacute;ch th&igrave; để t&ecirc;n đầu, b&ocirc;i mực đỏ để hệ thống tạo t&agrave;i khoản quản l&yacute; cho bạn đ&oacute;.</p>

<p>B2: Gửi lại danh s&aacute;ch to&agrave;n bộ c&aacute;c lớp, sinh vi&ecirc;n của khoa theo y&ecirc;u cầu mẫu b&ecirc;n dưới về email&nbsp;h<a href="mailto:sv.cntt@sgu.edu.vn">sv.cntt@sgu.edu.vn</a>&nbsp;<strong>trước ng&agrave;y 11/4/2018</strong>.</p>

<p>Ban Chấp h&agrave;nh Li&ecirc;n Chi Hội Sinh vi&ecirc;n khoa ph&acirc;n c&ocirc;ng đồng ch&iacute;&nbsp;<em>Trần Thị Tr&uacute;c Chi</em>&nbsp;(01655080910)&nbsp;phụ tr&aacute;ch nội dung n&agrave;y. Đề nghị c&aacute;c Chi Hội ở c&aacute;c kh&oacute;a&nbsp;15, 16, 17 (cả hệ Đại học v&agrave; Cao đẳng)&nbsp;nghi&ecirc;m t&uacute;c thực hiện v&agrave; triển khai hiệu quả.</p>

<p><a href="~/Files/02.docx">files/TheHV-DSSV-ChiHoi.xlsx</a></p>

<p>&nbsp;</p>
','04/09/2018',N'Trần Bá Xú','04/11/2018','SV',1)



INSERT INTO Baidang  VALUES ('BD36','HDSV',N'Thông báo về cuộc thi tuổi trẻ học tập và làm theo tư tưởng đạo đức phong cách Hồ Chí Minh 2018',N'<p>Triển khai cuộc thi tuổi trẻ học tập v&agrave; theo theo tư tưởng , đạo đức, phong c&aacute;ch theo c&ocirc;ng văn số 469/TB-ĐHSG Hiệu trưởng đ&atilde; k&yacute; v&agrave;o ng&agrave;y 28/3/2018. Sinh vi&ecirc;n tham gia cuộc thi bằng 2 c&aacute;ch:</p>

<p>- V&agrave;o trang web ctsc.sgu.edu.vn</p>

<p>- Hoặc trang web hocvalamtheobac.vn</p>

<p>&nbsp;</p>
','04/02/2018',N'Trần Bá Xú','06/30/2019','SV',1)

---clbsv


INSERT INTO Baidang  VALUES ('BD37','HDSV',N'Thông báo về việc đăng ký tham dự cuộc thi Vô địch Tin học văn phòng Thế giới năm 2018',N'<p>Đăng k&yacute; tham dự cuộc thi V&ocirc; địch Tin học văn ph&ograve;ng Thế giới năm 2018.&nbsp;<a href="~/Files/02.docx">Chi tiết tại đ&acirc;y.</a></p>

<p><a href="http://fit.sgu.edu.vn/web2017/detail/146/thong-bao-v-cu-c-thi-vo-d-ch-tin-h-c-th-gi-i-nam-2019/1">http://fit.sgu.edu.vn/web2017/detail/146/thong-bao-v-cu-c-thi-vo-d-ch-tin-h-c-th-gi-i-nam-2</a></p>

<p>&nbsp;</p>
','02/07/2018',N'Trần Bá Xú','12/30/2019','SV',1)




INSERT INTO Baidang  VALUES ('BD38','HDSV',N'Thông báo về việc triển khai chương trình tìm kiếm Đại sứ Adelaide',N'<p>Mọi chi tiết của th&ocirc;ng b&aacute;o c&aacute;c bạn sinh vi&ecirc;n&nbsp;<a href="~/Files/02.docx">xem tại:</a></p>

<p>&nbsp;</p>
','09/19/2017',N'Trần Bá Xú','12/30/2019','SV',1)



INSERT INTO Baidang  VALUES ('BD39','HDSV',N'Lớp phổ cập kiến thức chứng khoáng dành cho sinh viên',N'<p>Căn cứ v&agrave;o c&ocirc;ng văn số 107/UBCK ng&agrave;y 15/10/2017 của Uỷ Ban Chứng Kho&aacute;n nh&agrave; nước. Nh&agrave; trường tạo điều kiện để sinh vi&ecirc;n tham gia lớp phổ cập kiến thức về chứng kho&aacute;n. Xem chi tiết&nbsp;<a href="~/Files/02.docx">tại đ&acirc;y</a>.</p>

<p>&nbsp;</p>
','11/04/2018',N'Trần Bá Xú','12/30/2019','SV',1)


INSERT INTO Baidang  VALUES ('BD40','HDSV',N'Thông tin đăng kí nhận vé tham gia Halloween',N'<p>Hiện tại HSV trường đang giữ trong tay hơn 300 v&eacute; tham quan C&ocirc;ng vi&ecirc;n văn h&oacute;a Đầm Sen HALLOWEEN KỲ B&Iacute; hết sức hấp dẫn.Với nhiều s&acirc;n chơi giao lưu như:&nbsp;<br />
&nbsp;Kh&ocirc;ng gian ma qu&aacute;i.Hoạt động đường phố.&nbsp;H&oacute;a trang best costume.&nbsp;Đ&ecirc;m hội kỳ b&iacute;&nbsp;<br />
- V&eacute; c&oacute; gi&aacute; trị v&agrave;o cổng hoặc giảm 50% gi&aacute; c&aacute;c loại v&eacute; trọn g&oacute;i&nbsp;<br />
- V&eacute; được sử dụng trong ng&agrave;y 31/10/2018&nbsp;<br />
C&ograve;n chần chờ g&igrave; nữa m&agrave; kh&ocirc;ng đăng k&yacute; ngay để nhận v&eacute; ho&agrave;n to&agrave;n miễn ph&iacute;<br />
Thời hạn đăng k&yacute; t&iacute;nh từ b&acirc;y giờ cho đến 12h00 ng&agrave;y 31/10/2018 nha c&aacute;c bạn. Nhanh tay l&ecirc;n v&igrave; số lượng c&oacute; hạn n&egrave;.&nbsp;<br />
Link đăng k&yacute;:&nbsp;<a href="~/Files/02.docx">~/Files/02.docx</a></p>

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



INSERT INTO Baidang  VALUES ('BD42','HDSV',N'THE WINNER - Trận đấu đầy gay cấn và hồi hộp dành cho những chiến binh đã trở lại',N'<h1>THE WINNER - Trận đấu đầy gay cấn v&agrave; hồi hộp d&agrave;nh cho những chiến binh đ&atilde; trở lại</h1>

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


go
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
INSERT INTO Chitietbaidang VALUES ('BD9','2',1)
INSERT INTO Chitietbaidang VALUES ('BD10','2',1)
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

<p>- Chương tr&igrave;nh đ&agrave;o tạo chu kỳ 2012-2016.&nbsp;<a href="~/Files/02.docx">Xem tại đ&acirc;y</a></p>

<p>- Chương tr&igrave;nh đ&agrave;o tạo chu kỳ 2016 - 2020.&nbsp;<a href="~/Files/04.xlsx">Xem tai đ&acirc;y</a></p>

<p>- Chương tr&igrave;nh đ&agrave;o tạo theo cơ chế đặc th&ugrave;.&nbsp;<a href="~/Files/01.pdf">Xem tại đ&acirc;y</a></p>
' ,'07-19-2018','IT2' ,1 )
INSERT INTO NoidungDT	VALUES  ( 'NDDT2' ,'DH' ,N'Ngành Công nghệ thông tin - Hệ liên thông',N'<p><strong>Hệ li&ecirc;n th&ocirc;ng tr&igrave;nh độ đại&nbsp;học</strong></p>

<ul>
	<li>Li&ecirc;n th&ocirc;ng từ Trung cấp l&ecirc;n Đại học.&nbsp;<a href="~/Files/03.docx">Xem tại đ&acirc;y.</a></li>
	<li>Li&ecirc;n th&ocirc;ng từ Cao đẳng l&ecirc;n Đại học.&nbsp;<a href="~/Files/04.xlsx">Xem tại đ&acirc;y</a></li>
</ul>

<p>&nbsp;(Th&ocirc;ng tin tuyển sinh chi tiết xem tại website của Ph&ograve;ng đ&agrave;o tạo v&agrave; ph&ograve;ng Gi&aacute;o dục thường xuy&ecirc;n)</p>
' ,'07-19-2018','IT2' ,1 )
INSERT INTO NoidungDT	VALUES  ( 'NDDT3' ,'TS' ,N'[Thạc sỹ] Ngành Khoa học máy tính',N'<p>+Th&ocirc;ng tin chi tiết chương tr&igrave;nh đ&agrave;o tạo thạc sĩ KHMT&nbsp;<a href="~/Files/01.pdf">Xem tại đ&acirc;y</a></p>

<p>(Th&ocirc;ng tin tuyển sinh chi tiết xem tại website của Ph&ograve;ng đ&agrave;o tạo Sau đại học)</p>

<p><img alt="" src="~/Files/khoa-hoc-may-tinh.png" style="height:300px; width:592px" /></p>
' ,'07-19-2018','IT2' ,1 )

GO
CREATE TABLE Thongbaochuyentiep
(
	Machuyentiep VARCHAR(50) PRIMARY KEY,
	Taikhoangui VARCHAR(100),
	Tieude NVARCHAR(100),
	Noidung NVARCHAR(MAX),
	Ngaychuyen DATETIME,
	Flag BIT,
	FOREIGN KEY (Taikhoangui) REFERENCES Taikhoan(Tentaikhoan)
)
go
INSERT INTO Thongbaochuyentiep VALUES  ( 'CT1','IT3'  ,N'Đăng bài', N'<p>Tuyển dụng ở IVC Freshser 2018</p>'  , '09-20-2018' , 1 )
INSERT INTO Thongbaochuyentiep VALUES  ( 'CT2'  ,'IT9',N'Xóa bài' , N'<p>Xóa bài đăng Nghiên cứu BD3</p>' , '12-25-2018', 1 )
INSERT INTO Thongbaochuyentiep VALUES  ( 'CT3' ,'IT3',N'Sửa bài' , N'<p>Sửa bài đăng Bộ môn Hệ thống thông tin BD4</p>'  ,  '8-5-2018' , 1 )
INSERT INTO Thongbaochuyentiep VALUES  ( 'CT4' ,'IT10'  ,N'Xóa bài' , N'<p>Xóa bài đăng Bộ môn Kỹ thuật phần mềm BD5</p>' , '12-5-2018' , 1 )
INSERT INTO Thongbaochuyentiep VALUES  ( 'CT5' ,'IT4',N'Đăng bài' , N'<p>Quy định về khóa luận Tốt Nghiệp</p>'  , '11-20-2018'  , 1 )
go
CREATE TABLE Chitietchuyentiep
(
	Machuyentiep VARCHAR(50),
	Taikhoannhan VARCHAR(100),
	Ngaynhan datetime,
	Trangthaixem NVARCHAR(20),
	Trangthaichuyen NVARCHAR(20),
	Flag BIT,
	PRIMARY KEY (Machuyentiep,Taikhoannhan),
	FOREIGN KEY (Machuyentiep) REFERENCES Thongbaochuyentiep(Machuyentiep),
	FOREIGN KEY (Taikhoannhan) REFERENCES Taikhoan(Tentaikhoan)
)
go
INSERT INTO Chitietchuyentiep  VALUES  ( 'CT1' ,'IT4','09-22-2018', N'Đã xem', N'Đã chuyển',1 )
INSERT INTO Chitietchuyentiep  VALUES  ( 'CT2' ,'IT10' ,'12-27-2018', N'Đã xem', N'Đã chuyển',1  )
INSERT INTO Chitietchuyentiep  VALUES  ( 'CT3' ,'IT4' ,'8-8-2018', N'Đã xem', N'Đã chuyển',1  )
INSERT INTO Chitietchuyentiep  VALUES  ( 'CT4' ,'IT5','12-8-2018', N'Đã xem', N'Đã chuyển',1  )
INSERT INTO Chitietchuyentiep  VALUES  ( 'CT5' ,'IT3','11-22-2018' , N'Đã xem', N'Đã chuyển',1  )
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
VALUES ( 'GV1' , 'BM1',N'Nguyễn Quốc Huy','Tiến sĩ','Trưởng bộ môn','','nqhuy@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES  ( 'GV2' , 'BM1',N'Đinh Thị Ngọc Loan' ,'Thạc sĩ','Giảng viên','','', 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES ( 'GV3' , 'BM1'  ,N'Nguyễn Thị Uyên Nhi','Thạc sĩ','Giảng viên','','ntunhi@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES ( 'GV4' , 'BM1' ,N'Lê Nhị Lãm Thúy ','Thạc sĩ','Giảng viên','','thuylnl@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES ( 'GV5' , 'BM1' ,N'Phan Thị Kim Loan','Thạc sĩ','Giảnng viên','',' ptkloan@sgu.edu.vn' , 1 )

INSERT INTO ThongtinGV ( MaGV ,MaBM ,TenGV, Chucvu,Chucdanh ,ThongtinGV, Diachimail ,Flag )
VALUES ( 'GV6' , 'BM2' ,N'Phùng Thái Thiên Trang','Thạc sĩ','Giảng viên',N'<table border="1" cellpadding="0" cellspacing="0" style="width:100%">
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

INSERT INTO NoidungGT VALUES ('GT3','CCTC',N'Chi bộ khoa',N'<h1>Chi bộ khoa</h1>

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

INSERT INTO NoidungGT VALUES ('GT4','CCTC',N'Ban chủ nhiệm khoa',N'<p>&nbsp;</p>

<h1><strong>Ban chủ nhiệm khoa</strong></h1>

<table align="center" border="1" cellpadding="0.5" cellspacing="0.5" style="width:800px">
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

<table align="left" border="1" cellpadding="0.5" cellspacing="0.5" style="width:800px">
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

INSERT INTO NoidungGT VALUES ('GT5','CCTC',N'Hội đồng khoa học',N'<h2>Hội đồng khoa học&nbsp;</h2>

<p>1. TS Huỳnh Minh Tr&iacute;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; - Chủ tịch</p>

<p>2. TS Nguyễn H&ograve;a&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; - P.CT</p>

<p>3. ThS Nguyễn Nhựt Đ&ocirc;ng&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; - UV</p>

<p>4. TS Cao Th&aacute;i Phương Thanh&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; - UV</p>

<p>5. ThS L&ecirc; Ngọc Kim Kh&aacute;nh&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;- UV</p>

<p>6. TS Phan Tấn Quốc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;- UV</p>

<p>7. ThS Ph&ugrave;ng Th&aacute;i Thi&ecirc;n Trang&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;- Thư k&yacute;</p>
','03/08/2018','IT2',1)

INSERT INTO NoidungGT VALUES ('GT6','CCTC',N'Công đoàn khoa',N'<h1>C&ocirc;ng đo&agrave;n khoa</h1>

<p>1. C&ocirc; Ph&ugrave;ng Th&aacute;i Thi&ecirc;n Trang &ndash; Chủ tịch</p>

<p>2. Thầy L&ecirc; Minh Nhựt Triều - Ủy vi&ecirc;n</p>

<p>3. C&ocirc; T&ocirc; Thị Ngọc Ch&acirc;u -Ủy vi&ecirc;n</p>
','03/08/2017','IT2',1)

INSERT INTO NoidungGT VALUES ('GT7','CCTC',N'Văn phòng khoa',N'','03/08/2017','IT2',1)


INSERT INTO NoidungGT VALUES ('GT8','CCTC',N'Cựu viên chức khoa',N'<h1>Cựu vi&ecirc;n chức khoa</h1>

<p>1. C&ocirc; PhanThị Cảnh</p>

<p>2. Thầy Nguyễn Đăng Quan</p>

<p>3. Thầy Nguyễn Xu&acirc;n Mẫu</p>

<p>4. Thầy T&ocirc; Ho&agrave;i Việt</p>
','03/08/2017','IT2',1)


go
CREATE table Files
(
	IDfile int IDENTITY(1,1) primary key,
	Mabaidang varchar(50),
	MaNDBMTT varchar(50),
	MaNDDT VARCHAR(50),
	MaCTNCKH varchar(50),
	MaNDGT varchar(50),
	Machuyentiep varchar(50),
	TenFile nvarchar(max),
	FilePath nvarchar(max),
	Flag bit,
	FOREIGN KEY (Mabaidang) REFERENCES Baidang(Mabaidang),
	FOREIGN KEY (MaNDBMTT) REFERENCES NoidungBMTT(MaNDBMTT),
	FOREIGN KEY (MaNDDT) REFERENCES NoidungDT(MaNDDT),
	FOREIGN KEY (MaCTNCKH) REFERENCES ChitietNCKH(MaCTNCKH),
	FOREIGN KEY (Machuyentiep) REFERENCES Thongbaochuyentiep(Machuyentiep),
	FOREIGN KEY (MaNDGT) REFERENCES NoidungGT(MaNDGT)
)
go
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD1','ND2','NDDT1',null,null,'CT1','File 1','~/Files/01.pdf',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values (null,'ND5','NDDT3','NCKH3','GT1','CT1','File 1','~/Files/01.pdf',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values (null,'ND7',null,'NCKH3',null,'CT2','File 1','~/Files/01.pdf',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD1','ND2','NDDT1',null,null,'CT3','File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD3','ND3',null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD4','ND4',null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD5',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD6',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD7',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD8',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD9',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD10',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD11',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD11',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD12',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD13',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD14',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD15',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD16',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD17',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD18',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD19',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD20',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD21',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD22',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD23',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD24',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD25',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD26',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD27',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD28',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD29',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD30',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD31',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD35',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD37',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD38',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD39',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD40',null,null,null,null,null,'File 2','~/Files/02.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD2','ND5',null,null,null,null,'File 3','~/Files/03.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values ('BD2','ND5','NDDT2',null,null,null,'File 3','~/Files/03.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values (null,'ND2','NDDT1',null,null,null,'File 4','~/Files/04.xlsx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values (null,'ND3','NDDT2',null,null,null,'File 4','~/Files/04.xlsx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values (null,'ND6',null,null,null,null,'File 4','~/Files/04.xlsx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values (null,'ND1',null,null,null,null,'DonXinHoTroChiPhiHocTap','~/Files/DonXinHoTroChiPhiHocTap.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values (null,'ND1',null,null,null,null,'DonXinMienGiamHocPhi','~/Files/DonXinMienGiamHocPhi.docx',1)
insert into Files(Mabaidang,MaNDBMTT,MaNDDT,MaCTNCKH,MaNDGT,Machuyentiep,TenFile,FilePath,Flag)
values (null,'ND1',null,null,null,null,'DonXinTroCapDanToc','~/Files/DonXinTroCapDanToc.docx',1)

go
create table Hinhanh
(
	Id int IDENTITY(1,1) PRIMARY KEY,
	Mabaidang varchar(50),
	MaNDDT varchar(50),
	MaCTNCKH VARCHAR(50),
	Machuyentiep varchar(50),
	MaNDGT varchar(50),
	Tenfile nvarchar(max),
	FilePath varchar(max),
	Flag bit,
	FOREIGN KEY (MaNDDT) REFERENCES NoidungDT(MaNDDT),
	FOREIGN KEY (Mabaidang) REFERENCES Baidang(Mabaidang),
	FOREIGN KEY (MaCTNCKH) REFERENCES ChitietNCKH(MaCTNCKH),
	FOREIGN KEY (Machuyentiep) REFERENCES Thongbaochuyentiep(Machuyentiep),
	FOREIGN KEY (MaNDGT) REFERENCES NoidungGT(MaNDGT)
)
insert into Hinhanh(Mabaidang,MaNDDT,MaCTNCKH,Machuyentiep,MaNDGT,TenFile,FilePath,Flag)
values(null,'NDDT3',null,null,null,'khoa-hoc-may-tinh','~/Image/khoa-hoc-may-tinh.jpg',1)
