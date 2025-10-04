-- Veritaban�n� olu�turdum.
CREATE DATABASE SotaApp;

--Veritabanda de�ilken veritaban�na ge�i� yapmak i�in kulland�m.
USE SotaApp;

--M��teri Tablosunu olu�turdum.
CREATE TABLE Musteri(
id INT IDENTITY(1,1) PRIMARY KEY,
ad NVARCHAR(50),
soyad NVARCHAR(50),
email NVARCHAR(50),
sehir NVARCHAR(50),
kayit_tarihi DATETIME DEFAULT GETDATE()
);

--KAtegori Tablosunu olu�turdum
CREATE TABLE Kategori(
id INT IDENTITY(1,1) PRIMARY KEY,
ad NVARCHAR(50)
);

--Sat�c� Tablosunu olu�turdum
CREATE TABLE Satici(
id INT IDENTITY(1,1) PRIMARY KEY,
ad NVARCHAR(50),
adres NVARCHAR(50)
);

--�r�n Tablosunu olu�turdum
CREATE TABLE Urun(
id INT IDENTITY(1,1) PRIMARY KEY,
ad NVARCHAR(50),
fiyat DECIMAL(10,2),
stok INT,
kategori_id INT,
satici_id INT,
FOREIGN KEY (kategori_id) REFERENCES Kategori(id),
FOREIGN KEY (satici_id) REFERENCES Satici(id)
);

--Sipari� Tablosunu olu�turdum
CREATE TABLE Siparis(
id INT IDENTITY(1,1) PRIMARY KEY,
musteri_id INT,
tarih DATETIME DEFAULT GETDATE(),
toplam_tutar DECIMAL(10,2),
odeme_turu NVARCHAR(50)
FOREIGN KEY (musteri_id) REFERENCES Musteri(id)
);

--Sipari� Detay Tablosunu olu�turdum
CREATE TABLE Siparis_Detay(
id INT IDENTITY(1,1) PRIMARY KEY,
siparis_id INT,
urun_id INT,
adet INT,
fiyat DECIMAL(10,2),
FOREIGN KEY (siparis_id) REFERENCES Siparis(id),
FOREIGN KEY (urun_id) REFERENCES Urun(id)
);

--Stok azald���nda g�ncelleme sorgusu (Buray� pek anlayamad�m ama bu g�ncelleme �eklinin eklemek istedim.)
UPDATE Urun
SET stok = stok - 1
WHERE id = 1;

--Kategori tablosuna veri ekleme, silme ve g�ncelleme i�lemleri yapt�m
INSERT INTO Kategori (ad) VALUES
('Telefon'),
('Tablet'),
('Laptop'),
('Bilgisayar'),
('Televizyon'),
('Ak�ll� Saat'),
('Aksesuar');

DELETE FROM Kategori WHERE ad = 'Bilgisayar';

UPDATE Kategori SET ad = 'Di�er �r�nler' WHERE ad = 'Aksesuar';

INSERT INTO Kategori (ad) VALUES 
('Kulakl�k');

--SAt�c� tablosuna veri ekleme.
INSERT INTO Satici (ad, adres) VALUES
('Apple','�stanbul'),
('Apple','Ankara'),
('Apple','�zmir'),
('Apple','Mu�la'),
('Apple','Antalya'),
('Apple','Tekirda�');

--M��teri tablosuna veri ekleme
INSERT INTO Musteri VALUES
('Ahmet', 'Y�lmaz', 'ahmet@example.com', '�stanbul', '2025-01-15'),
('Ay�e', 'Demir', 'ayse@example.com', 'Ankara', '2025-03-10'),
('Mehmet', 'Kaya', 'mehmet@example.com', '�zmir', '2025-04-05'),
('Elif', '�etin', 'elif@example.com', 'Tekirda�', '2025-05-20'),
('Merve', '�avu�o�lu', 'merve@example.com', '�stanbul', '2025-06-02'),
('Murat', 'Han', 'murat@example.com', 'Ankara', '2025-06-02'),
('Yi�it', 'Kaplan', 'yigit@example.com', 'Antalya', '2025-06-02'),
('R�meysa', 'Terzi', 'rumeysa@example.com', 'Mu�la', '2025-06-02'),
('Neslihan', 'Berber', 'neslihan@example.com', 'Mu�la', '2025-06-02');

