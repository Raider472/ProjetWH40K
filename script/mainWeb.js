import mainScript from "./mainScript.js";
let vueMain = new mainScript({
    divSelectionFaction: document.querySelector("[id=div_selection_faction]"),
    selectFaction: document.querySelector("[id=select_faction]"),
    divChoixSousFaction: document.querySelector("[id=div_choix_sous_faction]"),
    lblSousFaction: document.querySelector("[id=label_sous_faction]"),
    selectSousFaction: document.querySelector("[id=select_sous_faction]"),
    divAjoutUnite: document.querySelector("[id=div_ajout_unite]"),
    btnAfficherUnit: document.querySelector("[id=btn_afficherUnitTrait]")
});
vueMain.type.selectFaction.addEventListener("change", function () { vueMain.afficherSousFaction(); });
//# sourceMappingURL=mainWeb.js.map