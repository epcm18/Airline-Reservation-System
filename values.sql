
CREATE TABLE `Booking_log` (
  `booking_id` Varchar(50),
  `user_id` Varchar(50),
  `log_id` Varchar(50),
  PRIMARY KEY (`log_id`)
);
INSERT INTO `Booking_log` VALUES ();

CREATE TABLE `Type` (
  `type_id` Varchar(50),
  `name` Varchar(50),
  PRIMARY KEY (`type_id`)
);
INSERT INTO `Type` VALUES ('00001', 'Frequnet');
INSERT INTO `Type` VALUES ('00002', 'Gold');
INSERT INTO `Type` VALUES ('00003', 'Regular');

CREATE TABLE `Registered_User` (
  `id` Varchar(50),
  `user_name` Varchar(50),
  `first_name` Varchar(50),
  `last_name` Varchar(50),
  `password` Varchar(50),
  `type_id` Varchar(50),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`type_id`) REFERENCES `Type`(`type_id`)
);
INSERT INTO `Registered_User` VALUES ('amal02', 'Amal', 'Karunathilake', 'amalK#123', '00001');
INSERT INTO `Registered_User` VALUES ('sandra@12', 'Sandra', 'Lopez', 'sandraL%12', '00002');
INSERT INTO `Registered_User` VALUES ('bhagath_12', 'Bagath', 'Singh', 'asinghB@', '00002');
INSERT INTO `Registered_User` VALUES ('chachi08', 'Chachi', 'Chan', 'cc#123', '00001');
INSERT INTO `Registered_User` VALUES ('nadun#1', 'Nadun', 'Gunathilake', 'NadunG789', '00001');

CREATE TABLE `Staff` (
  `staff_id` Varchar(50),
  `first_name` Varchar(50),
  `last_name` Varchar(50),
  `gender` Varchar(50),
  PRIMARY KEY (`staff_id`)
);
INSERT INTO `Staff` VALUES ('123456789A', 'Agata', 'Martinez', 'F');
INSERT INTO `Staff` VALUES ('146789345B', 'Emilio', 'Silva', 'M');
INSERT INTO `Staff` VALUES ('457329134K', 'Akash', 'Sharma', 'M');
INSERT INTO `Staff` VALUES ('869765423M', 'Nikita', 'Fernandez', 'F');
INSERT INTO `Staff` VALUES ('356789234P', 'Priyanka', 'Mohan', 'F');

CREATE TABLE `Airport` (
  `IATA_code` Varchar(50),
  `location_heirachi_id` Varchar(50),
  `time_zone` Varchar(50),
  PRIMARY KEY (`IATA_code`)
);
INSERT INTO `Airport` VALUES ('CGK', 'Soekarno–Hatta International Airport', 'GMT+7');
INSERT INTO `Airport` VALUES ('DPS', 'Ngurah Rai International Airport', 'GMT+8');
INSERT INTO `Airport` VALUES ('BIA', 'Bandaranaike International Airport', 'GMT+5:30');
INSERT INTO `Airport` VALUES ('HRI', 'Mattala international airport', 'GMT+5:30');
INSERT INTO `Airport` VALUES ('DEL', 'Indira Gandhi International Airport', 'GMT+5:30');
INSERT INTO `Airport` VALUES ('BOM', 'Chhatrapati Shivaji Maharaj International Airport', 'GMT+5:30');
INSERT INTO `Airport` VALUES ('MAA', 'Chennai International Airport', 'GMT+5:30');
INSERT INTO `Airport` VALUES ('BKK', 'Suvarnabhumi Airportt', 'GMT+7');
INSERT INTO `Airport` VALUES ('DMK', 'Don Mueang International Airport', 'GMT+7');
INSERT INTO `Airport` VALUES ('SIN', 'Singapore Changi Airport', 'GMT+8');

CREATE TABLE `Route` (
  `route_id` int,
  `from_airport` Varchar(50),
  `to_airport` Varchar(50),
  PRIMARY KEY (`route_id`),
  FOREIGN KEY (`from_airport`) REFERENCES `Airport`(`IATA_code`),
  FOREIGN KEY (`to_airport`) REFERENCES `Airport`(`IATA_code`)
);
INSERT INTO `Route` VALUES ('AIR00001', 'CGK', 'SIN');
INSERT INTO `Route` VALUES ('AIR00002', 'BIA', 'DEL');
INSERT INTO `Route` VALUES ('AIR00003', 'BOM', 'BKK');
INSERT INTO `Route` VALUES ('AIR00004', 'MAA', 'DPS');
INSERT INTO `Route` VALUES ('AIR00005', 'SIN', 'DMK');
INSERT INTO `Route` VALUES ('AIR00006', 'HRI', 'DEL');
INSERT INTO `Route` VALUES ('AIR00007', 'DMK', 'MAA');

