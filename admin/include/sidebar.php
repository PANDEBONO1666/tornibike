<div class="span3">
            <div class="sidebar">
                        <ul class="widget widget-menu unstyled">
                                    <li>
                                                <a class="collapsed" data-toggle="collapse" href="#togglePages">
                                                            <i class="menu-icon icon-cog"></i>
                                                            <i class="icon-chevron-down pull-right"></i>
                                                            <i class="icon-chevron-up pull-right"></i>
                                                            Gestión de pedidos
                                                </a>
                                                <ul id="togglePages" class="collapse unstyled">
                                                            <li>
                                                                        <a href="todays-orders.php">
                                                                                    <i class="icon-tasks"></i>
                                                                                    Pedidos de hoy
                                                                                    <?php
                                                                                    $result = mysqli_query($con, "SELECT COUNT(*) AS num_orders FROM Orders WHERE DATE(orderDate) = CURDATE()");
                                                                                    $row = mysqli_fetch_assoc($result);
                                                                                    $num_rows1 = $row['num_orders'];
                                                                                    ?>


                                                                                    <b
                                                                                                class="label orangel pull-right"><?php echo htmlentities($num_rows1); ?></b>
                                                                        </a>
                                                            </li>
                                                            <li>
                                                                        <a href="pending-orders.php">
                                                                                    <i class="icon-tasks"></i>
                                                                                    Órdenes pendientes
                                                                                    <?php
                                                                                    $status = 'Delivered';
                                                                                    $ret = mysqli_query($con, "SELECT * FROM Orders where orderStatus != '$status' OR orderStatus IS NULL");
                                                                                    $num = mysqli_num_rows($ret);
                                                                                    ?>
                                                                                    <b
                                                                                                class="label orange pull-right"><?php echo htmlentities($num); ?></b>
                                                                        </a>
                                                            </li>
                                                            <li>
                                                                        <a href="delivered-orders.php">
                                                                                    <i class="icon-inbox"></i>
                                                                                    Pedidos entregados
                                                                                    <?php
                                                                                    $status = 'Delivered';
                                                                                    $rt = mysqli_query($con, "SELECT * FROM Orders where orderStatus = '$status'");
                                                                                    $num1 = mysqli_num_rows($rt);
                                                                                    ?>
                                                                                    <b
                                                                                                class="label green pull-right"><?php echo htmlentities($num1); ?></b>
                                                                        </a>
                                                            </li>
                                                </ul>
                                    </li>
                                    <li>
                                                <a href="manage-users.php">
                                                            <i class="menu-icon icon-group"></i>
                                                            Administrar usuarios
                                                </a>
                                    </li>
                        </ul>

                        <ul class="widget widget-menu unstyled">
                                    <li><a href="category.php"><i class="menu-icon icon-tasks"></i> Crear categoría </a>
                                    </li>
                                    <li><a href="subcategory.php"><i class="menu-icon icon-tasks"></i>Sub Categoría </a>
                                    </li>
                                    <li><a href="insert-product.php"><i class="menu-icon icon-paste"></i>Insertar
                                                            producto</a></li>
                                    <li><a href="manage-products.php"><i class="menu-icon icon-table"></i>Administrar
                                                            productos </a></li>
                        </ul>

                        <ul class="widget widget-menu unstyled">
                                    <li><a href="user-logs.php"><i class="menu-icon icon-tasks"></i>Registro de inicio
                                                            de sesión de usuario</a>
                                    </li>
                                    <li>
                                                <a href="logout.php">
                                                            <i class="menu-icon icon-signout"></i>
                                                            Cerrar sesión
                                                </a>
                                    </li>
                        </ul>
            </div>
            <!--/.sidebar-->
</div>
<!--/.span3-->