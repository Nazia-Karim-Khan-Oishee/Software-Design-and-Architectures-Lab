ALTER TABLE product add column sale_count int;

ALTER TABLE sale add column seller_id int;
ALTER TABLE sale add foreign key(seller_id) 
references employee(employee_id);
ALTER TABLE sale add column date timestamp;

ALTER TABLE Invoice add column total_price decimal(10,2);

ALTER TABLE category add column average_rating numeric;

ALTER TABLE category add column total_sale decimal (10,2);

select * from category;

alter table category add foreign key(average_rating)
references product(average_rating);

