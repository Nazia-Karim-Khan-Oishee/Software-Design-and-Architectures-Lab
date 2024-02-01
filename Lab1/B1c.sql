DELIMITER //

CREATE PROCEDURE get_average_rating(
    IN product_id INT,
    OUT average_rating DECIMAL(10, 2)
)
BEGIN
    SELECT AVG(is_up_vote)
    INTO average_rating
    FROM rating
    WHERE product_id = product_id;
END //

DELIMITER ;

CALL get_average_rating(5, @result);
SELECT @result AS average_rating;
