<?php
session_start();
include('include/config.php');
if (strlen($_SESSION['alogin']) == 0) {
            header('location:index.php');
} else {

            if (isset($_POST['submit'])) {
                        $category = $_POST['category'];
                        $subcat = $_POST['subcategory'];
                        $productname = $_POST['productName'];
                        $productcompany = $_POST['productCompany'];
                        $productprice = $_POST['productprice'];
                        $productpricebd = $_POST['productpricebd'];
                        $productdescription = $_POST['productDescription'];
                        $productscharge = $_POST['productShippingcharge'];
                        $productavailability = $_POST['productAvailability'];
                        $productimage1 = $_FILES["productimage1"]["name"];
                        $productimage2 = $_FILES["productimage2"]["name"];
                        $productimage3 = $_FILES["productimage3"]["name"];
                        //for getting product id
                        $query = mysqli_query($con, "select max(id) as pid from products");
                        $result = mysqli_fetch_array($query);
                        $productid = $result['pid'] + 1;
                        $dir = "productimages/$productid";
                        if (!is_dir($dir)) {
                                    mkdir("productimages/" . $productid);
                        }

                        move_uploaded_file($_FILES["productimage1"]["tmp_name"], "productimages/$productid/" . $_FILES["productimage1"]["name"]);
                        move_uploaded_file($_FILES["productimage2"]["tmp_name"], "productimages/$productid/" . $_FILES["productimage2"]["name"]);
                        move_uploaded_file($_FILES["productimage3"]["tmp_name"], "productimages/$productid/" . $_FILES["productimage3"]["name"]);
                        $sql = mysqli_query($con, "insert into products(category,subCategory,productName,productCompany,productPrice,productDescription,shippingCharge,productAvailability,productImage1,productImage2,productImage3,productPriceBeforeDiscount) values('$category','$subcat','$productname','$productcompany','$productprice','$productdescription','$productscharge','$productavailability','$productimage1','$productimage2','$productimage3','$productpricebd')");
                        $_SESSION['msg'] = "Product Inserted Successfully !!";
            }


?>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>Administrador| Insertar producto</title>
                        <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
                        <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
                        <link type="text/css" href="css/theme.css" rel="stylesheet">
                        <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
                        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
                        <script src="http://js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
                        <script type="text/javascript">
                                    bkLib.onDomLoaded(nicEditors.allTextAreas);
                        </script>

                        <script>
                                    function getSubcat(val) {
                                                $.ajax({
                                                            type: "POST",
                                                            url: "get_subcat.php",
                                                            data: 'cat_id=' + val,
                                                            success: function(data) {
                                                                        $("#subcategory").html(data);
                                                            }
                                                });
                                    }

                                    function selectCountry(val) {
                                                $("#search-box").val(val);
                                                $("#suggesstion-box").hide();
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
                                                                                                            <h3>Insertar producto
                                                                                                            </h3>
                                                                                                </div>
                                                                                                <div class="module-body">

                                                                                                            <?php if (isset($_POST['submit'])) { ?>
                                                                                                                        <div class="alert alert-success">
                                                                                                                                    <button type="button" class="close" data-dismiss="alert">×</button>
                                                                                                                                    <strong>¡Bien
                                                                                                                                                hecho!</strong>
                                                                                                                                    <?php echo htmlentities($_SESSION['msg']); ?><?php echo htmlentities($_SESSION['msg'] = ""); ?>
                                                                                                                        </div>
                                                                                                            <?php } ?>


                                                                                                            <?php if (isset($_GET['del'])) { ?>
                                                                                                                        <div class="alert alert-error">
                                                                                                                                    <button type="button" class="close" data-dismiss="alert">×</button>
                                                                                                                                    <strong>¡Oh,
                                                                                                                                                chasquido!</strong>
                                                                                                                                    <?php echo htmlentities($_SESSION['delmsg']); ?><?php echo htmlentities($_SESSION['delmsg'] = ""); ?>
                                                                                                                        </div>
                                                                                                            <?php } ?>

                                                                                                            <br />

                                                                                                            <form class="form-horizontal row-fluid" name="insertproduct" method="post" enctype="multipart/form-data">

                                                                                                                        <div class="control-group">
                                                                                                                                    <label class="control-label" for="basicinput">Categoria</label>
                                                                                                                                    <div class="controls">
                                                                                                                                                <select name="category" class="span8 tip" onChange="getSubcat(this.value);" required>
                                                                                                                                                            <option value="">
                                                                                                                                                                        Seleccionar
                                                                                                                                                                        Categoria
                                                                                                                                                            </option>
                                                                                                                                                            <?php $query = mysqli_query($con, "select * from category");
                                                                                                                                                            while ($row = mysqli_fetch_array($query)) { ?>

                                                                                                                                                                        <option value="<?php echo $row['id']; ?>">
                                                                                                                                                                                    <?php echo $row['categoryName']; ?>
                                                                                                                                                                        </option>
                                                                                                                                                            <?php } ?>
                                                                                                                                                </select>
                                                                                                                                    </div>
                                                                                                                        </div>


                                                                                                                        <div class="control-group">
                                                                                                                                    <label class="control-label" for="basicinput">Sub
                                                                                                                                                Categoria</label>
                                                                                                                                    <div class="controls">
                                                                                                                                                <select name="subcategory" id="subcategory" class="span8 tip" required>
                                                                                                                                                </select>
                                                                                                                                    </div>
                                                                                                                        </div>


                                                                                                                        <div class="control-group">
                                                                                                                                    <label class="control-label" for="basicinput">nombre
                                                                                                                                                del
                                                                                                                                                producto</label>
                                                                                                                                    <div class="controls">
                                                                                                                                                <input type="text" name="productName" placeholder="Introduzca el nombre del producto" class="span8 tip" required>
                                                                                                                                    </div>
                                                                                                                        </div>

                                                                                                                        <div class="control-group">
                                                                                                                                    <label class="control-label" for="basicinput">Empresa
                                                                                                                                                del
                                                                                                                                                producto</label>
                                                                                                                                    <div class="controls">
                                                                                                                                                <input type="text" name="productCompany" placeholder="Introduzca el nombre de la empresa del producto" class="span8 tip" required>
                                                                                                                                    </div>
                                                                                                                        </div>
                                                                                                                        <div class="control-group">
                                                                                                                                    <label class="control-label" for="basicinput">Precio
                                                                                                                                                del
                                                                                                                                                producto
                                                                                                                                                antes
                                                                                                                                                del
                                                                                                                                                descuento</label>
                                                                                                                                    <div class="controls">
                                                                                                                                                <input type="text" name="productpricebd" placeholder="Introduzca el precio del producto" class="span8 tip" required>
                                                                                                                                    </div>
                                                                                                                        </div>

                                                                                                                        <div class="control-group">
                                                                                                                                    <label class="control-label" for="basicinput">Precio
                                                                                                                                                del
                                                                                                                                                producto
                                                                                                                                                después
                                                                                                                                                del
                                                                                                                                                descuento
                                                                                                                                                (precio
                                                                                                                                                de
                                                                                                                                                venta)</label>
                                                                                                                                    <div class="controls">
                                                                                                                                                <input type="text" name="productprice" placeholder="Introduzca el precio del producto" class="span8 tip" required>
                                                                                                                                    </div>
                                                                                                                        </div>

                                                                                                                        <div class="control-group">
                                                                                                                                    <label class="control-label" for="basicinput">Descripción
                                                                                                                                                del
                                                                                                                                                producto</label>
                                                                                                                                    <div class="controls">
                                                                                                                                                <textarea name="productDescription" placeholder="Introduzca la descripción del producto" rows="6" class="span8 tip">
</textarea>
                                                                                                                                    </div>
                                                                                                                        </div>

                                                                                                                        <div class="control-group">
                                                                                                                                    <label class="control-label" for="basicinput">Gastos
                                                                                                                                                de
                                                                                                                                                envío
                                                                                                                                                del
                                                                                                                                                producto</label>
                                                                                                                                    <div class="controls">
                                                                                                                                                <input type="text" name="productShippingcharge" placeholder="Ingrese el gasto de envío del producto" class="span8 tip" required>
                                                                                                                                    </div>
                                                                                                                        </div>

                                                                                                                        <div class="control-group">
                                                                                                                                    <label class="control-label" for="basicinput">Disponibilidad
                                                                                                                                                del
                                                                                                                                                producto</label>
                                                                                                                                    <div class="controls">
                                                                                                                                                <select name="productAvailability" id="productAvailability" class="span8 tip" required>
                                                                                                                                                            <option value="">
                                                                                                                                                                        Escoger
                                                                                                                                                            </option>
                                                                                                                                                            <option value="In Stock">
                                                                                                                                                                        disponible
                                                                                                                                                            </option>
                                                                                                                                                            <option value="Out of Stock">
                                                                                                                                                                        Agotado
                                                                                                                                                            </option>
                                                                                                                                                </select>
                                                                                                                                    </div>
                                                                                                                        </div>



                                                                                                                        <div class="control-group">
                                                                                                                                    <label class="control-label" for="basicinput">Producto
                                                                                                                                                Image1</label>
                                                                                                                                    <div class="controls">
                                                                                                                                                <input type="file" name="productimage1" id="productimage1" value="" class="span8 tip" required>
                                                                                                                                    </div>
                                                                                                                        </div>


                                                                                                                        <div class="control-group">
                                                                                                                                    <label class="control-label" for="basicinput">Producto
                                                                                                                                                Image2</label>
                                                                                                                                    <div class="controls">
                                                                                                                                                <input type="file" name="productimage2" class="span8 tip" required>
                                                                                                                                    </div>
                                                                                                                        </div>



                                                                                                                        <div class="control-group">
                                                                                                                                    <label class="control-label" for="basicinput">Producto
                                                                                                                                                Image3</label>
                                                                                                                                    <div class="controls">
                                                                                                                                                <input type="file" name="productimage3" class="span8 tip">
                                                                                                                                    </div>
                                                                                                                        </div>

                                                                                                                        <div class="control-group">
                                                                                                                                    <div class="controls">
                                                                                                                                                <button type="submit" name="submit" class="btn">Insertar</button>
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