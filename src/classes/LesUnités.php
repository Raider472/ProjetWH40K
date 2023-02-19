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