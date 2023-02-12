<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="src/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Créateur de Liste WH40K</title>
  </head>
  <body>
    <header>
      <h1>Créateur de liste WH40K</h1>
    </header>
    <main>
      <?php
        require "connect.php";
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
        echo "<br>"
      ?>
      <div id="div_selection_faction">
        <label for="select_faction">Faction</label>
        <select id="select_faction" name="faction">
          <option value="">Veuillez choisir une faction</option>
          <option value="necron">Necron</option>
          <option value="thousandSons">Thousand Sons</option>
        </select>
      </div>
      <div id="div_choix_sous_faction">
        <label for="select_sous_faction">Dinasty</label>
        <select id="select_sous_faction" name="sous_faction">
          <option value="">Aucune</option>
          <option value="Novokh">Novokh</option>
          <option value="Szarekhan">Szarekhan</option>
        </select>
      </div>
      <div id="div_ajout_unite">
        <h2>Ajout d'unités</h2>
        <div class="selectionDunité">
          <div class="selectUnités">
            <h3>Sélection de l'unité</h3>
            <select id="select_unites" name="unites">
              <option value=""></option>
              <option value="test">Test</option>
            </select>
          </div>
          <div id="div_bouton_unite">
            <input type="button" id="btn_ajouter">
          </div>
          <div>
            <label for="chk_seigneur_guerre">Seigneur de guerre</label>
            <input id="chk_seigneur_guerre" type="checkbox" value="trueSeigneur">
            <label for="chk_personnage_trait">Second seigneur de guerre</label>
            <input id="chk_personnage_trait" type="checkbox" value="secondSeigneur">
          </div>
        </div>
        <div id="div_choix_equipement">
          <h3>Choix des équipements</h3>
          <label for="chk_test">Test</label>
          <input type="checkbox" id="chk_test" value="test">
        </div>
        <div id="div_choix_trait">
          <h3>Sélection du trait de seigneur de guerre</h3>
          <select id="select_trait" name="trait">
            <option value="">Aucun</option>
            <option value="test">Test</option>
          </select>
        </div>
      </div>
      <div id="div_affichage_liste">
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
    <script type="module" src="/src/main.ts"></script>
  </body>
</html>
