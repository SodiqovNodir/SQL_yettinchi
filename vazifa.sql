-- ------------------------------< Jadval O'chirish >---------------------------------

DROP TABLE IF EXISTS authors CASCADE;
DROP TABLE IF EXISTS publishers CASCADE;
DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS book_reviews;

-- ------------------------------< Jadval Yaratish >---------------------------------

CREATE TABLE IF NOT EXISTS authors(
	author_id SERIAL PRIMARY KEY,
	author_name VARCHAR(50) NOT NULL,
	author_brith_day DATE,
	author_country VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS publishers(
	pub_id SERIAL PRIMARY KEY,
	pub_name VARCHAR(50) NOT NULL,
	pub_appeared INTEGER,
	pub_country VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS books(
	book_id SERIAL PRIMARY KEY,
	book_name VARCHAR(50) NOT NULL,
	author_id INTEGER REFERENCES authors(author_id),
	pub_id INTEGER REFERENCES publishers(pub_id),
	book_genre VARCHAR(50),
	book_pub_day INTEGER,
	book_price NUMERIC(10, 2)
);

CREATE TABLE IF NOT EXISTS book_reviews(
	book_review_id SERIAL PRIMARY KEY,
	book_id INTEGER REFERENCES books(book_id),
	book_com_text VARCHAR(150),
	book_evaluation INTEGER CHECK(book_evaluation >= 0 AND book_evaluation <= 100)
);

-- ------------------------------< Ma'lumotlarni Qo'shish >---------------------------------

INSERT INTO authors(author_name, author_brith_day, author_country) VALUES
('Alisher Navoiy', '1441-02-09', 'Hirot'),
('Jaloliddin Rumi', '1207-09-30', 'hozirgi (Afg‘oniston)'),
('William Shakespeare', '1564-04-23', 'Angliya'),
('Langston Hughes', '1902-02-01', 'AQSh'),
('Zahiriddin Muhammad Bobur', '1483-02-14', 'Andijon');

INSERT INTO publishers(pub_name, pub_appeared, pub_country) VALUES
('O‘zbekistonda Sovet nashriyoti', '1920', 'Toshkent'),
(' Germaniya (Mainz)', '1440', 'Mainz'),
('Raqamli Nashriyot Va Zamonaviy Matbaa', '1939', 'AQSh'),
('Matbaaning Joriy Etilishi', '1476', 'London'),
('Renessans Davri', '1483', 'Venetsiya');

INSERT INTO books(book_name, author_id, pub_id, book_genre, book_pub_day, book_price) VALUES
('Xamsa', 1, 1, 'Doston', '1831', '200000'),
('Masnavi', 2, 3, 'Doston', '1831', '200000'),
('Guliston', 4, 2, 'Doston', '1831', '200000'),
('Leyli va Majnun', 5, 3, 'Doston', '1831', '200000'),
('Hamlet', 3, 4, 'Drama', '1600', '422000'),
('Ruboyot', 2, 5, 'Doston', '1831', '200000'),
('Poems', 1, 3, 'Doston', '1831', '200000'),
('The Weary Blues', 2, 1, 'Doston', '1831', '200000'),
('Canto General', 5, 3, 'Doston', '1831', '200000'),
('Faust', 4, 2, 'Doston', '1831', '200000');

INSERT INTO book_reviews(book_id, book_com_text, book_evaluation) VALUES
(4, 'yaxshi', 89),
(7, 'ALO', 96),
(3, 'yaxshi', 84),
(9, 'Juda Yaxshi', 98),
(1, 'Eng yaxshisi', 100);

-- --------------------------------------< SQL So'rovlarni Bajarish >--------------------------------------------

-- --------------------------------------< Select qilish >---------------------------------------------------

SELECT * FROM authors;
SELECT * FROM publishera;
SELECT * FROM books;
SELECT * FROM book_reviews;

-- --------------------------------------< Column Aliases qilish >---------------------------------------------------

SELECT author_name ||' tug''ilgan '|| author_country as muolif_haqida, author_brith_day FROM authors;
SELECT pub_name ||' joylashuvi '|| pub_country as nashiryot_haqida, pub_appeared FROM publishers;
SELECT book_name ||' janri '|| book_genre as kitob_haqida, book_price FROM books;
SELECT book_com_text ||' natija '|| book_evaluation as reting FROM book_reviews;

-- --------------------------------------< Order By qilish >-----------------------------------

SELECT * FROM authors
ORDER BY author_name;

SELECT * FROM publishers
ORDER BY pub_name;

SELECT * FROM books
ORDER BY book_name;

SELECT * FROM book_reviews
ORDER BY book_evaluation;

-- --------------------------------------< Where qilish >-----------------------------------

SELECT * FROM authors 
WHERE author_id = 3;

SELECT * FROM publishers 
WHERE pub_id = 1;

SELECT * FROM books 
WHERE book_id = 8;

SELECT * FROM book_reviews 
WHERE book_com_text = 'yaxshi';

-- --------------------------------------< Limit qilish >-----------------------------------

SELECT * FROM authors 
LIMIT 2;

SELECT * FROM publishers 
LIMIT 2;

SELECT * FROM books 
LIMIT 2;

SELECT * FROM book_reviews 
LIMIT 2;

-- --------------------------------------< In qilish >-----------------------------------

SELECT * FROM authors WHERE author_country IN ('Hirot', 'Angliya');
SELECT * FROM publishers WHERE pub_country IN ('AQSH', 'Angliya');
SELECT * FROM books WHERE book_genre IN ('Doston', 'Drama');
SELECT * FROM book_reviews WHERE book_com_text IN ('yaxshi', 'Alo');

-- --------------------------------------< Between qilish >-----------------------------------

SELECT * FROM authors WHERE author_id BETWEEN 2 AND 5;
SELECT * FROM publishers WHERE pub_id BETWEEN 2 AND 5;
SELECT * FROM books WHERE book_price BETWEEN 2000 AND 200000;
SELECT * FROM book_reviews WHERE book_review_id BETWEEN 2 AND 5;

-- --------------------------------------< Like qilish >-----------------------------------

SELECT * FROM authors WHERE author_name LIKE 'Alisher';
SELECT * FROM publishers WHERE pub_country LIKE 'Angliya';
SELECT * FROM books WHERE book_name LIKE 'Hamlet';
SELECT * FROM book_reviews WHERE book_com_text LIKE 'Alo';

-- --------------------------------------< Is null qilish >-----------------------------------

SELECT * FROM authors WHERE author_country IS NULL;
SELECT * FROM publishers WHERE pub_appeared IS NULL;
SELECT * FROM books WHERE book_genre IS NULL;
SELECT * FROM book_reviews WHERE book_com_text IS NULL;

-- --------------------------------------< Join qilish >-----------------------------------

SELECT book_name, author_name, pub_name, book_price FROM books 
JOIN authors ON books.author_id = authors.author_id
JOIN publishers ON books.pub_id = publishers.pub_id












