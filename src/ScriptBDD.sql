SET FOREIGN_KEY_CHECKS=0;

-- Suppression des Tableaux
drop table if exists SousFaction;
drop table if exists Unité;
drop table if exists Faction;

-- Création des tableaux--
-- ------------------------
create table Faction (
    id_faction int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom_faction varchar(50) NOT NULL,
    alliance_faction varchar(15) NOT NULL
);

-- ------------------------

create table SousFaction (
    num_sousFaction int PRIMARY KEY AUTO_INCREMENT,
    id_sousFaction int NOT NULL,
    nom_sousFaction varchar(50) NOT NULL,
    alliance_faction varchar(15),
    psychic_sousFaction varchar(255) DEFAULT NULL,
    trait_sousFaction varchar(255) DEFAULT NULL,
    bonus_armée_souFaction varchar(255) DEFAULT NULL,
    FOREIGN KEY(id_sousFaction) REFERENCES Faction(id_faction)
);

-- ------------------------
create table Unité (
    numéro_unit int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    faction_id_unit int NOT NULL,
    sousFaction_unit int DEFAULT NULL,
    nom_unit varchar(50) NOT NULL,
    faction_unit varchar(50) NOT NULL,
    point_unit int NOT NULL DEFAULT 0,
    FOREIGN KEY(faction_id_unit) REFERENCES Faction(id_faction)
);

-- Insértion dans les tableaux
-- Insertion Des Factions
INSERT INTO Faction(nom_faction, alliance_faction) VALUES ("Nécrons", "Xeno"), ("Thousand Sons", "Chaos");
-- Insertion Des Sous Factions
INSERT INTO SousFaction(id_sousFaction, nom_sousFaction, alliance_faction) SELECT id_faction, "Novokh", nom_faction FROM Faction WHERE id_faction = 1; 
INSERT INTO SousFaction(id_sousFaction, nom_sousFaction, alliance_faction) SELECT id_faction, "Szarekhan", nom_faction FROM Faction WHERE id_faction = 1;
-- Insertion des Unités
INSERT INTO Unité(faction_id_unit, nom_unit, faction_unit, point_unit) VALUES (1, "Guerrier Nécrons", "Nécrons", 13), (1, "Destroyer Skorpek", "Nécron", 45);