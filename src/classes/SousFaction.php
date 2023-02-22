<?php
    class SousFaction {
        private int $num_sousFaction;
        private int $id_faction;
        private string $nom_sousFaction;
        private string $nom_faction;

        function __construct( int $num_sousFaction, int $id_faction, string $nom_sousFaction, string $nom_faction) {
            $this->num_sousFaction = $num_sousFaction;
            $this->id_faction = $id_faction;
            $this->nom_sousFaction = $nom_sousFaction;
            $this->nom_faction = $nom_faction;
        }

        function getNumSousFaction(): int {
            return $this->num_sousFaction;
        }

        function getIdFaction(): int {
            return $this->id_faction;
        }

        function getNomSousFaction(): string {
            return $this->nom_sousFaction;
        }

        function getNomFaction(): string {
            return $this->nom_faction;
        }
    }
?>