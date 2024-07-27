<?php
session_start();
include('include/config.php');

if (strlen($_SESSION['alogin']) == 0) {
            header('location:index.php');
} else {
            date_default_timezone_set('Asia/Kolkata'); // cambiar según la zona horaria
            $currentTime = date('d-m-Y h:i:s A', time());

            if (isset($_POST['submit'])) {
                        $sql = mysqli_query($con, "SELECT password FROM admin where password='" . md5($_POST['password']) . "' && username='" . $_SESSION['alogin'] . "'");
                        $num = mysqli_fetch_array($sql);
                        if ($num > 0) {
                                    $con = mysqli_query($con, "update admin set password='" . md5($_POST['newpassword']) . "', updationDate='$currentTime' where username='" . $_SESSION['alogin'] . "'");
                                    $_SESSION['msg'] = "Contraseña cambiada con éxito !!";

                                    // Agregar la redirección aquí
                                    header("Location: change-password.php");
                                    exit; // asegurar que el script se detenga después de la redirección
                        } else {
                                    $_SESSION['msg'] = "La contraseña antigua no coincide !!";
                        }
            }
?>
<!DOCTYPE html>
<html lang="es">

<head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Administrador| Cambiar contraseña</title>
            <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
            <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
            <link type="text/css" href="css/theme.css" rel="stylesheet">
            <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
            <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
                        rel='stylesheet'>
            <script type="text/javascript">
            function valid() {
                        if (document.chngpwd.password.value == "") {
                                    alert("Current Password Filed is Empty !!");
                                    document.chngpwd.password.focus();
                                    return false;
                        } else if (document.chngpwd.newpassword.value == "") {
                                    alert("New Password Filed is Empty !!");
                                    document.chngpwd.newpassword.focus();
                                    return false;
                        } else if (document.chngpwd.confirmpassword.value == "") {
                                    alert("Confirm Password Filed is Empty !!");
                                    document.chngpwd.confirmpassword.focus();
                                    return false;
                        } else if (document.chngpwd.newpassword.value != document.chngpwd.confirmpassword.value) {
                                    alert("Password and Confirm Password Field do not match  !!");
                                    document.chngpwd.confirmpassword.focus();
                                    return false;
                        }
                        return true;
            }
            </script>
            <style>
            /* Estilos para la animación de alerta */
            .alert-check {
                        display: none;
                        position: fixed;
                        top: 50%;
                        left: 50%;
                        transform: translate(-50%, -50%);
                        z-index: 9999;
                        padding: 20px;
                        background-color: #5cb85c;
                        color: white;
                        border-radius: 5px;
            }
            </style>
</head>

<body>
            <?php include('include/header.php'); ?>

            <div class="wrapper">
                        <div class="container">
                                    <div class="row">
                                                <?php include('include/sidebar.php'); ?>
                                                <div class="span9">
                                                            <div class="content">
                                                                        <div class="module">
                                                                                    <div class="module-head">
                                                                                                <h3>Admin Cambiar
                                                                                                            contraseña
                                                                                                </h3>
                                                                                    </div>
                                                                                    <div class="module-body">
                                                                                                <?php if (isset($_POST['submit'])) { ?>
                                                                                                <!-- Agregar animación de alerta -->
                                                                                                <div
                                                                                                            class="alert-check">
                                                                                                            Contraseña
                                                                                                            cambiada con
                                                                                                            éxito
                                                                                                </div>
                                                                                                <?php } ?>
                                                                                                <br />

                                                                                                <form class="form-horizontal row-fluid"
                                                                                                            name="chngpwd"
                                                                                                            method="post"
                                                                                                            onSubmit="return valid();">

                                                                                                            <div
                                                                                                                        class="control-group">
                                                                                                                        <label class="control-label"
                                                                                                                                    for="basicinput">Contraseña
                                                                                                                                    actual</label>
                                                                                                                        <div
                                                                                                                                    class="controls">
                                                                                                                                    <input type="password"
                                                                                                                                                placeholder="introduce su contraseña actual"
                                                                                                                                                name="password"
                                                                                                                                                class="span8 tip"
                                                                                                                                                required>
                                                                                                                        </div>
                                                                                                            </div>

                                                                                                            <div
                                                                                                                        class="control-group">
                                                                                                                        <label class="control-label"
                                                                                                                                    for="basicinput">nueva
                                                                                                                                    contraseña</label>
                                                                                                                        <div
                                                                                                                                    class="controls">
                                                                                                                                    <input type="password"
                                                                                                                                                placeholder="ingrese su nueva contraseña actual"
                                                                                                                                                name="newpassword"
                                                                                                                                                class="span8 tip"
                                                                                                                                                required>
                                                                                                                        </div>
                                                                                                            </div>

                                                                                                            <div
                                                                                                                        class="control-group">
                                                                                                                        <label class="control-label"
                                                                                                                                    for="basicinput">nueva
                                                                                                                                    contraseña
                                                                                                                                    de
                                                                                                                                    nuevo</label>
                                                                                                                        <div
                                                                                                                                    class="controls">
                                                                                                                                    <input type="password"
                                                                                                                                                placeholder="ingrese su nueva contraseña actual nuevamente"
                                                                                                                                                name="confirmpassword"
                                                                                                                                                class="span8 tip"
                                                                                                                                                required>
                                                                                                                        </div>
                                                                                                            </div>

                                                                                                            <div
                                                                                                                        class="control-group">
                                                                                                                        <div
                                                                                                                                    class="controls">
                                                                                                                                    <button type="submit"
                                                                                                                                                name="submit"
                                                                                                                                                class="btn">Enviar</button>
                                                                                                                        </div>
                                                                                                            </div>
                                                                                                </form>
                                                                                    </div>
                                                                        </div>
                                                            </div>
                                                            <!--/.content-->
                                                </div>
                                                <!--/.span9-->
                                    </div>
                        </div>
                        <!--/.container-->
            </div>
            <!--/.wrapper-->

            <?php include('include/footer.php'); ?>

            <script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
            <script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
            <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
            <script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
            <script>
            // Mostrar la animación de alerta cuando se carga la página
            $(document).ready(function() {
                        <?php if (isset($_SESSION['msg'])) { ?>
                        $('.alert-check').fadeIn(1000).delay(3000).fadeOut(1000);
                        <?php } ?>
            });
            </script>
</body>

</html>

<?php } ?>