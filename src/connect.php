<?php
    function db_connect() {
        require "config.php";
        $connect = new mysqli($serverName, $userName, $password, $dbName);
        return $connect;
    }
?>    