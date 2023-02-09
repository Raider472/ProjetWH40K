SET FOREIGN_KEY_CHECKS=0;

-- Suppression des Tableaux
drop table if exists EquipementPris;
drop table if exists ArmePrise;
drop table if exists SortPris;
drop table if exists UnitéPrise;
drop table if exists Liste;
drop table if exists Sort;
drop table if exists Reliques;
drop table if exists AptitudeLiaison;
drop table if exists Aptitude;
drop table if exists ArmeLiaison;
drop table if exists EquipementLiaison;
drop table if exists Arme;
drop table if exists Equipement;
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
    desc_apti varchar(1000) DEFAULT NULL,
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
    mouvement_unit int NOT NULL,
    cc_unit int NOT NULL,
    ct_unit int NOT NULL,
    force_unit int NOT NULL,
    endurance_unit int NOT NULL,
    pv_unit int NOT NULL,
    attaque_unit int NOT NULL,
    cd_unit int NOT NULL,
    sv_unit int NOT NULL,
    FOREIGN KEY(faction_id_unit) REFERENCES Faction(num_faction),
    FOREIGN KEY(trait_unit) REFERENCES Trait(num_trait),
    FOREIGN KEY(sousFaction_unit) REFERENCES SousFaction(num_sousFaction)
);

-- -------------------------
CREATE TABLE Arme (
    num_arme int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_arme varchar(255) NOT NULL,
    id_faction int NOT NULL,
    portée_arme int DEFAULT NULL,
    type_arme varchar(255) NOT NULL,
    force_arme varchar(255) NOT NULL,
    pa_arme int NOT NULL,
    dégat_arme varchar(255) NOT NULL,
    aptitude_arme varchar(500) DEFAULT NULL,
    point_arme int DEFAULT NULL,
    switchable_arme BOOLEAN DEFAULT false,
    trancheFig_arme int DEFAULT NULL,
    FOREIGN KEY(id_faction) REFERENCES Faction(num_faction)
);

-- -------------------------
CREATE TABLE Equipement (
    num_equipement int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_equipement varchar(255) NOT NULL,
    id_faction int NOT NULL,
    desc_equipement varchar(750) DEFAULT NULL,
    switchable_equipement BOOLEAN DEFAULT false,
    point_equipement int DEFAULT NULL,
    FOREIGN KEY(id_faction) REFERENCES Faction(num_faction)
);

-- -------------------------
CREATE TABLE ArmeLiaison (
    id_arme int NOT NULL,
    id_unit int NOT NULL,
    nom_arme varchar(255) DEFAULT NULL,
    nom_unit varchar(255) DEFAULT NULL,
    PRIMARY KEY(id_arme, id_unit),
    FOREIGN KEY(id_arme) REFERENCES Arme(num_arme),
    FOREIGN KEY(id_unit) REFERENCES Unité(numéro_unit)
);

-- -------------------------
CREATE TABLE EquipementLiaison (
    id_equipement int NOT NULL,
    id_unit int NOT NULL,
    nom_equipement varchar(255) DEFAULT NULL,
    nom_unit varchar(255) DEFAULT NULL,
    PRIMARY KEY(id_equipement, id_unit),
    FOREIGN KEY(id_equipement) REFERENCES Equipement(num_equipement),
    FOREIGN KEY(id_unit) REFERENCES Unité(numéro_unit)
);

-- -------------------------
CREATE TABLE AptitudeLiaison (
    id_apti int NOT NULL,
    id_unit int NOT NULL,
    nom_apti varchar(255) DEFAULT NULL,
    nom_unit varchar(255) DEFAULT NULL,
    PRIMARY KEY(id_apti, id_unit),
    FOREIGN KEY(id_apti) REFERENCES Aptitude(num_apti),
    FOREIGN KEY(id_unit) REFERENCES Unité(numéro_unit)
);