CREATE TABLE `Reference_log` (
  `booking_id` Varchar(50),
  `key` Varchar(50),
  `reference_num` Varchar(50),
  PRIMARY KEY (`reference_num`)
);

CREATE TABLE `Prices` (
  `route_id` int,
  `class_id` Varchar(50),
  `price` Decimal(6,2),
  PRIMARY KEY (`route_id`, `class_id`),
  FOREIGN KEY (`route_id`) REFERENCES `Route`(`route_id`)
);
INSERT INTO `Prices` VALUES ('AIR00001', 'CLASS001', 1169.00);
INSERT INTO `Prices` VALUES ('AIR00001', 'CLASS002', 668.00);
INSERT INTO `Prices` VALUES ('AIR00001', 'CLASS003', 64.00);
INSERT INTO `Prices` VALUES ('AIR00002', 'CLASS001', 4443.00);
INSERT INTO `Prices` VALUES ('AIR00002', 'CLASS002', 432.00);
INSERT INTO `Prices` VALUES ('AIR00002', 'CLASS003', 222.00);
INSERT INTO `Prices` VALUES ('AIR00003', 'CLASS001', 3705.00);
INSERT INTO `Prices` VALUES ('AIR00003', 'CLASS002', 400.00);
INSERT INTO `Prices` VALUES ('AIR00003', 'CLASS003', 149.00);
INSERT INTO `Prices` VALUES ('AIR00004', 'CLASS002', 938.00);
INSERT INTO `Prices` VALUES ('AIR00004', 'CLASS003', 172.00);
INSERT INTO `Prices` VALUES ('AIR00005', 'CLASS001', 81.00);
INSERT INTO `Prices` VALUES ('AIR00005', 'CLASS002', 81.00);
INSERT INTO `Prices` VALUES ('AIR00005', 'CLASS003', 81.00);
INSERT INTO `Prices` VALUES ('AIR00006', 'CLASS002', 432.00);
INSERT INTO `Prices` VALUES ('AIR00006', 'CLASS003', 286.00);
INSERT INTO `Prices` VALUES ('AIR00007', 'CLASS002', 126.00);
INSERT INTO `Prices` VALUES ('AIR00007', 'CLASS003', 103.00);

CREATE TABLE `Airplane` (
  `airplane_id` Varchar(50),
  `modle` Varchar(50),
  `year` int,
  `country` Varchar(50),
  `seating_capacity` Int,
  PRIMARY KEY (`airport_id`)
);
INSERT INTO `Airplane` VALUES ('12345F', 'Boeing 737', 2021, 'France', 189);
INSERT INTO `Airplane` VALUES ('15678K', 'Boeing 737', 2021,  'France', 189);
INSERT INTO `Airplane` VALUES ('19823L', 'Boeing 737', 2021,  'United States', 189);
INSERT INTO `Airplane` VALUES ('12679N', 'Boeing 757', 2021,  'France', 200);
INSERT INTO `Airplane` VALUES ('34562P', 'Boeing 757', 2021,  'Netherland', 200);
INSERT INTO `Airplane` VALUES ('98751A', 'Boeing 757', 2021,  'France', 200);
INSERT INTO `Airplane` VALUES ('76543W', 'Boeing 757', 2021,  'Singapore', 200);
INSERT INTO `Airplane` VALUES ('24567C', 'Boeing 737', 2021,  'Singapore', 189);
INSERT INTO `Airplane` VALUES ('32561H', 'Airbus A380', 2021,  'United Kingdom', 520);

