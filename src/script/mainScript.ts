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
    , divAjoutUnite: HTMLElement
    , selectUnité: HTMLSelectElement
    , btnAfficherUnitTrait: HTMLInputElement
    , btnAjouterUnit: HTMLInputElement
    , divCheckSeigneur: HTMLElement
    , divCheckSeigneurTraitSec: HTMLElement
}

class mainScript {
    private _type: mainScriptType
    constructor(type : mainScriptType) {
        this._type = type
        this.type.divChoixSousFaction.hidden = true
        this.type.selectFaction.value = ""
        this.type.divAffichageBonusSousFaction.hidden = true
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
            this.type.pDescSousFaction.innerHTML = ""
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
}

export default mainScript