-- -----------------------
CREATE TABLE Reliques (
    num_relique int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_faction int NOT NULL,
    nom_relique varchar(255) NOT NULL,
    desc_relique varchar(750) DEFAULT NULL,
    portée_relique int DEFAULT NULL,
    type_relique varchar(255) NOT NULL,
    force_relique int DEFAULT NULL,
    pa_relique int DEFAULT NULL,
    dégat_relique varchar(255) DEFAULT NULL,
    aptitude_relique varchar(255) DEFAULT NULL,
    FOREIGN KEY(id_faction) REFERENCES Faction(num_faction)
);

-- -----------------------
CREATE TABLE Liste (
    num_liste int PRIMARY KEY NOT NULL,
    nom_liste varchar(255) NOT NULL
);

-- ------------------------
CREATE TABLE UnitéPrise (
    id_unitPris int NOT NULL AUTO_INCREMENT,
    id_liste int NOT NULL,
    numéro_unit int NOT NULL,
    sousFaction_unit int NOT NULL,
    trait_unit int NOT NULL,
    id_relique int DEFAULT NULL,
    nom_unit varchar(50) NOT NULL,
    nomFaction_unit varchar(50) NOT NULL,
    point_unit int NOT NULL DEFAULT 0,
    nombre_unit int NOT NULL,
    PRIMARY KEY(id_unitPris, id_liste),
    FOREIGN KEY(id_liste) REFERENCES Liste(num_liste),
    FOREIGN KEY(numéro_unit) REFERENCES Unité(numéro_unit),
    FOREIGN KEY(trait_unit) REFERENCES Trait(num_trait),
    FOREIGN KEY(sousFaction_unit) REFERENCES SousFaction(num_sousFaction),
    FOREIGN KEY(id_relique) REFERENCES Reliques(num_relique)
);

-- -----------------------
CREATE TABLE SortPris (
    id_unitchoisie int NOT NULL,
    id_sort int NOT NULL,
    id_liste int NOT NULL,
    PRIMARY KEY(id_unitchoisie, id_sort),
    FOREIGN KEY(id_sort) REFERENCES Sort(num_sort),
    FOREIGN KEY(id_unitchoisie) REFERENCES UnitéPrise(id_unitPris),
    FOREIGN KEY(id_liste) REFERENCES Liste(num_liste)
);

-- -----------------------
CREATE TABLE ArmePrise (
    id_unitchoisie int NOT NULL,
    id_arme int NOT NULL,
    id_liste int NOT NULL,
    PRIMARY KEY(id_unitchoisie, id_arme),
    FOREIGN KEY(id_unitchoisie) REFERENCES UnitéPrise(id_unitPris),
    FOREIGN KEY(id_arme) REFERENCES Arme(num_arme),
    FOREIGN KEY(id_liste) REFERENCES Liste(num_liste)
);

