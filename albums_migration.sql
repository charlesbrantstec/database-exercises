USE codeup_test_db;
DROP TABLE IF EXISTS albums;
CREATE TABLE albums (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist VARCHAR(30),
    name VARCHAR(30),
    release_date INT(4),
    sales FLOAT(9),
    genre VARCHAR(30),
    PRIMARY KEY (id)
);
DESCRIBE albums;
SHOW CREATE albums;