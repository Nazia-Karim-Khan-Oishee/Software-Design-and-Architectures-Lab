ALTER TABLE vote RENAME TO rating;
ALTER TABLE rating MODIFY COLUMN is_up_vote INT;


UPDATE rating SET is_up_vote = 1 WHERE is_up_vote = 0;

UPDATE rating SET is_up_vote = 5 WHERE is_up_vote = 1;


ALTER TABLE product CHANGE COLUMN votes average_rating numeric;  

