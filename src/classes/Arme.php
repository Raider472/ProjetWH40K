<?php
    class Arme {
        private int $num_arme;
        private string $nom_arme;
        private int $id_faction;
        private int $portée_arme;
        private string $type_arme;
        private string $force_arme;
        private int $pa_arme;
        private string $dégat_arme; //TODO Je suis ici
        private string $aptitude_arme;
        private int $point_arme;
        private int $switchable_arme; //boolean: 0 ou 1
        private int $base_arme; //boolean: 0 ou 1
        private int $trancheFig_arme;

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
    }
?>