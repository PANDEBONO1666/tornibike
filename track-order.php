<?php
session_start();
include_once 'includes/config.php';
$oid = intval($_GET['oid']);
?>

<!DOCTYPE html>
<html lang="en">

<head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Detalles de seguimiento del pedido</title>
            <style>
            body {
                        font-family: Arial, sans-serif;
                        margin: 0;
                        padding: 0;
                        background-color: #f0f0f0;
                        color: #333;
            }

            .container {
                        max-width: 800px;
                        margin: 0 auto;
                        padding: 20px;
                        background-color: #fff;
                        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                        border-radius: 5px;
            }

            .header {
                        text-align: center;
                        margin-bottom: 20px;
            }

            .header h1 {
                        color: #333;
            }

            table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 20px;
            }

            table th,
            table td {
                        padding: 10px;
                        border-bottom: 1px solid #ddd;
            }

            table th {
                        text-align: left;
                        background-color: #f2f2f2;
            }

            .success {
                        color: green;
            }

            .error {
                        color: red;
            }
            </style>
</head>

<body>

            <div class="container">
                        <div class="header">
                                    <h1>Detalles de seguimiento del pedido</h1>
                        </div>

                        <table>
                                    <tr>
                                                <th>Id. de pedido:</th>
                                                <td><?php echo $oid; ?></td>
                                    </tr>
                                    <?php
      $ret = mysqli_query($con, "SELECT * FROM ordertrackhistory WHERE orderId='$oid'");
      $num = mysqli_num_rows($ret);
      if ($num > 0) {
        while ($row = mysqli_fetch_array($ret)) {
      ?>
                                    <tr>
                                                <th>A la fecha:</th>
                                                <td><?php echo $row['postingDate']; ?></td>
                                    </tr>
                                    <tr>
                                                <th>Estado:</th>
                                                <td><?php echo $row['status']; ?></td>
                                    </tr>
                                    <tr>
                                                <th>Comentario:</th>
                                                <td><?php echo $row['remark']; ?></td>
                                    </tr>
                                    <?php
        }
      } else {
        ?>
                                    <tr>
                                                <td colspan="2" class="error">Pedido aún no procesado</td>
                                    </tr>
                                    <?php
      }

      $st = 'Delivered';
      $rt = mysqli_query($con, "SELECT * FROM orders WHERE id='$oid'");
      while ($num = mysqli_fetch_array($rt)) {
        $currrentSt = $num['orderStatus'];
      }
      if ($st == $currrentSt) {
      ?>
                                    <tr>
                                                <td colspan="2" class="success">Producto entregado con éxito</td>
                                    </tr>
                                    <?php
      }
      ?>
                        </table>
            </div>

</body>

</html>