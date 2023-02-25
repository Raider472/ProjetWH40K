type mainScriptType = {
    divSelectionFaction: HTMLElement
    , selectFaction: HTMLSelectElement
    , divChoixSousFaction: HTMLElement
    , lblSousFaction: HTMLLabelElement
    , selectSousFaction: HTMLSelectElement
    , divAffichageBonusSousFaction: HTMLElement
    , h3TitreSousFaction: HTMLElement
    , h4TitreTraitSousFaction: HTMLElement
    , ulDescSousFaction: HTMLElement
    , divAffichageUnité: HTMLElement
    , h5NomUnitéActuel: HTMLElement
    , divAjoutUnite: HTMLElement
    , selectUnité: HTMLSelectElement
    , btnAfficherUnitTrait: HTMLInputElement
    , btnAjouterUnit: HTMLInputElement
    , divCheckSeigneur: HTMLElement
    , divCheckSeigneurTraitSec: HTMLElement
    , checkSeigneur: HTMLInputElement
    , checkSeigneurTraitSec: HTMLInputElement
    , divTableauUnit: HTMLElement
    , h4NomUnitéTrait: HTMLElement
    , divAffichageDetailTrait: HTMLElement
    , selectTrait: HTMLSelectElement
    , btnRetourUnitTrait: HTMLInputElement
    , h3TitreTrait: HTMLElement
    , ulDescTrait: HTMLElement
}

class mainScript {
    private _type: mainScriptType
    constructor(type : mainScriptType) {
        this._type = type
        this.type.divChoixSousFaction.hidden = true
        this.type.selectFaction.value = ""
        this.type.divAffichageBonusSousFaction.hidden = true
        this.type.divAffichageDetailTrait.hidden = true
    }

    get type(): mainScriptType {
        return this._type
    }

