-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 13, 2020 lúc 09:51 AM
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
  `BookingDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `booking`
--

INSERT INTO `booking` (`BookingID`, `BookingDate`) VALUES
(1, '2020-09-10');

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
  `RoomTypeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bookingdetails`
--

INSERT INTO `bookingdetails` (`BookingDetailsID`, `NumberOfPeople`, `NumberOfRooms`, `Price`, `CheckInDate`, `CheckOutDate`, `RoomTypeID`) VALUES
(1, 2, 1, 2000000, '2020-09-07', '2020-09-09', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `city`
--

CREATE TABLE `city` (
  `CityID` int(11) NOT NULL,
  `CityName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `city`
--

INSERT INTO `city` (`CityID`, `CityName`) VALUES
(1, 'Hà Nội'),
(2, 'Hải Phòng'),
(3, 'Quảng Ninh'),
(4, 'Huế'),
(5, 'Đà Nẵng'),
(6, 'Nha Trang'),
(7, 'Vũng Tàu'),
(8, 'Hồ Chí Minh'),
(9, 'Cà Mau');

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
  `Rate` double DEFAULT NULL,
  `HotelAddress` varchar(255) DEFAULT NULL,
  `Promotion` varchar(50) DEFAULT NULL,
  `CityID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `hotel`
--

INSERT INTO `hotel` (`HotelID`, `HotelName`, `HotelPhone`, `HotelEmail`, `HotelImages`, `Rate`, `HotelAddress`, `Promotion`, `CityID`) VALUES
(1, 'HACINCO HOTEL', '02438574040', 'info@hacincohotel.com', 'anh1.png', 3, '110 phố Thái Thịnh, Đống Đa, Hà Nội', '0', 1),
(2, 'GREEN HOTEL', '02432252683', 'achau.cec@gmail.com', 'anh1.png', 4, 'Số 5/72, Phố Tôn Thất Tùng, Đống Đa, Hà Nội', '0', 1),
(3, 'Khách sạn Golden Star', '02363919168', 'info@goldenstarhoteldn.com', 'anh1.png', 3, 'Võ Giáp Nguyễn, Phường Khuê Mỹ, Ngũ Hành Sơn, Đà Nẵng', '0', 5),
(4, 'Furama Resort Đà Nẵng', '0511 3847333', 'reservation@furamavietnam.com', 'anh1.png', 5, '110 phố Thái Thịnh, Đống Đa, Hà Nội', '0', 1),
(5, 'Khách sạn Khải Hoàn', '08 39756420', 'info@khaihoanapartments.com.vn', 'anh1.png', 4, '624 Lạc Long Quân, P 5, Quận 11, Hồ Chí Minh', '0', 8),
(6, 'Havana HotelL', '058 3889999', 'info@havanahotel.vn', 'anh1.png', 3, '38 Trần Phú St, phường Lộc Thọ, Nha Trang', '0', 6),
(7, 'Hotel Nikko Hai Phong', '0225 3265 66', 'reservation@hotelnikkohaiphong.com.vn', 'anh1.png', 3, 'No. 1, Road. 1, Waterfront City, Vinh Niem Ward, Le Chan District, Hai Phong City,', '0', 2),
(8, 'Halios Hotel Halong', '058 3889999', 'info@havanahotel.vn', 'anh1.png', 3, '38 Nguyen Du, Hạ Long, Việt Nam ', '0', 3),
(9, 'Moonlight Hotel Hue', '0225 3265 66', 'info@havanahotel.vn', 'anh1.png', 5, '20 Phạm Ngũ Lão, Thành phố Huế, Huế', '0', 4),
(10, 'Sun Beach Hote', '0225 3265 66', 'info@havanahotel.vn', 'anh1.png', 5, ' i1 Thái Văn Lung, phường 2, thành phố Vũng Tàu, Bà Rịa Vũng Tàu, Việt Nam., Vũng Tàu', '0', 7),
(11, ' Muong Thanh Luxury Ca Mau Hotel ', '0225 3265 66', 'info@havanahotel.vn', 'anh1.png', 5, 'Lot C03A, Ca Mau Administrative and Political Center Zone, Cà Mau', '0', 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `Amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `payment`
--

