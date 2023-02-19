<?php
    require("Faction.php");
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

        function putIntoSelect(array $tab): void {
            foreach ($tab as $lesFaction) {
                $text = "<option value=";
                $nomValue = $lesFaction->getNomFaction();
                $text .= "\"$nomValue\">";
                $text .= $nomValue;
                $text .= "</option>";
                echo $text;
            }
        }

        function showAll(array $tab): void {
            foreach ($tab as $lesFaction) {
                echo "<br>";
                echo $lesFaction->getNomFaction();
                echo "<br>";
            }
        }
    }
?>