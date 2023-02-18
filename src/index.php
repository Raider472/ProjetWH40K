<?php
      header("Access-Control-Allow-Origin: *");
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/style.css" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Créateur de Liste WH40K</title>
  </head>
  <body>
    <header>
      <h1>Créateur de liste WH40K</h1>
    </header>
    <main>
      <h2>Création d'une liste</h1>
      <?php
        require "config/connect.php";
        $connexion = db_connect();
        $sql = "SELECT * FROM Unité";
        $result = $connexion->query($sql);
        while ($data = $result->fetch_object()) {
          $users[] = $data;
        }
        foreach ($users as $user) {
          echo "<br>";
          echo $user->nom_unit . " | " . $user->type_unit;
          echo "<br>";
        }
      ?>
      <?php
        require "classes/LesFactions.php";
        $faction = new LesFaction();
        $tab = $faction->fetchAll();
        $faction->showAll($tab);
        //$faction->test();
      ?>
      <div class="creationListecss">
        <div>
          <select id="select_liste" name="liste">
            <option value="">Veuillez créer ou choisir une liste</option>
          </select>
        </div>
        <div class="buttonListe"> <!--Cette partie sera diviser en deux: le bouton créer en bas, le reste sur une nouvelle page affichage qui sera celle par defaut-->
          <input type="button" id="btn_creationListe" value="Créer">
          <input type="button" id="btn_suppressionListe" value="Supprimer">
        </div>
      </div>
      <div class="faction_selection">
        <div id="div_selection_faction">
          <label for="select_faction">Faction</label>
          <select id="select_faction" name="faction">
            <option value="">Veuillez choisir une faction</option>
            <option value="necron">Necron</option>
            <option value="thousandSons">Thousand Sons</option>
          </select>
        </div>
        <div id="div_choix_sous_faction"> <!--cacher et vide au début-->
          <label for="select_sous_faction">Dinasty</label>
          <select id="select_sous_faction" name="sous_faction">
            <option value="">Aucune</option>
            <option value="Novokh">Novokh</option>
            <option value="Szarekhan">Szarekhan</option>
          </select>
        </div>
      </div>
      <div class="TexteSousFaction">
        <h2>Bonus de sous-faction</h2>
        <h3>Novokh</h3>
        <p>
          Ajoutez 1 aux jets de charge pour les unités ayant ce code. \nChaque fois qu'une figurine ayant ce code fait une attaque de mêlée, si l'unité de la figurine a fait un mouvement de charge, a été chargée ou a accompli une Intervention Héroique à ce tour, améliorez de 1 la caractéristique de Pénétration d'armure de l'attaque. \nLorsque le protocole du Néant Avide devient actif pour votre armée, si toutes les unité de votre armée (à l'exception des unités DYNASTIC AGENT et C'TAN SHARD) possède ce code, vous pouvez sélectionner les deux directives de ce protocole de commande au lieu d'une seule.
        </p>
      </div>
      <div id="div_ajout_unite">
        <h2>Ajout d'unités</h2>
        <div class="selectionDunité">
          <div class="selectUnités">
            <h3>Sélection de l'unité</h3>
            <select id="select_unites" name="unites" size="15">
            </select>
          </div>
          <div id="div_bouton_unite">
            <input type="button" id="btn_afficherUnit" value="Afficher l'Unité">
            <input type="button" id="btn_ajouter" value="Sélectionner">
          </div>
          <div class="seigneur_guerre"> <!--Cette div est cacher au début et n'apparait seulement si le perso highlight est un personnage-->
            <div>
              <label for="chk_seigneur_guerre">Seigneur de guerre</label>
              <input id="chk_seigneur_guerre" type="checkbox" value="trueSeigneur">
            </div>
            <div>
              <label for="chk_personnage_trait">Second seigneur de guerre</label>
              <input id="chk_personnage_trait" type="checkbox" value="secondSeigneur">
            </div>
          </div>
        </div>
        <div class="choixEquipement">
          <h3>Choix des équipements</h3>
          <div id="div_choix_equipement" class="optionEquip">
            <div>
              <div>
                <label for="chk_test">Test</label>
                <input type="checkbox" id="chk_test" value="test">
              </div>
              <div>
                <label for="chk_test2">Test</label>
                <input type="checkbox" id="chk_test2" value="test">
              </div>
              <div>
                <label for="chk_test3">Test</label>
                <input type="checkbox" id="chk_test3" value="test">
              </div>
            </div>
            <div>
              <div>
                <label for="chk_test4">Test</label>
                <input type="checkbox" id="chk_test4" value="test">
              </div>
              <div>
                <label for="chk_test5">Test</label>
                <input type="checkbox" id="chk_test5" value="test">
              </div>
            </div>
          </div>
          <p>armes incompatibles</p>
        </div>
        <div id="div_choix_trait" class="traitSeigneur">
          <h3>Sélection du trait de seigneur de guerre</h3>
          <div class="boutonRadioTrait">
            <div>
              <label for="radio_test">Test1</label>
              <input type="radio" id="radio_test" value="test" name="test">
            </div>
            <div>
              <label for="radio_test2">test2</label>
              <input type="radio" id="radio_test2" value="test2" name="test">
            </div>
            <div>
              <label for="radio_test3">test3</label>
              <input type="radio" id="radio_test3" value="test3" name="test">
            </div>
          </div>
          <p>Choisir trait</p>
        </div>
      </div>
      <div id="div_affichage_liste" class="affichageListe">
        <h2>Vue d'ensemble de la liste</h2>
        <div id="div_liste_unité">
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
            <h3>Dinasty: </h3>
            <h3 id="h3_nom_sous_faction">Novhok</h3>
          </div>
          <div>
            <h4>Bonus de Dinasty</h4>
            <p>je suis nul</p>
          </div>
        </div>
        <div>
          <h3>Pouvoir psychic</h3>
        </div>

      </div>
    </main>
    <script type="text/javascript" src="/mainWeb.js"></script>
  </body>
</html>