--�r�n tablosuna veri ekleme
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES
('iPhone 17 Pro', 150000.00, 10, 1, 1),
('iPhone 17 Pro Max', 170000.00, 8, 1, 2),
('iPhone 17', 120000.00, 15, 1, 2),
('iPhone 16 Pro', 135000.00, 12, 1, 4),
('iPhone 16', 110000.00, 20, 1, 5),
('iPhone SE (2025)', 75000.00, 25, 1, 5),
('iPad Pro 13-inch (M4)', 95000.00, 10, 2, 5),
('iPad Pro 11-inch (M4)', 85000.00, 12, 2, 1),
('iPad Air (M2)', 65000.00, 18, 2, 6),
('iPad 11th Gen', 40000.00, 20, 2, 6),
('iPad Mini 7', 50000.00, 15, 2, 6),
('MacBook Pro 16-inch (M4 Pro)', 185000.00, 7, 3, 2),
('MacBook Pro 14-inch (M4)', 165000.00, 10, 3, 4),
('MacBook Air 15-inch (M3)', 95000.00, 12, 3, 1),
('MacBook Air 13-inch (M3)', 85000.00, 15, 3, 3),
('iMac 24-inch (M4)', 110000.00, 8, 3, 4),
('Mac Studio (M4 Ultra)', 250000.00, 5, 3, 4),
('Mac Mini (M3)', 60000.00, 20, 3, 2),
('Apple Watch Ultra 3', 65000.00, 10, 6, 3),
('Apple Watch Series 10', 35000.00, 25, 6, 6),
('Apple Watch SE 3', 25000.00, 30, 6, 1),
('AirPods Pro 3', 12000.00, 40, 8, 5),
('AirPods Max 2', 25000.00, 15, 8, 1),
('AirPods 4', 8000.00, 50, 8, 5),
('Apple Vision Pro 2', 180000.00, 5, 7, 4),
('Apple Pencil Pro', 6000.00, 30, 7, 2),
('Magic Keyboard for iPad Pro', 8500.00, 20, 7, 3),
('MagSafe Charger', 2500.00, 50, 7, 1),
('HomePod 2', 12000.00, 15, 5, 1),
('Apple TV 4K (3rd Gen)', 7000.00, 25, 5, 1);

--Sipari� tablosuna veri ekleme
INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES
(1, 150000.00, 'Kredi Kart�'),  
(2, 135000.00, 'Banka Kart�'),  
(3, 95000.00,  'Nakit'),         
(4, 47000.00,  'Kredi Kart�'),   
(5, 77000.00,  'Havale'),       
(6, 185000.00, 'Kredi Kart�'),   
(7, 25000.00,  'Nakit'),        
(8, 21000.00,  'Kredi Kart�'),   
(9, 192000.00, 'Havale');  

--Sipari� Detay tablosuna veri ekleme
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES
-- Sipari� 1 
(1, 1, 1, 150000.00),
-- Sipari� 2 
(2, 4, 1, 135000.00),
-- Sipari� 3 
(3, 13, 1, 95000.00),
-- Sipari� 4 
(4, 9, 1, 65000.00),   
(4, 26, 1, 6000.00),
-- Sipari� 5 
(5, 20, 1, 35000.00),
(5, 22, 1, 12000.00),
-- Sipari� 6 
(6, 12, 1, 185000.00),
-- Sipari� 7 
(7, 21, 1, 25000.00),
-- Sipari� 8 
(8, 23, 1, 25000.00),
(8, 28, 1, 2500.00),
-- Sipari� 9 
(9, 2, 1, 170000.00),
(9, 7, 1, 95000.00);



--En �ok sipari� veren 5 m��teri sorgusu.
SELECT TOP 5 m.ad, m.soyad, COUNT(s.id) AS siparis_sayisi
FROM Musteri m
JOIN Siparis s ON m.id = s.musteri_id
GROUP BY m.ad, m.soyad
ORDER BY siparis_sayisi DESC;

--En �ok sat�lan �r�nler sorgusu.
SELECT TOP 5 u.ad, SUM(sd.adet) AS toplam_adet
FROM Urun u
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY u.ad
ORDER BY toplam_adet DESC;


--En y�ksek cirosu olan sat�c�lar sorgusu.
SELECT TOP 5 s.ad AS satici_adi, SUM(sd.adet * sd.fiyat) AS toplam_ciro
FROM Satici s
JOIN Urun u ON s.id = u.satici_id
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY s.ad
ORDER BY toplam_ciro DESC;

--�ehirlere g�re m��teri say�s� sorgusu.
SELECT sehir, COUNT(*) AS musteri_sayisi
FROM Musteri
GROUP BY sehir
ORDER BY musteri_sayisi DESC;

-- Kategori bazl� toplam sat��lar sorgusu.
SELECT k.ad AS kategori, SUM(sd.adet * sd.fiyat) AS toplam_satis
FROM Kategori k
JOIN Urun u ON k.id = u.kategori_id
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY k.ad
ORDER BY toplam_satis DESC;

--Aylara g�re sipari� say�s� sorgusu.
SELECT FORMAT(tarih, 'yyyy-MM') AS ay, COUNT(*) AS siparis_sayisi
FROM Siparis
GROUP BY FORMAT(tarih, 'yyyy-MM')
ORDER BY ay;

-- Sipari�lerde m��teri bilgisi + �r�n bilgisi + sat�c� bilgisi sorgusu.
SELECT s.id AS siparis_id, m.ad + ' ' + m.soyad AS musteri_adi,
       u.ad AS urun_adi, sd.adet, sd.fiyat,
       sa.ad AS satici_adi, s.tarih
FROM Siparis s
JOIN Musteri m ON s.musteri_id = m.id
JOIN Siparis_Detay sd ON s.id = sd.siparis_id
JOIN Urun u ON sd.urun_id = u.id
JOIN Satici sa ON u.satici_id = sa.id
ORDER BY s.tarih DESC;

-- Hi� sat�lmam�� �r�nler sorgusu.
SELECT u.ad
FROM Urun u
LEFT JOIN Siparis_Detay sd ON u.id = sd.urun_id
WHERE sd.urun_id IS NULL;

-- Hi� sipari� vermemi� m��teriler sorgusu.
SELECT m.ad, m.soyad
FROM Musteri m
LEFT JOIN Siparis s ON m.id = s.musteri_id
WHERE s.id IS NULL;