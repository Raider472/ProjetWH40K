<?php
    require "src/config/connect.php";
    $action = $_GET["action"];
    switch($action) {
        case "affichageSousFaction":
            require "src/classes/LesSousFactions.php";
            $parametre = $_REQUEST["faction"];
            $sousFaction = new LesSousFactions();
            $tab = $sousFaction->fetchAllByFactionName($parametre);
            $sousFaction->putIntoSelect($tab);
        break;
        case "affichageUnités":
            require "src/classes/LesUnités.php";
            $parametre = $_REQUEST["faction"];
            $lesUnités = new LesUnités();
            $tab = $lesUnités->fetchAllByFactionName($parametre);
            $lesUnités->putIntoSelect($tab);
        break;
        case "affichageNomSousFaction":
            require "src/classes/LesSousFactions.php";
            $parametre = $_REQUEST["sousFaction"];
            $uneSousFaction = new LesSousFactions();
            $tab = $uneSousFaction->filterBySubFactionName($parametre);
            echo $tab[0]->getNomSousFaction();
        break;
        case "affichageNomTraitSousFaction":
            require "src/classes/LesAptitudes.php";
            $parametre = $_REQUEST["sousFaction"];
            $uneAptitudeSousFaction = new LesAptitudes();
            $tab = $uneAptitudeSousFaction->fetchAptitudeBySubFaction($parametre);
            echo $tab[0]->getNomApti();
        break;
        case "affichageDescriptionTraitSousFaction":
            require "src/classes/LesAptitudes.php";
            $parametre = $_REQUEST["sousFaction"];
            $uneAptitudeSousFaction = new LesAptitudes();
            $tab = $uneAptitudeSousFaction->fetchAptitudeBySubFaction($parametre);
            $desc = $tab[0]->getDescApti();
            $uneAptitudeSousFaction->miseEnPlaceDescription($desc);
        break;
        case "affichageStatsUnit":
            require "src/classes/LesUnités.php";
            $parametre = $_REQUEST["unit"];
            $lesUnités = new LesUnités();
            $tab = $lesUnités->fetchUnitByName($parametre);
            $lesUnités->putIntoTable($tab);
        break;
        case "affichageUnitTrait":
            require "src/classes/LesAptitudes.php";
            $parametre = $_REQUEST["Trait"];
            $lesAptitudes = new LesAptitudes();
            $tab = $lesAptitudes->fetchAptitudeByUnitName($parametre);
            $lesAptitudes->putIntoSelect($tab);
        break;
        case "affichageUnitTraitNom":
            require "src/classes/LesAptitudes.php";
            $parametre = $_REQUEST["Trait"];
            $lesAptitudes = new LesAptitudes();
            $tab = $lesAptitudes->fetchAptitudeByName($parametre);
            echo $tab[0]->getNomApti();
        break;
        case "affichageUnitTraitDesc":
            require "src/classes/LesAptitudes.php";
            $parametre = $_REQUEST["Trait"];
            $uneAptitudeDesc = new LesAptitudes();
            $tab = $uneAptitudeDesc->fetchAptitudeByName($parametre);
            $desc = $tab[0]->getDescApti();
            $uneAptitudeDesc->miseEnPlaceDescription($desc);
        break;

        case "affichageTableauEquip":
            require "src/classes/LesArmes.php";
            $parametre = $_REQUEST["UnitEquip"];
            $lesArmes = new LesArmes();
            $tab = $lesArmes->fetchAptitudeByUnitName($parametre);
            $lesArmes->putIntoTable($tab);
        break;
        default: echo "<h1>Erreur Erreur Erreur Erreur Erreur Erreur</h1>";
    }
?>