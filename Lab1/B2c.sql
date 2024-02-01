-- DROP PROCEDURE IF EXISTS set_product_category;


DELIMITER //

CREATE PROCEDURE set_product_category(
    IN product_id INT,
    IN in_category_id INT
)
BEGIN
    UPDATE product
    SET category_id = in_category_id
    WHERE id = product_id;
END //

DELIMITER ;

CALL set_product_category(1,3);