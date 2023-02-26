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
    , divQuantitéUnit: HTMLElement
    , numQuantitéUnit: HTMLInputElement
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
        this.type.numQuantitéUnit.value = "0"
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
            this.nbrDunitéNumBox()
            this.type.h5NomUnitéActuel.innerHTML = valueSelect
        }
        else {
            this.type.h5NomUnitéActuel.innerHTML = ""
            this.type.divTableauUnit.innerHTML = ""
        }
    }

    nbrDunitéNumBox(valueSelect: string = this.type.selectUnité.value): void {
        const ajax = new XMLHttpRequest()
        ajax.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                
            }
        }
        ajax.open("POST", "fonction.php?action="+ "affichageNbrUnit" + "&unit=" + valueSelect, true)
        ajax.send()
        setTimeout(this.fetchNumberQuantité, 1000)
        //let json = JSON.parse("script/Data.json")
        //
        //this.type.numQuantitéUnit.setAttribute("max", json[0].max)
        //this.type.numQuantitéUnit.setAttribute("min", json[0].min)
    }

    fetchNumberQuantité(): void {
        fetch("./Data.json")
            .then((response) => response.json())
            .then((data) => {
                console.log(data)
                let test = new mainScript({
                    divSelectionFaction: document.querySelector("[id=div_selection_faction]")!,
                    selectFaction: document.querySelector("[id=select_faction]")!,
                    divChoixSousFaction: document.querySelector("[id=div_choix_sous_faction]")!,
                    lblSousFaction: document.querySelector("[id=label_sous_faction]")!,
                    selectSousFaction: document.querySelector("[id=select_sous_faction]")!,
                    divAffichageBonusSousFaction: document.querySelector("[id=div_affichage_bonus_sous_faction]")!,
                    h3TitreSousFaction: document.querySelector("[id=h3_titre_sous_faction]")!,
                    h4TitreTraitSousFaction: document.querySelector("[id=h4_titre_trait_sous_faction]")!,
                    ulDescSousFaction: document.querySelector("[id=ul_desc_sous_faction]")!,
                    divAffichageUnité: document.querySelector("[id=div_affichage_unité]")!,
                    h5NomUnitéActuel: document.querySelector("[id=h5_nom_unité_actuel]")!,
                    divAjoutUnite: document.querySelector("[id=div_ajout_unite]")!,
                    selectUnité: document.querySelector("[id=select_unites]")!,
                    btnAfficherUnitTrait: document.querySelector("[id=btn_afficherUnitTrait]")!,
                    btnAjouterUnit: document.querySelector("[id=btn_ajouter]")!,
                    divCheckSeigneur: document.querySelector("[id=div_check_seigneur]")!,
                    divCheckSeigneurTraitSec: document.querySelector("[id=div_check_seigneur_traitSec]")!,
                    checkSeigneur: document.querySelector("[id=chk_seigneur_guerre]")!,
                    checkSeigneurTraitSec: document.querySelector("[id=chk_personnage_trait]")!,
                    divQuantitéUnit: document.querySelector("[id=div_quantité_unit]")!,
                    numQuantitéUnit: document.querySelector("[id=numQuantiteUnit]")!,
                    divTableauUnit: document.querySelector("[id=div_tableau_unit]")!,
                    h4NomUnitéTrait: document.querySelector("[id=h4_nom_unité_trait]")!,
                    divAffichageDetailTrait: document.querySelector("[id=div_affichage_detail_trait]")!,
                    selectTrait: document.querySelector("[id=select_trait]")!,
                    btnRetourUnitTrait: document.querySelector("[id=btn_retourUnitTrait]")!,
                    h3TitreTrait: document.querySelector("[id=h3_titre_trait]")!,
                    ulDescTrait: document.querySelector("[id=ul_desc_trait]")!
                })
                test.type.numQuantitéUnit.value = data[0].value
                test.type.numQuantitéUnit.setAttribute("max", data[0].max)
                test.type.numQuantitéUnit.setAttribute("max", data[0].min)
            })
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

    affichageDesEquipementsMain(): void {
        this.afficherChoisDesEquipementsCheckBox()
        this.afficherChoixDesEquipementsTableau()
    }

    afficherChoisDesEquipementsCheckBox(valueSelect: string = this.type.selectUnité.value): void {
        //const ajax = new XMLHttpRequest()
        this.type.numQuantitéUnit.setAttribute("max", "100")
        this.type.numQuantitéUnit.setAttribute("min", "50")
        /*ajax.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("div_choix_equipement").innerHTML = this.responseText
            }
        }
        ajax.open("POST", "fonction.php?action="+ "affichageEquipChk" + "&UnitEquip=" + valueSelect + "&NombreUnit=" + this.type.numQuantitéUnit.value, true)
        ajax.send()*/
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