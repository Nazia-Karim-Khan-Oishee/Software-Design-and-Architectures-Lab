DROP table customer;

CREATE TABLE customer (
    customer_id int not null auto_increment primary key ,
    name VARCHAR(100) not null
);

-- INSERT INTO customer (name) VALUES
-- ('John Doe'),
-- ('Jane Smith'),
-- ('Alice'),
-- ('Bob ');

ALTER TABLE rating add COLUMN customer_id INT;
alter table rating add foreign key (customer_id)
references customer(customer_id);

ALTER TABLE rating add COLUMN rating_timestamp timestamp;


