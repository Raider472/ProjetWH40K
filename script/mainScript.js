class mainScript {
    init(type) {
        this._type = type;
    }
    get type() {
        return this._type;
    }
    test() {
        console.log("hello");
        this.type.divSelectionFaction.hidden = true;
        this._type.divSelectionFaction.innerHTML = "test";
        this._type.divAjoutUnite.innerHTML = "require \"connect.php\";  $connexion = db_connect(); $sql = \"SELECT * FROM Unité\"; $result = $connexion->query($sql); while ($data = $result->fetch_object()) { $users[] = $data; } foreach ($users as $user) { echo \"<option value=\"$user->nom_unit\"> $user->nom_unit </option>\"; }";
        this._type.selectFaction.innerHTML = "require \"connect.php\";  $connexion = db_connect(); $sql = \"SELECT * FROM Unité\"; $result = $connexion->query($sql); while ($data = $result->fetch_object()) { $users[] = $data; } foreach ($users as $user) { echo \"<option value=\"$user->nom_unit\"> $user->nom_unit </option>\"; }";
    }
}
let vueMain = new mainScript();
export default vueMain;
//# sourceMappingURL=mainScript.js.map