-- -----------------------
CREATE TABLE EquipementPris (
    id_unitchoisie int NOT NULL,
    id_equipement int NOT NULL,
    id_liste int NOT NULL,
    PRIMARY KEY(id_unitchoisie, id_equipement),
    FOREIGN KEY(id_unitchoisie) REFERENCES UnitéPrise(id_unitPris),
    FOREIGN KEY(id_equipement) REFERENCES Equipement(num_equipement),
    FOREIGN KEY(id_liste) REFERENCES Liste(num_liste)
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
(1, "Servant du roi silencieux", "Ajoutez 3 pouce à la portée des aptitudes d'aura de ce Seigneur de Guerre (max 9). De plus, quand ce Seigneur de Guerre utilise les aptitudes Que Ma Volonté s'Acomplisse, Volonté du Dynaste ou Adaptation Stratégique, vous pouvez choisir une unité Base <Dynastie> amie à 12 pouce de ce Seigneur de Guerre au lieu de 9 pouce."),
(1, "Conquérent implacable(Aura)", "Tant qu'une unité Base<Dynastie> amie est à 6 pouce de ce Seigneur de Guerre, vous pouvez relancer les jets de charges pour l'unité."),
(1, "Combattant honorable", "A la phase de combat, chaque fois que ce Seigneur de Guerre est choisi pour combattre, il peut engager un combat honorable. Dans ce cas, choisissez une unité Personnage ennemie; jusqu'à la fin de la phase ajoutez 2 à la caractéristique d'Attaque de ce Seigneur de Guerre, mais il peut seulement faire des attaques qui ciblent l'unité Personnage ennemie.");

-- Insertion des Aptitudes
INSERT INTO Aptitude(id_faction, id_sousFaction, nom_apti, desc_apti) VALUES (1, 2, "Eveil par le meurtre", "Ajoutez 1 aux jets de charge pour les unités ayant ce code. \n Chaque fois qu'une figurine ayant ce code fait une attaque de mêlée, si l'unité de la figurine a fait un mouvement de charge, a été chargée ou a accompli une Intervention Héroique à ce tour, améliorez de 1 la caractéristique de Pénétration d'armure de l'attaque. \n Lorsque le protocole du Néant Avide devient actif pour votre armée, si toutes les unité de votre armée (à l'exception des unités DYNASTIC AGENT et C'TAN SHARD) possède ce code, vous pouvez sélectionner les deux directives de ce protocole de commande au lieu d'une seule."),
(1, 3, "Artificiers remarquables", "Chaque fois qu'une figurine ayant ce code perdrait un PV suite à une blessure mortelle, lancez un D6 ; sur un 5+, le PV n'est pas perdue. \n Chaque fois qu'une unité ayant ce code est sélectionnée pour tirer ou combattre, vous pouvez relancer un seul jet de blessure en faisant les attaques de l'unité. \n Quand le Protocole des Légions Impérissable devient actif pour votre armée, si toutes les unités de votre armée (à l'exception des unités D'AGENT DYNASTIQUE et d'ECHARDE C'TAN) possède ce code, vous pouvez sélectionner les deux directives de ce protocole de commandement au lieu d'une seule."),
(1, 4, "Fureur Solaire", "Ajoutez 3 pouce à la caractéristique de Portée des armes de tir (à l'exception des pistolets) dont les figurines possédant ce code sont équipées. \n Chaque fois qu'une figurine possédant ce code effectue une attaque à distance qui cible une unité située à mi-distance, la caractéristique de pénétration de l'armure de cette attaque est améliorée de 1. \n Quand le protocole des Astres Vengeurs devient actif pour votre armée, si toutes les unités de votre armée (à l'exception des unités de l'AGENT DYNASTIQUE et du C'TAN SHARD) possèdent ce code, vous pouvez sélectionner les deux directives de ce protocole de commandement au lieu d'une seule."),
(1, 5, "Rayons de translocalisation", "Les figurines avec ce code ont une sauvegarde invulnérable de 6+. \n Chaque fois qu'une unité avec ce code Avance, elle peut se translocaliser. Si elle le fait, ne faites pas de jet d'Avance pour elle. A la place, jusqu'à la fin de la phase, ajoutez 6 pouce à la caractéristique de mouvement des figurines de cette unité. Si une unité se translocalise, jusqu'à la fin du tour, les figurines de cette unité ne peuvent pas tirer. \n Chaque fois qu'une unité avec ce code Bat en Retraite ou se translocalise, jusqu'à la fin de la phase, les figurines de cette unité peuvent se déplacer à travers les figurines et le terrain comme s'ils n'étaient pas là. \n Quand le Protocole de la Tempête Soudaine devient actif pour votre armée, si chaque unité de votre armée (à l'exception des unités de l'AGENT DYNASTIQUE et de la CARTE C'TAN) possède ce code, vous pouvez sélectionner les deux directives de ce protocole de commandement au lieu d'une seule."),
(1, 6, "Terrritorialistes agressifs", "Les unités avec ce code ont la capacité Objectif Sécurisé. Si une figurine d'une telle unité possède déjà cette aptitude, la figurine compte comme une figurine supplémentaire lors de la détermination du contrôle d'un pion d'objectif. \n Chaque fois qu'une attaque ayant une caractéristique de pénétration d'armure de - 1 est allouée à une figurine ayant ce code, si l'unité de la figurine est entièrement dans la zone de déploiement de son contrôleur, cette attaque a une caractéristique de pénétration d'armure de 0 à la place. \n Quand le Protocole du Gardien Éternel devient actif pour votre armée, si chaque unité de votre armée (à l'exception des unités de l'AGENT DYNASTIQUE et du C'TAN SHARD) possède ce code, vous pouvez sélectionner les deux directives de ce protocole de commandement au lieu d'une seule."),
(1, 7, "Avancé implacable", "Chaque fois qu'un test de Moral est effectué pour une unité avec ce code, vous pouvez relancer ce test. \n Au lieu de suivre les règles normales pour les armes à tir rapide, les figurines ayant ce code tirant avec des armes à tir rapide effectuent deux fois plus d'attaques si la cible de la figurine qui tire est à 18 pouce. \n Quand le Protocole du Tyran Conquérant devient actif pour votre armée, si toutes les unités de votre armée (à l'exception des unités de l'AGENT DYNASTIQUE et du C'TAN SHARD) possèdent ce code, vous pouvez sélectionner les deux directives de ce protocole de commandement au lieu d'une seule.");
INSERT INTO Aptitude(id_faction, nom_apti, desc_apti) VALUES (1, "Protocole de réanimation", "Chaque fois que les protocoles de réanimation d'une unité se déclenche, effectuez des jets de protocole de réanimation pour cette unité en lançant un nombre de D6 égal à la caractéristiques de PV combinée de toutes les figurines en train de se réassembler. Chaque jet de protocole de réanimation de 5+ est placé dans un pool. Un jet de protocole de réanimation ne peut jamais être modifié par plus de -1 ou +1."),
(1, "Métal organique", "Au début de votre phase de Commandement, chaque figurine de cette unité regagne 1 PV perdue."),
(1, "Translocation dimensionnelle", "Au déploiement, vous pouvez placer cette unité dans une dimension hyperspatiale au lieu de la placer sur le champ de bataille. Dans ce cas, lors de l'étape Renforts de l'une de vos phases de mouvement, vous pouvez placer cette unité n'importe où sur le champ de bataille à une distance de plus de 9 pouce de toute figurine ennemi."),
(1, "Rites de réanimation", "À votre phase de commandement, vous pouvez choisir une unité amie NECRONS BASE à 6 pouce de cette figurine. Une figurine détruit de cette unité est réanimé. Si l'unité sélectionnée est une unité Guerrier Nécrons, D3 modèles détruits de cette unité sont réanimés à la place. Chaque unité ne peut être sélectionnée pour cette capacité qu'une fois par phase."),
(1, "Surchargeur Empyréen (Aura)", "Tant qu'une unité de PSYKER ennemie est à 12 pouce de cette figurine, à chaque fois qu'un test de Psychique est effectué pour cette unité, elle subit les Périls du Warp sur tout jet de dé qui inclut un double, au lieu d'un double 1 ou un double 6."),
(1, "Manipulateur d'énergie atomique", "Lors de la phase de combat, si cette figurine détruit un ou plusieurs figurines ennemies, alors à la fin de cette phase il peut utiliser sa capacité Augmentation mécanique comme si c'était la fin de votre phase de mouvement."),
(1, "Augmentation mécanique", "A la fin de votre phase de mouvement, vous pouvez sélectionner une unité amie NECRONS BASE à 6 pouce de cette figurine. Si vous le faites, lancez un D3 et consultez le tableau ci-dessous : \n 1. Jusqu'à la fin de la bataille, ajoutez 1 à la caractéristique de Force des figurines de cette unité. \n 2. Jusqu'à la fin de la bataille, ajoutez 1 à la caractéristique d'endurance des figurines de cette unité. \n 3. Jusqu'à la fin de la bataille, améliorez de 1 la caractéristique de capacité de tir des figurines de cette unité."),
(1, "Illuminor", "Cette figurine peut utiliser sa capacité Rites de réanimation une fois de plus par tour.");

-- Insertion des Unités
INSERT INTO Unité(faction_id_unit, sousFaction_unit, personnage_unit, trait_unit, nom_unit, nomFaction_unit, point_unit, min_unit, max_unit, mouvement_unit, cc_unit, ct_unit, force_unit, endurance_unit, pv_unit, attaque_unit, cd_unit, sv_unit)
SELECT num_faction, 1, true, 7, "Illuminor Szeras", nom_faction, 160, 1, 1, 8, 3, 3, 6, 6, 7, 4, 10, 3
FROM Faction 
WHERE num_faction = 1;

-- Insertion des armes
INSERT INTO Arme(nom_arme, id_faction, portée_arme, type_arme, force_arme, pa_arme, dégat_arme)
VALUES("Lance Spectrale (tir)", 1, 36, "Assaut D3", "8", -4, "D6");
INSERT INTO Arme(nom_arme, id_faction, type_arme, force_arme, pa_arme, dégat_arme)
VALUES("Lance Spectrale (mêlée)", 1, "mêlée", "util.", -4, "2");
INSERT INTO Arme(nom_arme, id_faction, type_arme, force_arme, pa_arme, dégat_arme, aptitude_arme)
VALUES("Jambes empaleuses", 1, "mêlée", "util.", -2, "1", "Chaque fois que le porteur combat, il fait 2 attaques supplémentaire avec cette arme.");

-- Insertion des equipements


-- Insertion des Reliques
INSERT INTO Reliques(id_faction, nom_relique, type_relique, desc_relique)
VALUES(1, "L'orbe d'éternité", "Equipement", "Figurine avec un orbe de résurrection uniquement. Cette Relique remplace un orbe de résurrection. Une fois par bataille, lors de votre phase de commandement, le porteur peut utiliser cette Relique. S'il le fait, choisissez une unité amie de <DYNASTIE> à 6 pouce du porteur qui n'est pas à sa force de départ et dont les protocoles de réanimation n'ont pas été mis en œuvre pendant cette phase. Les protocoles de réanimation de cette unité sont promulgués, et chaque modèle détruit de cette unité commence à se réassembler. Chaque fois qu'un jet de protocole de réanimation est effectué pour ces protocoles de réanimation, ajoutez 1 au résultat.");
INSERT INTO Reliques(id_faction, nom_relique, portée_relique, type_relique, force_relique, pa_relique, dégat_relique, aptitude_relique)
VALUES(1, "La flèche d'infinité", 120, "Assaut 1", 16, -5, "6", "Le porteur ne peut tirer qu'une seule fois avec cette arme qu'une fois par bataille.");
INSERT INTO Reliques(id_faction, nom_relique, type_relique, desc_relique)
VALUES(1, "La cassette de nanoscarabées", "Aptitude supplémentaire", "Chaque fois que le porteur utilise sa capacité Métal Organique, il récupère 1 blessure perdue supplémentaire.");

-- Insertion des Liaisons d'armes
INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Illuminor Szeras" AND nom_arme = "Lance Spectrale (tir)";
INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Illuminor Szeras" AND nom_arme = "Lance Spectrale (mêlée)";
INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Illuminor Szeras" AND nom_arme = "Jambes empaleuses";

-- Insertion des Liaisons d'Aptitudes
INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Illuminor Szeras" AND nom_apti = "Métal organique";
INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Illuminor Szeras" AND nom_apti = "Rites de réanimation";
INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Illuminor Szeras" AND nom_apti = "Surchargeur Empyréen (Aura)";
INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Illuminor Szeras" AND nom_apti = "Manipulateur d'énergie atomique";
INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Illuminor Szeras" AND nom_apti = "Augmentation mécanique";
INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Illuminor Szeras" AND nom_apti = "Illuminor";

-- Insertion des sorts
INSERT INTO Sort(id_faction, nom_sort) VALUES (2, "Death");