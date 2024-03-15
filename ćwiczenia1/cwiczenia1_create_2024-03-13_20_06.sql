-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-03-11 16:59:46.561

-- tables
-- Table: Artykuly
CREATE TABLE Artykuly (
    IDZamowienia int  NOT NULL,
    IDPudelka char  NOT NULL,
    Sztuk int  NOT NULL,
    Zamowienia_IDZamowienia int  NOT NULL,
    Pudelka_IDPudelka char  NOT NULL,
    CONSTRAINT Artykuly_pk PRIMARY KEY (IDZamowienia,IDPudelka)
);

-- Table: Czekoladki
CREATE TABLE Czekoladki (
    IDCzekoladki char  NOT NULL,
    Nazwa char  NOT NULL,
    RodzajCzekolady char  NOT NULL,
    RodzajOrzechow char  NOT NULL,
    RodzajNadzienia char  NOT NULL,
    Opis text  NOT NULL,
    Koszt money  NOT NULL,
    Masa int  NOT NULL,
    Zawartosc_IDPudelka char  NOT NULL,
    Zawartosc_IDCzekoladki char  NOT NULL,
    CONSTRAINT Czekoladki_pk PRIMARY KEY (IDCzekoladki)
);

-- Table: Klienci
CREATE TABLE Klienci (
    IDKlienta int  NOT NULL,
    Nazwa char  NOT NULL,
    Ulica char  NOT NULL,
    Miejscowosc char  NOT NULL,
    Kod char  NOT NULL,
    Telefon char  NOT NULL,
    CONSTRAINT Klienci_pk PRIMARY KEY (IDKlienta)
);

-- Table: Pudelka
CREATE TABLE Pudelka (
    IDPudelka char  NOT NULL,
    Nazwa char  NOT NULL,
    Opis text  NOT NULL,
    Cena money  NOT NULL,
    Stan int  NOT NULL,
    Artykuly_IDZamowienia int  NOT NULL,
    Artykuly_IDPudelka char  NOT NULL,
    CONSTRAINT Pudelka_pk PRIMARY KEY (IDPudelka)
);

-- Table: Zamowienia
CREATE TABLE Zamowienia (
    IDZamowienia int  NOT NULL,
    IDKlienta int  NOT NULL,
    DataRealizacji date  NOT NULL,
    Klienci_IDKlienta int  NOT NULL,
    CONSTRAINT Klienci PRIMARY KEY (IDZamowienia)
);

-- Table: Zawartosc
CREATE TABLE Zawartosc (
    IDPudelka char  NOT NULL,
    IDCzekoladki char  NOT NULL,
    Sztuk int  NOT NULL,
    Pudelka_IDPudelka char  NOT NULL,
    Czekoladki_IDCzekoladki char  NOT NULL,
    CONSTRAINT Zawartosc_pk PRIMARY KEY (IDPudelka,IDCzekoladki)
);

-- foreign keys
-- Reference: Artykuly_Pudelka (table: Artykuly)
ALTER TABLE Artykuly ADD CONSTRAINT Artykuly_Pudelka
    FOREIGN KEY (IDPudelka)
    REFERENCES Pudelka (IDPudelka)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Artykuly_Zamowienia (table: Artykuly)
ALTER TABLE Artykuly ADD CONSTRAINT Artykuly_Zamowienia
    FOREIGN KEY (IDZamowienia)
    REFERENCES Zamowienia (IDZamowienia)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Zamowienia_Klienci (table: Zamowienia)
ALTER TABLE Zamowienia ADD CONSTRAINT Zamowienia_Klienci
    FOREIGN KEY (IDKlienta)
    REFERENCES Klienci (IDKlienta)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Zawartosc_Czekoladki (table: Zawartosc)
ALTER TABLE Zawartosc ADD CONSTRAINT Zawartosc_Czekoladki
    FOREIGN KEY (IDCzekoladki)
    REFERENCES Czekoladki (IDCzekoladki)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Zawartosc_Pudelka (table: Zawartosc)
ALTER TABLE Zawartosc ADD CONSTRAINT Zawartosc_Pudelka
    FOREIGN KEY (IDPudelka)
    REFERENCES Pudelka (IDPudelka)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

