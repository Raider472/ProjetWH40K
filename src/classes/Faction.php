<?php
    class Faction {
        private int $num_faction;
        private string $nom_faction;
        private string $alliance_faction;

        function __construct( int $num_faction, string $nom_faction, string $alliance_faction) {
            $this->num_faction = $num_faction;
            $this->nom_faction = $nom_faction;
            $this->alliance_faction = $alliance_faction;
        }

        function getNumFaction(): int {
            return  $this->num_faction;
        }

        function getNomFaction(): string {
            return $this->nom_faction;
        }

        function getAllianceFaction(): string {
            return $this->alliance_faction;
        }
    }
?>