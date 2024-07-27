<?php
// Definiciones de constantes para la conexión a la base de datos
define('DB_SERVER', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'shopping');

// Conexión a la base de datos
$con = mysqli_connect(DB_SERVER, DB_USER, DB_PASS, DB_NAME);

// Verificación de la conexión
if (mysqli_connect_errno()) {
            echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

// Definición de la constante CLIENT_ID para PayPal
define('CLIENT_ID', 'Ab5eIKZuWxzRFIa1bSUFA8H_NSVWaObJfHeWXJm-DffDEqyl_KwppXFDGPtQagwCnZYDUPmYc1JiVdFZ');
