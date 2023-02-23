<?php
    class Aptitude {
        private int $num_apti;
        private int $id_faction;
        private int | null $id_sousFaction;
        private string $nom_apti;
        private string | null $desc_apti;

        function __construct(int $num_apti, int $id_faction, int | null $id_sousFaction, string $nom_apti, string |null $desc_apti) {
            $this->num_apti = $num_apti;
            $this->id_faction = $id_faction;
            if ($id_sousFaction === null) {
                $id_sousFaction = "Appartient à aucune sous faction";
            }
            $this->id_sousFaction = $id_sousFaction;
            $this->nom_apti = $nom_apti;
            if ($desc_apti === null) {
                $desc_apti = "Aucune description";
            }
            $this->desc_apti = $desc_apti;
        }

        function getNumApti(): int {
            return $this->num_apti;
        }

        function getIdFaction(): int {
            return $this->id_faction;
        }

        function geIdSousFaction(): int {
            return $this->id_sousFaction;
        }

        function getNomApti(): string {
            return $this->nom_apti;
        }

        function getDescApti(): string {
            return $this->desc_apti;
        }
    }
?>