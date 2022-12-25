USE b_airways ;
CREATE TABLE `Staff` (
  `id` Varchar(20),
  `first_name` Varchar(50),
  `last_name` Varchar(50),
  `gender` Varchar(20),
  PRIMARY KEY (`id`)
);

CREATE TABLE `Role` (
  `id` Varchar(20),
  `title` Varchar(50),
  PRIMARY KEY (`id`)
);

CREATE TABLE `Airplane` (
  `id` Varchar(20),
  `modal` Varchar(20),
  `year` Year,
  `country` Varchar(50),
  `seating_capacity` Int,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Assingnation` (
  `id` Varchar(20),
  `staff_id` Varchar(20),
  `plane_id` Varchar(20),
  `role_id` Varchar(20),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`staff_id`) REFERENCES `Staff`(`id`),
  FOREIGN KEY (`role_id`) REFERENCES `Role`(`id`),
  FOREIGN KEY (`plane_id`) REFERENCES `Airplane`(`id`)
);

CREATE TABLE `Passenger` (
  `id` Varchar(20),
  `passport_number` Varchar(50),
  `nationality` Varchar(50),
  `first_name` Varchar(50),
  `last_name` Varchar(50),
  `email` Varchar(75),
  `contact_number` varchar(20),
  PRIMARY KEY (`id`)
);

CREATE TABLE `Airport` (
  `IATA_code` Varchar(20),
  `name` Varchar(20),
  `time_zone` Varchar(20),
  PRIMARY KEY (`IATA_code`)
);

CREATE TABLE `Route` (
  `id` Varchar(20),
  `from` Varchar(20),
  `to` Varchar(20),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`to`) REFERENCES `Airport`(`IATA_code`),
  FOREIGN KEY (`from`) REFERENCES `Airport`(`IATA_code`)
);

CREATE TABLE `Prices` (
  `route_id` Varchar(20),
  `class` Varchar(20),
  `price` Decimal(6,2),
  PRIMARY KEY (`route_id`, `class`),
  FOREIGN KEY (`route_id`) REFERENCES `Route`(`id`)
);

CREATE TABLE `Type` (
  `id` Varchar(20),
  `name` Varchar(20),
  PRIMARY KEY (`id`)
);

CREATE TABLE `Registered_User` (
  `id` Varchar(20),
  `user_name` Varchar(50),
  `first_name` Varchar(50),
  `last_name` Varchar(50),
  `password` Varchar(50),
  `type_id` Varchar(20),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`type_id`) REFERENCES `Type`(`id`)
);

CREATE TABLE `Location` (
  `IATA_code` Varchar(20),
  `hierarchy_id` varchar(10),
  `location` Varchar(50),
  PRIMARY KEY (`IATA_code`, `hierarchy_id`),
  FOREIGN KEY (`IATA_code`) REFERENCES `Airport`(`IATA_code`)
);

CREATE TABLE `Boocking_log` (
  `booking_id` Varchar(20),
  `user_id` Varchar(20),
  `log_id` Varchar(20),
  PRIMARY KEY (`log_id`),
  FOREIGN KEY (`user_id`) REFERENCES `Registered_User`(`id`)
);

CREATE TABLE `Trip` (
  `id` Varchar(20),
  `departure` DateTime,
  `arrival` DateTime,
  `route_id` Varchar(20),
  `plane_id` Varchar(20),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`plane_id`) REFERENCES `Airplane`(`id`),
  FOREIGN KEY (`route_id`) REFERENCES `Route`(`id`)
);

CREATE TABLE `Reference_log` (
  `booking_id` Varchar(20),
  `key` Varchar(20),
  `reference_num` Varchar(20),
  PRIMARY KEY (`reference_num`)
);

CREATE TABLE `Status` (
  `id` Varchar(20),
  `name` varchar(20),
  PRIMARY KEY (`id`)
);

CREATE TABLE `Seat` (
  `id` Varchar(20),
  `airplane_id` Varchar(20),
  `type` Varchar(20),
  PRIMARY KEY (`id`, `airplane_id`),
  FOREIGN KEY (`airplane_id`) REFERENCES `Airplane`(`id`)
);

CREATE TABLE `Booking` (
  `id` Varchar(20),
  `trip_id` Varchar(20),
  `passenger_id` Varchar(20),
  `class` Varchar(20),
  `seat_id` Varchar(20),
  `cost` Decimal(6,2),
  `status_id` Varchar(20),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`seat_id`) REFERENCES `Seat`(`id`),
  FOREIGN KEY (`status_id`) REFERENCES `Status`(`id`),
  FOREIGN KEY (`trip_id`) REFERENCES `Trip`(`id`),
  FOREIGN KEY (`passenger_id`) REFERENCES `Passenger`(`id`)
);