INSERT INTO `payment` (`PaymentID`, `Amount`) VALUES
(1, 200000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roomtype`
--

CREATE TABLE `roomtype` (
  `RoomTypeID` int(11) NOT NULL,
  `RoomTypeName` varchar(50) DEFAULT NULL,
  `Descriptions` varchar(50) DEFAULT NULL,
  `Size` varchar(20) DEFAULT NULL,
  `RoomImages` varchar(50) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `HotelID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `roomtype`
--

INSERT INTO `roomtype` (`RoomTypeID`, `RoomTypeName`, `Descriptions`, `Size`, `RoomImages`, `Price`, `HotelID`) VALUES
(1, 'STANDARD', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 500000, 1),
(2, 'SUPERIOR', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 600000, 1),
(3, 'DELUXE', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 900000, 1),
(4, 'LUXURY', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 1000000, 1),
(5, 'SUPPERIOR DOUBLE', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 400000, 3),
(6, 'SUPPERIOR TWINS', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 700000, 3),
(7, 'DELUXE DOUBLE', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 1000000, 3),
(8, 'DELUXE TWINS', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 1500000, 3);

-- --------------------------------------------------------

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
(6, 'Spa', 80000, 3);

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
  ADD PRIMARY KEY (`BookingID`);

--
-- Chỉ mục cho bảng `bookingdetails`
--
ALTER TABLE `bookingdetails`
  ADD PRIMARY KEY (`BookingDetailsID`),
  ADD KEY `fk_bookingDetails_roomTypeID` (`RoomTypeID`);

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
  ADD KEY `fk_hotel_city` (`CityID`);

--
-- Chỉ mục cho bảng `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`);

--
-- Chỉ mục cho bảng `roomtype`
--
ALTER TABLE `roomtype`
  ADD PRIMARY KEY (`RoomTypeID`),
  ADD KEY `fk_roomType_hotel` (`HotelID`);

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
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `bookingdetails`
--
ALTER TABLE `bookingdetails`
  MODIFY `BookingDetailsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `city`
--
ALTER TABLE `city`
  MODIFY `CityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `roomtype`
--
ALTER TABLE `roomtype`
  MODIFY `RoomTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `service`
--
ALTER TABLE `service`
  MODIFY `ServiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  ADD CONSTRAINT `fk_booking_payment` FOREIGN KEY (`BookingID`) REFERENCES `payment` (`PaymentID`);

--
-- Các ràng buộc cho bảng `bookingdetails`
--
ALTER TABLE `bookingdetails`
  ADD CONSTRAINT `fk_bookingDetails_booking` FOREIGN KEY (`BookingDetailsID`) REFERENCES `booking` (`BookingID`),
  ADD CONSTRAINT `fk_bookingDetails_roomTypeID` FOREIGN KEY (`RoomTypeID`) REFERENCES `roomtype` (`RoomTypeID`);

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
  ADD CONSTRAINT `fk_customer_booking` FOREIGN KEY (`CustomerID`) REFERENCES `booking` (`BookingID`),
  ADD CONSTRAINT `fk_customer_creditCard` FOREIGN KEY (`CustomerID`) REFERENCES `creditcard` (`CreditCardID`);

--
-- Các ràng buộc cho bảng `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `fk_hotel_city` FOREIGN KEY (`CityID`) REFERENCES `city` (`CityID`);

--
-- Các ràng buộc cho bảng `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_creditCard` FOREIGN KEY (`PaymentID`) REFERENCES `creditcard` (`CreditCardID`);

--
-- Các ràng buộc cho bảng `roomtype`
--
ALTER TABLE `roomtype`
  ADD CONSTRAINT `fk_roomType_hotel` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`);

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
