<?php
    class SousFaction {
        private int $num_sousFaction;
        private int|string|null $id_faction;
        private string $nom_sousFaction;
        private string|null $nom_faction;

        function __construct( int $num_sousFaction, int|null|string $id_faction, string $nom_sousFaction, string|null $nom_faction) {
            $this->num_sousFaction = $num_sousFaction;
            if ($nom_faction === null) {
                $id_faction = "Neutre";
            }
            $this->id_faction = $id_faction;
            $this->nom_sousFaction = $nom_sousFaction;
            if ($nom_faction === null) {
                $nom_faction = "Neutre";
            }
            $this->nom_faction = $nom_faction;
        }

        function getNumSousFaction(): int {
            return $this->num_sousFaction;
        }

        function getIdFaction(): int|string {
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