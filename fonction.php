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
        default: echo "<h1>Erreur Erreur Erreur Erreur Erreur Erreur</h1>";
    }
?>