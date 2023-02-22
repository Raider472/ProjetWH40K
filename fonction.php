<?php
    require "src/config/connect.php";
    $action = $_GET["action"];
    switch($action) {
        case $action === "affichageSousFaction":
            require "src/classes/LesSousFactions.php";
            $parametre = $_REQUEST["faction"];
            $sousFaction = new LesSousFactions();
            $tab = $sousFaction->fetchAllByFactionName($parametre);
            $sousFaction->putIntoSelect($tab);
        break;
        default: echo "<h1>Erreur Erreur Erreur Erreur Erreur Erreur</h1>";
    }
?>