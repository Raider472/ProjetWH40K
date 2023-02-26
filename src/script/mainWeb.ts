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


vueMain.type.selectFaction.addEventListener("change", function() {vueMain.afficherSousFaction()})
vueMain.type.selectSousFaction.addEventListener("change", function() {vueMain.affichageDeSousFactionMain()})
vueMain.type.selectUnité.addEventListener("change", function() {vueMain.affichageDesUnitésMain()})
vueMain.type.btnAfficherUnitTrait.addEventListener("click", function() {vueMain.affichageDesAptitudesSelect()})
vueMain.type.selectTrait.addEventListener("change", function() {vueMain.affichageNomDescTrait()})
vueMain.type.btnRetourUnitTrait.addEventListener("click", function() {vueMain.cacherLesAptitudesSelect()})
vueMain.type.btnAjouterUnit.addEventListener("click", function() {vueMain.affichageDesEquipementsMain()})