    afficherSousFaction(valueSelect: string = this.type.selectFaction.value): void {
        if (valueSelect != "") {
            const ajax = new XMLHttpRequest()
            this.type.selectSousFaction.innerHTML = "<option value=\"\">Neutre</option>"
            ajax.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("select_sous_faction").innerHTML += this.responseText
                }
            }
            ajax.open("POST", "fonction.php?action="+ "affichageSousFaction" + "&faction=" + valueSelect, true)
            ajax.send()
            switch (valueSelect) {
                case "Nécrons":
                    this.type.lblSousFaction.innerHTML = "Dynastie"
                break
                case "Thousand Sons":
                    this.type.lblSousFaction.innerHTML = "Culte"
                break
                case "Space Marine":
                    this.type.lblSousFaction.innerHTML = "Chapitre"
                break
                default: this.type.lblSousFaction.innerHTML = ""
            }
            this.afficherUnitéFaction()
            this.type.h3TitreSousFaction.innerHTML = ""
            this.type.divChoixSousFaction.hidden = false
        }
        else {
            this.type.divChoixSousFaction.hidden = true
            this.type.selectSousFaction.innerHTML = ""
            this.type.h3TitreSousFaction.innerHTML = ""
            this.type.selectUnité.innerHTML = ""
        }
    }

    afficherUnitéFaction(valueSelect: string = this.type.selectFaction.value): void {
        const ajax = new XMLHttpRequest()
        ajax.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("select_unites").innerHTML = this.responseText
            }
        }
        ajax.open("POST", "fonction.php?action="+ "affichageUnités" + "&faction=" + valueSelect, true)
        ajax.send()
    }

    affichageDeSousFactionMain(valueSelect: string = this.type.selectSousFaction.value): void {
        if (valueSelect != "") {
            this.afficherTitreSousFaction()
            this.afficherTitreSousTraitFaction()
            this.afficherDescriptionTraitSousFaction()
            this.type.divAffichageBonusSousFaction.hidden = false
        }
        else {
            this.type.divAffichageBonusSousFaction.hidden = true
            this.type.h3TitreSousFaction.innerHTML = ""
            this.type.h4TitreTraitSousFaction.innerHTML = ""
            this.type.ulDescSousFaction.innerHTML = ""
        }
    }

    afficherTitreSousFaction(valueSelect: string = this.type.selectSousFaction.value): void {
        const ajax = new XMLHttpRequest()
        ajax.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("h3_titre_sous_faction").innerHTML = this.responseText
            }
        }
        ajax.open("POST", "fonction.php?action="+ "affichageNomSousFaction" + "&sousFaction=" + valueSelect, true)
        ajax.send()
    }

    afficherTitreSousTraitFaction(valueSelect: string = this.type.selectSousFaction.value): void {
        const ajax = new XMLHttpRequest()
        ajax.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("h4_titre_trait_sous_faction").innerHTML = this.responseText
            }
        }
        ajax.open("POST", "fonction.php?action="+ "affichageNomTraitSousFaction" + "&sousFaction=" + valueSelect, true)
        ajax.send()
    }

    afficherDescriptionTraitSousFaction(valueSelect: string = this.type.selectSousFaction.value): void {
        const ajax = new XMLHttpRequest()
        ajax.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("ul_desc_sous_faction").innerHTML = this.responseText
            }
        }
        ajax.open("POST", "fonction.php?action="+ "affichageDescriptionTraitSousFaction" + "&sousFaction=" + valueSelect, true)
        ajax.send()
    }

    affichageDesUnitésMain(valueSelect: string = this.type.selectUnité.value): void {
        if (valueSelect != "") {
            const ajax = new XMLHttpRequest()
            ajax.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("div_tableau_unit").innerHTML = this.responseText
                }
            }
            ajax.open("POST", "fonction.php?action="+ "affichageStatsUnit" + "&unit=" + valueSelect, true)
            ajax.send()
            this.type.h5NomUnitéActuel.innerHTML = valueSelect
        }
        else {
            this.type.h5NomUnitéActuel.innerHTML = ""
            this.type.divTableauUnit.innerHTML = ""
        }
    }

    affichageDesAptitudesSelect(valueSelect: string = this.type.selectUnité.value): void {
        if (valueSelect != "") {
            const ajax = new XMLHttpRequest()
            ajax.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("select_trait").innerHTML = this.responseText
                }
            }
            ajax.open("POST", "fonction.php?action="+ "affichageUnitTrait" + "&Trait=" + valueSelect, true)
            ajax.send()
            this.type.divAffichageUnité.hidden = true
            this.type.divAffichageDetailTrait.hidden = false
            this.type.h4NomUnitéTrait.innerHTML = valueSelect
        }
    }

    cacherLesAptitudesSelect(): void {
        this.type.divAffichageDetailTrait.hidden = true
        this.type.divAffichageUnité.hidden = false
        this.type.selectTrait.value = ""
    }

    affichageNomDescTrait(valueSelect: string = this.type.selectTrait.value): void {
        if (valueSelect != "") {
            this.affichageNomTrait()
            this.affichageDescTrait()
        }
    }

    affichageNomTrait(valueSelect: string = this.type.selectTrait.value): void {
        const ajax = new XMLHttpRequest()
        ajax.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("ul_desc_trait").innerHTML = this.responseText
            }
        }
        ajax.open("POST", "fonction.php?action="+ "affichageUnitTraitDesc" + "&Trait=" + valueSelect, true)
        ajax.send()
    }

    affichageDescTrait(valueSelect: string = this.type.selectTrait.value): void {
        const ajax = new XMLHttpRequest()
        ajax.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("h3_titre_trait").innerHTML = this.responseText
            }
        }
        ajax.open("POST", "fonction.php?action="+ "affichageUnitTraitNom" + "&Trait=" + valueSelect, true)
        ajax.send()
    }

    afficherChoixDesEquipementsTableau(valueSelect: string = this.type.selectUnité.value): void {
        const ajax = new XMLHttpRequest()
        ajax.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("div_tableau_equip").innerHTML = this.responseText
            }
        }
        ajax.open("POST", "fonction.php?action="+ "affichageTableauEquip" + "&UnitEquip=" + valueSelect, true)
        ajax.send()
    }
}

export default mainScript