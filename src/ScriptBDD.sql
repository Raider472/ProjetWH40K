SET FOREIGN_KEY_CHECKS=0;

-- Suppression des Tableaux
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

-- ------------------------
create table Unité (
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
    FOREIGN KEY(faction_id_unit) REFERENCES Faction(num_faction),
    FOREIGN KEY(trait_unit) REFERENCES Trait(num_trait),
    FOREIGN KEY(sousFaction_unit) REFERENCES SousFaction(num_sousFaction)
);

-- Insértion dans les tableaux
-- Insertion Des Factions
INSERT INTO Faction(nom_faction, alliance_faction) VALUES ("Nécrons", "Xeno"), ("Thousand Sons", "Chaos");
-- Insertion Des Sous Factions
INSERT INTO SousFaction(id_faction, nom_sousFaction) VALUES (1, "Neutre");
INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Novokh", nom_faction FROM Faction WHERE num_faction = 1; 
INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Szarekhan", nom_faction FROM Faction WHERE num_faction = 1;
-- Insertion des Unités
INSERT INTO Unité(faction_id_unit, personnage_unit, nom_unit, nomFaction_unit, point_unit, min_unit, max_unit) VALUES (1, false, "Guerrier Nécrons", "Nécrons", 13, 10, 20), (1, false, "Destroyer Skorpek", "Nécron", 45, 3, 6);
-- Insertion des traits
INSERT INTO Trait(id_faction, nom_trait, id_sousFaction, desc_trait) 
SELECT id_faction, "Fureur de sang", num_sousFaction, "Chaque fois que ce Seigneur de guerre fait une attaque de mêlée, un jet de blessure non modifié de 6 inflige 1 blessur mortelle à la cible en plus de tout autre dégât normal."
FROM SousFaction WHERE num_sousFaction = 1;