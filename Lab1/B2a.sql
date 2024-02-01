ALTER TABLE sale add column category_id int;


select * from category;

-- ALTER TABLE category
-- DROP COLUMN total_price;


ALTER TABLE sale add foreign key(category_id) 
references category(id);

