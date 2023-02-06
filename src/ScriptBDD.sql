SET FOREIGN_KEY_CHECKS=0;

-- Suppression des Tableaux
drop table if exists SortPris;
drop table if exists UnitéPrise;
drop table if exists Liste;
drop table if exists Sort;
drop table if exists Aptitude;
drop table if exists Unité;
drop table if exists Trait;
drop table if exists SousFaction;
drop table if exists Faction;

-- Création des tableaux--
-- ------------------------
create table Faction (
    num_faction int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom_faction varchar(50) NOT NULL,
    alliance_faction varchar(15) NOT NULL
);

-- ------------------------

create table SousFaction (
    num_sousFaction int PRIMARY KEY AUTO_INCREMENT,
    id_faction int NOT NULL,
    nom_sousFaction varchar(50) NOT NULL,
    nom_faction varchar(15) DEFAULT NULL,
    FOREIGN KEY(id_faction) REFERENCES Faction(num_faction)
);

-- ------------------------

CREATE TABLE Trait (
    num_trait int PRIMARY KEY AUTO_INCREMENT,
    id_faction int NOT NULL,
    id_sousFaction int DEFAULT NULL,
    nom_trait varchar(255) NOT NULL,
    desc_trait varchar(255) DEFAULT NULL,
    FOREIGN KEY(id_faction) REFERENCES Faction(num_faction),
    FOREIGN KEY(id_sousFaction) REFERENCES SousFaction(num_sousFaction)
);

-- -------------------------

CREATE TABLE Aptitude (
    num_apti int PRIMARY KEY AUTO_INCREMENT,
    id_faction int NOT NULL,
    id_sousFaction int DEFAULT NULL,
    nom_apti varchar(255) NOT NULL,
    desc_apti varchar(255) DEFAULT NULL,
    FOREIGN KEY(id_faction) REFERENCES Faction(num_faction),
    FOREIGN KEY(id_sousFaction) REFERENCES SousFaction(num_sousFaction)
);

-- -------------------------

CREATE TABLE Sort (
    num_sort int PRIMARY KEY AUTO_INCREMENT,
    id_faction int NOT NULL,
    id_sousFaction int DEFAULT NULL,
    nom_sort varchar(255) NOT NULL,
    desc_sort varchar(255) DEFAULT NULL,
    type_sort varchar(255) DEFAULT NULL,
    FOREIGN KEY(id_faction) REFERENCES Faction(num_faction),
    FOREIGN KEY(id_sousFaction) REFERENCES SousFaction(num_sousFaction)
);

-- ------------------------
CREATE TABLE Unité (
    numéro_unit int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    faction_id_unit int NOT NULL,
    sousFaction_unit int DEFAULT NULL,
    personnage_unit BOOLEAN NOT NULL,
    trait_unit int DEFAULT NULL,
    nom_unit varchar(50) NOT NULL,
    nomFaction_unit varchar(50) NOT NULL,
    point_unit int NOT NULL DEFAULT 0,
    min_unit int NOT NULL,
    max_unit int NOT NULL,
    nombre_sort int DEFAULT NULL,
    FOREIGN KEY(faction_id_unit) REFERENCES Faction(num_faction),
    FOREIGN KEY(trait_unit) REFERENCES Trait(num_trait),
    FOREIGN KEY(sousFaction_unit) REFERENCES SousFaction(num_sousFaction)
);

-- -----------------------
CREATE TABLE Liste (
    num_liste int PRIMARY KEY NOT NULL,
    nom_liste varchar(255) DEFAULT NULL
);

-- ------------------------
CREATE TABLE UnitéPrise (
    id_unitPris int NOT NULL AUTO_INCREMENT,
    id_liste int NOT NULL,
    numéro_unit int NOT NULL,
    sousFaction_unit int NOT NULL,
    trait_unit int NOT NULL,
    nom_unit varchar(50) NOT NULL,
    nomFaction_unit varchar(50) NOT NULL,
    point_unit int NOT NULL DEFAULT 0,
    nombre_unit int NOT NULL,
    PRIMARY KEY(id_unitPris, id_liste),
    FOREIGN KEY(id_liste) REFERENCES Liste(num_liste),
    FOREIGN KEY(numéro_unit) REFERENCES Unité(numéro_unit),
    FOREIGN KEY(trait_unit) REFERENCES Trait(num_trait),
    FOREIGN KEY(sousFaction_unit) REFERENCES SousFaction(num_sousFaction)
);

-- -----------------------
CREATE TABLE SortPris (
    id_unitchoisie int NOT NULL,
    id_sort int NOT NULL,
    PRIMARY KEY(id_unitchoisie, id_sort),
    FOREIGN KEY(id_sort) REFERENCES Sort(num_sort),
    FOREIGN KEY(id_unitchoisie) REFERENCES UnitéPrise(id_unitPris)
);

-- Insértion dans les tableaux
-- Insertion Des Factions
INSERT INTO Faction(nom_faction, alliance_faction) VALUES ("Nécrons", "Xeno"), ("Thousand Sons", "Chaos"), ("Ork", "Xeno");
-- Insertion Des Sous Factions
INSERT INTO SousFaction(id_faction, nom_sousFaction) VALUES (1, "Neutre");
INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Novokh", nom_faction FROM Faction WHERE num_faction = 1; 
INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Szarekhan", nom_faction FROM Faction WHERE num_faction = 1;
-- Insertion des Unités
INSERT INTO Unité(faction_id_unit, personnage_unit, nom_unit, nomFaction_unit, point_unit, min_unit, max_unit) VALUES (1, false, "Guerrier Nécrons", "Nécrons", 13, 10, 20), (1, false, "Destroyer Skorpek", "Nécron", 45, 3, 6);
-- Insertion des traits
INSERT INTO Trait(id_faction, nom_trait, id_sousFaction, desc_trait) 
SELECT id_faction, "Fureur de sang", num_sousFaction, "Chaque fois que ce Seigneur de guerre fait une attaque de mêlée, un jet de blessure non modifié de 6 inflige 1 blessur mortelle à la cible en plus de tout autre dégât normal."
FROM SousFaction WHERE nom_sousFaction = "Novokh";
-- Insertion des Aptitudes
INSERT INTO Aptitude(id_faction, id_sousFaction, nom_apti) VALUES (1, 2, "Test");
INSERT INTO Aptitude(id_faction, nom_apti) VALUES (1, "Test2");
-- Insertion des sorts
INSERT INTO Sort(id_faction, nom_sort) VALUES (2, "Death");