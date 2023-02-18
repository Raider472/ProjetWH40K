"use strict";
exports.__esModule = true;
exports.vueMain = void 0;
var mainScript = /** @class */ (function () {
    function mainScript() {
    }
    mainScript.prototype.init = function (type) {
        this._type = type;
    };
    Object.defineProperty(mainScript.prototype, "type", {
        get: function () {
            return this._type;
        },
        enumerable: false,
        configurable: true
    });
    mainScript.prototype.test = function () {
        console.log("hello");
        this.type.divSelectionFaction.hidden = true;
        this._type.divSelectionFaction.innerHTML = "test";
        this._type.divAjoutUnite.innerHTML = "require \"connect.php\";  $connexion = db_connect(); $sql = \"SELECT * FROM Unité\"; $result = $connexion->query($sql); while ($data = $result->fetch_object()) { $users[] = $data; } foreach ($users as $user) { echo \"<option value=\"$user->nom_unit\"> $user->nom_unit </option>\"; }";
        this._type.selectFaction.innerHTML = "require \"connect.php\";  $connexion = db_connect(); $sql = \"SELECT * FROM Unité\"; $result = $connexion->query($sql); while ($data = $result->fetch_object()) { $users[] = $data; } foreach ($users as $user) { echo \"<option value=\"$user->nom_unit\"> $user->nom_unit </option>\"; }";
    };
    return mainScript;
}());
var vueMain = new mainScript;
exports.vueMain = vueMain;
