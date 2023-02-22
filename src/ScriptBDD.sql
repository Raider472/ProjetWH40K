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
    nom_faction varchar(15) NOT NULL,
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
    type_unit varchar(255) NOT NULL,
    note_unit varchar(500) DEFAULT NULL,
    point_unit int NOT NULL DEFAULT 0,
    min_unit int NOT NULL,
    max_unit int NOT NULL,
    nombre_sort int DEFAULT 0,
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
    base_arme BOOLEAN DEFAULT false,
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
    base_equipement BOOLEAN DEFAULT false,
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
    id_sousFaction int DEFAULT NULL,
    nom_relique varchar(255) NOT NULL,
    desc_relique varchar(750) DEFAULT NULL,
    portée_relique int DEFAULT NULL,
    type_relique varchar(255) NOT NULL,
    force_relique varchar(255) DEFAULT NULL,
    pa_relique int DEFAULT NULL,
    dégat_relique varchar(255) DEFAULT NULL,
    aptitude_relique varchar(750) DEFAULT NULL,
    prerequis_relique varchar(255) DEFAULT NULL,
    FOREIGN KEY(id_faction) REFERENCES Faction(num_faction),
    FOREIGN KEY(id_sousFaction) REFERENCES SousFaction(num_sousFaction)
);

-- -----------------------
CREATE TABLE Liste (
    num_liste int PRIMARY KEY NOT NULL,
    nom_liste varchar(255) NOT NULL,
    faction_liste varchar(255) NOT NULL
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

-- Insertion Des Factions ---------------------------------------
INSERT INTO Faction(nom_faction, alliance_faction) VALUES ("Nécrons", "Xeno"), ("Thousand Sons", "Chaos"), ("Space Marine", "Loyaliste");

-- Insertion pour les Nécrons

-- Insertion Des Sous Factions ---------------------------------------

-- Nécrons
INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Novokh", nom_faction FROM Faction WHERE num_faction = 1; 

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Szarekhan", nom_faction FROM Faction WHERE num_faction = 1;

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Mephrit", nom_faction FROM Faction WHERE num_faction = 1;

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Nephrekh", nom_faction FROM Faction WHERE num_faction = 1;

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Nihilakh", nom_faction FROM Faction WHERE num_faction = 1;

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Sautekh", nom_faction FROM Faction WHERE num_faction = 1;

-- Thousand Sons

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Culte du Temps", nom_faction FROM Faction WHERE num_faction = 2; 

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Culte de la Mutation", nom_faction FROM Faction WHERE num_faction = 2;

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Culte du Savoir", nom_faction FROM Faction WHERE num_faction = 2;

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Culte de la Duplicité", nom_faction FROM Faction WHERE num_faction = 2;

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Culte de l'Intrigue", nom_faction FROM Faction WHERE num_faction = 2;

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Culte de la Magie", nom_faction FROM Faction WHERE num_faction = 2;

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Culte de la Prophétie", nom_faction FROM Faction WHERE num_faction = 2;

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Culte du Changement", nom_faction FROM Faction WHERE num_faction = 2;

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Culte de la Manipulation", nom_faction FROM Faction WHERE num_faction = 2;

-- Space Marine

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Dark Angels", nom_faction FROM Faction WHERE num_faction = 3;

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "White Scars", nom_faction FROM Faction WHERE num_faction = 3;

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Space Wolf", nom_faction FROM Faction WHERE num_faction = 3; 

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Imperial Fists", nom_faction FROM Faction WHERE num_faction = 3; 

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Crimson Fists", nom_faction FROM Faction WHERE num_faction = 3; 

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Black Templar", nom_faction FROM Faction WHERE num_faction = 3; 

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Blood Angels", nom_faction FROM Faction WHERE num_faction = 3; 

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Flesh Tearers", nom_faction FROM Faction WHERE num_faction = 3; 

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Iron Hands", nom_faction FROM Faction WHERE num_faction = 3; 

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Ultramarines", nom_faction FROM Faction WHERE num_faction = 3;

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Salamanders", nom_faction FROM Faction WHERE num_faction = 3; 

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Raven Guard", nom_faction FROM Faction WHERE num_faction = 3; 

INSERT INTO SousFaction(id_faction, nom_sousFaction, nom_faction) SELECT num_faction, "Deathwatch", nom_faction FROM Faction WHERE num_faction = 3; 

-- Insertion des traits ---------------------------------------
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
(1, "Vanité imortelle", "Chaque fois que ce Seigneur de Guerre est censé perdre un PV suite à une blessure mortelle, jetez un D6: sur un 5+, le PV n'est pas perdu. \nCe Seigneur de Guerre a l'aptitude suivante: Vanité immortelle (aura): Tant qu'une unité Base<Dynastie> amie est à 6 pouce de cette figurine, chaque fois qu'un test d'attrition est effectué pour l'unité, ignorez-en certains ou tous les modificateurs."),
(1, "Servant du roi silencieux", "Ajoutez 3 pouce à la portée des aptitudes d'aura de ce Seigneur de Guerre (max 9). De plus, quand ce Seigneur de Guerre utilise les aptitudes Que Ma Volonté s'Acomplisse, Volonté du Dynaste ou Adaptation Stratégique, vous pouvez choisir une unité Base <Dynastie> amie à 12 pouce de ce Seigneur de Guerre au lieu de 9 pouce."),
(1, "Conquérent implacable(Aura)", "Tant qu'une unité Base<Dynastie> amie est à 6 pouce de ce Seigneur de Guerre, vous pouvez relancer les jets de charges pour l'unité."),
(1, "Combattant honorable", "A la phase de combat, chaque fois que ce Seigneur de Guerre est choisi pour combattre, il peut engager un combat honorable. Dans ce cas, choisissez une unité Personnage ennemie; jusqu'à la fin de la phase ajoutez 2 à la caractéristique d'Attaque de ce Seigneur de Guerre, mais il peut seulement faire des attaques qui ciblent l'unité Personnage ennemie.");

-- Insertion des Aptitudes ---------------------------------------
INSERT INTO Aptitude(id_faction, id_sousFaction, nom_apti, desc_apti) VALUES (1, 2, "Eveil par le meurtre", "Ajoutez 1 aux jets de charge pour les unités ayant ce code. \nChaque fois qu'une figurine ayant ce code fait une attaque de mêlée, si l'unité de la figurine a fait un mouvement de charge, a été chargée ou a accompli une Intervention Héroique à ce tour, améliorez de 1 la caractéristique de Pénétration d'armure de l'attaque. \nLorsque le protocole du Néant Avide devient actif pour votre armée, si toutes les unité de votre armée (à l'exception des unités DYNASTIC AGENT et C'TAN SHARD) possède ce code, vous pouvez sélectionner les deux directives de ce protocole de commande au lieu d'une seule."),
(1, 3, "Artificiers remarquables", "Chaque fois qu'une figurine ayant ce code perdrait un PV suite à une blessure mortelle, lancez un D6 ; sur un 5+, le PV n'est pas perdue. \nChaque fois qu'une unité ayant ce code est sélectionnée pour tirer ou combattre, vous pouvez relancer un seul jet de blessure en faisant les attaques de l'unité. \nQuand le Protocole des Légions Impérissable devient actif pour votre armée, si toutes les unités de votre armée (à l'exception des unités D'AGENT DYNASTIQUE et d'ECHARDE C'TAN) possède ce code, vous pouvez sélectionner les deux directives de ce protocole de commandement au lieu d'une seule."),
(1, 4, "Fureur Solaire", "Ajoutez 3 pouce à la caractéristique de Portée des armes de tir (à l'exception des pistolets) dont les figurines possédant ce code sont équipées. \nChaque fois qu'une figurine possédant ce code effectue une attaque à distance qui cible une unité située à mi-distance, la caractéristique de pénétration de l'armure de cette attaque est améliorée de 1. \nQuand le protocole des Astres Vengeurs devient actif pour votre armée, si toutes les unités de votre armée (à l'exception des unités de l'AGENT DYNASTIQUE et du C'TAN SHARD) possèdent ce code, vous pouvez sélectionner les deux directives de ce protocole de commandement au lieu d'une seule."),
(1, 5, "Rayons de translocalisation", "Les figurines avec ce code ont une sauvegarde invulnérable de 6+. \nChaque fois qu'une unité avec ce code Avance, elle peut se translocaliser. Si elle le fait, ne faites pas de jet d'Avance pour elle. A la place, jusqu'à la fin de la phase, ajoutez 6 pouce à la caractéristique de mouvement des figurines de cette unité. Si une unité se translocalise, jusqu'à la fin du tour, les figurines de cette unité ne peuvent pas tirer. \nChaque fois qu'une unité avec ce code Bat en Retraite ou se translocalise, jusqu'à la fin de la phase, les figurines de cette unité peuvent se déplacer à travers les figurines et le terrain comme s'ils n'étaient pas là. \nQuand le Protocole de la Tempête Soudaine devient actif pour votre armée, si chaque unité de votre armée (à l'exception des unités de l'AGENT DYNASTIQUE et de la CARTE C'TAN) possède ce code, vous pouvez sélectionner les deux directives de ce protocole de commandement au lieu d'une seule."),
(1, 6, "Terrritorialistes agressifs", "Les unités avec ce code ont la capacité Objectif Sécurisé. Si une figurine d'une telle unité possède déjà cette aptitude, la figurine compte comme une figurine supplémentaire lors de la détermination du contrôle d'un pion d'objectif. \nChaque fois qu'une attaque ayant une caractéristique de pénétration d'armure de - 1 est allouée à une figurine ayant ce code, si l'unité de la figurine est entièrement dans la zone de déploiement de son contrôleur, cette attaque a une caractéristique de pénétration d'armure de 0 à la place. \nQuand le Protocole du Gardien Éternel devient actif pour votre armée, si chaque unité de votre armée (à l'exception des unités de l'AGENT DYNASTIQUE et du C'TAN SHARD) possède ce code, vous pouvez sélectionner les deux directives de ce protocole de commandement au lieu d'une seule."),
(1, 7, "Avancé implacable", "Chaque fois qu'un test de Moral est effectué pour une unité avec ce code, vous pouvez relancer ce test. \nAu lieu de suivre les règles normales pour les armes à tir rapide, les figurines ayant ce code tirant avec des armes à tir rapide effectuent deux fois plus d'attaques si la cible de la figurine qui tire est à 18 pouce. \nQuand le Protocole du Tyran Conquérant devient actif pour votre armée, si toutes les unités de votre armée (à l'exception des unités de l'AGENT DYNASTIQUE et du C'TAN SHARD) possèdent ce code, vous pouvez sélectionner les deux directives de ce protocole de commandement au lieu d'une seule.");

INSERT INTO Aptitude(id_faction, nom_apti, desc_apti) VALUES (1, "Protocole de réanimation", "Chaque fois que les protocoles de réanimation d'une unité se déclenche, effectuez des jets de protocole de réanimation pour cette unité en lançant un nombre de D6 égal à la caractéristiques de PV combinée de toutes les figurines en train de se réassembler. Chaque jet de protocole de réanimation de 5+ est placé dans un pool. Un jet de protocole de réanimation ne peut jamais être modifié par plus de -1 ou +1."),
(1, "Métal organique", "Au début de votre phase de commandement, chaque figurine de cette unité récuère 1 PV perdue."),
(1, "Translocation dimensionnelle", "Au déploiement, vous pouvez placer cette unité dans une dimension hyperspatiale au lieu de la placer sur le champ de bataille. Dans ce cas, lors de l'étape Renforts de l'une de vos phases de mouvement, vous pouvez placer cette unité n'importe où sur le champ de bataille à une distance de plus de 9 pouce de toute figurine ennemi."),
(1, "Rites de réanimation", "À votre phase de commandement, vous pouvez choisir une unité amie NECRONS BASE à 6 pouce de cette figurine. Une figurine détruit de cette unité est réanimé. Si l'unité sélectionnée est une unité Guerrier Nécrons, D3 modèles détruits de cette unité sont réanimés à la place. Chaque unité ne peut être sélectionnée pour cette capacité qu'une fois par phase."),
(1, "Surchargeur Empyréen (Aura)", "Tant qu'une unité de PSYKER ennemie est à 12 pouce de cette figurine, à chaque fois qu'un test de Psychique est effectué pour cette unité, elle subit les Périls du Warp sur tout jet de dé qui inclut un double, au lieu d'un double 1 ou un double 6."),
(1, "Manipulateur d'énergie atomique", "Lors de la phase de combat, si cette figurine détruit un ou plusieurs figurines ennemies, alors à la fin de cette phase il peut utiliser sa capacité Augmentation mécanique comme si c'était la fin de votre phase de mouvement."),
(1, "Augmentation mécanique", "A la fin de votre phase de mouvement, vous pouvez sélectionner une unité amie NECRONS BASE à 6 pouce de cette figurine. Si vous le faites, lancez un D3 et consultez le tableau ci-dessous : \n1. Jusqu'à la fin de la bataille, ajoutez 1 à la caractéristique de Force des figurines de cette unité. \n2. Jusqu'à la fin de la bataille, ajoutez 1 à la caractéristique d'endurance des figurines de cette unité. \n3. Jusqu'à la fin de la bataille, améliorez de 1 la caractéristique de capacité de tir des figurines de cette unité."),
(1, "Illuminor", "Cette figurine peut utiliser sa capacité Rites de réanimation une fois de plus par tour."),
(1, "Progression implacable", "Tant qu'une unité amie DYNASTYIE BASE se trouve dans un rayon de 6 pouce de cette figurine, chaque fois que cette unité est sélectionnée pour effectuer un Mouvement ou une Avance Normale, jusqu'à la fin de la phase, ajoutez 1 pouce à la caractéristique de Mouvement des figurines de cette unité."),
(1, "Disrupteur de phase", "Cette figurine à une sauvegarde invulnérable de 4+"),
(1, "Que ma volonté s'accomplisse", "Lors de votre phase de commandement, vous pouvez choisir une unité amie de DYNASTIE BASE dans un rayon de 9 pouce de cette figurine. Jusqu'au début de votre prochaine phase de commandement, chaque fois qu'une figurine de cette unité effectue une attaque, ajoutez 1 au jet de touche de cette attaque. Chaque unité ne peut être sélectionnée pour cette capacité qu'une fois par phase."),
(1, "Leur nombre est légion", "Relancez les jets de Protocoles de Réanimation de 1 pour cette unité."),
(1, "Programmés pour détruire", "Chaque fois qu'une figurine de cette unité fait une attque, relancez tout jet de touche de 1."),
(1, "Construct viral", "Si votre armée est réglementaire, pour chaque unité CULTE DESTROYER DYNASTIE incluse dans un détachement, une unité PLASMACYTE CANOPTEK DYNASTIEpeut être incluse dans le détachement sans occuper de choix de rôle tactique. Vous ne pouvez pas inclure plus d'unités PLASMACYTE CANOPTEK DYNASTIE dans un détachement qu'il n'y a d'unités CULTE DESTROYER DYNASTIE dans le détachement."),
(1, "Protocoles d'échappatoire", "Tant que ce modèle se trouve à 3 pouce d'une unité amie DESTROYER CULTE DYNASTIE, les figurines ennemis ne peuvent pas la cibler avec des armes à distance, sauf si c'est la cible éligible la plus proche. De plus, cette unité ne peut pas effectuer d'actions."),
(1, "Protocoles de rappel", "Lors de l'étape des Tests de Cohérence d'Unité de la phase de Moral, si cette figurine n'est pas à 6 pouce d'une unité amie de DESTROYER CULTE DYNASTIE, cette figurine est détruite."),
(1, "Démence injectée", "Une fois par tour, au début de votre phase de charge ou de la phase de combat, vous pouvez choisir une unité amie CULTE DESTROYER DYNASTIE dans un rayon de 3 pouce de ce modèle. Si vous le faites, lancez un D6 : sur 1, une figurine de cette unité est détruit. Quel que soit le résultat, jusqu'à la fin du tour, ajoutez 1 aux caractéristiques Force et Attaques des modèles de cette unité. Chaque unité ne peut être sélectionnée pour cette capacité qu'une fois par tour."),
(1, "Faux d'hyperphase", "Chaque fois qu'une figurine de cette unité fait une attaque avec une FAUX D'HYPERPHASE, un jet de touche non modifié de 6 cause 1 touches supplémentaire."),
(1, "Corps sinueux", "A chaque attaque de mêlée contre cette unité, soustrayez 1 au jet de touche de l'attaque."),
(1, "Horreurs fouisseuses", "Pendant le déploiement, vous pouvez mettre en place cette unité sous terre au lieu de la mettre en place sur le champ de bataille. Dans ce cas, pendant l'étape Renforts de l'une de vos phases de mouvement, vous pouvez installer cette unité n'importe où sur le champ de bataille à une distance de plus de 9 pouce de tout modèle ennemi."),
(1, "Attaque furtive", "Cette unité est éligible pour tirer et déclarer une charge à un tours lors duquel elle a battu en retraite."),
(1, "Enveloppe spectrale", "Les modèles de cette unité ont une sauvegarde invulnérable de 4+. De plus, à chaque fois que cette unité effectue un mouvement normal, avance, recule ou effectue un mouvement de charge, jusqu'à ce que ce mouvement soit terminé, les modèles de cette unité peuvent se déplacer horizontalement à travers les modèles et les éléments du terrain (ils ne peuvent pas terminer un mouvement sur un autre modèle ou son socle)."),
(1, "Champ de confinement", "Cette figurine a une sauvegarde invulnérable de 4+"),
(1, "Construct sentinelle", "Chaque fois qu'une unité ennemie déclare une charge contre une unité amie de DYNASTIE ou AGENT DYNASTIQUE dans un rayon de 6 pouce de cette figurine, à moins que cette figurine ne soit à portée d'engagement de figurines ennemi, ce modèle peut tirer en État d’alerte sur l'unité qui charge comme si elle était aussi la cible de cette charge (en plus de toutes les autres unités qui tirent en Surveillances). Chaque fois que cette figurine tire en État d’alerte, il effectue des attaques avec son Eclateur du jugement dernier en utilisant le profil haute puissance."),
(1, "Explosion", "Quand cette figurine est détruite, jetez un D6 avant de la retirer du jeu. Sur un 5+, elle explose, et chaque unité à 6 pouce subit D3 blessure mortelles.");

-- Insertion des Unités ---------------------------------------
INSERT INTO Unité(faction_id_unit, sousFaction_unit, personnage_unit, trait_unit, nom_unit, nomFaction_unit, type_unit, point_unit, min_unit, max_unit, mouvement_unit, cc_unit, ct_unit, force_unit, endurance_unit, pv_unit, attaque_unit, cd_unit, sv_unit)
SELECT num_faction, 1, true, 7, "Illuminor Szeras", nom_faction, "QG", 160, 1, 1, 8, 3, 3, 6, 6, 7, 4, 10, 3
FROM Faction 
WHERE num_faction = 1;

INSERT INTO Unité(faction_id_unit, personnage_unit, nom_unit, nomFaction_unit, type_unit, point_unit, min_unit, max_unit, mouvement_unit, cc_unit, ct_unit, force_unit, endurance_unit, pv_unit, attaque_unit, cd_unit, sv_unit)
SELECT num_faction, true, "Tétraque", nom_faction, "QG", 95, 1, 1, 6, 2, 2, 5, 5, 5, 4, 10, 3
FROM Faction 
WHERE num_faction = 1;

INSERT INTO Unité(faction_id_unit, personnage_unit, nom_unit, nomFaction_unit, type_unit, point_unit, min_unit, max_unit, mouvement_unit, cc_unit, ct_unit, force_unit, endurance_unit, pv_unit, attaque_unit, cd_unit, sv_unit)
SELECT num_faction, false, "Guerriers Nécrons", nom_faction, "Troupes", 13, 10, 20, 5, 3, 3, 4, 4, 1, 1, 10, 4
FROM Faction 
WHERE num_faction = 1;

INSERT INTO Unité(faction_id_unit, personnage_unit, nom_unit, nomFaction_unit, type_unit, point_unit, min_unit, max_unit, mouvement_unit, cc_unit, ct_unit, force_unit, endurance_unit, pv_unit, attaque_unit, cd_unit, sv_unit)
SELECT num_faction, false, "Skorpekh Destroyers", nom_faction, "Elite", 35, 3, 6, 8, 3, 3, 5, 5, 3, 3, 10, 3
FROM Faction 
WHERE num_faction = 1;

INSERT INTO Unité(faction_id_unit, personnage_unit, nom_unit, nomFaction_unit, type_unit, point_unit, min_unit, max_unit, mouvement_unit, cc_unit, ct_unit, force_unit, endurance_unit, pv_unit, attaque_unit, cd_unit, sv_unit)
SELECT num_faction, false, "Plasmacyte Canoptek", nom_faction, "Elite", 15, 1, 1, 8, 4, 4, 4, 5, 1, 1, 10, 4
FROM Faction 
WHERE num_faction = 1;

INSERT INTO Unité(faction_id_unit, personnage_unit, nom_unit, nomFaction_unit, type_unit, point_unit, min_unit, max_unit, mouvement_unit, cc_unit, ct_unit, force_unit, endurance_unit, pv_unit, attaque_unit, cd_unit, sv_unit)
SELECT num_faction, false, "Nuées de Scarabées Canopteks", nom_faction, "Attaque rapide", 15, 3, 9, 10, 4, 0, 3, 3, 4, 4, 10, 6
FROM Faction 
WHERE num_faction = 1;

INSERT INTO Unité(faction_id_unit, personnage_unit, nom_unit, nomFaction_unit, type_unit, point_unit, min_unit, max_unit, mouvement_unit, cc_unit, ct_unit, force_unit, endurance_unit, pv_unit, attaque_unit, cd_unit, sv_unit)
SELECT num_faction, false, "Destroyers Ophydiens", nom_faction, "Attaque rapide", 35, 3, 6, 10, 3, 3, 4, 4, 3, 3, 10, 4
FROM Faction 
WHERE num_faction = 1;

INSERT INTO Unité(faction_id_unit, personnage_unit, nom_unit, nomFaction_unit, type_unit, point_unit, min_unit, max_unit, mouvement_unit, cc_unit, ct_unit, force_unit, endurance_unit, pv_unit, attaque_unit, cd_unit, sv_unit)
SELECT num_faction, false, "Spectres Canopteks", nom_faction, "Attaque rapide", 35, 3, 6, 12, 4, 4, 4, 5, 3, 4, 10, 3
FROM Faction 
WHERE num_faction = 1;

INSERT INTO Unité(faction_id_unit, personnage_unit, nom_unit, nomFaction_unit, type_unit, note_unit, point_unit, min_unit, max_unit, mouvement_unit, cc_unit, ct_unit, force_unit, endurance_unit, pv_unit, attaque_unit, cd_unit, sv_unit)
SELECT num_faction, false, "Maraudeur Canoptek", nom_faction, "Soutien", "(8 M, 5 CC, 2 A, si entre 4-6 PV.) \n(6 M, 6 CC, 1 A si entre 1-3 PV.)", 140, 1, 1, 10, 4, 4, 6, 6, 12, 3, 10, 3
FROM Faction 
WHERE num_faction = 1;

-- Insertion des armes ---------------------------------------

-- Tir ++++++++++++++++++++++++++++++++++++++++++++
INSERT INTO Arme(nom_arme, id_faction, portée_arme, type_arme, force_arme, pa_arme, dégat_arme, base_arme)
VALUES("Lance Spectrale (tir)", 1, 36, "Assaut D3", "8", -4, "D6", true);

INSERT INTO Arme(nom_arme, id_faction, portée_arme, type_arme, force_arme, pa_arme, dégat_arme, aptitude_arme, point_arme, switchable_arme, base_arme)
VALUES("Arbalète à tachyons", 1, 120, "Assaut 1", "12", -5, "D6", "Le porteur ne peut tirer qu'une seule fois par bataille avec cette arme", 5, true, true);

INSERT INTO Arme(nom_arme, id_faction, portée_arme, type_arme, force_arme, pa_arme, dégat_arme, switchable_arme)
VALUES("Bâton de lumière (Tir)", 1, 18, "Assaut 3", "5", -2, "1", true);

INSERT INTO Arme(nom_arme, id_faction, portée_arme, type_arme, force_arme, pa_arme, dégat_arme, switchable_arme, base_arme)
VALUES("Écorcheur Gauss", 1, 24, "Tir Rapide 1", "4", -1, "1", true, true);

INSERT INTO Arme(nom_arme, id_faction, portée_arme, type_arme, force_arme, pa_arme, dégat_arme, switchable_arme)
VALUES("Faucheuse Gauss", 1, 12, "Assaut 2", "5", -2, "1", true);

INSERT INTO Arme(nom_arme, id_faction, portée_arme, type_arme, force_arme, pa_arme, dégat_arme, point_arme, switchable_arme, base_arme)
VALUES("Projecteur de particules", 1, 12, "Pistolet 2", "6", 0, "1", 5, true, true);

INSERT INTO Arme(nom_arme, id_faction, portée_arme, type_arme, force_arme, pa_arme, dégat_arme, point_arme, switchable_arme)
VALUES("Faisceau transdimensionnel", 1, 12, "Assaut 1", "4", -3, "3", 10, true);

INSERT INTO Arme(nom_arme, id_faction, portée_arme, type_arme, force_arme, pa_arme, dégat_arme, aptitude_arme, base_arme)
VALUES("Eclateur du jugement dernier (Basse puissance)", 1, 24, "Lourde 6", "8", -2, "D3", "Déflagration", true);

INSERT INTO Arme(nom_arme, id_faction, portée_arme, type_arme, force_arme, pa_arme, dégat_arme, aptitude_arme, base_arme)
VALUES("Eclateur du jugement dernier (Haute puissance)", 1, 48, "Lourde 6", "10", -5, "D6", "Déflagration. Le porteur ne peut faire des attaques avec ce profil que s'il est resté immobile à sa phase de mouvement précédente.", true);

INSERT INTO Arme(nom_arme, id_faction, portée_arme, type_arme, force_arme, pa_arme, dégat_arme, base_arme)
VALUES("Ecorcheur gauss jumelé", 1, 24, "Tir Rapide 2", "4", -1, "1", true);

-- Mêlée ++++++++++++++++++++++++++++++++++++++++++++
INSERT INTO Arme(nom_arme, id_faction, type_arme, force_arme, pa_arme, dégat_arme, base_arme)
VALUES("Lance Spectrale (mêlée)", 1, "mêlée", "util.", -4, "2", true);

INSERT INTO Arme(nom_arme, id_faction, type_arme, force_arme, pa_arme, dégat_arme, aptitude_arme, base_arme)
VALUES("Jambes empaleuses", 1, "mêlée", "util.", -2, "1", "Chaque fois que le porteur combat, il fait 2 attaques supplémentaire avec cette arme.", true);

INSERT INTO Arme(nom_arme, id_faction, type_arme, force_arme, pa_arme, dégat_arme, switchable_arme, base_arme)
VALUES("Vouge d'hyperphase", 1, "mêlée", "+2", -3, "D3", true, true);

INSERT INTO Arme(nom_arme, id_faction, type_arme, force_arme, pa_arme, dégat_arme, switchable_arme)
VALUES("Épée d'hyperphase", 1, "mêlée", "+1", -3, "1", true);

INSERT INTO Arme(nom_arme, id_faction, type_arme, force_arme, pa_arme, dégat_arme, switchable_arme)
VALUES("Bâton de lumière (mêlée)", 1, "mêlée", "Util.", -2, "1", true);

INSERT INTO Arme(nom_arme, id_faction, type_arme, force_arme, pa_arme, dégat_arme, aptitude_arme, switchable_arme)
VALUES("Lame du néant", 1, "mêlée", "Util.", -3, "1", "Chaque fois que le porteur combat, il fait 1 attaque supplémentaire avec cette arme.", true);

INSERT INTO Arme(nom_arme, id_faction, type_arme, force_arme, pa_arme, dégat_arme, aptitude_arme, switchable_arme)
VALUES("Lame du néant", 1, "mêlée", "Util.", -3, "1", "Chaque fois que le porteur combat, il fait 1 attaque supplémentaire avec cette arme.", true);

INSERT INTO Arme(nom_arme, id_faction, type_arme, force_arme, pa_arme, dégat_arme, aptitude_arme, switchable_arme)
VALUES("Faux du néant", 1, "mêlée", "x2", -4, "3", "A chaque attaque de cette arme, soustrayez 1 au jet de touche de l'attaque.", true);

INSERT INTO Arme(nom_arme, id_faction, type_arme, force_arme, pa_arme, dégat_arme, switchable_arme)
VALUES("Fauchard", 1, "mêlée", "+2", -4, "2", true);

INSERT INTO Arme(nom_arme, id_faction, type_arme, force_arme, pa_arme, dégat_arme, base_arme)
VALUES("Faux d'hyperphase", 1, "mêlée", "+2", -4, "3", true);

INSERT INTO Arme(nom_arme, id_faction, type_arme, force_arme, pa_arme, dégat_arme, aptitude_arme, base_arme)
VALUES("Fauchons d'hyperphase", 1, "mêlée", "Util.", -3, "2", "Chaque fois que le porteur combat, il fait 1 attaque supplémentaire avec cette arme.", true);

INSERT INTO Arme(nom_arme, id_faction, type_arme, force_arme, pa_arme, dégat_arme, base_arme)
VALUES("Sonde monomoléculaire", 1, "mêlée", "Util.", -1, "1", true);

INSERT INTO Arme(nom_arme, id_faction, type_arme, force_arme, pa_arme, dégat_arme, aptitude_arme, base_arme)
VALUES("Mandibules", 1, "mêlée", "Util.", 0, "1", "A chaque attaque de cette arme, un jet de touche non modifié de 6 blesse automatiquement la cible.", true);

INSERT INTO Arme(nom_arme, id_faction, type_arme, force_arme, pa_arme, dégat_arme, aptitude_arme, base_arme)
VALUES("Griffes ophydiennes", 1, "mêlée", "Util.", -1, "1", "Chaque fois que le porteur combat, il fait 2 attaque supplémentaires avec cette arme.", true);

INSERT INTO Arme(nom_arme, id_faction, type_arme, force_arme, pa_arme, dégat_arme, switchable_arme, base_arme)
VALUES("Griffe acérées", 1, "mêlée", "+2", -2, "2", true, true);

INSERT INTO Arme(nom_arme, id_faction, type_arme, force_arme, pa_arme, dégat_arme, aptitude_arme, switchable_arme)
VALUES("Câbles constricteurs", 1, "mêlée", "Util.", -1, "1", "A chaque attaque de cette arme, faites 2 jets de touche au lieu de 1", true);

-- Insertion des equipements ---------------------------------------
INSERT INTO Equipement(nom_equipement, id_faction, desc_equipement, switchable_equipement, base_equipement, point_equipement)
VALUES("Orbe de résurrection", 1, "Une fois par bataille, à votre phase de Commandement, le porteur peut utiliser son orbe de résurrection. Dans ce cas, choisissez une unité DYNASTIE amie à 6 pouces du porteur, n'étant pas à son Effectif initial et dont les protocoles de réanimiations ne se sont pas déclenchés à cette phase. Les protocoles de réanimation de l'unité se déclenchent, et toutes les figurines détruites de l'unité commencent à se réassembler.", true, true, 30);

-- Insertion des Reliques ---------------------------------------
INSERT INTO Reliques(id_faction, nom_relique, type_relique, desc_relique, prerequis_relique)
VALUES(1, "L'orbe d'éternité", "Equipement", "Figurine avec un orbe de résurrection uniquement. Cette Relique remplace un orbe de résurrection. Une fois par bataille, lors de votre phase de commandement, le porteur peut utiliser cette Relique. S'il le fait, choisissez une unité amie de <DYNASTIE> à 6 pouce du porteur qui n'est pas à sa force de départ et dont les protocoles de réanimation n'ont pas été mis en œuvre pendant cette phase. Les protocoles de réanimation de cette unité sont promulgués, et chaque modèle détruit de cette unité commence à se réassembler. Chaque fois qu'un jet de protocole de réanimation est effectué pour ces protocoles de réanimation, ajoutez 1 au résultat.", "Orbe de résurrection");

INSERT INTO Reliques(id_faction, nom_relique, portée_relique, type_relique, force_relique, pa_relique, dégat_relique, aptitude_relique, prerequis_relique)
VALUES(1, "La flèche d'infinité", 120, "Assaut 1", "16", -5, "6", "Le porteur ne peut tirer qu'une seule fois avec cette arme qu'une fois par bataille.", "Arbalète à tachyons");

INSERT INTO Reliques(id_faction, nom_relique, type_relique, desc_relique)
VALUES(1, "La cassette de nanoscarabées", "Equipement", "Chaque fois que le porteur utilise sa capacité Métal Organique, il récupère 1 blessure perdue supplémentaire.");

INSERT INTO Reliques(id_faction, nom_relique, type_relique, desc_relique)
VALUES(1, "Voile de ténèbres", "Equipement", "Une fois par bataille, lors de votre phase de mouvement, le porteur peut utiliser cette Relique. S'il le fait, l'unité du porteur et jusqu'à une unité amie <DYNASTY> BASE dans un rayon de 3 pouce du porteur peuvent être retirées du champ de bataille et remises en place n'importe où sur le champ de bataille à plus de 9 pouce de tout modèle ennemi. Si deux unités sont remises en place sur le champ de bataille en utilisant cette Relique, les deux unités doivent être placées intégralement à moins de 6 pouce l'une de l'autre.");

INSERT INTO Reliques(id_faction, nom_relique, portée_relique, type_relique, force_relique, pa_relique, dégat_relique, aptitude_relique, prerequis_relique)
VALUES(1, "Bâton voltaique (tir)", 18, "Assaut 4", "6", -2, "2", "Chaque fois qu'une attaque est effectuée avec cette arme, un jet de touche de 6 non modifié permet d'obtenir 2 touches supplémentaires.", "Bâton de lumière");

INSERT INTO Reliques(id_faction, nom_relique, type_relique, force_relique, pa_relique, dégat_relique, prerequis_relique)
VALUES(1, "Bâton voltaique (mêlée)", "mêlée", "+2", -2, "2", "Bâton de lumière");

INSERT INTO Reliques(id_faction, nom_relique, type_relique, force_relique, pa_relique, dégat_relique, aptitude_relique, prerequis_relique)
VALUES(1, "Fauche-le-néant", "mêlée", "+2", -4, "3", "À chaque attaque de cette arme, les règles permettant d'ignorer les blessures ne peuvent pas être utilisées.", "Faux du néant ou Fauchard");

INSERT INTO Reliques(id_faction, nom_relique, type_relique, desc_relique, prerequis_relique)
VALUES(1, "Trame sempiternelle", "Equipement", "Figurine d'INFANTERIE NOBLE seulement. Ajoutez 1 aux caractéristique d'Endurance et de Points de Vie du porteu.", "Infanterie noble");

INSERT INTO Reliques(id_faction, nom_relique, portée_relique, type_relique, force_relique, pa_relique, dégat_relique, aptitude_relique)
VALUES(1, "Le gantelet du conflagrateur", 12, "Pistolet 1", NULL, NULL, NULL, "Chaque fois qu'une attaque est effectuée avec cette arme, cette attaque touche automatiquement la cible. Au lieu de faire un jet de blessure, lancez un D6 pour chaque modèle de l'unité cible : cette unité subit 1 blessure mortelle pour chaque résultat de 6 et la séquence d'attaque se termine.");

INSERT INTO Reliques(id_faction, id_sousFaction, nom_relique, portée_relique, type_relique, force_relique, pa_relique, dégat_relique, prerequis_relique)
VALUES(1, 4, "Conduit stellaire", 36, "Tir rapide 3", "6", -2, "2", "Mephrit");

INSERT INTO Reliques(id_faction, id_sousFaction, nom_relique, type_relique, desc_relique, prerequis_relique)
VALUES(1, 3, "Le diadème du souverain", "Equipement", "Amplificateur d'ondes de commandement (Aura) : Tant qu'une unité SZAREKHAN amie se trouve dans un rayon de 9 pouce du porteur, cette unité bénéficie de la directive sélectionnée du protocole de commandement actif de votre armée tant qu'elle se trouve dans un rayon de 9 pouce d'un modèle de PERSONNAGE NECRONS ami (à l'exception des modèles de SHARD C'TAN), au lieu de 6 pouce. \nOptimisateur de cortex synthétique (Aura) : Tant qu'une unité SZAREKHAN BASE amie se trouve dans un rayon de 9 pouce de son porteur, cette unité bénéficie des deux directives du protocole de commandement actif de votre armée, au lieu de la seule sélectionnée.", "Noble szarekhan");

INSERT INTO Reliques(id_faction, id_sousFaction, nom_relique, type_relique, desc_relique, prerequis_relique)
VALUES(1, 6, "Le manteau d'infinité", "Equipement", "Ajoutez 1 aux jets de sauvegarde d'armure pour le porteur. \nChaque fois le que le porteur est censé perdre un PV, jetez un D6: sur un jet de 6, le PV n'est pas perdu.", "Nihilakh");

INSERT INTO Reliques(id_faction, id_sousFaction, nom_relique, type_relique, force_relique, pa_relique, dégat_relique, aptitude_relique, prerequis_relique)
VALUES(1, 2, "La faux de sang", "mêlée", "+2", -4, "2", "Chaque fois que le porteur combat, il fait 2 attaques supplémentaires avec cette arme.", "Novokh avec Faux du néant ou Fauchard");

INSERT INTO Reliques(id_faction, id_sousFaction, nom_relique, type_relique, desc_relique, prerequis_relique)
VALUES(1, 7, "Le masque du vainqueur", "Equipement", "Figurine Sautekh uniquement. Au début de la phase de combat, vous pouvez choisir une unité ennemie dans un rayon de 3 pouce autour du porteur. Cette unité n'est pas éligible pour combattre cette phase jusqu'à ce que toutes les unités éligibles de votre armée l'aient fait.", "Sautekh");

INSERT INTO Reliques(id_faction, id_sousFaction, nom_relique, portée_relique, type_relique, force_relique, pa_relique, dégat_relique, aptitude_relique, prerequis_relique)
VALUES(1, 5, "Bâton solaire (tir)", 24, "Assaut 6", "5", -2, "1", "Chaque fois qu'une attaque est effectuée avec cette arme contre une unité d'infanterie, si une touche est causée, alors jusqu'à la fin du tour cette unité est aveuglée. Les unités aveuglées ne peuvent pas tirer en état d'alerte ni préparer leur défense.", "Nephrekh avec un Bâton de lumière");

INSERT INTO Reliques(id_faction, id_sousFaction, nom_relique, type_relique, force_relique, pa_relique, dégat_relique, aptitude_relique, prerequis_relique)
VALUES(1, 5, "Bâton solaire (mêlée)", "mêlée", "util.", -2, "1", "Chaque fois qu'une attaque est effectuée avec cette arme contre une unité d'infanterie, si une touche est causée, alors jusqu'à la fin du tour cette unité est aveuglée. Les unités aveuglées ne peuvent pas tirer en état d'alerte ni préparer leur défense.", "Nephrekh avec un Bâton de lumière");

-- Insertion des Liaisons d'armes ---------------------------------------
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

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Tétraque" AND nom_arme = "Arbalète à tachyons";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Tétraque" AND nom_arme = "Vouge d'hyperphase";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Tétraque" AND nom_arme = "Épée d'hyperphase";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Tétraque" AND nom_arme = "Bâton de lumière (Tir)";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Tétraque" AND nom_arme = "Bâton de lumière (mêlée)";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Tétraque" AND nom_arme = "Lame du néant";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Tétraque" AND nom_arme = "Faux du néant";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Tétraque" AND nom_arme = "Fauchard";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Guerriers Nécrons" AND nom_arme = "Écorcheur Gauss";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Guerriers Nécrons" AND nom_arme = "Faucheuse Gauss";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Skorpekh Destroyers" AND nom_arme = "Faux d'hyperphase";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Skorpekh Destroyers" AND nom_arme = "Fauchons d'hyperphase";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Plasmacyte Canoptek" AND nom_arme = "Sonde monomoléculaire";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Nuées de Scarabées Canopteks" AND nom_arme = "Mandibules";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Destroyers Ophydiens" AND nom_arme = "Faux d'hyperphase";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Destroyers Ophydiens" AND nom_arme = "Fauchons d'hyperphase";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Destroyers Ophydiens" AND nom_arme = "Griffes ophydiennes";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Spectres Canopteks" AND nom_arme = "Projecteur de particules";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Spectres Canopteks" AND nom_arme = "Faisceau transdimensionnel";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Spectres Canopteks" AND nom_arme = "Griffe acérées";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Spectres Canopteks" AND nom_arme = "Câbles constricteurs";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Maraudeur Canoptek" AND nom_arme = "Eclateur du jugement dernier (Basse puissance)";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Maraudeur Canoptek" AND nom_arme = "Eclateur du jugement dernier (Haute puissance)";

INSERT INTO ArmeLiaison(id_arme, id_unit, nom_arme, nom_unit)
SELECT num_arme, numéro_unit, nom_arme, nom_unit
FROM Arme, Unité
WHERE nom_unit = "Maraudeur Canoptek" AND nom_arme = "Ecorcheur gauss jumelé";

-- Insertion des Liaisons d'Aptitudes ---------------------------------------
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

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Tétraque" AND nom_apti = "Métal organique";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Tétraque" AND nom_apti = "Progression implacable";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Tétraque" AND nom_apti = "Disrupteur de phase";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Tétraque" AND nom_apti = "Que ma volonté s'accomplisse";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Guerriers Nécrons" AND nom_apti = "Protocole de réanimation";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Guerriers Nécrons" AND nom_apti = "Leur nombre est légion";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Skorpekh Destroyers" AND nom_apti = "Métal organique";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Skorpekh Destroyers" AND nom_apti = "Protocole de réanimation";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Skorpekh Destroyers" AND nom_apti = "Programmés pour détruire";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Plasmacyte Canoptek" AND nom_apti = "Translocation dimensionnelle";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Plasmacyte Canoptek" AND nom_apti = "Construct viral";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Plasmacyte Canoptek" AND nom_apti = "Protocoles d'échappatoire";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Plasmacyte Canoptek" AND nom_apti = "Protocoles de rappel";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Plasmacyte Canoptek" AND nom_apti = "Démence injectée";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Nuées de Scarabées Canopteks" AND nom_apti = "Métal organique";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Nuées de Scarabées Canopteks" AND nom_apti = "Protocole de réanimation";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Destroyers Ophydiens" AND nom_apti = "Métal organique";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Destroyers Ophydiens" AND nom_apti = "Protocole de réanimation";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Destroyers Ophydiens" AND nom_apti = "Programmés pour détruire";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Destroyers Ophydiens" AND nom_apti = "Faux d'hyperphase";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Destroyers Ophydiens" AND nom_apti = "Corps sinueux";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Destroyers Ophydiens" AND nom_apti = "Horreurs fouisseuses";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Spectres Canopteks" AND nom_apti = "Métal organique";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Spectres Canopteks" AND nom_apti = "Protocole de réanimation";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Spectres Canopteks" AND nom_apti = "Attaque furtive";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Spectres Canopteks" AND nom_apti = "Enveloppe spectrale";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Maraudeur Canoptek" AND nom_apti = "Métal organique";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Maraudeur Canoptek" AND nom_apti = "Champ de confinement";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Maraudeur Canoptek" AND nom_apti = "Construct sentinelle";

INSERT INTO AptitudeLiaison(id_apti, id_unit, nom_apti, nom_unit)
SELECT num_apti, numéro_unit, nom_apti, nom_unit
FROM Aptitude, Unité
WHERE nom_unit = "Maraudeur Canoptek" AND nom_apti = "Explosion";

-- Insertion des Liaisons d'Equipement ---------------------------------------
INSERT INTO EquipementLiaison(id_equipement, id_unit, nom_equipement, nom_unit)
SELECT num_equipement, numéro_unit, nom_equipement, nom_unit
FROM Equipement, Unité
WHERE nom_unit = "Tétraque" AND nom_equipement = "Orbe de résurrection";

-- Insertion des sorts
INSERT INTO Sort(id_faction, nom_sort) VALUES (2, "Death");