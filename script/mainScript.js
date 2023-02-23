class mainScript {
    constructor(type) {
        this._type = type;
        this.type.divChoixSousFaction.hidden = true;
        this.type.selectFaction.value = "";
        this.type.divAffichageBonusSousFaction.hidden = true;
    }
    get type() {
        return this._type;
    }
    afficherSousFaction(valueSelect = this.type.selectFaction.value) {
        if (valueSelect != "") {
            const ajax = new XMLHttpRequest();
            this.type.selectSousFaction.innerHTML = "<option value=\"\">Neutre</option>";
            ajax.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("select_sous_faction").innerHTML += this.responseText;
                }
            };
            ajax.open("POST", "fonction.php?action=" + "affichageSousFaction" + "&faction=" + valueSelect, true);
            ajax.send();
            switch (valueSelect) {
                case "Nécrons":
                    this.type.lblSousFaction.innerHTML = "Dynastie";
                    break;
                case "Thousand Sons":
                    this.type.lblSousFaction.innerHTML = "Culte";
                    break;
                case "Space Marine":
                    this.type.lblSousFaction.innerHTML = "Chapitre";
                    break;
                default: this.type.lblSousFaction.innerHTML = "";
            }
            this.afficherUnitéFaction();
            this.type.h3TitreSousFaction.innerHTML = "";
            this.type.divChoixSousFaction.hidden = false;
        }
        else {
            this.type.divChoixSousFaction.hidden = true;
            this.type.selectSousFaction.innerHTML = "";
            this.type.h3TitreSousFaction.innerHTML = "";
            this.type.selectUnité.innerHTML = "";
        }
    }
    afficherUnitéFaction(valueSelect = this.type.selectFaction.value) {
        const ajax = new XMLHttpRequest();
        ajax.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("select_unites").innerHTML = this.responseText;
            }
        };
        ajax.open("POST", "fonction.php?action=" + "affichageUnités" + "&faction=" + valueSelect, true);
        ajax.send();
    }
    affichageDeSousFactionMain(valueSelect = this.type.selectSousFaction.value) {
        if (valueSelect != "") {
            this.afficherTitreSousFaction();
            this.afficherTitreSousTraitFaction();
            this.afficherDescriptionTraitSousFaction();
            this.type.divAffichageBonusSousFaction.hidden = false;
        }
        else {
            this.type.divAffichageBonusSousFaction.hidden = true;
            this.type.h3TitreSousFaction.innerHTML = "";
            this.type.h4TitreTraitSousFaction.innerHTML = "";
            this.type.pDescSousFaction.innerHTML = "";
        }
    }
    afficherTitreSousFaction(valueSelect = this.type.selectSousFaction.value) {
        const ajax = new XMLHttpRequest();
        ajax.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("h3_titre_sous_faction").innerHTML = this.responseText;
            }
        };
        ajax.open("POST", "fonction.php?action=" + "affichageNomSousFaction" + "&sousFaction=" + valueSelect, true);
        ajax.send();
    }
    afficherTitreSousTraitFaction(valueSelect = this.type.selectSousFaction.value) {
        const ajax = new XMLHttpRequest();
        ajax.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("h4_titre_trait_sous_faction").innerHTML = this.responseText;
            }
        };
        ajax.open("POST", "fonction.php?action=" + "affichageNomTraitSousFaction" + "&sousFaction=" + valueSelect, true);
        ajax.send();
    }
    afficherDescriptionTraitSousFaction(valueSelect = this.type.selectSousFaction.value) {
        const ajax = new XMLHttpRequest();
        ajax.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("ul_desc_sous_faction").innerHTML = this.responseText;
            }
        };
        ajax.open("POST", "fonction.php?action=" + "affichageDescriptionTraitSousFaction" + "&sousFaction=" + valueSelect, true);
        ajax.send();
    }
}
export default mainScript;
//# sourceMappingURL=mainScript.js.map