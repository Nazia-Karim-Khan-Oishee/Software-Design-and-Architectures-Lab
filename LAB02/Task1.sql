create database reporting_db;
use reporting_db;

create table dimension_employee(
employee_id  int not null auto_increment primary key,
employee_name varchar(100)
);

create table dimension_customer(
customer_id  int not null auto_increment primary key,
name varchar(100)
);

create table dimension_invoice(
invoice_id int auto_increment primary key,
customer_id int,
employee_id int,
date datetime default current_timestamp,
total_price decimal(10,2)
);

-- ALTER TABLE invoice
-- CHANGE COLUMN empluyee_id employee_id INT;


create table dimension_product(
id int auto_increment primary key,
name varchar(100),
category_id int,
average_rating decimal(10,2),
sale_count decimal,
price decimal(10,2) default 0
);

create table dimension_category(
id int auto_increment primary key,
name varchar(100),
total_sale decimal(10,2),
average_rating decimal(10,2) default 0
);

create table dimension_rating(
id int auto_increment primary key,
product_id varchar(100),
customer_id varchar(100),
is_up_vote decimal,
rating_timestamp datetime default current_timestamp
);

ALTER TABLE dimension_rating
CHANGE COLUMN product_id product_id INT;

ALTER TABLE dimension_rating
CHANGE COLUMN customer_id customer_id INT;


create table fact_sale(
id int auto_increment primary key,
product_id INT,
seller_id INT,
invoice_id INT,
unit_price decimal(10,2),
count int,
category_id int,
date datetime default current_timestamp,
foreign key (product_id) references dimension_product(id),
foreign key (seller_id) references dimension_employee(employee_id),
foreign key (invoice_id) references dimension_invoice(invoice_id)
);

-- drop table fact_sale;

use kids_shop;
INSERT INTO change_log (created_by, script_name, script_details)
VALUES ('nazia', '001_task1.sql', 'created_reporing_db');
use reporting_db;

