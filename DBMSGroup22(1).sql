DDL


CREATE TABLE `Boocking_log` (
  `booking_id` Varchar(20),
  `user_id` Varchar(20),
  `log_id` Varchar(20),
  PRIMARY KEY (`log_id`)
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


CREATE TABLE `Staff` (
  `id` Varchar(20),
  `first_name` Varchar(50),
  `last_name` Varchar(50),
  `gender` Varchar(20),
  PRIMARY KEY (`id`)
);


CREATE TABLE `Airport` (
  `IATA_code` Varchar(20),
  `location_heirachi_id` Varchar(20),
  `time_zone` Varchar(20),
  PRIMARY KEY (`IATA_code`)
);


CREATE TABLE `Route` (
  `id` Varchar(20),
  `from` Varchar(20),
  `to` Varchar(20),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`from`) REFERENCES `Airport`(`IATA_code`),
  FOREIGN KEY (`to`) REFERENCES `Airport`(`IATA_code`)
);


CREATE TABLE `Reference_log` (
  `booking_id` Varchar(20),
  `key` Varchar(20),
  `reference_num` Varchar(20),
  PRIMARY KEY (`reference_num`)
);


CREATE TABLE `Prices` (
  `route_id` Varchar(20),
  `class` Varchar(20),
  `price` Decimal(6,2),
  PRIMARY KEY (`route_id`, `class`),
  FOREIGN KEY (`route_id`) REFERENCES `Route`(`id`)
);


CREATE TABLE `Airplane` (
  `id` Varchar(20),
  `modal` Varchar(20),
  `year` Year,
  `country` Varchar(50),
  `seating_capacity` Int,
  PRIMARY KEY (`id`)
);


CREATE TABLE `Trip` (
  `id` Varchar(20),
  `departure` DateTime,
  `arrival` DateTime,
  `route_id` Varchar(20),
  `plane_id` Varchar(20),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`route_id`) REFERENCES `Prices`(`route_id`),
  FOREIGN KEY (`plane_id`) REFERENCES `Airplane`(`id`)
);


CREATE TABLE `Seat` (
  `id` Varchar(20),
  `airplane_id` Varchar(20),
  `type` Varchar(20),
  PRIMARY KEY (`id`, `airplane_id`),
  FOREIGN KEY (`airplane_id`) REFERENCES `Airplane`(`id`)
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


CREATE TABLE `Status` (
  `id` Varchar(20),
  `name` varchar(20),
  PRIMARY KEY (`id`)
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
  FOREIGN KEY (`trip_id`) REFERENCES `Trip`(`id`),
  FOREIGN KEY (`seat_id`) REFERENCES `Seat`(`id`),
  FOREIGN KEY (`passenger_id`) REFERENCES `Passenger`(`id`),
  FOREIGN KEY (`status_id`) REFERENCES `Status`(`id`)
);


CREATE TABLE `Role` (
  `id` Varchar(20),
  `title` Varchar(50),
  PRIMARY KEY (`id`)
);


CREATE TABLE `Assingnation` (
  `id` Varchar(20),
  `staff_id` Varchar(20),
  `plane_id` Varchar(20),
  `role_id` Varchar(20),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`role_id`) REFERENCES `Role`(`id`),
  FOREIGN KEY (`plane_id`) REFERENCES `Airplane`(`id`),
  FOREIGN KEY (`staff_id`) REFERENCES `Staff`(`id`)
);


CREATE TABLE `Location` (
  `id` Varchar(20),
  `country` Varchar(50),
  `state` Varchar(50),
  `city` Varchar(50),
  `name` Varchar(20),
  PRIMARY KEY (`id`)
);




DML


INSERT INTO `Staff` VALUES('s_00001', 'Anne', 'Marie', 'F');
INSERT INTO `Staff` VALUES('s_00002', 'Emily', 'Clare', 'F');
INSERT INTO `Staff` VALUES('s_00003', 'Robert', 'Anderson', 'M');
INSERT INTO `Staff` VALUES('s_00004', 'Thiago', 'Silva', 'M');
INSERT INTO `Staff` VALUES('s_00005', 'Kate', 'Winslet', 'F');
INSERT INTO `Staff` VALUES('s_00006', 'Emma', 'Lopez', 'F');
INSERT INTO `Staff` VALUES('s_00007', 'Neil', 'Ambrose', 'M');
INSERT INTO `Staff` VALUES('s_00008', 'Neil', 'Ambrose', 'M');


INSERT INTO Airport (IATA_code,location_heirachi_id,time_zone)
VALUES ('CGK','L001','+7:00'),
       ('DPS','L002','+8:00'),
       ('CMB','L003','+5:30'),
       ('HRI','L004','+5:30'),
       ('DEL','L005','+5:30'),
       ('BOM','L006','+5:30'),
       ('MAA','L007','+5:30'),
       ('BKK','L008','+7:00'),
       ('DMK','L009','+7:00'),
       ('SIN','L010','+8:00') ;
