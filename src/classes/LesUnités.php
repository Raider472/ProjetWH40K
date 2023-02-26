<?php
    require("Unité.php");
    class LesUnités {
        private array $unitésTab;

        function getUnitéTab(): array {
            return  $this->unitésTab;
        }

        function fetchAllByFactionName(string $FactionName): array {
            $connexion = db_connect();
            $sql = "SELECT * FROM Unité WHERE nomFaction_unit = " . "\"" . "$FactionName" . "\""; 
            $result = $connexion->query($sql);
            $unité = [];
            while ($data = $result->fetch_object()) {
                $unité[] = new Unité(
                    $data->numéro_unit, 
                    $data->faction_id_unit, 
                    $data->sousFaction_unit,
                    $data->personnage_unit,
                    $data->trait_unit,
                    $data->nom_unit,
                    $data->nomFaction_unit,
                    $data->type_unit,
                    $data->note_unit,
                    $data->point_unit,
                    $data->min_unit,
                    $data->max_unit,
                    $data->nombre_sort,
                    $data->mouvement_unit,
                    $data->cc_unit,
                    $data->ct_unit,
                    $data->force_unit,
                    $data->endurance_unit,
                    $data->pv_unit,
                    $data->attaque_unit,
                    $data->cd_unit,
                    $data->sv_unit
                );
            }
            return $unité;
        }

        function fetchUnitByName(string $UnitName): array {
            $connexion = db_connect();
            $sql = "SELECT * FROM Unité WHERE nom_unit = \"$UnitName\""; 
            $result = $connexion->query($sql);
            $unité = [];
            while ($data = $result->fetch_object()) {
                $unité[] = new Unité(
                    $data->numéro_unit, 
                    $data->faction_id_unit, 
                    $data->sousFaction_unit,
                    $data->personnage_unit,
                    $data->trait_unit,
                    $data->nom_unit,
                    $data->nomFaction_unit,
                    $data->type_unit,
                    $data->note_unit,
                    $data->point_unit,
                    $data->min_unit,
                    $data->max_unit,
                    $data->nombre_sort,
                    $data->mouvement_unit,
                    $data->cc_unit,
                    $data->ct_unit,
                    $data->force_unit,
                    $data->endurance_unit,
                    $data->pv_unit,
                    $data->attaque_unit,
                    $data->cd_unit,
                    $data->sv_unit
                );
            }
            return $unité;
        }

        function putIntoSelect(array $tab): void {
            foreach ($tab as $lesUnités) {
                $text = "<option value=";
                $nomValue = $lesUnités->getNomUnit();
                $text .= "\"$nomValue\">";
                $text .= $nomValue . " | " . $lesUnités->getTypeUnit() . " | " . $lesUnités->getPointUnit() . " Points";
                if ($lesUnités->getPersonnageUnit() === 1) {
                    $text .= " | Personnage"; 
                }
                $text .= "</option>";
                echo $text;
            }
        }

        function putInXML(array $tab): string {
            $data = [
                [
                    "value" => $tab[0]->getMinUnit(),
                    "min" => $tab[0]->getMinUnit(),
                    "max" => $tab[0]->getMaxUnit()
                ]
            ];
            $data = json_encode($data, JSON_PRETTY_PRINT);
            return $data;
        }

        function putIntoTable(array $tab): void {
            echo "<table class=\"tab\">";
                echo "<thead>";
                    echo "<tr>";
                    echo "<th>Nom</th>";
                    if ($tab[0]->getSousFactionUnit() != "Aucun") {
                        echo "<th>Sous Faction</th>";
                    }
                    echo "<th>Rôle Stratégique</th>";
                    echo "<th>Quantité par unité</th>";
                    echo "<th>Nombre de Sort</th>";
                    echo "<th>Mouvement</th>";
                    echo "<th>Capacité Combat</th>";
                    echo "<th>Capacité Tir</th>";
                    echo "<th>Force</th>";
                    echo "<th>Endurance</th>";
                    echo "<th>PV</th>";
                    echo "<th>Attaque</th>";
                    echo "<th>Commandement</th>";
                    echo "<th>Sauvegarde</th>";
                    echo "<th>Nombre de Points</th>";
                    if ($tab[0]->getNoteUnit() != "Aucun") {
                        echo "<th>Note Supplémentaire</th>";
                    }
                    echo "</tr>";
                echo "</thead>";
                echo "<tbody>";
                    echo "<tr>";
                    echo "<td>". $tab[0]->getNomUnit() ."</td>";
                    if ($tab[0]->getSousFactionUnit() != "Aucun") {
                        $connexion = db_connect();
                        $sql = "SELECT * FROM SousFaction WHERE num_sousFaction = " . "\"" . $tab[0]->getSousFactionUnit() . "\""; 
                        $result = $connexion->query($sql);
                        require "SousFaction.php";
                        $sousFaction = [];
                        while ($data = $result->fetch_object()) {
                            $sousFaction[] = new SousFaction(
                                $data->num_sousFaction, 
                                $data->id_faction, 
                                $data->nom_sousFaction,
                                $data->nom_faction
                            );
                        }
                        echo "<td>". $sousFaction[0]->getNomSousFaction() ."</td>";
                    }
                    echo "<td>". $tab[0]->getTypeUnit() ."</td>";
                    echo "<td>". $tab[0]->getMinUnit() . "-" . $tab[0]->getMaxUnit() ."</td>";
                    echo "<td>". $tab[0]->getNombreSortUnit() ."</td>";
                    echo "<td>". $tab[0]->getMouvementUnit() . "\"" . "</td>";
                    echo "<td>". $tab[0]->getCCUnit() . "+" . "</td>";
                    echo "<td>". $tab[0]->getCTUnit() . "+" ."</td>";
                    echo "<td>". $tab[0]->getForceUnit() ."</td>";
                    echo "<td>". $tab[0]->getEnduranceUnit() ."</td>";
                    echo "<td>". $tab[0]->getPVUnit() ."</td>";
                    echo "<td>". $tab[0]->getAttaqueUnit() ."</td>";
                    echo "<td>". $tab[0]->getCDUnit() ."</td>";
                    echo "<td>". $tab[0]->getSVUnit() . "+" ."</td>";
                    echo "<td>". $tab[0]->getPointUnit() . " Points" ."</td>";
                    if ($tab[0]->getNoteUnit() != "Aucun") {
                        echo "<td>". $tab[0]->getNoteUnit() ."</td>";
                    }
                    echo "</tr>";
                echo "</tbody>";
            echo "</table>";
        }

        function showAll(array $tab): void {
            foreach ($tab as $lesUnités) {
                echo "<br>";
                echo $lesUnités->getNumUnit(),
                " ", $lesUnités->getFactionIdUnit(),
                " ", $lesUnités->getSousFactionUnit(), 
                " ", $lesUnités->getPersonnageUnit(), 
                " ", $lesUnités->getTraitUnit(), 
                " ", $lesUnités->getNomUnit(), 
                " ", $lesUnités->getNomFactionUnit(), 
                " ", $lesUnités->getTypeUnit(), 
                " ", $lesUnités->getNoteUnit(), 
                " ", $lesUnités->getPointUnit(), 
                " ", $lesUnités->getMinUnit(), 
                " ", $lesUnités->getMaxUnit(), 
                " ", $lesUnités->getNombreSortUnit(),
                " ", $lesUnités->getMouvementUnit(),
                " ", $lesUnités->getCCUnit(),
                " ", $lesUnités->getCTUnit(),
                " ", $lesUnités->getForceUnit(),
                " ", $lesUnités->getEnduranceUnit(),
                " ", $lesUnités->getPVUnit(),
                " ", $lesUnités->getAttaqueUnit(),
                " ", $lesUnités->getCDUnit(),
                " ", $lesUnités->getSVUnit();
                echo "<br>";
            }
        }
    }
?>