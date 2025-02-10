create database Cafe;
go
use cafe;
go
CREATE TABLE [Type_Récolte] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[Nom] VARCHAR(50),
	[Description] TEXT,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [Type_Origine] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[Nom] VARCHAR(50),
	[Description] TEXT,
	[CafeinePour100] FLOAT,
	[IdTypeRecolte] INTEGER,
	[Terroir] INTEGER,
	[TypeGrain] INTEGER,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [Type_grain] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[Nom] VARCHAR(50),
	[Déscription] TEXT,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [Terroir] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[Nom] VARCHAR(50),
	[Pays] INTEGER,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [Pays] (
	[Prefixe] VARCHAR(50) NOT NULL,
	[Nom] VARCHAR(50) NOT NULL,
	[Code] VARCHAR(50) NOT NULL,
	[id] INTEGER NOT NULL UNIQUE,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [Cafe] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[Nom] TEXT,
	[Intensité] SMALLINT,
	[Description] TEXT,
	[PrixVenteConseillé] MONEY,
	[Torréfaction] INTEGER,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [AROME] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[Nom] VARCHAR(50),
	PRIMARY KEY([id])
);
GO

CREATE TABLE [CafeToTypeOrigine] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[Id_TypeOrigine] INTEGER NOT NULL,
	[Id_Cafe] INTEGER,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [AromeToCafe] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[Id_Arome] INTEGER NOT NULL,
	[Id_Cafe] INTEGER NOT NULL,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [AromeToTypeOrigine] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[Id_origine] INTEGER NOT NULL,
	[Id_Arome] INTEGER NOT NULL,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [Ville] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[Nom] VARCHAR(50),
	[CodePostal] VARCHAR(50),
	[IdPays] INTEGER,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [Adresse] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[Rue] VARCHAR(50) NOT NULL,
	[Numéro] INTEGER NOT NULL,
	[Boite] VARCHAR(50),
	[IdVille] INTEGER,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [PointDeVente] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[Nom] VARCHAR(50),
	[Adresse] INTEGER,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [CafeToPointDeVente] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[IdCafe] INTEGER,
	[IdPointDeVente] INTEGER,
	[PrixDeVente]  MONEY,
	[Date_Start] Date NOT Null,
	[Date_End] Date,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [Torrefaction] (
	[id] INTEGER NOT NULL IDENTITY UNIQUE,
	[Nom] VARCHAR(50),
	[Description] TEXT,
	PRIMARY KEY([id])
);
GO