CREATE TABLE `Trip` (
  `trip_id` Varchar(50),
  `departure` DateTime,
  `arrival` DateTime,
  `route_id` Varchar(50),
  `plane_id` Varchar(50),
  `tripstatus_id` int,
  PRIMARY KEY (`trip_id`),
  FOREIGN KEY (`route_id`) REFERENCES `Prices`(`route_id`),
  FOREIGN KEY (`plane_id`) REFERENCES `Airplane`(`airplane_id`)
);
INSERT INTO `Trip` VALUES ('TRIPD1001', 2023-01-14 07:10:00, 2023-01-14 12:20:00, 'AIR00001', '12345F', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD1002', 2023-01-14 09:30:00, 2023-01-14 14:25:00, 'AIR00002', '15678K', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD1003', 2023-01-14 12:12:00, 2023-01-14 17:20:00, 'AIR00003', '19823L', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD1004', 2023-01-14 16:55:00, 2023-01-15 00:20:00, 'AIR00004', '12679N', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD2001', 2023-01-15 04:24:00, 2023-01-15 08:20:00, 'AIR00005', '34562P', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD2002', 2023-01-15 09:45:00, 2023-01-15 12:50:00, 'AIR00006', '32561H', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD2003', 2023-01-15 13:10:00, 2023-01-15 18:20:00, 'AIR00007', '24567C', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD2004', 2023-01-15 17:34:00, 2023-01-15 23:28:00, 'AIR00001', '76543W', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD3001', 2023-01-16 00:10:00, 2023-01-16 05:48:00, 'AIR00002', '98751A', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD3002', 2023-01-16 07:20:00, 2023-01-16 12:14:00, 'AIR00003', '34562P', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD3003', 2023-01-16 14:40:00, 2023-01-16 19:26:00, 'AIR00004', '12345F', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD3004', 2023-01-16 17:30:00, 2023-01-16 23:50:00, 'AIR00005', '15678K', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD3005', 2023-01-16 22:12:00, 2023-01-17 03:30:00, 'AIR00006', '19823L', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD4001', 2023-01-17 03:34:00, 2023-01-17 07:27:00, 'AIR00007', '12679N', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD4002', 2023-01-17 09:10:00, 2023-01-17 13:30:00, 'AIR00001', '34562P', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD4003', 2023-01-17 15:40:00, 2023-01-17 19:48:00, 'AIR00002', '32561H', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD4004', 2023-01-17 19:50:00, 2023-01-17 23:40:00, 'AIR00003', '24567C', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD5001', 2023-01-18 13:12:00, 2023-01-18 18:25:00, 'AIR00007', '15678K', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD5002', 2023-01-18 04:15:00, 2023-01-18 09:20:00, 'AIR00004', '12679N', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD5003', 2023-01-18 08:10:00, 2023-01-18 12:30:00, 'AIR00002', '98751A', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD5004', 2023-01-18 21:25:00, 2023-01-19 01:05:00, 'AIR00005', '34562P', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD6001', 2023-01-19 14:45:00, 2023-01-14 19:25:00, 'AIR00001', '12345F', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD6002', 2023-01-19 12:30:00, 2023-01-14 16:20:00, 'AIR00007', '24567C', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD6003', 2023-01-19 16:10:00, 2023-01-14 21:50:00, 'AIR00004', '15678K', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD6004', 2023-01-19 08:10:00, 2023-01-14 13:35:00, 'AIR00002', '32561H', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD0001', 2023-01-14 07:10:00, 2023-01-14 12:20:00, 'AIR00001', '12345F', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD0001', 2023-01-14 07:10:00, 2023-01-14 12:20:00, 'AIR00001', '12345F', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD0001', 2023-01-14 07:10:00, 2023-01-14 12:20:00, 'AIR00001', '12345F', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD0001', 2023-01-14 07:10:00, 2023-01-14 12:20:00, 'AIR00001', '12345F', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD0001', 2023-01-14 07:10:00, 2023-01-14 12:20:00, 'AIR00001', '12345F', 'STATE002');
INSERT INTO `Trip` VALUES ('TRIPD0001', 2023-01-14 07:10:00, 2023-01-14 12:20:00, 'AIR00001', '12345F', 'STATE002');

CREATE TABLE `Seat` (
  `seat_id` Varchar(50),
  `airplane_id` Varchar(50),
  `class_id` int,
  PRIMARY KEY (`seat_id`, `airplane_id`),
  FOREIGN KEY (`airplane_id`) REFERENCES `Airplane`(`airport_id`)
);

CREATE TABLE `Passenger` (
  `passenger_id` Varchar(50),
  `passport_number` Varchar(50),
  `nationality` Varchar(50),
  `first_name` Varchar(50),
  `last_name` Varchar(50),
  `email` Varchar(75),
  `contact_number` Varchar(50),
  `b_day` date,
  PRIMARY KEY (`passenger_id`)
);
INSERT INTO `Passenger` VALUES ('IND20221226A', 'Indian', 'Karun', 'Nair', 'karunN@gmail.com', '+918519087654');
INSERT INTO `Passenger` VALUES ('SRI20221226S', 'Sri Lanakan', 'Bharatha', 'Thennakoon', 'BharathaThen@gmail.com', '+93708976543');
INSERT INTO `Passenger` VALUES ('IND20221226P', 'Indian', 'Arpit', 'Nayar', 'ArpitN@gmail.com', '+918519765432');
INSERT INTO `Passenger` VALUES ('MLY20221226O', 'Malaysian', 'Arun', 'Abbar', 'arunAbbar@gmail.com', '+607234561236');
INSERT INTO `Passenger` VALUES ('IND20221226A', 'Indian', 'Nitya', 'Menon', 'Nityamenon@gmail.com', '+916723451896');


CREATE TABLE `Status` (
  `Status_id` Varchar(50),
  `name` Varchar(50),
  PRIMARY KEY (`Status_id`)
);

CREATE TABLE `Booking` (
  `booking_id` Varchar(50),
  `trip_id` Varchar(50),
  `passenger_id` Varchar(50),
  `class_id` Varchar(50),
  `seat_id` Varchar(50),
  `cost` Decimal(6,2),
  `status_id` Varchar(50),
  PRIMARY KEY (`booking_id`),
  FOREIGN KEY (`trip_id`) REFERENCES `Trip`(`trip_id`),
  FOREIGN KEY (`seat_id`) REFERENCES `Seat`(`seat_id`),
  FOREIGN KEY (`passenger_id`) REFERENCES `Passenger`(`passenger_id`),
  FOREIGN KEY (`status_id`) REFERENCES `Status`(`Status_id`)
);

CREATE TABLE `Class` (
  `class_id` Varchar(50),
  `class_name` Varchar(50),
  PRIMARY KEY (`class_id`),
  FOREIGN KEY (`class_id`) REFERENCES `Booking`(`class_id`)
);
INSERT INTO `Class` VALUES ('CLASS001', 'Platinum');
INSERT INTO `Class` VALUES ('CLASS002', 'Buisness');
INSERT INTO `Class` VALUES ('CLASS003', 'Economy');

CREATE TABLE `Tripstatus` (
  `trip_status_id` Varchar(50),
  `title` Varchar(50),
  PRIMARY KEY (`trip_status_id`),
  FOREIGN KEY (`trip_status_id`) REFERENCES `Trip`(`tripstatus_id`)
);
INSERT INTO `Tripstatus` VALUES ('STATE001', 'INAIR');
INSERT INTO `Tripstatus` VALUES ('STATE002', 'ONGROUND');
INSERT INTO `Tripstatus` VALUES ('STATE003', 'DELAYED');
INSERT INTO `Tripstatus` VALUES ('STATE004', 'CANCELED');

CREATE TABLE `Role` (
  `role_id` Varchar(50),
  `title` Varchar(50),
  PRIMARY KEY (`role_id`)
);
INSERT INTO `Role` VALUES ('000000000A', 'Pilot');
INSERT INTO `Role` VALUES ('000000001B', 'Co-Pilot');
INSERT INTO `Role` VALUES ('000000002C', 'Cabin crew');

CREATE TABLE `Assingnation` (
  `assignation_id` Varchar(50),
  `staff_id` Varchar(50),
  `plane_id` Varchar(50),
  `role_id` Varchar(50),
  PRIMARY KEY (`assignation_id`),
  FOREIGN KEY (`role_id`) REFERENCES `Role`(`role_id`),
  FOREIGN KEY (`plane_id`) REFERENCES `Airplane`(`airport_id`),
  FOREIGN KEY (`staff_id`) REFERENCES `Staff`(`staff_id`)
);
INSERT INTO `Assignation` VALUES ('1111A', '123456789A', '98751A', '000000002C');
INSERT INTO `Assignation` VALUES ('1111B', '457329134K', '32561H', '000000001B');
INSERT INTO `Assignation` VALUES ('1111C', '146789345B', '19823L', '000000000A');

CREATE TABLE `Location` (
  `location_id` int,
  `name` Varchar(50),
  `parent` int,
  PRIMARY KEY (`location_id`)
);
INSERT INTO `Location` VALUES (00001, 'Sri Lanka', null);
INSERT INTO `Location` VALUES (00011, 'Colombo', 00001);
INSERT INTO `Location` VALUES (00012, 'Hambantota', 00001);
INSERT INTO `Location` VALUES (00002, 'India', null);
INSERT INTO `Location` VALUES (00021, 'Mumbhai', 00002);
INSERT INTO `Location` VALUES (00022, 'New Delhi', 00002);

