<?php
    require("Faction.php"); //Tester si sa marche sans
    class LesFaction {
        private array $factionTab;

        function getFactionTab(): array {
            return  $this->factionTab;
        }

        function fetchAll(): array {
            $connexion = db_connect();
            $sql = "SELECT * FROM Faction"; 
            $result = $connexion->query($sql);
            $faction = [];
            while ($data = $result->fetch_object()) {
                $faction[] = new Faction($data->num_faction, $data->nom_faction, $data->alliance_faction);
            }
            return $faction;
        }

        function showAll(array $tab): void {
            foreach ($tab as $dasFaction) {
                echo "<br>";
                echo $dasFaction->getNomFaction();
                echo "<br>";
              }
        }
    }
?>