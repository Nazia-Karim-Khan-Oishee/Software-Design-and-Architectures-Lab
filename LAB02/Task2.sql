insert into reporting_db.dimension_category (id, name, total_sale, average_rating)
SELECT id, name, total_sale, average_rating
FROM kids_shop.category;

insert into reporting_db.dimension_customer (customer_id, name)
SELECT customer_id, name
FROM kids_shop.customer;

-- drop table reporting_db.dimension_employee;

insert into reporting_db.dimension_employee (employee_id, employee_name)
SELECT employee_id, employee_name
FROM kids_shop.employee;


insert into reporting_db.dimension_invoice (invoice_id, customer_id, employee_id, date, total_price)
SELECT invoice_id, customer_id, employee_id, date, total_price
FROM kids_shop.invoice;

insert into reporting_db.dimension_product (id, name, category_id, average_rating, sale_count)
SELECT id, name, category_id,average_rating, sale_count
FROM kids_shop.product;


insert into reporting_db.dimension_rating (id, product_id, customer_id, is_up_vote, rating_timestamp)
SELECT id, product_id, customer_id, is_up_vote, rating_timestamp
FROM kids_shop.rating;

insert into reporting_db.fact_sale (id, product_id, invoice_id, unit_price, category_id, seller_id, count, date)
SELECT id, product_id, invoice_id, unit_price, category_id, seller_id, count, date
FROM kids_shop.sale;


use kids_shop;
INSERT INTO change_log (created_by, script_name, script_details)
VALUES ('nazia', '002_task2.sql', 'copying_kids_shop_db');
use reporting_db;
