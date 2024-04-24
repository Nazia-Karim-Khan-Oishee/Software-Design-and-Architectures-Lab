-- a
DELIMITER //
CREATE PROCEDURE reporting_db.get_top_3_products()
BEGIN
select product_id, AVG(is_up_vote) AS avg_rating
from dimension_rating
group by product_id
order by avg_rating desc
limit 3;
END //
DELIMITER ;

CALL reporting_db.get_top_3_products();

-- b
DELIMITER //
CREATE PROCEDURE reporting_db.get_top_2_categories()
BEGIN
select id as category_id,  average_rating
from dimension_category
group by id
order by average_rating desc
limit 2;
END //
DELIMITER ;

CALL reporting_db.get_top_2_categories();

-- c

-- DROP PROCEDURE IF EXISTS get_top_product_by_duration;

DELIMITER //
CREATE PROCEDURE reporting_db.get_top_product_by_duration(IN start DATE, IN end DATE)
BEGIN
    select product_id, AVG(is_up_vote) AS avg_rating
    from dimension_rating r 
	join dimension_product p on r.product_id = p.id
    where rating_timestamp BETWEEN start and end
    group by  product_id
    order by  avg_rating DESC
    limit 1;
END //
DELIMITER ;


CALL reporting_db.get_top_product_by_duration('2024-02-10', '2024-02-15');

-- d
-- DROP PROCEDURE IF EXISTS get_top_product_by_category;

DELIMITER //
create procedure get_top_product_by_category(IN p_category_id INT)
BEGIN
    select product_id, AVG(r.is_up_vote) as avg_rating
    from dimension_rating r
    join dimension_product p on r.product_id = p.id
    where p.category_id = p_category_id
    group by  r.product_id
    order by  avg_rating desc
    limit 1;
END //
DELIMITER ;

CALL reporting_db.get_top_product_by_category(1);

-- e

DROP PROCEDURE IF EXISTS get_top_employee_by_duration;

DELIMITER //
CREATE PROCEDURE get_top_employee_by_duration(IN start_date DATE, IN end_date DATE)
BEGIN
    select e.employee_id, e.employee_name, SUM(fs.unit_price * fs.count) AS total_sales
    from fact_sale fs
    join dimension_employee e ON fs.seller_id = e.employee_id
    where fs.date BETWEEN start_date AND end_date
    group by  fs.seller_id
    order by total_sales desc
    LIMIT 1;
END //

DELIMITER ;

CALL reporting_db.get_top_employee_by_duration('2024-02-11', '2024-02-15');
