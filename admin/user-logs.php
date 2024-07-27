<?php
session_start();
include('include/config.php');
if (strlen($_SESSION['alogin']) == 0) {
            header('location:index.php');
} else {

?>
<!DOCTYPE html>
<html lang="en">

<head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Administrador| Registro de usuarios</title>
            <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
            <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
            <link type="text/css" href="css/theme.css" rel="stylesheet">
            <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
            <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
                        rel='stylesheet'>
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
                                                                                                <h3>Administrar usuarios
                                                                                                </h3>
                                                                                    </div>
                                                                                    <div class="module-body table">


                                                                                                <table cellpadding="0"
                                                                                                            cellspacing="0"
                                                                                                            border="0"
                                                                                                            class="datatable-1 table table-bordered table-striped	 display"
                                                                                                            width="100%">
                                                                                                            <thead>
                                                                                                                        <tr>
                                                                                                                                    <th>#
                                                                                                                                    </th>
                                                                                                                                    <th> Correo electrónico
                                                                                                                                                del
                                                                                                                                                usuario
                                                                                                                                    </th>
                                                                                                                                    <th>IP de usuario
                                                                                                                                    </th>
                                                                                                                                    <th>Tiempo de
                                                                                                                                                inicio
                                                                                                                                                de
                                                                                                                                                sesión
                                                                                                                                    </th>
                                                                                                                                    <th>Hora de cierre
                                                                                                                                                de
                                                                                                                                                sesión
                                                                                                                                    </th>
                                                                                                                                    <th>Estado
                                                                                                                                    </th>

                                                                                                                        </tr>
                                                                                                            </thead>
                                                                                                            <tbody>

                                                                                                                        <?php $query = mysqli_query($con, "select * from userlog");
                                                                                                                                    $cnt = 1;
                                                                                                                                    while ($row = mysqli_fetch_array($query)) {
                                                                                                                                    ?>
                                                                                                                        <tr>
                                                                                                                                    <td><?php echo htmlentities($cnt); ?>
                                                                                                                                    </td>
                                                                                                                                    <td><?php echo htmlentities($row['userEmail']); ?>
                                                                                                                                    </td>
                                                                                                                                    <td><?php echo htmlentities($row['userip']); ?>
                                                                                                                                    </td>
                                                                                                                                    <td> <?php echo htmlentities($row['loginTime']); ?>
                                                                                                                                    </td>
                                                                                                                                    <td><?php echo htmlentities($row['logout']); ?>
                                                                                                                                    </td>
                                                                                                                                    <td><?php $st = $row['status'];

                                                                                                                                                                        if ($st == 1) {
                                                                                                                                                                                    echo "Successfull";
                                                                                                                                                                        } else {
                                                                                                                                                                                    echo "Failed";
                                                                                                                                                                        }
                                                                                                                                                                        ?>
                                                                                                                                    </td>


                                                                                                                                    <?php $cnt = $cnt + 1;
                                                                                                                                    } ?>

                                                                                                </table>
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
            <script src="scripts/datatables/jquery.dataTables.js"></script>
            <script src="scripts/datatables/dataTables.es.js"></script> <!-- Agrega el archivo de idioma en español -->
            <script>
            $(document).ready(function() {
                        $('.datatable-1').dataTable({
                                    "language": {
                                                "sProcessing": "Procesando...",
                                                "sLengthMenu": "Mostrar _MENU_ registros",
                                                "sZeroRecords": "No se encontraron resultados",
                                                "sEmptyTable": "Ningún dato disponible en esta tabla",
                                                "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                                                "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                                                "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                                                "sInfoPostFix": "",
                                                "sSearch": "Buscar:", // Cambiado a español
                                                "sUrl": "",
                                                "sInfoThousands": ",",
                                                "sLoadingRecords": "Cargando...",
                                                "oPaginate": {
                                                            "sFirst": "Primero",
                                                            "sLast": "Último",
                                                            "sNext": "Siguiente",
                                                            "sPrevious": "Anterior"
                                                },
                                                "oAria": {
                                                            "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                                                            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                                                }
                                    }
                        });
                        $('.dataTables_paginate').addClass("btn-group datatable-pagination");
                        $('.dataTables_paginate > a').wrapInner('<span />');
                        $('.dataTables_paginate > a:first-child').append(
                                    '<i class="icon-chevron-left shaded"></i>');
                        $('.dataTables_paginate > a:last-child').append(
                                    '<i class="icon-chevron-right shaded"></i>');
            });
            </script>

</body>
<?php } ?>