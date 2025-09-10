
/*Tabloyu oluşturdum*/

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(150) NOT NULL,
    genre VARCHAR(50),
    price DECIMAL(8,2) CHECK (price >= 0),
    stock_qty INT CHECK (stock_qty >= 0),
    published_year INT CHECK (published_year BETWEEN 1900 AND 2025),
    added_at DATE NOT NULL
);


/*Veri Ekledim.*/

INSERT INTO books (book_id, title, author, genre, price, stock_qty, published_year, added_at) VALUES
(1, 'Kayıp Zamanın İzinde', 'M. Proust', 'roman', 129.90, 25, 1913, '2025-08-20'),
(2, 'Simyacı', 'P. Coelho', 'roman', 89.50, 40, 1988, '2025-08-21'),
(3, 'Sapiens', 'Y. N. Harari', 'tarih', 159.00, 18, 2011, '2025-08-25'),
(4, 'İnce Memed', 'Y. Kemal', 'roman', 99.90, 12, 1955, '2025-08-22'),
(5, 'Körlük', 'J. Saramago', 'roman', 119.00, 7, 1995, '2025-08-28'),
(6, 'Dune', 'F. Herbert', 'bilim', 149.00, 30, 1965, '2025-09-01'),
(7, 'Hayvan Çiftliği', 'G. Orwell', 'roman', 79.90, 55, 1945, '2025-08-23'),
(8, '1984', 'G. Orwell', 'roman', 99.00, 35, 1949, '2025-08-24'),
(9, 'Nutuk', 'M. K. Atatürk', 'tarih', 139.00, 20, 1927, '2025-08-27'),
(10, 'Küçük Prens', 'A. de Saint-Exupéry', 'çocuk', 69.90, 80, 1943, '2025-08-26'),
(11, 'Başlangıç', 'D. Brown', 'roman', 109.00, 22, 2017, '2025-09-02'),
(12, 'Atomik Alışkanlıklar', 'J. Clear', 'kişisel gelişim', 129.00, 28, 2018, '2025-09-03'),
(13, 'Zamanın Kısa Tarihi', 'S. Hawking', 'bilim', 119.50, 16, 1988, '2025-08-29'),
(14, 'Şeker Portakalı', 'J. M. de Vasconcelos', 'roman', 84.90, 45, 1968, '2025-08-30'),
/*
(15, 'Bir İdam Mahkûmunun Son Günü', 'V. Hugo', 'roman', 74.90, 26, 1829, '2025-08-31');
burda 1900 ile 2025 arasında bir tarih olmadığı için hata aldım bu yüzden aşağıdaki gibi yeniden düzenledim.
*/
(15, N'Bir İdam Mahkûmunun Son Günü', N'V. Hugo', N'roman', 74.90, 26, 1900, '2025-08-31');


/*GÖREVLER:*/
/*1. Fiyatı artan şekilde tüm kitaplar*/

SELECT title, author, price
FROM books
ORDER BY price ASC;


/*2. Türü roman olanları A→Z title sırasıyla*/

SELECT title, author, price
FROM books
ORDER BY price ASC;


/*3. Fiyatı 80–120 arasındaki kitaplar*/

SELECT *
FROM books
WHERE price BETWEEN 80 AND 120;


/*4. Stok < 20 olanlar*/

SELECT title, stock_qty
FROM books
WHERE stock_qty < 20;


/*5. Title içinde "zaman" geçenler*/

SELECT *
FROM books
WHERE LOWER(title) LIKE '%zaman%';


/*6. Türü roman veya bilim olanlar*/

SELECT *
FROM books
WHERE genre IN ('roman', 'bilim');


/*7. 2000 ve sonrası çıkanlar, yeniden eskiye*/
SELECT *
FROM books
WHERE published_year >= 2000
ORDER BY published_year DESC;


/*8. Son 10 gün içinde eklenen kitaplar*/

SELECT *
FROM books
WHERE added_at >= DATEADD(DAY, -10, GETDATE());


/*9. En pahalı 5 kitap*/

SELECT TOP 5 *
FROM books
ORDER BY price DESC;


/*10. Stok 30–60 arası, fiyata göre artan sıralı*/

SELECT *
FROM books
WHERE stock_qty BETWEEN 30 AND 60
ORDER BY price ASC;
