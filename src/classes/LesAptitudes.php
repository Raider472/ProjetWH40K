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

        function fetchAptitudeByName(string $AptiName): array {
            $connexion = db_connect();
            $sql = "SELECT * FROM Aptitude WHERE nom_apti = \"$AptiName\"";
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

        function fetchAptitudeByUnitName(string $UnitName): array {
            $connexion = db_connect();
            $sql = "SELECT Aptitude.* FROM AptitudeLiaison, Aptitude WHERE AptitudeLiaison.nom_unit = \"$UnitName\" AND AptitudeLiaison.id_apti = Aptitude.num_apti";
            $result = $connexion->query($sql);
            $desAptitudeUnits = [];
            while ($data = $result->fetch_object()) {
                $desAptitudeUnits[] = new Aptitude(
                    $data->num_apti, 
                    $data->id_faction, 
                    $data->id_sousFaction,
                    $data->nom_apti,
                    $data->desc_apti
                );
            }
            return $desAptitudeUnits;
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

        function putIntoSelect(array $tab): void {
            foreach ($tab as $lesAptitudes) {
                $text = "<option value=";
                $nomValue = $lesAptitudes->getNomApti();
                $text .= "\"$nomValue\">";
                $text .= $nomValue;
                $text .= "</option>";
                echo $text;
            }
        }
    }
?>