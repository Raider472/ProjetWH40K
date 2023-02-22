<?php
    require("SousFaction.php");
    class LesSousFactions {
        private array $sousFactionTab;

        function getSousFactionTab(): array {
            return $this->sousFactionTab;
        }

        function fetchAllByFactionName(string $FactionName): array {
            $connexion = db_connect();
            $sql = "SELECT * FROM SousFaction WHERE nom_faction = " . "\"" . "$FactionName" . "\""; 
            $result = $connexion->query($sql);
            $sousFaction = [];
            while ($data = $result->fetch_object()) {
                $sousFaction[] = new SousFaction(
                    $data->num_sousFaction, 
                    $data->id_faction, 
                    $data->nom_sousFaction,
                    $data->nom_faction
                );
            }
            return $sousFaction;
        }

        function putIntoSelect(array $tab): void {
            foreach ($tab as $lesSousFaction) {
                $text = "<option value=";
                $nomValue = $lesSousFaction->getNomSousFaction();
                $text .= "\"$nomValue\">";
                $text .= $nomValue;
                $text .= "</option>";
                echo $text;
            }
        }

        function showAll(array $tab): void {
            foreach ($tab as $lesSousFaction) {
                echo "<br>";
                echo $lesSousFaction->getNomSousFaction();
                echo "<br>";
            }
        }
    }
?>