INSERT INTO Location(id,airport_name,country,state,city)
VALUES ('L001','Soekarno–Hatta International Airport','Indonesia','Banten','Tangerang'),
       ('L002','I Gusti Ngurah Rai International Airport','Indonesia','Bali','Tuban'),
       ('L003','Bandaranaike International Airport','Sri Lanka',NULL,'Katunayake'),
       ('L004','Mattala Rajapaksa International Airport','Sri Lanka',NULL,'Hambantota'),
       ('L005','Indira Gandhi International Airport','India','Delhi','Palam'),
       ('L006','Chhatrapati Shivaji Maharaj International Airport','India','Maharashtra','Mumbai'),
       ('L007','Chennai International Airport','India','Tamil Nadu','Chennai'),
       ('L008','Suvarnabhumi Airport','Thailand','Bangkok','Bang Phli'),
       ('L009','Don Mueang International Airport','Thailand','Bangkok','Sanam Bin Subdistrict'),
       ('L010','Singapore Changi Airport','Singapore','East Region','Changi');


INSERT INTO Airplane Values(1,"Boeing 737",2010,"USA",149);
INSERT INTO Airplane Values        (2,"Boeing 737",2010,"USA",149);
INSERT INTO Airplane Values        (3,"Boeing 737",2010,"USA",149);
INSERT INTO Airplane Values        (4,"Boeing 757",2005,"USA",220);
INSERT INTO Airplane Values        (5,"Boeing 757",2005,"USA",220);
INSERT INTO Airplane Values        (6,"Boeing 757",2005,"USA",220);
INSERT INTO Airplane Values        (7,"Boeing 757",2005,"USA",220);
INSERT INTO Airplane Values        (8,"Airbus A380",2000,"France",615);




INSERT INTO Seat VALUES('A1',1,'Economy');
INSERT INTO Seat VALUES('A2',1,'Economy');
INSERT INTO Seat VALUES('A3',1,'Business');
INSERT INTO Seat VALUES('A4',1,'Business');


INSERT INTO Seat VALUES('A1',2,'Economy');
INSERT INTO Seat VALUES('A2',2,'Economy');
INSERT INTO Seat VALUES('A3',2,'Business');
INSERT INTO Seat VALUES('A4',2,'Business');




INSERT INTO Seat VALUES('A1',3,'Economy');
INSERT INTO Seat VALUES('A2',3,'Economy');
INSERT INTO Seat VALUES('A3',3,'Business');
INSERT INTO Seat VALUES('A4',3,'Business');




insert into [Registered_User] values ('REG00000000000000001','S_dani','Daniel','Smith','#daniel23','1');
insert into [Registered_User] values ('REG00000000000000002','Mill_jam','James','Miller','#Jmill04','1');
insert into [Registered_User] values ('REG00000000000000003','TommyWill','Thomas','Williams','#willTom','1');
insert into [Registered_User] values ('REG00000000000000004','Adam@29','Bryan','Adams','_(thiUse','1');
insert into [Registered_User] values ('REG00000000000000005','Kelly$Clar','Kelly','Clarkson','43fjgkj','1');
insert into [Registered_User] values ('REG00000000000000006','WillSammy','Sam','Wilson','45%gjkj','1');
insert into [Registered_User] values ('REG00000000000000007','KevRichie','Kevin','Richardson','*ygh*','1');
insert into [Registered_User] values ('REG00000000000000008','JakieSam','Samantha','Jackson','/8ygkhlk','1');
insert into [Registered_User] values ('REG00000000000000009','Katie@25','Kate','Anderson','hlpqe4@rrr','1');
insert into [Registered_User] values ('REG00000000000000010','MarYAnny','Mary','Anne','$5gy45','1');


insert into [Type] values('1','General');
insert into [Type] values('2','Frequent');
insert into [Type] values('3','Gold');

insert into Passenger (id,passport_number,nationality,first_name,last_name,email,contact_number)
values ('P00000000000000000001','2019555182','India','Virat','Kohli','vking@gmail.com','+94-7509869'),
('P00000000000000000002','65964269427','Sri Lanka','Kumar','Sangakka','sangathelefthander@gmail.com','+91-8766619'),
('P00000000000000000003','17005291090','France','Emmanuel','Macron','emac@gmail.com','+33-8494758'),
('P00000000000000000004','66118358344','England','Ben','Stokes','stokes@gmail.com','+44-4697708'),
('P00000000000000000005','18759238670','France','Mabappe','Nokoya','mnokya@gmail.com','+33-7719792'),
('P00000000000000000006','9811253166','India','Rohit','Sharma','ro45@gmail.com','+91-1690313'),
('P00000000000000000007','77144316330','France','Lisa','Kate','kate@gmail.com','+33-9420277'),
('P00000000000000000008','58609686472','India','Smiriti','Mandana','mandana@gmail.com','+91-5368008'),
('P00000000000000000009','17504788539','Sri Lanka','Chamari','Atapattu','catta@gmail.com','+94-2652085'),
('P00000000000000000010','81159185564','USA','Fox','Mulder','spooky@gmail.com','+1-4345355'),
('P00000000000000000011','59548317896','France','Mari','Antonoit','ckae@gmail.com','+33-9155150'),
('P00000000000000000012','68938692317','Pakistan','Saeeda','Nazar','saeeda@gmail.com','+92-3574552'),
('P00000000000000000013','10512996991','Sri Lanka','kusal','Mendis','kmedis@gmail.com','+94-5620870'),
('P00000000000000000014','1347329337','France','Luvi','King','luvi3@gmail.com','+33-2735057'),
('P00000000000000000015','98744704053','USA','Dana','Scullt','partnerFox@gmail.com','+1-5575404'),
('P00000000000000000016','44806538852','Pakistan','Shaheen','Afridi','shaheen@gmail.com','+92-9216106');