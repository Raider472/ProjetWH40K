<?php
    require("Arme.php");
    class LesArmes {
        private array $armesTab;

        function getArmesTab(): array {
            return  $this->armesTab;
        }

        function fetchAllByIdUnit(int $idUnit): array {
            $connexion = db_connect();
            $sql = "SELECT * FROM Arme INNER JOIN ArmeLiaison ON Arme.num_arme = ArmeLiaison.id_arme AND ArmeLiaison.id_unit = $idUnit"; 
            $result = $connexion->query($sql);
            $arme = [];
            while ($data = $result->fetch_object()) {
                $arme[] = new Arme(
                    $data->num_arme,
                    $data->nom_arme,
                    $data->id_faction, 
                    $data->portée_arme, 
                    $data->type_arme, 
                    $data->force_arme, 
                    $data->pa_arme, 
                    $data->dégat_arme, 
                    $data->aptitude_arme, 
                    $data->point_arme, 
                    $data->switchable_arme, 
                    $data->base_arme, 
                    $data->trancheFig_arme
                );
            }
            return $arme;
        }

        function fetchAptitudeByUnitName(string $UnitName): array {
            $connexion = db_connect();
            $sql = "SELECT Arme.* FROM ArmeLiaison, Arme WHERE ArmeLiaison.nom_unit = \"$UnitName\" AND ArmeLiaison.id_arme = Arme.num_arme";
            $result = $connexion->query($sql);
            $desArmesUnits = [];
            while ($data = $result->fetch_object()) {
                $desArmesUnits[] = new Arme(
                    $data->num_arme,
                    $data->nom_arme,
                    $data->id_faction, 
                    $data->portée_arme, 
                    $data->type_arme, 
                    $data->force_arme, 
                    $data->pa_arme, 
                    $data->dégat_arme, 
                    $data->aptitude_arme, 
                    $data->point_arme, 
                    $data->switchable_arme, 
                    $data->base_arme, 
                    $data->trancheFig_arme
                );
            }
            return $desArmesUnits;
        }

        function putIntoTable(array $tab): void {
            for($i = 0; $i < Count($tab); $i++) {
                echo "<div>";
                echo "<table class=\"tab\">";
                echo "<thead>";
                    echo "<tr>";
                        echo "<th>Nom Arme</th>";
                        echo "<th>Portée de l'Arme</th>";
                        echo "<th>Type d'Arme</th>";
                        echo "<th>Force</th>";
                        echo "<th>PA</th>";
                        echo "<th>Dégats</th>";
                        echo "<th>Points</th>";
                        echo "<th>Peut-être Remplacé ?</th>";
                        echo "<th>Maximum par Unité</th>";
                        echo "<th>Aptitude</th>";
                    echo "</tr>";
                echo "</thead>";
                echo "<tbody>";
                    echo "<tr>";
                        echo "<td>". $tab[$i]->getNomArme() ."</td>";
                        if($tab[$i]->getPorteeArme() === 0) {
                            echo "<td>". "Mêlée" ."</td>";
                        }
                        else {
                            echo "<td>". $tab[$i]->getPorteeArme() . "\"" ."</td>";
                        }
                        echo "<td>". $tab[$i]->getTypeArme() ."</td>";
                        echo "<td>". $tab[$i]->getForceArme() ."</td>";
                        echo "<td>". $tab[$i]->getPaArme() ."</td>";
                        echo "<td>". $tab[$i]->getDegatArme() ."</td>";
                        if ($tab[$i]->getPointArme() === 0) {
                            echo "<td>". "Cette Arme ne coûte Aucun Points" ."</td>";
                        }
                        else {
                            echo "<td>". $tab[$i]->getPointArme() . " Points" ."</td>";
                        }
                        if ($tab[$i]->getSwitchableArme() === 1) {
                            echo "<td>". "Oui" ."</td>";
                        }
                        else {
                            echo "<td>". "Non" ."</td>";
                        }
                        if ($tab[$i]->getTrancheFigArme() === 0) {
                            echo "<td>". "Aucune Limite" ."</td>";
                        }
                        else {
                            echo "<td>". $tab[$i]->getTrancheFigArme() ."</td>";
                        }
                        echo "<td>". $tab[$i]->getAptitudeArme() ."</td>";
                    echo "</tr>";
                echo "</tbody>";
                echo "</table>";
                echo "</div>";
            }
        }

        function showAll(array $tab): void {
            foreach ($tab as $lesArmes) {
                echo "<br>";
                echo $lesArmes->getNumArme(), " ", $lesArmes->getNomArme(), " ", $lesArmes->getIdFaction(), " ", $lesArmes->getPorteeArme(), " ", $lesArmes->getTypeArme(), " ", $lesArmes->getForceArme(), " ", $lesArmes->getPaArme(), " ", $lesArmes->getDegatArme(), " ", $lesArmes->getAptitudeArme(), " ", $lesArmes->getPointArme(), " ", $lesArmes->getSwitchableArme(), " ", $lesArmes->getBaseArme(), " ", $lesArmes->getTrancheFigArme();
                echo "<br>";
            }
        }
    }
?>