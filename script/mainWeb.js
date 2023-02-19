import vueMain from "./mainScript";
vueMain.init({
    divSelectionFaction: document.querySelector("[id=div_selection_faction]"),
    selectFaction: document.querySelector("[id=select_faction]"),
    divChoixSousFaction: document.querySelector("[id=div_choix_sous_faction]"),
    selectSousFaction: document.querySelector("[id=select_sous_faction]"),
    divAjoutUnite: document.querySelector("[id=div_ajout_unite]"),
    btnAfficherUnit: document.querySelector("[id=btn_afficherUnitTrait]")
});
vueMain.type.btnAfficherUnit.addEventListener("click", function () { vueMain.test(); });
//# sourceMappingURL=mainWeb.js.map