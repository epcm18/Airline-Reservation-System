DROP DATABASE IF EXISTS b_airways;
CREATE DATABASE b_airways;
USE b_airways ;
CREATE TABLE `Staff` (
  `id` Varchar(50),
  `first_name` Varchar(50),
  `last_name` Varchar(50),
  `gender` Varchar(50),
  PRIMARY KEY (`id`)
);

CREATE TABLE `Role` (
  `id` Varchar(50),
  `title` Varchar(50),
  PRIMARY KEY (`id`)
);

CREATE TABLE `Airplane` (
  `id` Varchar(50),
  `modal` Varchar(50),
  `year` Year,
  `country` Varchar(50),
  `seating_capacity` Int,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Assingnation` (
  `id` Varchar(50),
  `staff_id` Varchar(50),
  `plane_id` Varchar(50),
  `role_id` Varchar(50),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`staff_id`) REFERENCES `Staff`(`id`),
  FOREIGN KEY (`role_id`) REFERENCES `Role`(`id`),
  FOREIGN KEY (`plane_id`) REFERENCES `Airplane`(`id`)
);

CREATE TABLE `Passenger` (
  `id` Varchar(50),
  `passport_number` Varchar(50),
  `nationality` Varchar(50),
  `first_name` Varchar(50),
  `last_name` Varchar(50),
  `email` Varchar(50),
  `contact_number` Varchar(50),
  PRIMARY KEY (`id`)
);

CREATE TABLE `Airport` (
  `IATA_code` Varchar(50),
  `name` Varchar(50),
  `time_zone` Varchar(50),
  PRIMARY KEY (`IATA_code`)
);

CREATE TABLE `Route` (
  `id` Varchar(50),
  `from` Varchar(50),
  `to` Varchar(50),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`to`) REFERENCES `Airport`(`IATA_code`),
  FOREIGN KEY (`from`) REFERENCES `Airport`(`IATA_code`)
);

CREATE TABLE `Prices` (
  `route_id` Varchar(50),
  `class` Varchar(50),
  `price` Decimal(6,2),
  PRIMARY KEY (`route_id`, `class`),
  FOREIGN KEY (`route_id`) REFERENCES `Route`(`id`)
);

CREATE TABLE `Type` (
  `id` Varchar(50),
  `name` Varchar(50),
  `discount_rate` Decimal(2,2),
  PRIMARY KEY (`id`)
);

CREATE TABLE `Registered_User` (
  `id` Varchar(50),
  `user_name` Varchar(50),
  `first_name` Varchar(50),
  `last_name` Varchar(50),
  `password` Varchar(50),
  `type_id` Varchar(50),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`type_id`) REFERENCES `Type`(`id`)
);

CREATE TABLE `Location` (
  `IATA_code` Varchar(50),
  `hierarchy_id` varchar(50),
  `location` Varchar(50),
  PRIMARY KEY (`IATA_code`, `hierarchy_id`),
  FOREIGN KEY (`IATA_code`) REFERENCES `Airport`(`IATA_code`)
);

CREATE TABLE `Boocking_log` (
  `booking_id` Varchar(50),
  `user_id` Varchar(50),
  `log_id` Varchar(50),
  PRIMARY KEY (`log_id`),
  FOREIGN KEY (`user_id`) REFERENCES `Registered_User`(`id`)
);

CREATE TABLE `Trip` (
  `id` Varchar(50),
  `departure` DateTime,
  `arrival` DateTime,
  `route_id` Varchar(50),
  `plane_id` Varchar(50),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`plane_id`) REFERENCES `Airplane`(`id`),
  FOREIGN KEY (`route_id`) REFERENCES `Route`(`id`)
);

CREATE TABLE `Reference_log` (
  `booking_id` Varchar(50),
  `key` Varchar(50),
  `reference_num` Varchar(50),
  PRIMARY KEY (`reference_num`)
);

CREATE TABLE `Status` (
  `id` Varchar(50),
  `name` Varchar(50),
  PRIMARY KEY (`id`)
);

CREATE TABLE `Seat` (
  `id` Varchar(50),
  `airplane_id` Varchar(50),
  `type` Varchar(50),
  PRIMARY KEY (`id`, `airplane_id`),
  FOREIGN KEY (`airplane_id`) REFERENCES `Airplane`(`id`)
);

CREATE TABLE `Booking` (
  `id` Varchar(50),
  `trip_id` Varchar(50),
  `passenger_id` Varchar(50),
  `class` Varchar(50),
  `seat_id` Varchar(50),
  `cost` Decimal(6,2),
  `status_id` Varchar(50),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`seat_id`) REFERENCES `Seat`(`id`),
  FOREIGN KEY (`status_id`) REFERENCES `Status`(`id`),
  FOREIGN KEY (`trip_id`) REFERENCES `Trip`(`id`),
  FOREIGN KEY (`passenger_id`) REFERENCES `Passenger`(`id`)
);
