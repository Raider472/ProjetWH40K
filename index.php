<!DOCTYPE html>
<html lang="en"> <!--ITC Novarese W01 Medium Fonts-->
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="src/style.css">
    <link rel="stylesheet" type="text/css" href="https://unpkg.com/magic-input/dist/magic-input.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="src/assets/40kIcon.jpg">
    <script type="module" src="/script/mainWeb.js" defer async></script>
    <title>Créateur de Liste WH40K</title>
  </head>
  <body>
    <header>
      <h1>Créateur de liste WH40K</h1>
    </header>
    <main>
      <?php
        require("src/config/connect.php");
      ?>
      <h2>Création d'une liste</h2>
      <div class="faction_selection">
        <h3>Sélection de la faction</h3>
        <div class="divFaction">
          <div id="div_selection_faction">
            <label for="select_faction">Faction</label>
            <select id="select_faction" name="faction" class="selectStyle">
              <option value="">Veuillez choisir une faction</option>
              <?php
                require "src/classes/LesFactions.php";
                $faction = new LesFaction();
                $tab = $faction->fetchAll();
                $faction->putIntoSelect($tab);
              ?>
            </select>
          </div>
          <div id="div_choix_sous_faction"> <!--cacher et vide au début-->
            <label for="select_sous_faction" id="label_sous_faction"></label>
            <select id="select_sous_faction" name="sous_faction" class="selectStyle">
            </select>
          </div>
        </div>
      </div>
      <div class="TexteSousFaction" id="div_affichage_bonus_sous_faction"><!--Faire disparaitre aprés-->
        <h2>Bonus de sous-faction</h2>
        <h3 id="h3_titre_sous_faction"></h3>
        <h4 id="h4_titre_trait_sous_faction"></h4>
        <ul id="ul_desc_sous_faction" class="ulDescSousFaction"></ul>
      </div>
      <div id="div_ajout_unite" class="divAjoutUnité">
        <h2>Ajout d'unités</h2>
        <!--Unité-->
        <div id="div_affichage_unité">
          <div class="selectUnités">
            <h3>Sélection de l'unité</h3>
            <h4 class="h4UnitActuel">Unité Actuel :</h4>
            <h5 id="h5_nom_unité_actuel" class="h5NomUnit"></h5>
            <select id="select_unites" name="unites" size="15">
            </select>
          </div>
          <div id="div_bouton_unite" class="divBoutonUnite">
            <input type="button" id="btn_afficherUnitTrait" value="Afficher les aptitudes">
            <input type="button" id="btn_ajouter" value="Sélectionner">
          </div>
          <div class="seigneur_guerre"> <!--Cette div est cacher au début et n'apparait seulement si le perso highlight est un personnage-->
            <div id="div_check_seigneur">
              <label for="chk_seigneur_guerre">Seigneur de guerre</label>
              <input id="chk_seigneur_guerre" type="checkbox" value="trueSeigneur" class="mgc mgc-primary">
            </div>
            <div id="div_check_seigneur_traitSec">
              <label for="chk_personnage_trait">Stratagème</label>
              <input id="chk_personnage_trait" type="checkbox" value="secondSeigneur" class="mgc mgc-primary">
            </div>
          </div>
          <div id="div_quantité_unit" class="quantitéUnit">
            <label for="numQuantiteUnit">Quantité</label>
            <input id="numQuantiteUnit" type="number" name="UnitQuantité" min="0" max="0" size="3">
          </div>
          <div class="tableUnit">
            <div id="div_tableau_unit">
            </div>
          </div>
        </div>
        <!--Unité-->
        <!--Aptitude-->
        <div id="div_affichage_detail_trait" class="selectionDunité">
          <div class="selectUnités">
            <h3>Detail des traits de l'unité :</h3>
            <h4 id="h4_nom_unité_trait" class="h4NomUnit"></h4>
            <select id="select_trait" name="unites" size="15">
            </select>
          </div>
          <div class="divBoutonUnite">
            <input type="button" id="btn_retourUnitTrait" value="Retour">
          </div>
        <div class="TexteSousFaction">
          <h3 id="h3_titre_trait"></h3>
          <ul id="ul_desc_trait" class="ulDescSousFaction"></ul>
        </div>
        </div>
        <!--Aptitude-->
        <!--Equipement-->
        <div class="choixEquipement"> <!--Elle apparait quand l'unité est selectionner-->
          <h3>Choix des équipements</h3>
          <div id="div_choix_equipement" class="optionEquip">
          </div>
          <p>armes incompatibles</p>
          <div id="div_tableau_equip" class="tableEquip">
          </div>
        </div>
        <!--Equipement-->
        <!--Trait-->
        <div id="div_choix_trait" class="traitSeigneur"> <!--apparait quand c'est un personnage et que seigneur de guerre est selectionner-->
          <h3>Sélection du trait de seigneur de guerre</h3>
          <div class="boutonRadioTrait">
            <div>
              <label for="radio_test">Test1</label>
              <input type="radio" id="radio_test" value="test" name="test" class="mgr mgr-primary">
            </div>
            <div>
              <label for="radio_test2">test2</label>
              <input type="radio" id="radio_test2" value="test2" name="test" class="mgr mgr-primary">
            </div>
            <div>
              <label for="radio_test3">test3</label>
              <input type="radio" id="radio_test3" value="test3" name="test" class="mgr mgr-primary">
            </div>
          </div>
          <p class="lblErreur">Choisir trait</p>
          <div class="descTrait">
            <h4>Nom trait</h4>
            <p>
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ut nunc velit. Nullam sed mauris imperdiet, tempus mauris quis, suscipit odio. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dictum augue non mauris sodales, ac cursus justo cursus. Maecenas sollicitudin consequat turpis, quis volutpat lorem euismod at. Donec mollis tempus nulla suscipit varius. Duis tristique, dui in feugiat imperdiet, ipsum elit viverra mi, id finibus sapien lacus eu neque. Morbi pellentesque elementum urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ut nulla tristique, pulvinar nulla eu, feugiat magna. 
            </p>
          </div>
        </div>
        <!--Trait-->
        <!--Relique-->
        <div id="div_choix_relique" class="ReliqueSeigneur">
          <h3>Sélection de la relique</h3>
          <div class="boutonRadioRelique">
            <div>
              <label for="radio_test1">Test1</label>
              <input type="radio" id="radio_test1" value="test" name="test" class="mgr mgr-primary">
            </div>
            <div>
              <label for="radio_test12">test2</label>
              <input type="radio" id="radio_test12" value="test2" name="test" class="mgr mgr-primary">
            </div>
            <div>
              <label for="radio_test13">test3</label>
              <input type="radio" id="radio_test13" value="test3" name="test" class="mgr mgr-primary">
            </div>
          </div>
          <div class="descRelique">
            <h4>Nom relique</h4>
            <p>
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ut nunc velit. Nullam sed mauris imperdiet, tempus mauris quis, suscipit odio. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dictum augue non mauris sodales, ac cursus justo cursus. Maecenas sollicitudin consequat turpis, quis volutpat lorem euismod at. Donec mollis tempus nulla suscipit varius. Duis tristique, dui in feugiat imperdiet, ipsum elit viverra mi, id finibus sapien lacus eu neque. Morbi pellentesque elementum urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ut nulla tristique, pulvinar nulla eu, feugiat magna. 
            </p>
          </div>
        </div>
        <!--Relique-->
        <!--Sort-->
        <div id="div_choix_sort" class="choixSort">
          <h3>Sélection des sorts</h3>
          <div class="optionSortChoix">
            <div class="divSortEquip">
              <div>
                <h4>Nom de Sort</h4>
              </div>
              <div>
                <label for="chk_test1">Test</label>
                <input type="checkbox" id="chk_test1" value="test" class="mgc mgc-primary">
              </div>
              <div>
                <label for="chk_test21">Test</label>
                <input type="checkbox" id="chk_test21" value="test" class="mgc mgc-primary">
              </div>
              <div>
                <label for="chk_test31">Test</label>
                <input type="checkbox" id="chk_test31" value="test" class="mgc mgc-primary">
              </div>
            </div>
            <div class="descriptionSort">
              <h4>Nom du sort</h4>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ut nunc velit. Nullam sed mauris imperdiet, tempus mauris quis, suscipit odio. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dictum augue non mauris sodales, ac cursus justo cursus. Maecenas sollicitudin consequat turpis, quis volutpat lorem euismod at. Donec mollis tempus nulla suscipit varius. Duis tristique, dui in feugiat imperdiet, ipsum elit viverra mi, id finibus sapien lacus eu neque. Morbi pellentesque elementum urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ut nulla tristique, pulvinar nulla eu, feugiat magna. 
              </p>
            </div>
            <div class="divSortEquip">
              <div>
                <h4>Nom de Sort</h4>
              </div>
              <div>
                <label for="chk_test41">Test</label>
                <input type="checkbox" id="chk_test41" value="test" class="mgc mgc-primary">
              </div>
              <div>
                <label for="chk_test51">Test</label>
                <input type="checkbox" id="chk_test51" value="test" class="mgc mgc-primary">
              </div>
            </div>
          </div>
          <p class="lblErreur">trop de sorts</p>
        </div>
        <!--Sort-->
      </div>
      <div id="div_affichage_liste" class="affichageListe">
        <h2>Vue d'ensemble de la liste</h2>
        <div id="div_liste_unité" class="listeUnitAffichage">
          <h3>Liste des unités</h3>
          <select id="select_affichage_liste" name="affichage_liste" size="15"></select>
        </div>
        <div>
          <h3>Nombre de points:</h3>
          <h3 id="h3_nombre_points"></h3>
        </div>
        <div>
          <h3>Traits:</h3>
        </div>
        <div id="div_sous_faction_affichage">
          <div>
            <h3 id="h3_nom_faction_">Dinasty: </h3>
            <h4 id="h4_nom_sous_faction">Novhok</h4>
          </div>
          <div>
            <h3>Bonus de Dinasty</h3>
            <p id="p_bonus_sous_faction">je suis nul</p>
          </div>
        </div>
        <div>
          <h3>Pouvoir psychic</h3>
        </div>
      </div>
      <div class="creationListecss">
        <div>
          <input type="button" id="btn_ajouterListe" value="Ajouter">
          <input type="button" id="btn_annulerListe" value="Annuler">
        </div>
      </div>
    </main>
    <footer>
      <p>Crée par Gabriel NAE /Placeholder</p>
      <div>Font made from <a href="http://www.onlinewebfonts.com">oNline Web Fonts</a>is licensed by CC BY 3.0</div>
    </footer>
  </body>
</html>
