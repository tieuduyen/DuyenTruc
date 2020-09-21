-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 17, 2020 lúc 11:40 AM
-- Phiên bản máy phục vụ: 10.4.13-MariaDB
-- Phiên bản PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bookinghotel`
--
CREATE DATABASE IF NOT EXISTS `bookinghotel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bookinghotel`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `booking`
--

CREATE TABLE `booking` (
  `BookingID` int(11) NOT NULL,
  `BookingDate` date DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `booking`
--

INSERT INTO `booking` (`BookingID`, `BookingDate`, `CustomerID`) VALUES
(1, '2020-08-15'),
(2, '2019-05-05'),
(3, '2020-06-10'),
(4, '2018-06-30'),
(5, '2020-08-20'),
(6, '2020-09-01'),
(7, '2020-09-10'),
(8, '2020-10-01'),
(9, '2020-11-10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bookingdetails`
--

CREATE TABLE `bookingdetails` (
  `BookingDetailsID` int(11) NOT NULL,
  `NumberOfPeople` int(11) DEFAULT NULL,
  `NumberOfRooms` int(11) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `CheckInDate` date DEFAULT NULL,
  `CheckOutDate` date DEFAULT NULL,
  `BookingID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bookingdetails`
--

INSERT INTO `bookingdetails` (`BookingDetailsID`, `NumberOfPeople`, `NumberOfRooms`, `Price`, `CheckInDate`, `CheckOutDate`, `BookingID`) VALUES
(1, 2, 1, 2000000, '2020-09-07', '2020-09-09',1),
(2,4,2,5500000,'2019-05-19','2019-05-22',2),
(3,2,1,250000,'2020-06-15','2020-06-16',3),
(4,8,3,5000000,'2018-07-18','2018-07-20',4),
(5,2,1,400000,'2020-08-20','2020-08-21',5),
(6,5,2,2000000,'2020-09-07','2020-09-10',6),
(7,6,2,2000000,'2020-09-20','2020-09-25',7),
(8,2,1,200000,'2020-10-11','2020-10-12',8),
(9,2,1,280000,'2020-11-21','2020-11-22',9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `city`
--

CREATE TABLE `city` (
  `CityID` int(11) NOT NULL,
  `CityName` varchar(50) DEFAULT NULL,
  `CityImages` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `city`
--

INSERT INTO `city` (`CityID`, `CityName`, `CityImages`) VALUES
(1, 'Hà Nội', 'ha_noi.jpg'),
(2, 'Hải Phòng', 'hai_phong.jpg'),
(3, 'Quảng Ninh', 'quang_ninh.jpg'),
(4, 'Huế', 'hue.jpg'),
(5, 'Đà Nẵng', 'da_nang.jpg'),
(6, 'Nha Trang', 'nha_trang.jpg'),
(7, 'Vũng Tàu', 'vung_tau.jpg'),
(8, 'Hồ Chí Minh', 'ho_chi_minh.jpg'),
(9, 'Cà Mau', 'ca_mau.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `CommentID` int(11) NOT NULL,
  `CommentDate` date DEFAULT NULL,
  `Rate` double DEFAULT NULL,
  `Content` varchar(255) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `HotelID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`CommentID`, `CommentDate`, `Rate`, `Content`, `CustomerID`, `HotelID`) VALUES
(1, '2020-09-10', 5, 'Good', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `creditcard`
--

CREATE TABLE `creditcard` (
  `CreditCardID` int(11) NOT NULL,
  `CreditCardType` varchar(50) DEFAULT NULL,
  `CreditCardNumber` varchar(19) DEFAULT NULL,
  `CardholdersName` varchar(30) DEFAULT NULL,
  `ExpirationDate` date DEFAULT NULL,
  `Surplus` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `creditcard`
--

INSERT INTO `creditcard` (`CreditCardID`, `CreditCardType`, `CreditCardNumber`, `CardholdersName`, `ExpirationDate`, `Surplus`) VALUES
(1, 'Visa', '1111-2222-3333-4444', 'Phạm Văn Trực', '2020-12-30', 40000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `CustomerName` varchar(50) DEFAULT NULL,
  `Phone` varchar(13) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Password` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`CustomerID`, `Email`, `CustomerName`, `Phone`, `Sex`, `BirthDate`, `Password`) VALUES
(1, 'truckt12a3@gmail.com', 'Phạm Văn Trực', '0123456789', 'Nam', '2000-08-19', 'truc123456');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hotel`
--

CREATE TABLE `hotel` (
  `HotelID` int(11) NOT NULL,
  `HotelName` varchar(50) DEFAULT NULL,
  `HotelPhone` varchar(13) DEFAULT NULL,
  `HotelEmail` varchar(50) DEFAULT NULL,
  `HotelImages` varchar(50) DEFAULT NULL,
  `HotelAddress` varchar(255) DEFAULT NULL,
  `Promotion` varchar(50) DEFAULT NULL,
  `Introduction` longtext DEFAULT NULL,
  `Evaluate` double DEFAULT NULL,
  `RateID` int(11) DEFAULT NULL,
  `CityID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `hotel`
--

INSERT INTO `hotel` (`HotelID`, `HotelName`, `HotelPhone`, `HotelEmail`, `HotelImages`, `HotelAddress`, `Promotion`, `Introduction`, `Evaluate`, `RateID`, `CityID`) VALUES
(1, 'HACINCO HOTEL', '02438574040', 'info@hacincohotel.com', 'hachico_hotel.jpg', '110 phố Thái Thịnh, Đống Đa, Hà Nội', '0', 'Toạ lạc tại trung tâm Quận Đống Đa, một trong những trung tâm tài chính – kinh tế lớn của thủ đô Hà Nội, Khách sạn Hacinco ngay từ thời điểm khai trương (tháng 11 năm 1999) đã trở thành sự lựa chọn của du khách trong nước và quốc tế. Với 140 phòng nghỉ tiêu chuẩn quốc tế 3 sao, hệ thống dịch vụ tiện nghi hiện đại, phong cách phục vụ chu đáo và chuyên nghiệp, khách sạn Hacinco đã thực sự mang đến cho du khách cảm giác dễ chịu, thân tình và thoải mái như đang ở chính ngôi nhà của mình.', 9.5, 4, 1),
(2, 'GREEN HOTEL', '02432252683', 'achau.cec@gmail.com', 'green_hotel.jpg', 'Số 5/72, Phố Tôn Thất Tùng, Đống Đa, Hà Nội', '0', 'Tọa lạc ở thành phố Đà Nẵng, Green Hotel Da Nang có nhà hàng, hồ bơi ngoài trời, quán bar và sảnh khách chung. Khách sạn 3 sao này có khu vườn và phòng nghỉ gắn máy điều hòa với WiFi miễn phí cùng phòng tắm riêng. Chỗ nghỉ cũng cung cấp dịch vụ lễ tân 24 giờ, dịch vụ phòng và dịch vụ thu đổi ngoại tệ cho khách.', 10, 5, 1),
(3, 'Khách sạn Golden Star', '02363919168', 'info@goldenstarhoteldn.com', 'golden_star.jpg', 'Võ Giáp Nguyễn, Phường Khuê Mỹ, Ngũ Hành Sơn, Đà Nẵng', '0', 'Golden Star Hotel tọa lạc gần trung tâm thành phố Đà Nẵng và cách Sân bay Quốc tế Đà Nẵng chỉ 3 km. Nơi nghỉ tọa lạc ở một vị trí thuận tiện trong bán kính chỉ 5 phút đi bộ từ Bãi biển Mỹ Khê. Tại đây có nhà hàng trong khuôn viên phục vụ các món ăn quốc tế và Việt Nam, cũng như đáp ứng các yêu cầu ăn uống tại phòng 24 giờ.', 8.7, 4, 5),
(4, 'Furama Resort Đà Nẵng', '0511 3847333', 'reservation@furamavietnam.com', 'furama_resort.jpeg', '110 phố Thái Thịnh, Đống Đa, Hà Nội', '0', 'Kỳ nghỉ sang trọng tại Furama Resort Danang sẽ mở đầu hành trình của du khách tới các di sản được UNESCO công nhận như Kinh thành Huế, cách resort 2 giờ lái xe. Các tiện nghi đẳng cấp thế giới như hồ bơi nước ngọt, spa và 4 lựa chọn ăn uống đang chờ đón du khách tại resort này.', 8, 5, 1),
(5, 'Khách sạn Khải Hoàn', '08 39756420', 'info@khaihoanapartments.com.vn', 'khai_hoan.jpg', '624 Lạc Long Quân, P 5, Quận 11, Hồ Chí Minh', '0', 'Phòng nghỉ tại Khải Hoàn Hotel được bố trí khu vực ghế ngồi. Phòng tắm chung được trang bị chậu rửa vệ sinh (bidet), máy sấy tóc và đồ vệ sinh cá nhân miễn phí. Các phòng còn có bàn làm việc, TV màn hình phẳng và phòng tắm riêng.', 9, 3, 8),
(6, 'Havana HotelL', '058 3889999', 'info@havanahotel.vn', 'havana.jpg', '38 Trần Phú St, phường Lộc Thọ, Nha Trang', '0', 'Khách Sạn Havana Nha Trang là một trong 140 khách sạn hạng sang của tập đoàn Best Western. Đây là tổ hợp khách sạn cao nhất và có quy mô lớn nhất tại Nha Trang với 41 tầng và trên 1200 phòng hướng biển.', 10, 4, 6),
(7, 'Hotel Nikko Hai Phong', '0225 3265 66', 'reservation@hotelnikkohaiphong.com.vn', 'hotel_nikko.jpg', 'No. 1, Road. 1, Waterfront City, Vinh Niem Ward, Le Chan District, Hai Phong City,', '0', 'Hotel Nikko Hai Phong tọa lạc tại thành phố Hải Phòng, cách Nhà hát thành phố 4,5 km. Chỗ nghỉ có trung tâm thể dục, quầy bar và tầm nhìn ra sông. Các tiện nghi của chỗ nghỉ bao gồm nhà hàng, dịch vụ lễ tân 24 giờ, dịch vụ phòng và WiFi miễn phí.', 9.8, 4, 2),
(8, 'Halios Hotel Halong', '058 3889999', 'info@havanahotel.vn', 'halios_hotel.webp', '38 Nguyen Du, Hạ Long, Việt Nam ', '0', 'Tọa lạc tại thành phố Hạ Long, cách trung tâm thương mại Vincom Plaza Hạ Long 1,2 km, Halios Hotel Halong cung cấp chỗ nghỉ với nhà hàng, chỗ đỗ xe riêng miễn phí, xe đạp cho khách sử dụng miễn phí và quầy bar. Khách sạn 3 sao này có sảnh khách chung cũng như phòng nghỉ gắn máy điều hòa đi kèm WiFi miễn phí và phòng tắm riêng. Chỗ nghỉ cũng cung cấp dịch vụ lễ tân 24 giờ và dịch vụ phòng cho khách.', 8.7, 3, 3),
(9, 'Moonlight Hotel Hue', '0225 3265 66', 'info@havanahotel.vn', 'moonlight_hotel.jpg', '20 Phạm Ngũ Lão, Thành phố Huế, Huế', '0', 'Tọa lạc tại trung tâm Thành phố Huế, nằm trong bán kính chỉ 5 phút lái xe từ Chợ Đông Ba nổi tiếng, Moonlight Hotel Hue có hồ bơi trong nhà riêng. Các phòng hiện đại tại đây được trang trí nội thất tuyệt đẹp và có truy cập Wi-Fi miễn phí.', 7.9, 5, 4),
(10, 'Sun Beach Hote', '0225 3265 66', 'info@havanahotel.vn', 'sun_beach.webp', ' i1 Thái Văn Lung, phường 2, thành phố Vũng Tàu, Bà Rịa Vũng Tàu', '0', 'Sun Beach Hôtel ở thành phố Cotonou này có hồ bơi trong nhà và nhà hàng. Quý khách có thể truy cập Wi-Fi miễn phí.', 9.4, 5, 7),
(11, ' Muong Thanh Luxury Ca Mau Hotel ', '0225 3265 66', 'info@havanahotel.vn', 'luxury.jpg', 'Lot C03A, Ca Mau Administrative and Political Center Zone, Cà Mau', '0', 'Khách sạn Mường Thanh Luxury Cà Mau – một trong những khách sạn cao cấp hàng đầu khu vực Đồng Bằng sông Cửu Long, tọa lạc tại Khu trung tâm hành chính – chính trị thành phố Cà Mau. Khách sạn là điểm dừng chân lý tưởng cho những chuyến du lịch hay công tác với vị trí thuận tiện để tiếp cận trung tâm thành phố và những điểm du lịch đặc trưng của vùng.', 10, 4, 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `Amount` double DEFAULT NULL,
  `CreditCardID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `payment`
--

INSERT INTO `payment` (`PaymentID`, `Amount`, `CreditCardID`) VALUES
(1, 200000, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rate`
--

CREATE TABLE `rate` (
  `RateID` int(11) NOT NULL,
  `TypeRate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `rate`
--

INSERT INTO `rate` (`RateID`, `TypeRate`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roomtype`
--

CREATE TABLE `roomType` (
  `RoomTypeID` int(11) NOT NULL,
  `RoomTypeName` varchar(50) DEFAULT NULL,
  `Descriptions` varchar(50) DEFAULT NULL,
  `Size` varchar(20) DEFAULT NULL,
  `RoomImages` varchar(50) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `HotelID` int(11) DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `roomtype`
--

INSERT INTO `roomType` (`RoomTypeID`, `RoomTypeName`, `Descriptions`, `Size`, `RoomImages`, `Price`, `HotelID`) VALUES
(1, 'STANDARD', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 500000, 1),
(2, 'SUPERIOR', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 600000, 2),
(3, 'DELUXE', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 900000, 3),
(4, 'LUXURY', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 1000000, 4),
(5, 'SUPPERIOR DOUBLE', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 400000, 5),
(6, 'SUPPERIOR TWINS', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 700000, 6),
(7, 'DELUXE DOUBLE', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 1000000, 7),
(8, 'DELUXE TWINS', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 1500000, 8),
(9, 'DELUXE TWINS', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 1500000, 9);

-- --------------------------------------------------------

CREATE TABLE room (
	roomID int(11) not null,
    RoomTypeID int(11) NOT NULL,
    BookingDetailsID int(11) NOT NULL
);

insert into room (roomID,roomTypeID,bookingDetailsID)
value (1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,9,9);

--
-- Cấu trúc bảng cho bảng `service`
--

CREATE TABLE `service` (
  `ServiceID` int(11) NOT NULL,
  `ServiceName` varchar(50) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `HotelID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `service`
--

INSERT INTO `service` (`ServiceID`, `ServiceName`, `Price`, `HotelID`) VALUES
(1, 'Massage', 800000, 1),
(2, 'Karaoke', 100000, 1),
(3, 'Spa', 1000000, 1),
(4, 'Casino', 50000, 1),
(5, 'Karaoke', 50000, 3),
(6, 'Spa', 80000, 3),
(7, 'Massage', 800000, 1),
(8, 'Karaoke', 100000, 1),
(9, 'Spa', 1000000, 1),
(10, 'Casino', 50000, 1),
(11, 'Karaoke', 50000, 3),
(12, 'Spa', 80000, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `servicedetails`
--

CREATE TABLE `servicedetails` (
  `ServiceDetailsID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `BookingDetailsID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `servicedetails`
--

INSERT INTO `servicedetails` (`ServiceDetailsID`, `CustomerID`, `Time`, `BookingDetailsID`) VALUES
(1, 1, '01:15:30', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `SlideID` int(11) NOT NULL,
  `SlideImages` varchar(255) DEFAULT NULL,
  `SlideTitle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`SlideID`, `SlideImages`, `SlideTitle`) VALUES
(1, 'ha_noi.jpg', 'Hà Nội'),
(2, 'da_nang.jpg', 'Đà Nẵng'),
(3, 'ho_chi_minh.jpg', 'Hồ Chí Minh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`username`, `password`, `enabled`) VALUES
('admin1', 'abc123', 1),
('user1', '12345', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_roles`
--

CREATE TABLE `user_roles` (
  `user_roles_id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user_roles`
--

INSERT INTO `user_roles` (`user_roles_id`, `username`, `role`) VALUES
(3, 'admin1', 'ROLE_ADMIN'),
(2, 'admin1', 'ROLE_USER'),
(1, 'user1', 'ROLE_USER');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `fk_booking_customer` (`CustomerID`);

--
-- Chỉ mục cho bảng `bookingdetails`
--
ALTER TABLE `bookingdetails`
  ADD PRIMARY KEY (`BookingDetailsID`),
  ADD KEY `fk_bookingDetails_booking` (`BookingID`);

--
-- Chỉ mục cho bảng `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`CityID`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`CommentID`),
  ADD KEY `fk_comment_customer` (`CustomerID`),
  ADD KEY `fk_comment_roomType` (`HotelID`);

--
-- Chỉ mục cho bảng `creditcard`
--
ALTER TABLE `creditcard`
  ADD PRIMARY KEY (`CreditCardID`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Chỉ mục cho bảng `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`HotelID`),
  ADD KEY `fk_hotel_city` (`CityID`),
  ADD KEY `fk_hotel_rate` (`RateID`);

--
-- Chỉ mục cho bảng `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `fk_payment_creditCard` (`CreditCardID`);

--
-- Chỉ mục cho bảng `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`RateID`);

--
-- Chỉ mục cho bảng `room`
--
ALTER TABLE `roomtype`
  ADD PRIMARY KEY (`RoomTypeID`),
  ADD KEY `fk_roomType_hotel` (`HotelID`);

alter table `room`
add primary key (`roomID`),
add key `fk_room_roomTypeID` (`RoomtypeID`),
add key `fk_room_BookingDetailsID` (`bookingDetailsID`);
--
-- Chỉ mục cho bảng `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`ServiceID`),
  ADD KEY `fk_service_hotel` (`HotelID`);

--
-- Chỉ mục cho bảng `servicedetails`
--
ALTER TABLE `servicedetails`
  ADD PRIMARY KEY (`ServiceDetailsID`),
  ADD KEY `fk_serviceDetails_BookingDetails` (`BookingDetailsID`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`SlideID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_roles_id`),
  ADD UNIQUE KEY `uni_username_role` (`username`,`role`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `booking`
--
ALTER TABLE `booking`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `bookingdetails`
--
ALTER TABLE `bookingdetails`
  MODIFY `BookingDetailsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `city`
--
ALTER TABLE `city`
  MODIFY `CityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `CommentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `creditcard`
--
ALTER TABLE `creditcard`
  MODIFY `CreditCardID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `hotel`
--
ALTER TABLE `hotel`
  MODIFY `HotelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `rate`
--
ALTER TABLE `rate`
  MODIFY `RateID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `room`
--
ALTER TABLE `room`
  MODIFY `RoomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `roomtype`
  MODIFY `RoomTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT cho bảng `service`
--
ALTER TABLE `service`
  MODIFY `ServiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `SlideID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `user_roles_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_booking_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `fk_booking_payment` FOREIGN KEY (`BookingID`) REFERENCES `payment` (`PaymentID`);

--
-- Các ràng buộc cho bảng `bookingdetails`
--
ALTER TABLE `bookingdetails`
  ADD CONSTRAINT `fk_bookingDetails_booking` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `fk_comment_roomType` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`);

--
-- Các ràng buộc cho bảng `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_customer_creditCard` FOREIGN KEY (`CustomerID`) REFERENCES `creditcard` (`CreditCardID`);

--
-- Các ràng buộc cho bảng `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `fk_hotel_city` FOREIGN KEY (`CityID`) REFERENCES `city` (`CityID`),
  ADD CONSTRAINT `fk_hotel_rate` FOREIGN KEY (`RateID`) REFERENCES `rate` (`RateID`);

--
-- Các ràng buộc cho bảng `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_creditCard` FOREIGN KEY (`CreditCardID`) REFERENCES `creditcard` (`CreditCardID`);

--
-- Các ràng buộc cho bảng `room`

ALTER TABLE `roomtype`
  ADD CONSTRAINT `fk_roomType_hotel` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`);

alter table `room`
add constraint `fk_room_roomTypeID`  foreign key(`RoomtypeID`) references `roomType` (`RoomtypeID`),
add constraint `fk_room_BookingDetailsID`  foreign key (`bookingDetailsID`)references `bookingdetails` (`bookingDetailsID`) ;
--
-- Các ràng buộc cho bảng `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `fk_service_hotel` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`);

--
-- Các ràng buộc cho bảng `servicedetails`
--
ALTER TABLE `servicedetails`
  ADD CONSTRAINT `fk_serviceDetails_BookingDetails` FOREIGN KEY (`BookingDetailsID`) REFERENCES `bookingdetails` (`BookingDetailsID`),
  ADD CONSTRAINT `fk_serviceDetails_Service` FOREIGN KEY (`ServiceDetailsID`) REFERENCES `service` (`ServiceID`);

--
-- Các ràng buộc cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `fk_user_roles` FOREIGN KEY (`username`) REFERENCES `users` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
