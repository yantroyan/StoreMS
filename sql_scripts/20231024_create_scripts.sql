create database StoreMS;

create table category(
id int not null primary key auto_increment,
name varchar(20),
created timestamp,
is_active boolean
);

create table product (
id int not null primary key auto_increment,
name varchar(20),
description varchar (120),
category_id int,
unit_price double,
created timestamp,
is_active boolean,
FOREIGN KEY (category_id) REFERENCES CATEGORY(id)
ON UPDATE CASCADE ON DELETE RESTRICT
);

create table city(
id int not null primary key auto_increment,
name varchar(20),
);

create table store(
id int not null primary key auto_increment,
name varchar(20),
city_id int,
address varchar(45),
FOREIGN KEY (city_id) REFERENCES city(id)
ON UPDATE CASCADE ON DELETE RESTRICT
);

create table sales (
id int not null primary key auto_increment,
store_id int,
product_id int,
sold_on timestamp,
amount int,
total_price double,
FOREIGN KEY (store_id) REFERENCES store(id)
    ON UPDATE CASCADE ON DELETE RESTRICT
FOREIGN KEY (product_id) REFERENCES product(id)
    ON UPDATE CASCADE ON DELETE RESTRICT

);
INSERT INTO `category`(`name`, `created`, `is_active`) VALUES ('milk','2023-10-24', 1);
INSERT INTO `category`(`name`, `created`, `is_active`) VALUES ('meat','2023-10-24', 1);
INSERT INTO `category`(`name`, `created`, `is_active`) VALUES ('vegetables','2023-10-24', 1);
INSERT INTO `category`(`name`, `created`, `is_active`) VALUES ('fruits','2023-10-24', 0);

INSERT INTO `city`(`name`) VALUES ('Sofia');
INSERT INTO `city`(`name`) VALUES ('Plovdiv');
INSERT INTO `city`(`name`) VALUES ('Varna');
INSERT INTO `city`(`name`) VALUES ('Troyan');

INSERT INTO `store`(`name`, `city_id`, `address`) VALUES ('Avanti','1','bul. Bulgaria 16');
INSERT INTO `store`(`name`, `city_id`, `address`) VALUES ('Lidl','3','bul. Shipka 10');
INSERT INTO `store`(`name`, `city_id`, `address`) VALUES ('Billa','2','bul. Kuma Lisa 118');

INSERT INTO `product`(`name`, `description`, `category_id`, `unit_price`, `created`, `is_active`) VALUES ('Vereya Cheese','Slivenskiqt kashkaval',1,12.6,'2023-10-24 10:50:00',1);
INSERT INTO `product`(`name`, `description`, `category_id`, `unit_price`, `created`, `is_active`) VALUES ('Sudjuk','Svinsko izdeliq',2,6.50,'2023-10-24 10:50:00',1);
INSERT INTO `product`(`name`, `description`, `category_id`, `unit_price`, `created`, `is_active`) VALUES ('Chushki','ot s. Oreshak',3,8,'2023-10-24 10:50:00',1);
INSERT INTO `product`(`name`, `description`, `category_id`, `unit_price`, `created`, `is_active`) VALUES ('Chereshi','hrushtqlki',4,7,'2023-10-24 10:50:00',1);