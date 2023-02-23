<?php
    require("Aptitude.php");
    class LesAptitudes {
        private array $aptitudeTab;

        function getAptitudeTab(): array {
            return $this->aptitudeTab;
        }

        function fetchAptitudeBySubFaction(string $subFaction): array {
            $connexion = db_connect();
            $sql = "SELECT * FROM Aptitude, SousFaction WHERE Aptitude.id_sousFaction = SousFaction.num_sousFaction AND SousFaction.nom_sousFaction = \"$subFaction\""; //Requete a chercher
            $result = $connexion->query($sql);
            $uneAptitudeSousFaction = [];
            while ($data = $result->fetch_object()) {
                $uneAptitudeSousFaction[] = new Aptitude(
                    $data->num_apti, 
                    $data->id_faction, 
                    $data->id_sousFaction,
                    $data->nom_apti,
                    $data->desc_apti
                );
            }
            return $uneAptitudeSousFaction;
        }

        function miseEnPlaceDescription(string $desc): void {
            $stringCons = "";
            for($i = 0; $i < strlen($desc); $i++) {
                if ($desc[$i] === "-" && $desc[$i+1] === "-") {
                    echo "<li>";
                    echo "$stringCons";
                    echo "</li>";
                    $stringCons = "";
                    $i+=2;
                }
                $stringCons .= $desc[$i];
            }
            echo "<li>";
            echo "$stringCons";
            echo "</li>";
        }
    }
?>