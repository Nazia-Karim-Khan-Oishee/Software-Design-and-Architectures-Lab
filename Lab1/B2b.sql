DELIMITER //

CREATE PROCEDURE get_sale_per_category(
    IN employee_id INT
)
BEGIN
    SELECT category_id, SUM(unit_price * count) AS total_sales
    FROM Sale
    WHERE seller_id = employee_id
    GROUP BY category_id;
END //

DELIMITER ;

CALL get_sale_per_category(2);