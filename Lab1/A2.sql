create table employee (
employee_id int not null auto_increment primary key
);
ALTER TABLE employee add column employee_name varchar(100);
-- INSERT INTO employee (employee_name) VALUES
-- ('Employee1'),
-- ('Employee2'),
-- ('Employee3'),
-- ('Employee4');


create table Invoice(
invoice_id int not null auto_increment primary key,
customer_id int not null,
employee_id int not null,
date datetime,
foreign key(customer_id) references customer(customer_id),
foreign key(employee_id) references employee(employee_id)

);

create table sale (
    id int not null auto_increment primary key,
    product_id int not null,
    invoice_id int not null,
    unit_price decimal(10, 2) not null,
    count int not null,
    foreign key(product_id) references product(id),
    foreign key(invoice_id) references Invoice(invoice_id)
);

-- INSERT INTO Sale (product_id, invoice_id, unit_price, count,
--  date, seller_id, category_id) VALUES
-- (1, 1, 10, 2, '2024-02-15 10:30:00', 1, 1),
-- (2, 2, 20, 1, '2024-02-15 11:45:00', 2, 2),
-- (3, 3, 30, 3, '2024-02-15 12:30:00', 3, 3),
-- (4, 1, 40, 2, '2024-02-15 14:15:00', 4, 1),
-- (5, 2, 40.5, 1, '2024-02-15 15:30:00', 1, 2);


