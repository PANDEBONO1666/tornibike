<?php
session_start();

include_once 'include/config.php';
if (strlen($_SESSION['alogin']) == 0) {
  header('location:index.php');
} else {
  $oid = intval($_GET['oid']);
  if (isset($_POST['submit2'])) {
    $status = $_POST['status'];
    $remark = $_POST['remark'];

    $query = mysqli_query($con, "insert into ordertrackhistory(orderId,status,remark) values('$oid','$status','$remark')");
    $sql = mysqli_query($con, "update orders set orderStatus='$status' where id='$oid'");
    echo "<script>alert('Order updated successfully...');</script>";
  }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Orden de actualización</title>
            <link href="style.css" rel="stylesheet" type="text/css">
            <link href="anuj.css" rel="stylesheet" type="text/css">
            <style>
            body {
                        font-family: Arial, sans-serif;
                        margin: 0;
                        padding: 0;
                        background-color: #f8f9fa;
                        color: #212529;
            }

            .container {
                        max-width: 800px;
                        margin: 20px auto;
                        padding: 20px;
                        background-color: #fff;
                        border-radius: 5px;
                        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .header {
                        text-align: center;
                        margin-bottom: 20px;
            }

            .header h1 {
                        color: #007bff;
            }

            table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 20px;
            }

            table th,
            table td {
                        padding: 10px;
                        border-bottom: 1px solid #dee2e6;
            }

            table th {
                        text-align: left;
                        background-color: #f2f2f2;
                        color: #212529;
            }

            .fontkink1 {
                        font-weight: bold;
            }

            .fontkink {
                        font-size: 16px;
            }

            textarea {
                        width: 100%;
                        padding: 10px;
                        border: 1px solid #ced4da;
                        border-radius: 4px;
                        resize: vertical;
            }

            select {
                        width: 100%;
                        padding: 10px;
                        border: 1px solid #ced4da;
                        border-radius: 4px;
                        background-color: #fff;
                        appearance: none;
                        -webkit-appearance: none;
                        -moz-appearance: none;
                        cursor: pointer;
            }

            input[type="submit"] {
                        padding: 10px 20px;
                        background-color: #007bff;
                        border: none;
                        border-radius: 4px;
                        color: #fff;
                        font-size: 16px;
                        cursor: pointer;
            }

            input[type="submit"]:hover {
                        background-color: #0056b3;
            }

            .close-btn {
                        background-color: #dc3545;
            }
            </style>
</head>

<body>

            <div class="container">
                        <div class="header">
                                    <h1>Orden de actualización</h1>
                        </div>

                        <form name="updateticket" id="updateticket" method="post">
                                    <table>
                                                <tr>
                                                            <th>Solicitar ID:</th>
                                                            <td><?php echo $oid; ?></td>
                                                </tr>
                                                <?php
        $ret = mysqli_query($con, "SELECT * FROM ordertrackhistory WHERE orderId='$oid'");
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
                                                <tr>
                                                            <td colspan="2">
                                                                        <hr />
                                                            </td>
                                                </tr>
                                                <?php } ?>
                                                <?php
        $st = 'Delivered';
        $rt = mysqli_query($con, "SELECT * FROM orders WHERE id='$oid'");
        while ($num = mysqli_fetch_array($rt)) {
          $currrentSt = $num['orderStatus'];
        }
        if ($st != $currrentSt) {
        ?>
                                                <tr>
                                                            <td class="fontkink1">Estado:</td>
                                                            <td class="fontkink">
                                                                        <select name="status" class="fontkink" required>
                                                                                    <option value="">Seleccionar estado
                                                                                    </option>
                                                                                    <option value="In Process">En
                                                                                                proceso</option>
                                                                                    <option value="Delivered">Entregada
                                                                                    </option>
                                                                        </select>
                                                            </td>
                                                </tr>
                                                <tr>
                                                            <td class="fontkink1">Comentario:</td>
                                                            <td class="fontkink">
                                                                        <textarea cols="50" rows="7" name="remark"
                                                                                    required></textarea>
                                                            </td>
                                                </tr>
                                                <tr>
                                                            <td></td>
                                                            <td>
                                                                        <input type="submit" name="submit2"
                                                                                    value="Actualizar" size="40">
                                                                        <input type="submit" class="close-btn"
                                                                                    value="Cerrar esta ventana"
                                                                                    onClick="return f2();">
                                                            </td>
                                                </tr>
                                                <?php } ?>
                                    </table>
                        </form>
            </div>

            <script language="javascript" type="text/javascript">
            function f2() {
                        window.close();
            }
            </script>

</body>

</html>