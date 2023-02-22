type mainScriptType = {
    divSelectionFaction: HTMLElement
    , selectFaction: HTMLSelectElement
    , divChoixSousFaction: HTMLElement
    , lblSousFaction: HTMLLabelElement
    , selectSousFaction: HTMLSelectElement
    , divAjoutUnite: HTMLElement
    , btnAfficherUnit: HTMLInputElement
}

class mainScript {
    private _type: mainScriptType
    constructor(type : mainScriptType) {
        this._type = type
        this.type.divChoixSousFaction.hidden = true
        this.type.selectFaction.value = ""
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
            this.type.divChoixSousFaction.hidden = false
        }
        else {
            console.log(valueSelect, "bad")
            this.type.divChoixSousFaction.hidden = true
            this.type.selectSousFaction.innerHTML = ""
        }
    }
}

export default mainScript