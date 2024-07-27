<?php
session_start(); // Inicia la sesión al principio del script
error_reporting(0);
include("include/config.php");

$_SESSION['errmsg'] = ""; // Inicializa la variable de sesión errmsg

if (isset($_POST['submit'])) {
            $username = $_POST['username'];
            $password = md5($_POST['password']);
            $ret = mysqli_query($con, "SELECT * FROM admin WHERE username='$username' and password='$password'");
            $num = mysqli_fetch_array($ret);
            if ($num > 0) {
                        $extra = "change-password.php"; //
                        $_SESSION['alogin'] = $_POST['username'];
                        $_SESSION['id'] = $num['id'];
                        $host = $_SERVER['HTTP_HOST'];
                        $uri = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
                        header("location:http://$host$uri/$extra");
                        exit();
            } else {
                        $_SESSION['errmsg'] = "Invalid username or password";
                        $extra = "index.php";
                        $host  = $_SERVER['HTTP_HOST'];
                        $uri  = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
                        header("location:http://$host$uri/$extra");
                        exit();
            }
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title> Administrador login</title>
            <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
            <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
            <link type="text/css" href="css/theme.css" rel="stylesheet">
            <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
            <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
                        rel='stylesheet'>
            <style>
            /* Estilo para centrar el contenido */
            .centered-form {
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        height: 70vh;
            }

            .module-login {
                        background-color: #ffffff;
                        padding: 20px;
                        border-radius: 5px;
                        box-shadow: 0px 0px 10px rgba(0, 0, 255, 0.5);
                        margin: 0px 20px;
            }

            .navbar .brand img {
                        max-height: 40px;
                        margin-top: -10px;
                        margin-left: 10px;
            }
            </style>
</head>

<body>

            <div class="navbar navbar-fixed-top">
                        <div class="navbar-inner">
                                    <div class="container">
                                                <a class="brand" href="index.html"
                                                            style="margin-top: 20px; letter-spacing: 1px;">
                                                            Portal Administrador| DVUS
                                                </a>
                                                <div class="nav-collapse collapse navbar-inverse-collapse">
                                                            <ul class="nav pull-right">
                                                                        <li
                                                                                    style="text-align: center; margin-top: 35px;">
                                                                                    <div
                                                                                                style="display: inline-block; margin: px -100px; padding: 5px 60px; border-radius: 70px; box-shadow: 0px 0px 10px rgba(0, 0, 255, 0.5);">
                                                                                                <a href="http://localhost/shopping/"
                                                                                                            style="text-decoration: none; color: #3d3d3d;">Volver
                                                                                                            al
                                                                                                            portal</a>
                                                                                    </div>
                                                                        </li>
                                                                        <img src="../logo dvus.png" alt="logo"
                                                                                    width="110"
                                                                                    style="margin-left: 100px;">
                                                            </ul>
                                                </div><!-- /.nav-collapse -->
                                    </div>
                        </div><!-- /navbar-inner -->

            </div><!-- /navbar -->

            <div class="wrapper" style="position: relative; text-align: center;">
                        <?php
                        echo '<img src="../uni.jpg" alt="logo" style="width: 100%; height: auto; position: absolute; top: 0; left: 0;">';
                        ?>





                        <div class="container centered-form"
                                    style="position: relative; top: 50%; transform: translateY(-10%);">
                                    <div class="row">
                                                <div class="module module-login span4">
                                                            <form class="form-vertical" method="post">
                                                                        <div class="module-head"
                                                                                    onmouseover="illuminateBorder(this)"
                                                                                    onmouseout="resetBorder(this)">
                                                                                    <h3>Inicia sesión</h3>
                                                                        </div>

                                                                        <style>
                                                                        .module-head {
                                                                                    border: 1px solid #ccc;
                                                                                    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                                                                                    /* Agrega una sombra para el efecto 3D */
                                                                        }

                                                                        .module-head:hover {
                                                                                    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.3);
                                                                                    /* Cambia la sombra al pasar el cursor */
                                                                        }
                                                                        </style>

                                                                        <script>
                                                                        function illuminateBorder(element) {
                                                                                    element.style.border =
                                                                                                "1px solid #c1c5ff"; // Cambia el color del borde al pasar el cursor
                                                                        }

                                                                        function resetBorder(element) {
                                                                                    element.style.border =
                                                                                                "1px solid #ccc"; // Restaura el color del borde cuando el cursor sale
                                                                        }
                                                                        </script>

                                                                        <span
                                                                                    style="color:red;"><?php echo htmlentities($_SESSION['errmsg']); ?></span>
                                                                        <div class="module-body">
                                                                                    <div class="control-group">
                                                                                                <div
                                                                                                            class="controls row-fluid">
                                                                                                            <input class="span12"
                                                                                                                        type="text"
                                                                                                                        id="inputEmail"
                                                                                                                        name="username"
                                                                                                                        placeholder="Username">
                                                                                                </div>
                                                                                    </div>
                                                                                    <div class="control-group">
                                                                                                <div
                                                                                                            class="controls row-fluid">
                                                                                                            <input class="span12"
                                                                                                                        type="password"
                                                                                                                        id="inputPassword"
                                                                                                                        name="password"
                                                                                                                        placeholder="Password">
                                                                                                </div>
                                                                                    </div>
                                                                        </div>
                                                                        <div class="module-foot">
                                                                                    <div class="control-group">
                                                                                                <div
                                                                                                            class="controls clearfix">
                                                                                                            <button type="submit"
                                                                                                                        class="btn btn-primary pull-right"
                                                                                                                        name="submit">Login</button>
                                                                                                </div>
                                                                                    </div>
                                                                        </div>
                                                            </form>
                                                </div>
                                    </div>
                        </div>
            </div>
            <!--/.wrapper-->

            <div class="footer" style="text-align: center;">
                        <div class="container">
                                    <b class="copyright">&copy; 2024 Portal </b> administracion por DVUS.
                        </div>
            </div>

            </div>
            <script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
            <script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
            <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</body>

</html>