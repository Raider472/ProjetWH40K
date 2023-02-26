<?php
    class Arme {
        private int $num_arme;
        private string $nom_arme;
        private int $id_faction;
        private int|null $portée_arme;
        private string $type_arme;
        private string $force_arme;
        private int $pa_arme;
        private string $dégat_arme;
        private string|null $aptitude_arme;
        private int|null $point_arme;
        private int $switchable_arme; //boolean: 0 ou 1
        private int $base_arme; //boolean: 0 ou 1
        private int|null $trancheFig_arme;
        private int $unique_arme; // boolean 0 ou 1

        function __construct( int $num_arme, string $nom_arme, int $id_faction, int|null $portée_arme, string $type_arme, string $force_arme, int $pa_arme, string $dégat_arme, string|null $aptitude_arme, int|null $point_arme, int $switchable_arme, int $base_arme, int|null $trancheFig_arme, int $unique_arme) {
            $this->num_arme = $num_arme;
            $this->nom_arme = $nom_arme;
            $this->id_faction = $id_faction;
            if($portée_arme === null) {
                $portée_arme = 0;
            }
            $this->portée_arme = $portée_arme;
            $this->type_arme = $type_arme;
            $this->force_arme = $force_arme;
            $this->pa_arme = $pa_arme;
            $this->dégat_arme = $dégat_arme;
            if($aptitude_arme === null) {
                $aptitude_arme = "Aucune";
            }
            $this->aptitude_arme = $aptitude_arme;
            if($point_arme === null) {
                $point_arme = 0;
            }
            $this->point_arme = $point_arme;
            $this->switchable_arme = $switchable_arme;
            $this->base_arme = $base_arme;
            if($trancheFig_arme === null) {
                $trancheFig_arme = 0;
            }
            $this->trancheFig_arme = $trancheFig_arme;
            $this->unique_arme = $unique_arme;
        }

        function getNumArme(): int {
            return  $this->num_arme;
        }

        function getNomArme(): string {
            return  $this->nom_arme;
        }

        function getIdFaction(): int {
            return  $this->id_faction;
        }

        function getPorteeArme(): int {
            return  $this->portée_arme;
        }

        function getTypeArme(): string {
            return  $this->type_arme;
        }

        function getForceArme(): string {
            return  $this->force_arme;
        }

        function getPaArme(): int {
            return  $this->pa_arme;
        }

        function getDegatArme(): string {
            return  $this->dégat_arme;
        }

        function getAptitudeArme(): string {
            return  $this->aptitude_arme;
        }

        function getPointArme(): int {
            return  $this->point_arme;
        }

        function getSwitchableArme(): int {
            return  $this->switchable_arme;
        }

        function getBaseArme(): int {
            return  $this->base_arme;
        }

        function getTrancheFigArme(): int {
            return  $this->trancheFig_arme;
        }

        function getUniqueArme(): int {
            return  $this->unique_arme;
        }
    }
?>