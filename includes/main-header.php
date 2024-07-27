<?php
if (isset($_GET['action'])) {
            if (!empty($_SESSION['cart'])) {
                        foreach ($_POST['quantity'] as $key => $val) {
                                    if ($val == 0) {
                                                unset($_SESSION['cart'][$key]);
                                    } else {
                                                $_SESSION['cart'][$key]['quantity'] = $val;
                                    }
                        }
            }
}
?>
<div class="main-header">
            <div class="container">
                        <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-3 logo-holder">
                                                <div class="logo" style="margin-top: -100px;">
                                                            <a href="index.php">
                                                                        <img src="logo.png" alt="Logo"
                                                                                    style="width: 140px; height: auto; margin-top: 50px;">
                                                            </a>
                                                </div>
                                                <mark
                                                            style="padding: .44em; background-color: #ffd708; border-radius: 5px; box-shadow: -7px 6px 6px rgb(209 1 1 / 53%); transform: translateY(-1px); margin-top: -20px; font-size: 1.3em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">Portal
                                                            de compras</mark>




                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-6 top-search-holder"
                                                style="margin-top: 17px;">
                                                <div class="search-area">
                                                            <form name="search" method="post"
                                                                        action="search-result.php">
                                                                        <div class="control-group">
                                                                                    <input class="search-field"
                                                                                                style="padding: 8px; border: 1px solid #ccc; border-radius: 4px; font-size: 14px; width: calc(100% - 40px);"
                                                                                                placeholder="busca aqui..."
                                                                                                name="product"
                                                                                                required="required" />
                                                                                    <button class="search-button"
                                                                                                style="position: relative; left: -5px; margin-left: -20px; width: 35px; height: 0px; background-color: transparent; border: 0px solid #ccc; border-radius: 0 4px 4px 0; cursor: pointer; padding: 6px 10px;"
                                                                                                type="submit"
                                                                                                name="search"></button>
                                                                        </div>
                                                            </form>
                                                </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-12 col-md-3 animate-dropdown top-cart-row">
                                                <?php
                                                if (!empty($_SESSION['cart'])) {
                                                ?>
                                                <div class="dropdown dropdown-cart">
                                                            <a href="#" class="dropdown-toggle lnk-cart"
                                                                        data-toggle="dropdown">
                                                                        <div class="items-cart-inner">
                                                                                    <div class="total-price-basket">
                                                                                                <span class="lbl">cart
                                                                                                            -</span>
                                                                                                <span
                                                                                                            class="total-price">
                                                                                                            <span
                                                                                                                        class="sign">COP
                                                                                                            </span>
                                                                                                            <span
                                                                                                                        class="value"><?php echo number_format($_SESSION['tp'], 0, '', '.'); ?></span>

                                                                                    </div>
                                                                                    <div class="basket">
                                                                                                <i
                                                                                                            class="glyphicon glyphicon-shopping-cart"></i>
                                                                                    </div>
                                                                                    <div class="basket-item-count"><span
                                                                                                            class="count"><?php echo $_SESSION['qnty']; ?></span>
                                                                                    </div>
                                                                        </div>
                                                            </a>

                                                            <ul class="dropdown-menu">
                                                                        <?php
                                                                                    $sql = "SELECT * FROM products WHERE id IN(";
                                                                                    foreach ($_SESSION['cart'] as $id => $value) {
                                                                                                $sql .= $id . ",";
                                                                                    }
                                                                                    $sql = substr($sql, 0, -1) . ") ORDER BY id ASC";
                                                                                    $query = mysqli_query($con, $sql);
                                                                                    $totalprice = 0;
                                                                                    $totalqunty = 0;
                                                                                    if (!empty($query)) {
                                                                                                while ($row = mysqli_fetch_array($query)) {
                                                                                                            $quantity = $_SESSION['cart'][$row['id']]['quantity'];
                                                                                                            $subtotal = $_SESSION['cart'][$row['id']]['quantity'] * $row['productPrice'] + $row['shippingCharge'];
                                                                                                            $totalprice += $subtotal;
                                                                                                            $_SESSION['qnty'] = $totalqunty += $quantity;
                                                                                    ?>
                                                                        <li>
                                                                                    <div
                                                                                                class="cart-item product-summary">
                                                                                                <div class="row">
                                                                                                            <div
                                                                                                                        class="col-xs-4">
                                                                                                                        <div
                                                                                                                                    class="image">
                                                                                                                                    <a
                                                                                                                                                href="product-details.php?pid=<?php echo $row['id']; ?>"><img
                                                                                                                                                            src="admin/productimages/<?php echo $row['id']; ?>/<?php echo $row['productImage1']; ?>"
                                                                                                                                                            width="35"
                                                                                                                                                            height="50"
                                                                                                                                                            alt=""></a>
                                                                                                                        </div>
                                                                                                            </div>
                                                                                                            <div
                                                                                                                        class="col-xs-7">
                                                                                                                        <h3
                                                                                                                                    class="name">
                                                                                                                                    <a
                                                                                                                                                href="product-details.php?pid=<?php echo $row['id']; ?>"><?php echo $row['productName']; ?></a>
                                                                                                                        </h3>
                                                                                                                        <div
                                                                                                                                    class="price">
                                                                                                                                    COP
                                                                                                                                    <?php echo number_format(($row['productPrice'] + $row['shippingCharge']) * $_SESSION['cart'][$row['id']]['quantity'], 0, '', '.'); ?>

                                                                                                                        </div>
                                                                                                            </div>
                                                                                                </div>
                                                                                    </div>
                                                                        </li>
                                                                        <?php }
                                                                                    } ?>
                                                                        <div class="clearfix"></div>
                                                                        <hr>
                                                                        <div class="clearfix cart-total">
                                                                                    <div class="pull-right">
                                                                                                <span class="text">Total
                                                                                                            :</span><span
                                                                                                            class='price'>COP
                                                                                                            <?php echo number_format($_SESSION['tp'] = $totalprice, 0, '', '.'); ?></span>

                                                                                    </div>
                                                                                    <div class="clearfix"></div>
                                                                                    <a href="my-cart.php"
                                                                                                class="btn btn-upper btn-primary btn-block m-t-20">Mi
                                                                                                carrito</a>
                                                                        </div>
                                                            </ul>
                                                </div>
                                                <?php } else { ?>
                                                <div class="dropdown dropdown-cart">
                                                            <a href="#" class="dropdown-toggle lnk-cart"
                                                                        data-toggle="dropdown">
                                                                        <div class="items-cart-inner">
                                                                                    <div class="total-price-basket">
                                                                                                <span class="lbl">cart
                                                                                                            -</span>
                                                                                                <span
                                                                                                            class="total-price">
                                                                                                            <span
                                                                                                                        class="sign">COP.</span>
                                                                                                            <span
                                                                                                                        class="value"><?php echo number_format($tu_valor, 0, '', '.'); ?></span>
                                                                                                </span>

                                                                                    </div>
                                                                                    <div class="basket">
                                                                                                <i
                                                                                                            class="glyphicon glyphicon-shopping-cart"></i>
                                                                                    </div>
                                                                                    <div class="basket-item-count"><span
                                                                                                            class="count">0</span>
                                                                                    </div>
                                                                        </div>
                                                            </a>

                                                            <ul class="dropdown-menu">
                                                                        <li>
                                                                                    <div
                                                                                                class="cart-item product-summary">
                                                                                                <div class="row">
                                                                                                            <div
                                                                                                                        class="col-xs-12">
                                                                                                                        Su
                                                                                                                        carrito
                                                                                                                        de
                                                                                                                        compras
                                                                                                                        está
                                                                                                                        vacío.

                                                                                                            </div>
                                                                                                </div>
                                                                                    </div>
                                                                                    <hr>
                                                                                    <div class="clearfix cart-total">
                                                                                                <div class="clearfix">
                                                                                                </div>
                                                                                                <a href="index.php"
                                                                                                            class="btn btn-upper btn-primary btn-block m-t-20">continue
                                                                                                            en
                                                                                                            tornibike</a>
                                                                                    </div>
                                                                        </li>
                                                            </ul>
                                                </div>
                                                <?php } ?>

                                    </div>
                        </div>
            </div>
</div>