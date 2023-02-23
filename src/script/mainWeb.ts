import mainScript from "./mainScript.js";

let vueMain = new mainScript({
    divSelectionFaction: document.querySelector("[id=div_selection_faction]")!,
    selectFaction: document.querySelector("[id=select_faction]")!,
    divChoixSousFaction: document.querySelector("[id=div_choix_sous_faction]")!,
    lblSousFaction: document.querySelector("[id=label_sous_faction]")!,
    selectSousFaction: document.querySelector("[id=select_sous_faction]")!,
    divAffichageBonusSousFaction: document.querySelector("[id=div_affichage_bonus_sous_faction]")!,
    h3TitreSousFaction: document.querySelector("[id=h3_titre_sous_faction]")!,
    h4TitreTraitSousFaction: document.querySelector("[id=h4_titre_trait_sous_faction]")!,
    ulDescSousFaction: document.querySelector("[id=ul_desc_sous_faction]")!,
    divAjoutUnite: document.querySelector("[id=div_ajout_unite]")!,
    selectUnité: document.querySelector("[id=select_unites]")!,
    btnAfficherUnitTrait: document.querySelector("[id=btn_afficherUnitTrait]")!,
    btnAjouterUnit: document.querySelector("[id=btn_ajouter]")!,
    divCheckSeigneur: document.querySelector("[id=div_check_seigneur]")!,
    divCheckSeigneurTraitSec: document.querySelector("[id=div_check_seigneur_traitSec]")!
})


vueMain.type.selectFaction.addEventListener("change", function() {vueMain.afficherSousFaction()})
vueMain.type.selectSousFaction.addEventListener("change", function() {vueMain.affichageDeSousFactionMain()})