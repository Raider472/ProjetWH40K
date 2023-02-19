<?php
    class Unité {
        private int $numéro_unit;
        private int $faction_id_unit;
        private int|string|null $sousFaction_unit;
        private int $personnage_unit;
        private int|null $trait_unit;
        private string $nom_unit;
        private string $nomFaction_unit;
        private string $type_unit;
        private string|null $note_unit;
        private int $point_unit;
        private int $min_unit;
        private int $max_unit;
        private int $nombre_sort;
        private int $mouvement_unit;
        private int $cc_unit;
        private int $ct_unit;
        private int $force_unit;
        private int $endurance_unit;
        private int $pv_unit;
        private int $attaque_unit;
        private int $cd_unit;
        private int $sv_unit;

        function __construct(
            int $numéro_unit,
            int $faction_id_unit,
            int|string|null $sousFaction_unit,
            int $personnage_unit,
            int|null $trait_unit,
            string $nom_unit,
            string $nomFaction_unit,
            string $type_unit,
            string|null $note_unit,
            int $point_unit,
            int $min_unit,
            int $max_unit,
            int $nombre_sort,
            int $mouvement_unit,
            int $cc_unit,
            int $ct_unit,
            int $force_unit,
            int $endurance_unit,
            int $pv_unit,
            int $attaque_unit,
            int $cd_unit,
            int $sv_unit
        )
        {
            $this->numéro_unit = $numéro_unit;
            $this->faction_id_unit = $faction_id_unit;
            if ($sousFaction_unit === null) {
                $sousFaction_unit = "Aucun";
            }
            $this->sousFaction_unit = $sousFaction_unit;
            $this->personnage_unit = $personnage_unit;
            if ($trait_unit === null) {
                $trait_unit = 0;
            }
            $this->trait_unit = $trait_unit;
            $this->nom_unit = $nom_unit;
            $this->nomFaction_unit = $nomFaction_unit;
            $this->type_unit = $type_unit;
            if ($note_unit === null) {
                $note_unit = "Aucun";
            }
            $this->note_unit = $note_unit;
            $this->point_unit = $point_unit;
            $this->min_unit = $min_unit;
            $this->max_unit = $max_unit;
            $this->nombre_sort = $nombre_sort;
            $this->mouvement_unit = $mouvement_unit;
            $this->cc_unit = $cc_unit;
            $this->ct_unit = $ct_unit;
            $this->force_unit = $force_unit;
            $this->endurance_unit = $endurance_unit;
            $this->pv_unit = $pv_unit;
            $this->attaque_unit = $attaque_unit;
            $this->cd_unit = $cd_unit;
            $this->sv_unit = $sv_unit;
        }

        function getNumUnit(): int {
            return $this->numéro_unit;
        }

        function getFactionIdUnit(): int {
            return $this->faction_id_unit;
        }

        function getSousFactionUnit(): int|string|null {
            return $this->sousFaction_unit;
        }

        function getPersonnageUnit(): int {
            return $this->personnage_unit;
        }

        function getTraitUnit(): int|null {
            return $this->trait_unit;
        }

        function getNomUnit(): string {
            return $this->nom_unit;
        }

        function getNomFactionUnit(): string {
            return $this->nomFaction_unit;
        }

        function getTypeUnit(): string {
            return $this->type_unit;
        }

        function getNoteUnit(): string|null {
            return $this->note_unit;
        }

        function getPointUnit(): int {
            return $this->point_unit;
        }

        function getMinUnit(): int {
            return $this->min_unit;
        }

        function getMaxUnit(): int {
            return $this->max_unit;
        }

        function getNombreSortUnit(): int {
            return $this->nombre_sort;
        }

        function getMouvementUnit(): int {
            return $this->mouvement_unit;
        }

        function getCCUnit(): int {
            return $this->cc_unit;
        }

        function getCTUnit(): int {
            return $this->ct_unit;
        }

        function getForceUnit(): int {
            return $this->force_unit;
        }

        function getEnduranceUnit(): int {
            return $this->endurance_unit;
        }

        function getPVUnit(): int {
            return $this->pv_unit;
        }

        function getAttaqueUnit(): int {
            return $this->attaque_unit;
        }

        function getCDUnit(): int {
            return $this->cd_unit;
        }

        function getSVUnit(): int {
            return $this->sv_unit;
        }

    }
?>