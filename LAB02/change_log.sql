-- use kids_shop; 

CREATE TABLE change_log (
    id int auto_increment primary key,
    applied_at timestamp default current_timestamp,
    created_by varchar(255),
    script_name varchar(255),
    script_details TEXT
);

INSERT INTO change_log (created_by, script_name, script_details)
VALUES ('nazia', '000_change_log.sql', 'change_log_file');

select * from kids_shop.change_log;