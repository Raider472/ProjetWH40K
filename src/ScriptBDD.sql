SET FOREIGN_KEY_CHECKS=0;

-- Suppression des Tableaux
drop table if exists SortPris;
drop table if exists UnitéPrise;
drop table if exists Liste;
drop table if exists Sort;
drop table if exists AptitudeLiaison;
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
    desc_trait varchar(500) DEFAULT NULL,
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

-- -------------------------
CREATE TABLE AptitudeLiaison (
    id_apti int NOT NULL,
    id_unit int NOT NULL,
    nom_apt varchar(255) DEFAULT NULL,
    nom_unit varchar(255) DEFAULT NULL,
    PRIMARY KEY(id_apti, id_unit),
    FOREIGN KEY(id_apti) REFERENCES Aptitude(num_apti),
    FOREIGN KEY(id_unit) REFERENCES Unité(numéro_unit)
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
INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) VALUES (1, "Neutre", "Nécrons");
INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Novokh", nom_faction FROM Faction WHERE num_faction = 1; 
INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Szarekhan", nom_faction FROM Faction WHERE num_faction = 1;
INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Mephrit", nom_faction FROM Faction WHERE num_faction = 1;
INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Nephrekh", nom_faction FROM Faction WHERE num_faction = 1;
INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Nihilakh", nom_faction FROM Faction WHERE num_faction = 1;
INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Sautekh", nom_faction FROM Faction WHERE num_faction = 1;
-- Insertion des Unités
INSERT INTO Unité(faction_id_unit, personnage_unit, nom_unit, nomFaction_unit, point_unit, min_unit, max_unit) VALUES (1, false, "Guerrier Nécrons", "Nécrons", 13, 10, 20), (1, false, "Destroyer Skorpek", "Nécron", 45, 3, 6);
-- Insertion des traits
INSERT INTO Trait(id_faction, nom_trait, id_sousFaction, desc_trait) 
SELECT id_faction, "Fureur de sang", num_sousFaction, "Chaque fois que ce Seigneur de guerre fait une attaque de mêlée, un jet de blessure non modifié de 6 inflige 1 blessure mortelle à la cible en plus de tout autre dégât normal."
FROM SousFaction 
WHERE nom_sousFaction = "Novokh";
INSERT INTO Trait(id_faction, nom_trait, id_sousFaction, desc_trait) 
SELECT id_faction, "La volonté du triarcat", num_sousFaction, "Si votre Seigneur de Guerre a ce trait de seigneur de guerre, quand vous assignez des protocoles de commandement pour la bataille, vous pouvez choisir quatre protocole au lieu de cinq, et l'un des protocoles de commandement choisi peut être assigné à deux rounds de bataille au lieu d'un seul."
FROM SousFaction 
WHERE nom_sousFaction = "Szarekhan";
INSERT INTO Trait(id_faction, nom_trait, id_sousFaction, desc_trait) 
SELECT id_faction, "Tyran sans merci", num_sousFaction, "Ajoutez 1 aux caractéristiques de Force et d'Attaques de ce Seigneur de Guerre."
FROM SousFaction 
WHERE nom_sousFaction = "Mephrit";
INSERT INTO Trait(id_faction, nom_trait, id_sousFaction, desc_trait) 
SELECT id_faction, "Peau de dieu vivant", num_sousFaction, "Chaque fois qu'une attaque est faite contre ce Seigneur de Guerre, soustrayez 1 au jet de touche de l'attaque."
FROM SousFaction 
WHERE nom_sousFaction = "Nephrekh";
INSERT INTO Trait(id_faction, nom_trait, id_sousFaction, desc_trait) 
SELECT id_faction, "Frappe précognitive", num_sousFaction, "Au début de la phase de combat, si ce Seigneur de Guerre est à portée d'engagement d'une unité ennemie, il peut combattre en premier à cette phase."
FROM SousFaction 
WHERE nom_sousFaction = "Nihilakh";
INSERT INTO Trait(id_faction, nom_trait, id_sousFaction, desc_trait) 
SELECT id_faction, "Stratège hyperlogique", num_sousFaction, "Tant que ce Seigneur de Guerre est sur le champ de bataille, chaque fois que vous dépensez un PC pour utiliser un stratagème, vous pouvez jeter un D6: sur 5+, le pc vous est restitué."
FROM SousFaction 
WHERE nom_sousFaction = "Sautekh";
INSERT INTO Trait(id_faction, nom_trait, desc_trait) 
VALUES (1, "Volonté immuable", "Chaque fois qu'on alloue une attaque à ce Seigneur de Guerre, on soustrait 1 à la caractéristique de Dégats de l'attaque (jusqu'à un minimum de 1)."),
(1, "Folie éternelle", "Chaque fois que ce Seigneur de Guerre fait une attaque de mêlée, vous pouvez relancer le jet de blessure"),
(1, "Vanité imortelle", "Chaque fois que ce Seigneur de Guerre est censé perdre un PV suite à une blessure mortelle, jetez un D6: sur un 5+, le PV n'est pas perdu. \n Ce Seigneur de Guerre a l'aptitude suivante: Vanité immortelle (aura): Tant qu'une unité Base<Dynastie> amie est à 6 pouce de cette figurine, chaque fois qu'un test d'attrition est effectué pour l'unité, ignorez-en certains ou tous les modificateurs."),
(1, "Servant du roi silencieux", "Ajoutez 3 pouce à la portée des aptitudes d'aura de ce Seigneur de Guerre (max 9). De plus, quand ce Seigneur de Guerre utilise les aptitudes Que Ma Volonté s'Acomplisse, Volonté du Dynaste ou Adaptation Stratégique, vous pouvez choisir une unité Base <Dynastie> amie à 12 pouce de ce Seigneur de Guerre au lieu de 9 pouce.");
-- Insertion des Aptitudes
INSERT INTO Aptitude(id_faction, id_sousFaction, nom_apti) VALUES (1, 2, "Test");
INSERT INTO Aptitude(id_faction, nom_apti) VALUES (1, "Test2");
-- Insertion des sorts
INSERT INTO Sort(id_faction, nom_sort) VALUES (2, "Death");