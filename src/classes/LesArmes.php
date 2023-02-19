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
                $arme[] = new Arme($data->num_arme, $data->nom_arme, $data->id_faction, $data->portée_arme, $data->type_arme, $data->force_arme, $data->pa_arme, $data->force_arme, $data->aptitude_arme, $data->point_arme, $data->switchable_arme, $data->base_arme, $data->trancheFig_arme);
            }
            return $arme;
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