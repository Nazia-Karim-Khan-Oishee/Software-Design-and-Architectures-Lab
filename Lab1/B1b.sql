DROP PROCEDURE IF EXISTS add_rating;

DELIMITER //

CREATE PROCEDURE add_rating(in productid int,
    in ratingvalue int,in customerid int)
BEGIN
    INSERT INTO rating (product_id, is_up_vote, customer_id, 
    rating_timestamp)
    VALUES (productid, ratingvalue, 
    customerid, CURRENT_TIMESTAMP());

    UPDATE product
    SET average_rating = (
        SELECT AVG(is_up_vote)
        FROM rating
        WHERE product_id = productid
    )
    WHERE id = productid;
END //

DELIMITER ;


CALL add_rating(4, 5, 1);



