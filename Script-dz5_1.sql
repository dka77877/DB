--Задание 1--
CREATE table users	(
id serial primary key,
name varchar(255) comment 'Имя покупателяэ',
birthday_at date comment 'дата рождения',
created_at DATETIME,
updated_at DATETIME
) COMMENT = 'Покупатели';
INSERT into
users (name, birthday_at, created_at, updated_at)
values
('Геннадий', '1990-10-05', NULL, NULL),
('Тамара', '1984-04-23', NULL, NULL),
('Иван', '1974-04-13', NULL, NULL),
('Петр', '1945-11-02', NULL, NULL),
('Светлана', '2001-08-27', NULL, NULL);
SELECT * FROM users;
UPDATE users SET created_at = NOW(), updated_at = NOW();
--Задание 2--
CREATE table users2	(
id serial primary key,
name varchar(255) comment 'Имя покупателяэ',
birthday_at date comment 'дата рождения',
created_at VARCHAR(255),
updated_at VARCHAR(255)
) COMMENT = 'Покупатели';
INSERT into
users2 (name, birthday_at, created_at, updated_at)
values
('Геннадий', '1990-10-05', '12.05.2018 10:01',  '12.05.2018 10:01'),
('Тамара', '1984-04-23', '01.11.2019 14:32', '01.11.2019 14:32'),
('Иван', '1974-04-13', '17.10.2019 17:51', '17.10.2019 17:51'),
('Петр', '1945-11-02', '22.01.2020 07:45', '22.01.2020 07:45'),
('Светлана', '2001-08-27', '17.08.2018 21:16', '17.08.2018 21:16');
SELECT * FROM users2;
SELECT STR_TO_DATE(created_at, '%d.%m.%Y %k:%i') FROM users2;
UPDATE 
	users2 
SET
	created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'),
	updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%i');
DESCRIBE users2;
ALTER TABLE
users2
CHANGE
created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE
users2
CHANGE
updated_at updated_at DATETIME DEFAULT CURRENT_TIMESTAMP;

DROP TABLE storehouses_products;
CREATE TABLE storehouses_products (
 id SERIAL PRIMARY KEY,
 storehouse_id INT UNSIGNED,
 product_id INT UNSIGNED,
 value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
 created_at DATETIME  DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';
INSERT INTO
 storehouses_products (storehouse_id, product_id, value)
VALUES
(1, 343, 0),
(1, 464, 2554),
(1, 3345, 0),
(1, 826, 30),
(1, 255, 500),
(1, 76, 1);
SELECT * FROM storehouses_products ORDER BY value;
SELECT id, value, IF(value > 0, 0, 1) AS sort FROM storehouses_products ORDER BY value;

SELECT * FROM users2;
SELECT name, DATE_FORMAT(birthday_at, '%M') FROM users2;
SELECT name FROM users2 WHERE DATE_FORMAT(birthday_at, '%M') IN ('april', 'august');

SELECT 
	TIMESTAMPDIFF(YEAR, birthday_at, NOW() ) AS age
	FROM users2;
SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW() )) AS age
	FROM users2; 

SELECT name, birthday_at FROM users2;
SELECT 	MONTH (birthday_at), DAY(birthday_at) FROM users2;
SELECT 	YEAR (NOW()), MONTH (birthday_at), DAY(birthday_at) FROM users2;
SELECT 	CONCAT_WS('-', YEAR (NOW()), MONTH (birthday_at), DAY(birthday_at)) FROM users2;
SELECT 	DATE(CONCAT_WS('-', YEAR (NOW()), MONTH (birthday_at), DAY(birthday_at))) FROM users2;
SELECT 	DATE_FORMAT(DATE(CONCAT_WS('-', YEAR (NOW()), MONTH (birthday_at), DAY(birthday_at))), '%W') AS day FROM users2;
SELECT 	DATE_FORMAT(DATE(CONCAT_WS('-', YEAR (NOW()), MONTH (birthday_at), DAY(birthday_at))), '%W') AS day FROM users2 GROUP BY day;
SELECT 	DATE_FORMAT(DATE(CONCAT_WS('-', YEAR (NOW()), MONTH (birthday_at), DAY(birthday_at))), '%W') AS day, COUNT(*) AS total FROM users2 GROUP BY day;

