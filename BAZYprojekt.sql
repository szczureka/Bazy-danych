CREATE DATABASE bazy;
USE bazy;

--tworzenie tabel
CREATE TABLE GeoEon (id_eon INT PRIMARY KEY, nazwa_eon VARCHAR(100));

CREATE TABLE GeoEra (id_era INT PRIMARY KEY, id_eon INT, nazwa_era VARCHAR(100),
    FOREIGN KEY (id_eon) REFERENCES GeoEon(id_eon));

CREATE TABLE GeoOkres (id_okres INT PRIMARY KEY, id_era INT, nazwa_okres VARCHAR(100),
    FOREIGN KEY (id_era) REFERENCES GeoEra(id_era));

CREATE TABLE GeoEpoka (id_epoka INT PRIMARY KEY, id_okres INT, nazwa_epoka VARCHAR(100),
    FOREIGN KEY (id_okres) REFERENCES GeoOkres(id_okres));

CREATE TABLE GeoPietro (id_pietro INT PRIMARY KEY, id_epoka INT, nazwa_pietro VARCHAR(100),
    FOREIGN KEY (id_epoka) REFERENCES GeoEpoka(id_epoka));


--wype�nienie tabel danymi 
INSERT INTO GeoEon(id_eon, nazwa_eon)
VALUES (1, 'Fanerozoik');

INSERT INTO GeoEra(id_era, id_eon, nazwa_era)
VALUES 
(1, 1, 'Kenozoik'),
(2, 1, 'Mezozoik'),
(3, 1, 'Paleozoik');

INSERT INTO GeoOkres(id_okres, id_era, nazwa_okres)
VALUES
(1, 1, 'Czwartorz�d'),
(2, 1, 'Neogen'),
(3, 1, 'Paleogen'),
(4, 2, 'Kreda'),
(5, 2, 'Jura'),
(6, 2, 'Trias'),
(7, 3, 'Perm'),
(8, 3, 'Karbon'),
(9, 3, 'Dewon');

INSERT INTO GeoEpoka(id_epoka, id_okres, nazwa_epoka)
VALUES
(1, 1, 'Holocen'),
(2, 1, 'Plejstocen'),
(3, 2, 'Pliocen'),
(4, 2, 'Miocen'),
(5, 3, 'Oligocen'),
(6, 3, 'Eocen'),
(7, 3, 'Paleocen'),
(8, 4, 'P�na (G�rna)'),
(9, 4, 'Wczesna (Dolna)'),
(10, 5, 'P�na (G�rna)'),
(11, 5, '�rodkowa'),
(12, 5, 'Wczesna (Dolna)'),
(13, 6, 'P�na (G�rna)'),
(14, 6, '�rodkowa'),
(15, 6, 'Wczesna (Dolna)'),
(16, 7, 'G�rny'),
(17, 7, 'Dolny'),
(18, 8, 'G�rny'),
(19, 8, 'Dolny'),
(20, 9, 'G�rny'),
(21, 9, '�rodkowy'),
(22, 9, 'Dolny');

--tabela skr�cona, �eby bylo 68 rekord�w
INSERT INTO GeoPietro(id_pietro, id_epoka, nazwa_pietro)
VALUES
(1, 1, 'Megalaj'),
(2, 1, 'Nortgryp'),
(3, 1, 'Grenland'),
(4, 2, 'P�ny'),
(5, 2, 'Chiban'),
(6, 2, 'Kalabr'),
(7, 2, 'Gelas'),
(8, 3, 'Piacent'),
(9, 3, 'Zankl'),
(10, 4, 'Messyn'),
(11, 4, 'Torton'),
(12, 4, 'Serrawal'),
(13, 4, 'Lang'),
(14, 4, 'Burdyga�'),
(15, 4, 'Akwitan'),
(16, 5, 'Szat'),
(17, 5, 'Rupel'),
(18, 6, 'Priabon'),
(19, 6, 'Barton'),
(20, 6, 'Lutet'),
(21, 6, 'Iprez'),
(22, 7, 'Tanet'),
(23, 7, 'Zeland'),
(24, 7, 'Dan'),
(25, 8, 'Mastrycht'),
(26, 8, 'Kampan'),
(27, 8, 'Santon'),
(28, 8, 'Koniak'),
(29, 8, 'Turon'),
(30, 8, 'Cenoman'),
(31, 9, 'Alb'),
(32, 9, 'Apt'),
(33, 9, 'Barrem'),
(34, 9, 'Hoteryw'),
(35, 9, 'Walan�yn'),
(36, 9, 'Berrias'),
(37, 10, 'Tyton'),
(38, 10, 'Kimeryd'),
(39, 10, 'Oksford'),
(40, 11, 'Kelowej'),
(41, 11, 'Baton'),
(42, 11, 'Bajos'),
(43, 11, 'Aalen'),
(44, 12, 'Toark'),
(45, 12, 'Pliensbach'),
(46, 12, 'Synemur'),
(47, 12, 'Hettang'),
(48, 13, 'Retyk'),
(49, 13, 'Noryk'),
(50, 13, 'Karnik'),
(51, 14, 'Ladyn'),
(52, 14, 'Anizyk'),
(53, 15, 'Olenek'),
(54, 15, 'Ink'),
(55, 16, 'Czangsing'),
(56, 16, 'Wucziaping'),
(57, 17, 'Kungur'),
(58, 17, 'Artinsk'),
(59, 17, 'Sakmar'),
(60, 17, 'Assel'),
(61, 18, 'G�el'),
(62, 18, 'Kasimow'),
(63, 18, 'Moskow'),
(64, 18, 'Baszkir'),
(65, 19, 'Serpuchow'),
(66, 19, 'Wizen'),
(67, 19, 'Turnej'),
(68, 20, 'Famen');