ALTER TABLE [Type_Origine]
ADD FOREIGN KEY([IdTypeRecolte]) REFERENCES [Type_Récolte]([id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [Type_Origine]
ADD FOREIGN KEY([TypeGrain]) REFERENCES [Type_grain]([id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [Type_Origine]
ADD FOREIGN KEY([Terroir]) REFERENCES [Terroir]([id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [AromeToTypeOrigine]
ADD FOREIGN KEY(Id_origine) REFERENCES Type_Origine([id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [AromeToTypeOrigine]
ADD FOREIGN KEY([Id_Arome]) REFERENCES [AROME]([id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO

ALTER TABLE [AromeToCafe]
ADD FOREIGN KEY([Id_Cafe]) REFERENCES [Cafe]([id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [AromeToCafe]
ADD FOREIGN KEY([Id_Arome]) REFERENCES [AROME]([id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [Cafe]
ADD FOREIGN KEY([Torréfaction]) REFERENCES [Torrefaction]([id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [CafeToTypeOrigine]
ADD FOREIGN KEY([Id_Cafe]) REFERENCES [Cafe]([id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [CafeToTypeOrigine]
ADD FOREIGN KEY([Id_TypeOrigine]) REFERENCES [Type_Origine]([id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [Terroir]
ADD FOREIGN KEY([Pays]) REFERENCES [Pays]([id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [Ville]
ADD FOREIGN KEY([IdPays]) REFERENCES [Pays]([id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [Adresse]
ADD FOREIGN KEY([IdVille]) REFERENCES [Ville]([id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [PointDeVente]
ADD FOREIGN KEY([Adresse]) REFERENCES [Adresse]([id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [CafeToPointDeVente]
ADD FOREIGN KEY([IdPointDeVente]) REFERENCES [PointDeVente]([id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
ALTER TABLE [CafeToPointDeVente]
ADD FOREIGN KEY([IdCafe]) REFERENCES [Cafe]([id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO


-- Table Pays
INSERT INTO [Pays] ([Prefixe], [Nom], [Code], [id])
VALUES
('33', 'France', 'FR', 1),
('55', 'Brésil', 'BR', 2),
('CO', 'Colombie', 'CO', 3),
('IT', 'Italie', 'IT', 4),
('ET', 'Éthiopie', 'ET', 5),
('VN', 'Vietnam', 'VN', 6),
('ID', 'Indonésie', 'ID', 7),
('IN', 'Inde', 'IN', 8),
('52', 'Mexique', 'MX', 9),
('506', 'Costa Rica', 'CR', 10),
('BE', 'Belgique', 'BE',11),
('504', 'Honduras','HN',12),
('503', 'Salvador', 'SV', 13),
('51', 'Pérou', 'PE',14)

GO

-- Table Torrefaction
INSERT INTO [Torrefaction] ([Nom], [Description])
VALUES
('Clair', 'Torréfaction légère pour un goût plus doux'),
('Moyen', 'Torréfaction moyenne pour un équilibre de saveurs'),
('Foncé', 'Torréfaction foncée pour un goût robuste');
GO

-- Table AROME
INSERT INTO [AROME] ([Nom])
VALUES
('Chocolat'),
('Fruité'),
('Noisette'),
('Floral'),
('Épicé'),
('Caramel'),
('Agrumes'),
('Boisé'),
('Vanille'),
('Miel'),
('crémeux'),
('équilibré'),
('pain grillé'),
('amande');
GO

-- Table Type_grain
INSERT INTO [Type_grain] ([Nom], [Déscription])
VALUES
('Arabica', 'Grains de café Arabica de haute qualité'),
('Robusta', 'Grains de café Robusta pour un goût plus fort'),
('Liberica', 'Grains rares avec un arôme unique'),
('Excelsa', 'Variété avec des notes fruitées et tartes'),
('Chiwawa', 'Race de chien assez spécial, pas très grand, on peut même dire trés petite');
GO

-- Table Type_Récolte
INSERT INTO [Type_Récolte] ([Nom], [Description])
VALUES
('Manuelle', 'Récolte manuelle pour une meilleure sélection des grains'),
('Mécanisée', 'Récolte mécanisée pour une production de masse'),
('Semi-Manuelle', 'Combinaison de méthodes manuelles et mécanisées');
GO

-- Table Terroir
INSERT INTO [Terroir] ([Nom], [Pays])
VALUES
('Sumatra', 7),
('Antioquia', 3),
('Minas Gerais', 2),
('Sidamo', 5),
('Blue Mountain', 10),
('Chiapas', 9),
('Mysore', 8),
('Huehuetenango', 9),
('Yirgacheffe', 5),
('Costa Rica',10),
('Jember', 7),
('Honduras',12),
('Salvador',13),
('amazoniennes',14),
('Sigri', 12),
('La Belgica',13);
GO

-- Table Type_Origine
INSERT INTO [Type_Origine] ([Nom], [Description], [CafeinePour100], [IdTypeRecolte], [Terroir], [TypeGrain])
VALUES
('Origine France', 'Café cultivé en France', 1.2, 1, 1, 1),
('Origine Colombie', 'Café cultivé en Colombie', 1.5, 1, 2, 1),
('Origine Brésil', 'Café cultivé au Brésil', 1.8, 2, 3, 2),
('Origine Éthiopie', 'Café éthiopien aux notes florales', 1.1, 1, 4, 1),
('Origine Jamaïque', 'Blue Mountain, l un des cafés les plus chers', 0.9, 1, 5, 1),
('Origine Mexique', 'Café mexicain doux et équilibré', 1.3, 3, 6, 1),
('Origine Inde', 'Café indien épicé', 1.7, 2, 7, 2),
('Origine Guatemala', 'Café guatémaltèque riche en saveurs', 1.4, 1, 8, 1),
('Origine Indonésie', 'Café indonésien terreux', 1.6, 2, 9, 3),
('Origine Vietnam', 'Café vietnamien robuste', 2.0, 2, 10, 2),
('Mélange 1','mélange',1.5,1,10,2),
('Mélange 1.1','mélange',2.5,2,6,1),
('Mélange 1.2','mélange',1.5,2,12,1),
('Mélange 1.3','mélange',1.5,2,3,2),
('Bourbon Rouge','Le Bourbon Rouge a une quantité importante de fructose, ce qui crée une tasse sucrée et juteuse. Le Bourbon est une variété de grande taille caractérisée par une production relativement faible et une excellente qualité en tasse. La variété Bourbon a été introduite par des missionnaires français d’Afrique en Amérique vers 1860, où elle s’est mélangée avec d’autres variétés apparentées. Aujourd’hui. de nombreuses variétés similaires au Bourbon se trouvent en Afrique de l’Est, mais aucune ne correspond exactement à la variété distinctive Bourbon que l’on peut trouver en Amérique centrale et surtout au Salvador.',1.7,3,13,1),
('Pérou Bio&Fairtraide - grains','Ce café Bio du Pérou est cultivé en haute altitude de 1000 à 1800 mètres d’altitude dans les terres amazoniennes. Le café péruvien est savoureux et onctueux, pour une tasse particulièrement équilibrée, dont les légères notes d’agrumes s’entremêlent subtilement aux arômes de cacao. Une fine touche acidulée qui en bouche s’épanouit dans une sensation de rondeur et de velouté : c’est l’équilibre parfait entre le corps moyen et la finesse des saveurs.',1.6,1,14,1),
('Blue Mountain grains','',1.5,3,5,1),
('Papouasie grains','',2.1,1,15,1),
('Pacamara', '',1.3,1,16,1);

GO

-- Table Ville
INSERT INTO [Ville] ([Nom], [CodePostal], [IdPays])
VALUES
('Paris', '75000', 1),
('Rio de Janeiro', '20000-000', 2),
('Bogotá', '110111', 3),
('Rome', '00100', 4),
('Addis-Abeba', '1000', 5),
('Hanoï', '100000', 6),
('Jakarta', '10110', 7),
('New Delhi', '110001', 8),
('Mexico City', '01000', 9),
('San José', '10101', 10);
GO

-- Table Adresse
INSERT INTO [Adresse] ([Rue], [Numéro], [Boite], [IdVille])
VALUES
('Champs-Élysées', 10, NULL, 1),
('Avenida Atlântica', 500, 'A', 2),
('Carrera 7', 14, 'B', 3),
('Via del Corso', 22, NULL, 4),
('Churchill Avenue', 7, 'C', 5),
('Đường Trần Hưng Đạo', 123, NULL, 6),
('Jalan MH Thamrin', 56, 'D', 7),
('Connaught Place', 78, NULL, 8),
('Avenida Reforma', 90, 'E', 9),
('Calle Central', 33, NULL, 10);
GO

-- Table PointDeVente
INSERT INTO [PointDeVente] ([Nom], [Adresse])
VALUES
('Café de Paris', 1),
('Café do Brasil', 2),
('Café de Colombia', 3),
('Espresso Italiano', 4),
('Ethiopian Coffee House', 5),
('Vietnamese Coffee Corner', 6),
('Indonesian Coffee Hub', 7),
('Indian Coffee Shop', 8),
('Mexican Coffee Stand', 9),
('Costa Rican Café', 10);
GO

-- Table Cafe
INSERT INTO [Cafe] ([Nom], [Intensité], [Description], [PrixVenteConseillé], [Torréfaction])
VALUES
('Café Parisien', 5, 'Un café doux et équilibré', 4.5, 1),
('Café Brésilien', 7, 'Un café fort et corsé', 5.0, 3),
('Café Colombien', 6, 'Un café fruité avec des notes florales', 4.8, 2),
('Espresso Roma', 8, 'Un espresso à l italienne', 5.5, 3),
('Café Éthiopien', 4, 'Notes florales et fruitées', 6.0, 1),
('Café Vietnamien', 7, 'Café fort souvent servi avec du lait concentré', 4.0, 3),
('Café Indonésien', 6, 'Arômes terreux et épicés', 5.2, 3),
('Café Indien', 7, 'Notes épicées et chocolatées', 5.1, 2),
('Café Mexicain', 5, 'Café doux avec des notes de caramel', 4.7, 2),
('Café Costa Ricain', 6, 'Arômes équilibrés avec une acidité vive', 5.3, 2),

('Bourbon Rouge',5,'Le Bourbon Rouge a une quantité importante de fructose, ce qui crée une tasse sucrée et juteuse. Le Bourbon est une variété de grande taille caractérisée par une production relativement faible et une excellente qualité en tasse. La variété Bourbon a été introduite par des missionnaires français d’Afrique en Amérique vers 1860, où elle s’est mélangée avec d’autres variétés apparentées. Aujourd’hui. de nombreuses variétés similaires au Bourbon se trouvent en Afrique de l’Est, mais aucune ne correspond exactement à la variété distinctive Bourbon que l’on peut trouver en Amérique centrale et surtout au Salvador.',7.4,1),
('Pérou Bio&Fairtraide - grains',5,'Ce café Bio du Pérou est cultivé en haute altitude de 1000 à 1800 mètres d’altitude dans les terres amazoniennes. Le café péruvien est savoureux et onctueux, pour une tasse particulièrement équilibrée, dont les légères notes d’agrumes s’entremêlent subtilement aux arômes de cacao. Une fine touche acidulée qui en bouche s’épanouit dans une sensation de rondeur et de velouté : c’est l’équilibre parfait entre le corps moyen et la finesse des saveurs.',25,2),
('Blue Mountain grains',5,'Le café « Jamaica Blue Mountain » est une légende dans le monde du café arabica. Il s agit d un café obtenu à partir de caféiers cultivés dans les Blue Mountains, en Jamaïque. Les Blue Mountain se trouvent à l extrémité orientale de l île de la Jamaïque. À des altitudes allant jusqu à 5 000 pieds, le sol et l épais brouillard des Blue Mountain se combinent pour créer les conditions parfaites pour la culture de ce café dexception.',26.8,3),
('Papouasie grains',3,'Dans les montagnes de Papouasie-Nouvelle-Guinée se trouve la plantation Sigri qui produit l’un des meilleurs cafés gourmets du monde. Tous les plants de caféiers sont exclusivement des arabicas de la variété Typica. Les caféiers poussent à environ 1500 mètres d’altitude et profitent d’un climat frais et des pluies abondantes. Le gouvernement a toujours soutenu la production d’ Arabica . Il garantit au début de chaque saison un prix minimum de vente aux producteurs. Profil harmonieux et persistant autour de notes de pain grillé, d’épices et d’amande fraiche.',7.4,1),
('Pacamara',3, 'Pacamara est la variété la plus reconnue en Amérique Centrale pour sa polyvalence en coupe. Il s’agit d’un hybride entre les variétés Pacas et Maragogipe développé par l’Institut salvadorien de recherche sur le café (ISIC) dans les années 1950. La ferme «La Bélgica» était l’une des trois fermes où Pacamara a été testé à la fin des années 1950 par l’oncle d’Ernesto Samayoa Denys, Gustavo Denys. Aujourd’hui, elle est considérée comme l’un des joyaux par excellence du pays.',14,2);

GO

-- Table CafeToTypeOrigine
INSERT INTO [CafeToTypeOrigine] ([Id_TypeOrigine], [Id_Cafe])
VALUES
(1, 1),
(2, 3),
(3, 2),
(4, 5),
(5, 4),
(6, 9),
(7, 8),
(8, 10),
(9, 7),
(10, 6),
(11,11),
(12,11),
(13,11),
(14,11),
(15,12),
(16,13),
(17,14),
(18,15);
GO

-- Table AromeToCafe
INSERT INTO [AromeToCafe] ([Id_Arome], [Id_Cafe])
VALUES
(1, 1), -- Chocolat pour Café Parisien
(2, 3), -- Fruité pour Café Colombien
(3, 2), -- Noisette pour Café Brésilien
(4, 3), -- Floral pour Café Colombien
(5, 2), -- Épicé pour Café Brésilien
(6, 9), -- Caramel pour Café Mexicain
(7, 10), -- Agrumes pour Café Costa Ricain
(8, 7), -- Boisé pour Café Indonésien
(9, 5), -- Vanille pour Café Éthiopien
(10, 5), -- Miel pour Café Éthiopien
(2, 5), -- Fruité pour Café Éthiopien
(5, 8), -- Épicé pour Café Indien
(1, 4), -- Chocolat pour Espresso Roma
(6, 1), -- Caramel pour Café Parisien
(7, 3), -- Agrumes pour Café Colombien
(9, 4), -- Vanille pour Espresso Roma
(8, 6), -- Boisé pour Café Vietnamien
(4, 9), -- Floral pour Café Mexicain
(10, 10), -- Miel pour Café Costa Ricain
(3, 8),-- Noisette pour Café Indien
(8,11),
(2,12),
(6,12),
(11,13),
(12,13),
(7,14),
(6,14),
(5,14),
(13,15),
(14,15);
GO

-- Table AromeToTypeOrigine
INSERT INTO [AromeToTypeOrigine] ([Id_origine], [Id_Arome])
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 9),
(6, 6),
(7, 5),
(8, 7),
(9, 8),
(10, 5),
(11,8),
(12,2),
(12,6),
(13,11),
(13,12),
(14,7),
(14,8),
(14,5),
(15,13),
(15,14);
GO

-- Table CafeToPointDeVente
INSERT INTO [CafeToPointDeVente] ([IdCafe], [IdPointDeVente], [PrixDeVente],[Date_Start], [Date_End])
VALUES
(1, 1, 4.5, '2021-05-12', ''),
(2, 2, 6, '2020-03-20', '2023-05-10'),
(3, 3, 4.9, '2022-01-01', ''),
(4, 4, 5.5, '2020-06-10', ''),
(5, 5, 6, '2021-11-25', ''),
(6, 6, 4, '2020-02-14', '2026-05-20'),
(7, 7, 5.6, '2023-03-15', ''),
(8, 8, 5.1, '2020-12-01', ''),
(9, 9, 4.7, '2021-07-07', ''),
(10, 10, 5.5, '2022-05-05', ''),
(3, 1, 4.9, '2021-01-15', ''),
(5, 1, 5.6, '2020-09-09', ''),
(7, 2, 5.6, '2022-02-22', '2027-03-03'),
(8, 2, 5.1, '2021-08-08', ''),
(9, 3, 4.9, '2020-07-14', ''),
(10, 3, 5.5, '2021-12-12', ''),
(2, 4, 6, '2020-05-05', '2022-06-06'),
(6, 5, 4.2, '2021-03-03', ''),
(4, 6, 5.5, '2022-04-04', ''),
(11, 1, 7.4, '2020-10-10', ''),
(11, 2, 7.4, '2020-10-10', ''),
(11, 3, 7.4, '2020-10-10', ''),
(11, 4, 7.4, '2020-10-10', ''),
(11, 5, 7.4, '2020-10-10', ''),
(12, 6, 25, '2020-12-31', ''),
(12, 7, 25.1, '2021-01-01', ''),
(12, 8, 25, '2022-01-01', '2022-12-31'),
(12, 9, 25.3, '2023-01-01', ''),
(12, 10, 24.9, '2020-06-01', ''),
(12, 1, 25, '2021-09-09', ''),
(13, 2, 26.8, '2022-02-02', ''),
(13, 3, 26.8, '2020-03-03', ''),
(13, 4, 26.8, '2021-04-04', ''),
(13, 5, 28, '2020-05-05', ''),
(13, 6, 26.9, '2021-06-06', ''),
(13, 7, 26.8, '2022-07-07', ''),
(15, 8, 7.4, '2023-08-08', ''),
(15, 9, 7.4, '2020-09-09', ''),
(15, 10, 7.4, '2021-10-10', ''),
(15, 1, 7.4, '2022-11-11', '2023-11-11'),
(15, 2, 7.4, '2020-12-12', ''),
(15, 3, 7.4, '2021-01-01', ''),
(15, 4, 7.4, '2022-02-02', ''),
(1, 7, 5.6, '2021-03-03', '');
GO
