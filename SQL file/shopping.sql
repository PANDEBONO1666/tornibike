-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2024 a las 07:41:38
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `shopping`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '81dc9bdb52d04dc20036dbd8313ed055', '2017-01-24 16:21:18', '10-06-2024 09:02:17 AM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(6, 'Ropa', 'Fashion', '2017-02-20 19:18:52', '25-04-2024 05:20:42 AM'),
(7, 'piezas ', 'andar', '2024-04-24 10:04:27', '24-04-2024 05:13:52 PM'),
(8, 'bicicletas', 'bici', '2024-04-24 18:01:15', NULL),
(9, 'herramientas', 'kit', '2024-04-25 04:46:39', '25-04-2024 10:19:52 AM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(15, 5, '25', 1, '2024-05-02 02:30:51', 'Debit / Credit card', 'Delivered'),
(16, 5, '30', 1, '2024-05-02 02:30:51', 'Debit / Credit card', 'Delivered'),
(17, 5, '27', 1, '2024-05-05 02:38:46', 'COD', NULL),
(18, 6, '24', 1, '2024-05-05 05:30:19', 'Internet Banking', 'Delivered'),
(19, 5, '24', 1, '2024-05-09 03:59:47', 'Debit / Credit card', 'Delivered'),
(20, 6, '26', 1, '2024-05-11 03:51:07', 'COD', 'Delivered'),
(21, 6, '24', 1, '2024-05-11 22:16:02', 'COD', 'In Process'),
(22, 6, '24', 1, '2024-05-11 22:16:06', 'COD', NULL),
(23, 6, '25', 1, '2024-05-11 22:54:02', 'Debit / Credit card', NULL),
(24, 6, '25', 1, '2024-05-11 23:01:12', 'COD', NULL),
(25, 6, '34', 1, '2024-05-11 23:05:52', 'COD', NULL),
(26, 5, '27', 1, '2024-05-12 00:02:54', 'COD', NULL),
(27, 6, '25', 1, '2024-05-21 19:10:38', 'COD', NULL),
(28, 6, '24', 1, '2024-05-22 03:15:40', 'COD', NULL),
(29, 6, '24', 5, '2024-05-31 03:39:21', 'COD', NULL),
(30, 6, '25', 1, '2024-06-02 21:38:06', 'COD', NULL),
(31, 6, '26', 1, '2024-06-02 21:38:06', 'COD', NULL),
(32, 5, '24', 1, '2024-06-03 03:34:28', 'Debit / Credit card', 'Delivered'),
(33, 5, '34', 6, '2024-06-03 03:35:05', 'COD', 'Delivered'),
(34, 5, '36', 7, '2024-06-03 22:13:55', 'Debit / Credit card', 'Delivered'),
(35, 5, '37', 4, '2024-06-03 22:49:03', NULL, 'Delivered'),
(36, 6, '23', 1, '2024-06-05 00:06:35', 'Debit / Credit card', NULL),
(37, 6, '23', 1, '2024-06-05 00:19:07', 'Debit / Credit card', NULL),
(38, 6, '24', 1, '2024-06-05 01:04:10', 'COD', NULL),
(39, 6, '25', 1, '2024-06-05 02:57:29', 'COD', NULL),
(40, 6, '29', 5, '2024-06-10 02:13:39', 'COD', NULL),
(41, 6, '26', 4, '2024-06-10 04:24:20', 'Debit / Credit card', NULL),
(42, 6, '26', 6, '2024-06-10 04:28:22', 'Debit / Credit card', NULL),
(43, 6, '23', 3, '2024-06-10 05:44:05', 'Debit / Credit card', NULL),
(44, 6, '30', 3, '2024-06-10 05:44:05', 'Debit / Credit card', NULL),
(45, 6, '37', 1, '2024-06-10 05:50:43', 'Debit / Credit card', NULL),
(46, 6, '34', 1, '2024-06-10 05:53:33', 'COD', NULL),
(47, 6, '34', 1, '2024-06-10 05:53:54', 'COD', NULL),
(48, 6, '34', 1, '2024-06-10 05:54:51', 'COD', NULL),
(49, 9, '29', 3, '2024-06-27 04:14:45', 'Debit / Credit card', NULL),
(50, 9, '29', 3, '2024-06-27 04:15:37', 'Debit / Credit card', NULL),
(51, 9, '24', 4, '2024-06-27 04:16:14', 'Debit / Credit card', 'Delivered'),
(52, 7, '24', 4, '2024-06-27 05:20:57', 'Internet Banking', NULL),
(53, 7, '27', 1, '2024-06-27 05:20:57', 'Internet Banking', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(9, 15, 'Delivered', 'ya', '2024-05-02 02:31:21'),
(10, 19, 'Delivered', 'ya', '2024-05-09 04:01:13'),
(11, 18, 'Delivered', 'listo', '2024-05-09 04:27:43'),
(12, 16, 'In Process', 'fhgfhfh', '2024-05-11 03:56:08'),
(13, 16, 'Delivered', 'hkjk', '2024-05-11 03:57:05'),
(14, 20, 'In Process', 'njkmb', '2024-05-11 03:57:41'),
(15, 20, 'Delivered', 'nklnl', '2024-05-11 03:58:06'),
(16, 20, 'Delivered', 'nklnl', '2024-05-11 04:00:49'),
(17, 21, 'In Process', 'gdfdg', '2024-05-11 22:18:55'),
(18, 34, 'Delivered', 'ya', '2024-06-03 22:21:18'),
(19, 32, 'Delivered', 'se ha entregado', '2024-06-10 20:27:20'),
(20, 33, 'Delivered', 'se ha entregado', '2024-06-10 20:28:19'),
(21, 35, 'Delivered', 'se ha entregado', '2024-06-10 20:28:58'),
(22, 51, 'Delivered', 'AMOR DE MI VIDA YA TE MANDE ESA MONDA', '2024-06-27 04:18:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(5, 23, 4, 4, 4, 'ana ', 'buena ', 'las tallas ', '2024-05-02 02:32:38'),
(6, 25, 2, 1, 1, 'DVUS', 'malo', 'dsa', '2024-06-27 05:19:30'),
(7, 25, 2, 1, 1, 'DVUS', 'malo', 'dsa', '2024-06-27 05:19:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` float DEFAULT NULL,
  `productPriceBeforeDiscount` float DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(22, 7, 13, 'llantas ', 'll', 1100000, 1192640, 'fdFg', 'D_NQ_NP_2X_881453-MLU72459506137_102023-F.webp', 'D_NQ_NP_2X_677754-MLU72459506139_102023-F.webp', 'D_NQ_NP_2X_906235-MLU72459273483_102023-F.webp', 10, 'Out of Stock', '2024-04-24 10:05:38', NULL),
(23, 6, 14, 'camisa rosada', 'UCC', 1100000, 1192640, 'Licra<div _msttexthash=\"60853\" _msthash=\"56\">Suave</div><div _msttexthash=\"60099\" _msthash=\"56\">oComo</div>', 'D_NQ_NP_2X_659218-MCO45187335392_032021-F.webp', 'D_NQ_NP_2X_943973-MCO45187355009_032021-F.webp', 'D_NQ_NP_2X_923644-MCO45187338308_032021-F.webp', 10, 'In Stock', '2024-04-24 11:35:30', NULL),
(24, 7, 15, 'cadena potente', 'cc', 1100000, 1192640, '<h4 _msttexthash=\"154232\" _msthash=\"63\">Muy Chevere&nbsp;</h4>', 'D_NQ_NP_772900-MLU74992012560_032024-O.webp', 'D_NQ_NP_809011-MLA73043293181_112023-O.webp', 'D_NQ_NP_939866-MLU74992111356_032024-O.webp', 10, 'In Stock', '2024-04-24 11:49:04', NULL),
(25, 7, 16, 'Freno de freno en V Shimano Alivio Br T4000 Mtb (par)', 'java', 1100000, 1192640, 'sfsfsfsdfdsfsfSdf', 'D_NQ_NP_2X_832648-MLU73630055853_122023-F.webp', 'D_NQ_NP_2X_787087-MLU73630055839_122023-F.webp', 'D_NQ_NP_2X_979826-MLU74449495641_022024-F.webp', 10, 'In Stock', '2024-04-24 11:50:33', NULL),
(26, 8, 17, 'cicla negra', 'cr', 1100000, 1192640, 'dsfsffdsfdsfdsRea', 'D_NQ_NP_2X_774642-MCO75596112129_042024-F.webp', 'D_NQ_NP_2X_925941-MCO75595692953_042024-F.webp', 'D_NQ_NP_2X_972005-MCO75074296953_032024-F.webp', 10, 'In Stock', '2024-04-24 18:02:57', NULL),
(27, 6, 18, 'saco', 'ktm', 51000, 52000, '<font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">muy chevere la tela punto co</font></font>', 'D_NQ_NP_2X_927928-MCO73584734597_122023-F.png', 'D_NQ_NP_2X_620901-MCO73584734595_122023-F.png', 'D_NQ_NP_2X_732131-MCO74052926038_012024-F.png', 10, 'In Stock', '2024-04-24 21:26:50', NULL),
(28, 6, 18, 'saco negro', 'LLÑ', 51000, 52000, '<font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">metrouy bueno</font></font><div><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">dura mucho</font></font></font></font></div><div><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">negro</font></font></font></font></font></font></div>', 'D_NQ_NP_2X_658712-MCO50090883938_052022-F.webp', 'D_NQ_NP_2X_829634-MCO50091385887_052022-F.webp', 'D_NQ_NP_2X_983180-MCO50091050230_052022-F.webp', 10, 'In Stock', '2024-04-25 02:05:36', NULL),
(29, 6, 14, 'Enterizo Uniforme Ciclismo Mujer Ride 6138', 'CRONOS ROPA DEPORTIVA', 271287, 5652, '<span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">DATOS TÉCNICOS ENTERIZOS PARA DAMA.</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">Enterizos de alta calidad y precios bajos.</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">- Producto nuevo - calidad de exportación</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">- Industria Colombiana 100%</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">- Moldes optimizados para la figura femenina</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">- Lycra y mallas de alta calidad - Siempre Fresco</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">- Colores profundos y de gran viveza</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">- Logos y detalles gráficos de alta resolución</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">- Apliques reflectivos en la espalda para visibilidad en la noche</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">- Costuras planas flat seamer que evita el roce con la piel. Gran acabado visual y resistencia.</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">- Cremallera durable</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">- Bandas con silicona en las piernas para óptimo ajuste</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">- Badana espuma alta densidad 3D, antibacterial, indeformable, 4 a 5 horas de práctica.</span><br>', 'D_NQ_NP_685561-MCO46252689487_062021-O.webp', 'D_NQ_NP_695626-MCO46252721311_062021-O.webp', 'D_NQ_NP_664872-MCO46252683509_062021-O.webp', 10, 'In Stock', '2024-04-25 02:11:41', NULL),
(30, 8, 17, 'Bicicleta Todo Terreno Mtb Bks Rin 27.5 Shimano 21 Velocidad Color Azul Tamaño del marco 27.5', ' BKS', 977990, 20375, '<span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">La bicicleta es uno de los vehículos más elegidos como medio de transporte, y esta tendencia se incrementó aún más con la pandemia del coronavirus. Además de su uso para fines recreativos y deportivos, tiene un impacto muy positivo en el ambiente y el bienestar de personas de todas las edades. Sus beneficios son múltiples: es accesible, ocupa poco espacio, no genera contaminación y hace bien a la salud. ¡Únete a esta ola sustentable que avanza en todo el mundo!</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">Seguridad y calidad</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">Gracias a sus frenos de disco mecánico podés detener la bicicleta con total precisión. Se caracteriza por su durabilidad, ya que su funcionamiento no se ve afectado por cuestiones como la corrosión, las condiciones climáticas o del suelo</span><br>', 'D_NQ_NP_2X_779638-MLU74470970461_022024-F.webp', 'D_NQ_NP_2X_830767-MLU74352324030_022024-F.webp', 'D_NQ_NP_2X_897798-MLU74470831999_022024-F.webp', 1000, 'In Stock', '2024-04-25 02:16:10', NULL),
(31, 8, 17, 'Mountain bike Scott Scale 980 2022 M 12v cambio Shimano Deore M6100 SGS color dark gray', ' Scott', 4705870, 51000, '<div class=\"ui-pdp-container__row ui-pdp-container__row--highlighted-features-title\" style=\"box-sizing: border-box; display: flex; flex: 0 1 0%; flex-flow: wrap; margin-left: 0px; margin-right: 0px; margin-top: 32px; color: rgb(0, 0, 0); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 16px;\"><h2 class=\"ui-vpp-text-alignment--left ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--SEMIBOLD highlighted-features-title\" style=\"box-sizing: border-box; line-height: 1.25; margin-bottom: 0px; color: rgba(0, 0, 0, 0.9); font-size: 14px;\">Lo que tienes que saber de este producto</h2></div><div class=\"ui-pdp-container__row ui-pdp-container__row--highlighted-features\" style=\"box-sizing: border-box; display: flex; flex: 0 1 0%; flex-flow: wrap; color: rgb(0, 0, 0); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 16px;\"><div class=\"ui-vpp-highlighted-specs__features\" style=\"box-sizing: border-box; max-width: 340px; overflow-wrap: break-word; width: 339.994px;\"><ul class=\"ui-vpp-highlighted-specs__features-list\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px;\"><li class=\"ui-vpp-highlighted-specs__features-list-item ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--REGULAR\" style=\"box-sizing: border-box; list-style: none; color: rgba(0, 0, 0, 0.9); font-size: 14px; line-height: 1.43em; margin-top: 16px; padding-left: 10px; text-indent: -11px;\">Con ruedas de entrenamiento: No</li><li class=\"ui-vpp-highlighted-specs__features-list-item ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--REGULAR\" style=\"box-sizing: border-box; list-style: none; color: rgba(0, 0, 0, 0.9); font-size: 14px; line-height: 1.43em; margin-top: 8px; padding-left: 10px; text-indent: -11px;\">Con pie de apoyo: No</li><li class=\"ui-vpp-highlighted-specs__features-list-item ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--REGULAR\" style=\"box-sizing: border-box; list-style: none; color: rgba(0, 0, 0, 0.9); font-size: 14px; line-height: 1.43em; margin-top: 8px; padding-left: 10px; text-indent: -11px;\">Cambios traseros: Shimano Deore M6100 SGS</li><li class=\"ui-vpp-highlighted-specs__features-list-item ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--REGULAR\" style=\"box-sizing: border-box; list-style: none; color: rgba(0, 0, 0, 0.9); font-size: 14px; line-height: 1.43em; margin-top: 8px; padding-left: 10px; text-indent: -11px;\">Cantidad de velocidades: 12</li><li class=\"ui-vpp-highlighted-specs__features-list-item ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--REGULAR\" style=\"box-sizing: border-box; list-style: none; color: rgba(0, 0, 0, 0.9); font-size: 14px; line-height: 1.43em; margin-top: 8px; padding-left: 10px; text-indent: -11px;\">Suspensión delantera.</li><li class=\"ui-vpp-highlighted-specs__features-list-item ui-pdp-color--BLACK ui-pdp-size--XSMALL ui-pdp-family--REGULAR\" style=\"box-sizing: border-box; list-style: none; color: rgba(0, 0, 0, 0.9); font-size: 14px; line-height: 1.43em; margin-top: 8px; padding-left: 10px; text-indent: -11px;\">Peso: 13.6kg.</li></ul></div></div>', 'D_NQ_NP_2X_888666-MLA73981715316_012024-F.webp', 'D_NQ_NP_2X_958177-MLA53454828359_012023-F.webp', 'D_NQ_NP_2X_616039-MLA53454828357_012023-F.webp', 10, 'In Stock', '2024-04-25 04:37:56', NULL),
(32, 7, 16, 'frenos', 'ff', 271287, 52000, 'frenos muy buenos&nbsp;', 'D_NQ_NP_929952-MCO72058096339_102023-O.webp', 'D_NQ_NP_981361-MCO72000743204_102023-O.webp', 'D_NQ_NP_690109-MCO44076358826_112020-O.webp', 1000, 'In Stock', '2024-04-25 04:40:34', NULL),
(33, 7, 16, 'frenosss', 'dd', 35000, 52000, 'dsfsfsfsfsf', 'D_NQ_NP_2X_851111-MLU73481808356_122023-F.webp', 'D_NQ_NP_2X_952411-MLU73481808362_122023-F.webp', 'D_NQ_NP_2X_851111-MLU73481808356_122023-F.webp', 10, 'In Stock', '2024-04-25 04:42:38', NULL),
(34, 9, 19, 'Kit Herramienta Bicicleta Con Kit De Despinche Yanuo', 'YANUO', 37999, 52000, '<span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">1 * Caja de Herramientas</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">1 x manual</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">2 * palo para neumáticos</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">8 * almohadilla de reparación de neumáticos</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">1 x pegamento</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">2 x tubo de cuero con boquilla de aire</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">1 x panel de metal</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">1 * llave multifuncional</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">1 * Inflador de aire</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">1 * mini llave</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">1 * bolsa de almacenamiento</span><br>', 'D_NQ_NP_670290-MCO48091991290_112021-O.webp', 'D_NQ_NP_816379-MCO48091903956_112021-O.webp', 'D_NQ_NP_618086-MCO48091918819_112021-O.webp', 10, 'In Stock', '2024-04-25 04:49:04', NULL),
(35, 7, 15, 'Grupo Shimano Deore 12v Mtb', ' Scott', 300000, 52000, 'hfgfh', 'D_NQ_NP_919333-MCO52749673251_122022-O.webp', 'D_NQ_NP_718300-MCO52749694097_122022-O.webp', 'D_NQ_NP_986019-MCO52749617171_122022-O.webp', 1000, 'In Stock', '2024-05-12 01:41:10', NULL),
(36, 6, 18, 'Buzo De Compresion En Licra Proteccion Uv Multicolores', 'MAKING JAZ', 41500, 865, '<font face=\"helvetica\"><span style=\"color: rgb(102, 102, 102); font-size: 20px;\">Buzo de compresión en licra deportiva de secado rápido y frescura máxima.</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-size: 20px;\">Hola somos Making Jaz TENEMOS MUCHOS COLORES DISPONIBLES.</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-size: 20px;\">BLANCO</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-size: 20px;\">AZUL</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-size: 20px;\">AZUL OSCURO</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-size: 20px;\">ROJO</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-size: 20px;\">VERDE NEON</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-size: 20px;\">VERDE MILITAR</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-size: 20px;\">VINOTINTO</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-size: 20px;\">AMARILLO</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-size: 20px;\">GRIS</span><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-size: 20px;\"><span style=\"color: rgb(102, 102, 102); font-size: 20px;\">NARANJA</span></font><br style=\"box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 20px;\">', 'D_NQ_NP_839194-MCO51857389143_102022-O.webp', 'D_NQ_NP_747231-MCO71951909668_092023-O.webp', 'D_NQ_NP_629465-MCO71556773857_092023-O.webp', 1000, 'In Stock', '2024-05-25 04:14:54', NULL),
(37, 9, 19, 'Kit de herramientas para bicicletas, llaves, parche de bomba, reparación de bicicletas', 'kit reparo', 37999, 36999, '<table class=\"andes-table\" style=\"color: rgba(0, 0, 0, 0.9); font-family: &quot;Proxima Nova&quot;, -apple-system, Roboto, Arial, sans-serif; font-size: 14px; line-height: 18px; padding: 0px; width: 363.386px; -webkit-font-smoothing: antialiased; border: 1px solid rgb(245, 245, 245); border-collapse: separate; border-radius: 5px; overflow: hidden; table-layout: fixed; background-color: rgb(255, 255, 255);\"><tbody class=\"andes-table__body\" style=\"box-sizing: border-box;\"><tr class=\"andes-table__row ui-vpp-striped-specs__row\" style=\"box-sizing: border-box; background: rgba(0, 0, 0, 0.04); box-shadow: none; display: flex; border: none; width: 361.463px;\"><th class=\"andes-table__header andes-table__header--left ui-vpp-striped-specs__row__column ui-vpp-striped-specs__row__column--id\" scope=\"col\" style=\"box-sizing: border-box; background-color: inherit; box-shadow: none; text-align: left; padding: 15px 24px 15px 16px; vertical-align: middle; white-space-collapse: break-spaces; border: none; font-size: 12px; overflow: hidden; overflow-wrap: break-word; width: 180.724px; word-break: break-word;\"><div class=\"andes-table__header__container\" style=\"box-sizing: border-box; align-items: center; background-color: transparent; border: none; display: inline-block; padding: 0px; font: inherit;\">Incluye inflador</div></th><td class=\"andes-table__column andes-table__column--left andes-table__column--vertical-align-center ui-vpp-striped-specs__row__column\" id=\":R57tishc4um:\" title=\"No\" style=\"box-sizing: border-box; white-space-collapse: break-spaces; vertical-align: middle; box-shadow: none; padding: 15px 24px 15px 16px; background-color: inherit; border: none; font-size: 12px; overflow: hidden; overflow-wrap: break-word; width: 180.724px; word-break: break-word;\"><span class=\"andes-table__column--value\" style=\"box-sizing: border-box; display: -webkit-box; -webkit-box-orient: vertical; margin: 0px; overflow: hidden; white-space-collapse: collapse;\">No</span></td></tr></tbody></table>', 'D_NQ_NP_2X_878548-MLU74499773741_022024-F.webp', 'D_NQ_NP_2X_775750-MLU74380221006_022024-F.webp', 'D_NQ_NP_2X_929351-MLU74380221010_022024-F.webp', 1000, 'In Stock', '2024-06-03 22:45:22', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(13, 7, 'llantas ', '2024-04-24 10:04:44', NULL),
(14, 6, 'mujer ', '2024-04-24 11:31:15', '25-04-2024 02:58:11 AM'),
(15, 7, 'cadena', '2024-04-24 11:47:54', NULL),
(16, 7, 'frenos', '2024-04-24 11:49:45', NULL),
(17, 8, 'ciclas', '2024-04-24 18:01:28', NULL),
(18, 6, 'hombre', '2024-04-24 21:25:39', NULL),
(19, 9, ' kit', '2024-04-25 04:47:06', '25-04-2024 10:20:29 AM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:18:50', '', 1),
(2, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:29:33', '', 1),
(3, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:30:11', '', 1),
(4, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 15:00:23', '26-02-2017 11:12:06 PM', 1),
(5, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:08:58', '', 0),
(6, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:09:41', '', 0),
(7, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:04', '', 0),
(8, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:31', '', 0),
(9, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:13:43', '', 1),
(10, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:52:58', '', 0),
(11, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:53:07', '', 1),
(12, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:09', '', 0),
(13, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:15', '', 1),
(14, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-06 18:10:26', '', 1),
(15, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 12:28:16', '', 1),
(16, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:43:27', '', 1),
(17, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:55:33', '', 1),
(18, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 19:44:29', '', 1),
(19, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-08 19:21:15', '', 1),
(20, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:19:38', '', 1),
(21, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:20:36', '15-03-2017 10:50:39 PM', 1),
(22, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-16 01:13:57', '', 1),
(23, 'hgfhgf@gmass.com', 0x3a3a3100000000000000000000000000, '2018-04-29 09:30:40', '', 1),
(24, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-04-24 18:59:17', NULL, 0),
(25, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-04-24 18:59:24', NULL, 0),
(26, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-04-24 18:59:37', NULL, 1),
(27, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-04-24 19:17:36', '25-04-2024 12:47:47 AM', 1),
(28, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-04-24 19:17:50', '25-04-2024 12:49:19 AM', 1),
(29, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-04-24 19:19:23', NULL, 1),
(30, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-04-24 19:21:27', NULL, 1),
(31, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-04-24 21:09:24', NULL, 1),
(32, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-01 20:40:47', NULL, 1),
(33, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-01 21:57:28', NULL, 1),
(34, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-01 22:01:44', NULL, 1),
(35, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-01 22:14:39', '02-05-2024 07:22:01 AM', 1),
(36, 'anas@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-02 01:53:37', NULL, 1),
(37, 'anas@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-02 01:55:42', NULL, 1),
(38, 'anas@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-02 02:30:19', NULL, 1),
(39, 'anas@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-05 02:08:32', '05-05-2024 10:59:33 AM', 1),
(40, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-05 05:29:55', NULL, 1),
(41, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-05 05:57:53', NULL, 1),
(42, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-06 22:56:33', '07-05-2024 04:26:37 AM', 1),
(43, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-06 22:56:50', '07-05-2024 04:50:19 AM', 1),
(44, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-06 23:20:53', NULL, 1),
(45, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-09 03:46:58', '09-05-2024 09:28:43 AM', 1),
(46, 'anas@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-09 03:59:11', NULL, 1),
(47, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-11 03:23:38', NULL, 1),
(48, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-11 04:11:30', NULL, 1),
(49, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-11 04:40:04', NULL, 1),
(50, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-11 04:54:30', NULL, 1),
(51, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-11 05:08:59', '11-05-2024 12:43:59 PM', 1),
(52, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-11 07:14:05', NULL, 1),
(53, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-11 21:51:59', '12-05-2024 03:22:26 AM', 1),
(54, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-11 21:52:30', NULL, 1),
(55, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-11 22:08:02', '12-05-2024 04:23:49 AM', 1),
(56, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-11 22:53:54', '12-05-2024 05:28:38 AM', 1),
(57, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-12 00:01:58', NULL, 1),
(58, 'anas@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-12 00:02:37', NULL, 1),
(59, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-12 03:10:35', NULL, 1),
(60, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-12 03:12:09', '12-05-2024 08:42:54 AM', 1),
(61, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-12 03:18:16', '12-05-2024 08:54:21 AM', 1),
(62, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-21 19:10:02', NULL, 1),
(63, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-22 03:15:29', NULL, 1),
(64, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-27 03:14:03', NULL, 1),
(65, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-30 22:38:15', '31-05-2024 04:08:27 AM', 1),
(66, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-31 01:00:42', NULL, 1),
(67, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-02 05:02:07', NULL, 1),
(68, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-02 20:50:27', '03-06-2024 03:18:39 AM', 1),
(69, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-02 21:48:48', '03-06-2024 09:03:52 AM', 1),
(70, 'anas@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-03 03:33:57', NULL, 1),
(71, 'anas@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-03 22:12:46', NULL, 1),
(72, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-05 00:06:19', '05-06-2024 05:57:37 AM', 1),
(73, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-05 00:37:26', NULL, 1),
(74, 'anas@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-05 02:45:11', '05-06-2024 08:51:27 AM', 1),
(75, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-05 02:57:01', NULL, 1),
(76, 'anas@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-05 03:24:15', '05-06-2024 08:54:19 AM', 1),
(77, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:13:18', '10-06-2024 07:47:25 AM', 1),
(78, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:17:33', NULL, 0),
(79, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:17:44', NULL, 1),
(80, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:18:11', NULL, 0),
(81, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:18:14', '10-06-2024 07:49:24 AM', 1),
(82, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:27', NULL, 0),
(83, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:29', NULL, 0),
(84, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:29', NULL, 0),
(85, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:30', NULL, 0),
(86, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:30', NULL, 0),
(87, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:30', NULL, 0),
(88, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:30', NULL, 0),
(89, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:30', NULL, 0),
(90, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:33', NULL, 0),
(91, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:35', NULL, 0),
(92, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:35', NULL, 0),
(93, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:36', NULL, 0),
(94, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:36', NULL, 0),
(95, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:36', NULL, 0),
(96, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:37', NULL, 0),
(97, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:37', NULL, 0),
(98, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:37', NULL, 0),
(99, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:37', NULL, 0),
(100, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:37', NULL, 0),
(101, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:38', NULL, 0),
(102, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:38', NULL, 0),
(103, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:19:40', '10-06-2024 07:51:42 AM', 1),
(104, 'anas@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:21:49', '10-06-2024 07:52:55 AM', 1),
(105, 'anas@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:23:00', NULL, 0),
(106, 'anas@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:23:04', '10-06-2024 07:54:10 AM', 1),
(107, 'manu@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:23:23', NULL, 1),
(108, 'anas@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:24:14', '10-06-2024 07:54:17 AM', 1),
(109, 'anas@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:24:21', NULL, 0),
(110, 'anas@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:24:27', NULL, 0),
(111, 'anas@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:24:30', '10-06-2024 08:17:33 AM', 1),
(112, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:41:17', NULL, 1),
(113, 'anas@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:47:39', NULL, 0),
(114, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:47:42', NULL, 0),
(115, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:47:47', NULL, 0),
(116, 'danna16666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 02:48:21', NULL, 1),
(117, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 03:47:02', NULL, 0),
(118, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 03:47:08', '10-06-2024 09:52:33 AM', 1),
(119, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 04:22:42', NULL, 0),
(120, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 04:22:46', '10-06-2024 09:54:38 AM', 1),
(121, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 04:25:16', '10-06-2024 09:58:10 AM', 1),
(122, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 04:28:12', NULL, 0),
(123, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 04:28:14', '10-06-2024 09:58:25 AM', 1),
(124, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 04:28:37', NULL, 0),
(125, '', 0x3a3a3100000000000000000000000000, '2024-06-10 04:29:08', '10-06-2024 10:47:10 AM', 0),
(126, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 05:24:21', NULL, 0),
(127, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 05:24:25', '10-06-2024 10:57:53 AM', 1),
(128, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 05:28:04', '10-06-2024 10:59:42 AM', 1),
(129, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 05:29:43', NULL, 0),
(130, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 05:29:53', '10-06-2024 11:02:22 AM', 1),
(131, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 05:32:24', NULL, 0),
(132, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 05:40:25', NULL, 1),
(133, 'danna1666z@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-10 20:38:54', NULL, 1),
(134, 'natalia@gmail.com', 0x3132372e302e302e3100000000000000, '2024-06-27 04:12:12', NULL, 1),
(135, 'natalia@gmail.com', 0x3132372e302e302e3100000000000000, '2024-06-27 04:22:39', NULL, 1),
(136, 'anas@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-27 05:12:28', NULL, 0),
(137, 'manu@gmail.com', 0x3a3a3100000000000000000000000000, '2024-06-27 05:12:35', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(5, 'ana santiago', 'anas@gmail.com', 3164041905, '81dc9bdb52d04dc20036dbd8313ed055', 'colombia', 'activo', 'colombia', 123, 'colombia', 'activa', 'ocaña', 123, '2024-05-02 01:52:51', NULL),
(6, 'DANNA VALERIA URIBE', 'danna1666z@gmail.com', 3164041903, '81dc9bdb52d04dc20036dbd8313ed055', '23', 'fa', 'bogota', 0, 'colombia', 'activa', 'ocaña', 123, '2024-05-05 05:29:52', '10-06-2024 10:58:30 AM'),
(7, 'manu', 'manu@gmail.com', 3164041903, '81dc9bdb52d04dc20036dbd8313ed055', 'colombia', 'activa', 'ocaña', 123, 'colombia', 'activa', 'ocaña', 123, '2024-06-05 03:11:46', NULL),
(8, 'danna valeria uribe santiago', 'danna16666z@gmail.com', 3164041903, '81dc9bdb52d04dc20036dbd8313ed055', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-10 02:48:11', NULL),
(9, 'EL AMOR DE MI VIDA', 'natalia@gmail.com', 3168909786, '81dc9bdb52d04dc20036dbd8313ed055', '3424', '324', '324', 324, '43', '3424', '3243', 32434, '2024-06-27 04:11:45', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 0, '2017-02-27 18:53:17'),
(6, 6, 23, '2024-05-31 01:00:52'),
(7, 7, 37, '2024-06-27 05:38:04');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