--tworzenie GeoTabela (oparta na danych ze schematu p�atka �niegu)
CREATE TABLE GeoTabela(id_pietro INT PRIMARY KEY, nazwa_pietro VARCHAR(80), id_epoka INT, nazwa_epoka VARCHAR(80), id_okres INT, nazwa_okres VARCHAR(80), id_era INT, nazwa_era VARCHAR(80),
id_eon INT, nazwa_eon VARCHAR(80))
INSERT INTO GeoTabela
SELECT GP.id_pietro, GP.nazwa_pietro, GE.id_epoka, GE.nazwa_epoka, GOK.id_okres, GOK.nazwa_okres, GER.id_era, GER.nazwa_era, GEO.id_eon, GEO.nazwa_eon FROM GeoPietro GP
JOIN GeoEpoka GE ON GP.id_epoka = GE.id_epoka 
JOIN GeoOkres GOK ON GE.id_okres = GOK.id_okres
JOIN GeoEra  GER ON GOK.id_era = GER.id_era
JOIN GeoEon GEO ON GER.id_eon = GEO.id_eon;

SELECT * FROM GeoTabela;

-- tabele do test�w wydajno�ci
CREATE TABLE Dziesiec (cyfra INT PRIMARY KEY);
INSERT INTO Dziesiec(cyfra) VALUES 
	(0), (1), (2), (3), (4), (5), (6), (7), (8), (9);
SELECT * FROM Dziesiec;

CREATE TABLE Milion (liczba INT PRIMARY KEY)
INSERT INTO Milion(liczba) SELECT a1.cyfra
+ a2.cyfra*10
+ a3.cyfra*100 
+ a4.cyfra*1000 
+ a5.cyfra*10000
+ a6.cyfra*100000
FROM Dziesiec a1
JOIN Dziesiec a2 ON a1.cyfra >= 0
JOIN Dziesiec a3 ON a2.cyfra >= 0
JOIN Dziesiec a4 ON a3.cyfra >= 0
JOIN Dziesiec a5 ON a4.cyfra >= 0
JOIN Dziesiec a6 ON a5.cyfra >= 0;
SELECT * FROM Milion;

-- KRYTERIA TEST�W
-- bez indeks�w
-- 1ZL
SELECT COUNT(*)
FROM Milion 
INNER JOIN GeoTabela 
ON (Milion.liczba % 68) = GeoTabela.id_pietro;

-- 2ZL
SELECT COUNT(*) 
FROM Milion 
INNER JOIN GeoPietro ON ((Milion.liczba % 68)= GeoPietro.id_pietro) 
INNER JOIN GeoEpoka ON GeoPietro.id_epoka = GeoEpoka.id_epoka 
INNER JOIN GeoOkres ON GeoEpoka.id_okres = GeoOkres.id_okres
INNER JOIN GeoEra ON GeoOkres.id_era = GeoEra.id_era
INNER JOIN GeoEon ON GeoEra.id_eon = GeoEon.id_eon;

-- 3ZG
SELECT COUNT(*) 
FROM Milion 
WHERE Milion.liczba % 68 = (SELECT id_pietro FROM GeoTabela WHERE (Milion.liczba % 68) = (id_pietro));

--4ZG
SELECT COUNT(*)
FROM Milion
WHERE Milion.liczba % 68 IN (
    SELECT GeoPietro.id_pietro 
    FROM GeoPietro
    INNER JOIN GeoEpoka ON GeoPietro.id_epoka = GeoEpoka.id_epoka
    INNER JOIN GeoOkres ON GeoEpoka.id_okres = GeoOkres.id_okres
    INNER JOIN GeoEra ON GeoOkres.id_era = GeoEra.id_era
    INNER JOIN GeoEon ON GeoEon.id_eon = GeoEra.id_eon
);

--z indeksami

CREATE INDEX IDX_GeoPietro_id_epoka ON GeoPietro(id_epoka);
CREATE INDEX IDX_GeoEpoka_id_okres ON GeoEpoka(id_okres);
CREATE INDEX IDX_GeoOkres_id_era ON GeoOkres(id_era);
CREATE INDEX IDX_GeoEra_id_eon ON GeoEra(id_eon);
CREATE INDEX IDX_geoEon_id_eon ON GeoEon(id_eon);

CREATE INDEX IDX_Milion_liczba ON Milion(liczba);

CREATE INDEX IDX_GeoTabela_id_pietro ON GeoTabela(id_pietro);


