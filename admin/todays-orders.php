<?php
session_start();
include('include/config.php');
if (strlen($_SESSION['alogin']) == 0) {
            header('location:index.php');
} else {
            date_default_timezone_set('Asia/Kolkata'); // Cambiar según la zona horaria
            $currentTime = date('Y-m-d H:i:s', time());

            // Definir el rango de tiempo para los últimos 24 horas
            $twentyFourHoursAgo = date('Y-m-d H:i:s', strtotime('-24 hours'));

?>
<!DOCTYPE html>
<html lang="en">

<head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Administrador| Órdenes pendientes</title>
            <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
            <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
            <link type="text/css" href="css/theme.css" rel="stylesheet">
            <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
            <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
                        rel='stylesheet'>
            <script language="javascript" type="text/javascript">
            var popUpWin = 0;

            function popUpWindow(URLStr, left, top, width, height) {
                        if (popUpWin) {
                                    if (!popUpWin.closed) popUpWin.close();
                        }
                        popUpWin = open(URLStr, 'popUpWin',
                                    'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width=' +
                                    600 + ',height=' + 600 + ',left=' + left + ', top=' + top +
                                    ',screenX=' + left + ',screenY=' + top + '');
            }
            </script>
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
                                                                                                <h3>Pedidos de hoy
                                                                                                </h3>
                                                                                    </div>
                                                                                    <div class="module-body table">
                                                                                                <?php if (isset($_GET['del'])) { ?>
                                                                                                <div
                                                                                                            class="alert alert-error">
                                                                                                            <button type="button"
                                                                                                                        class="close"
                                                                                                                        data-dismiss="alert">×</button>
                                                                                                            <strong>Oh
                                                                                                                        snap!</strong>
                                                                                                            <?php echo htmlentities($_SESSION['delmsg']); ?><?php echo htmlentities($_SESSION['delmsg'] = ""); ?>
                                                                                                </div>
                                                                                                <?php } ?>
                                                                                                <br />
                                                                                                <table cellpadding="0"
                                                                                                            cellspacing="0"
                                                                                                            border="0"
                                                                                                            class="datatable-1 table table-bordered table-striped display table-responsive">
                                                                                                            <thead>
                                                                                                                        <tr>
                                                                                                                                    <th>#
                                                                                                                                    </th>
                                                                                                                                    <th>Nombre
                                                                                                                                    </th>
                                                                                                                                    <th
                                                                                                                                                width="50">
                                                                                                                                                Correo
                                                                                                                                                electrónico
                                                                                                                                                /
                                                                                                                                                Contacto
                                                                                                                                                no
                                                                                                                                    </th>
                                                                                                                                    <th>Dirección
                                                                                                                                                de
                                                                                                                                                envío
                                                                                                                                    </th>
                                                                                                                                    <th>Producto
                                                                                                                                    </th>
                                                                                                                                    <th>cantidad
                                                                                                                                    </th>
                                                                                                                                    <th>precio
                                                                                                                                    </th>
                                                                                                                                    <th>Fecha de pedido
                                                                                                                                    </th>
                                                                                                                                    <th>Acción
                                                                                                                                    </th>
                                                                                                                        </tr>
                                                                                                            </thead>
                                                                                                            <tbody>
                                                                                                                        <?php
                                                                                                                                    $query = mysqli_query($con, "SELECT users.name as username,users.email as useremail,users.contactno as usercontact,users.shippingAddress as shippingaddress,users.shippingCity as shippingcity,users.shippingState as shippingstate,users.shippingPincode as shippingpincode,products.productName as productname,products.shippingCharge as shippingcharge,orders.quantity as quantity,orders.orderDate as orderdate,products.productPrice as productprice,orders.id as id  
                                        FROM orders 
                                        JOIN users ON  orders.userId=users.id 
                                        JOIN products ON products.id=orders.productId 
                                        WHERE orders.orderDate BETWEEN '$twentyFourHoursAgo' AND '$currentTime'");
                                                                                                                                    $cnt = 1;
                                                                                                                                    while ($row = mysqli_fetch_array($query)) {
                                                                                                                                    ?>
                                                                                                                        <tr>
                                                                                                                                    <td><?php echo htmlentities($cnt); ?>
                                                                                                                                    </td>
                                                                                                                                    <td><?php echo htmlentities($row['username']); ?>
                                                                                                                                    </td>
                                                                                                                                    <td><?php echo htmlentities($row['useremail']); ?>/<?php echo htmlentities($row['usercontact']); ?>
                                                                                                                                    </td>
                                                                                                                                    <td><?php echo htmlentities($row['shippingaddress'] . "," . $row['shippingcity'] . "," . $row['shippingstate'] . "-" . $row['shippingpincode']); ?>
                                                                                                                                    </td>
                                                                                                                                    <td><?php echo htmlentities($row['productname']); ?>
                                                                                                                                    </td>
                                                                                                                                    <td><?php echo htmlentities($row['quantity']); ?>
                                                                                                                                    </td>
                                                                                                                                    <td><?php echo number_format(htmlentities($row['quantity'] * $row['productprice'] + $row['shippingcharge']), 0, ',', '.'); ?>
                                                                                                                                    </td>

                                                                                                                                    <td><?php echo htmlentities($row['orderdate']); ?>
                                                                                                                                    </td>
                                                                                                                                    <td>
                                                                                                                                                <a href="updateorder.php?oid=<?php echo htmlentities($row['id']); ?>"
                                                                                                                                                            title="Update order"
                                                                                                                                                            target="_blank">
                                                                                                                                                            <i
                                                                                                                                                                        class="icon-edit"></i>
                                                                                                                                                </a>
                                                                                                                                    </td>
                                                                                                                        </tr>
                                                                                                                        <?php $cnt = $cnt + 1;
                                                                                                                                    } ?>
                                                                                                            </tbody>
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

</html>
<?php
}
?>