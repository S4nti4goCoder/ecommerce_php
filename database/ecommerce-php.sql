-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2024 a las 07:26:09
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
-- Base de datos: `ecommerce-php`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admins`
--

CREATE TABLE `admins` (
  `id_admin` int(11) NOT NULL,
  `rol_admin` text DEFAULT NULL,
  `name_admin` text DEFAULT NULL,
  `email_admin` text DEFAULT NULL,
  `password_admin` text DEFAULT NULL,
  `token_admin` text DEFAULT NULL,
  `token_exp_admin` text DEFAULT NULL,
  `date_created_admin` date DEFAULT NULL,
  `date_updated_admin` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `admins`
--

INSERT INTO `admins` (`id_admin`, `rol_admin`, `name_admin`, `email_admin`, `password_admin`, `token_admin`, `token_exp_admin`, `date_created_admin`, `date_updated_admin`) VALUES
(1, 'admin', 'Jose Tienda', 'admin@ecommerce.com', '$2a$07$azybxcags23425sdg23sde9Sczn9l3QeLCqG2x31FveZjFNtYBr9a', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3MzI0MDg4MDIsImV4cCI6MTczMjQ5NTIwMiwiZGF0YSI6eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBlY29tbWVyY2UuY29tIn19.dYN9sGz5OYABbYKDyNflu6FB05E-_KwEy-BqdCQb8lE', '1732495202', '2024-09-01', '2024-11-24 00:40:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL,
  `name_category` text DEFAULT NULL,
  `url_category` text DEFAULT NULL,
  `icon_category` text DEFAULT NULL,
  `image_category` text DEFAULT NULL,
  `description_category` text DEFAULT NULL,
  `keywords_category` text DEFAULT NULL,
  `subcategories_category` int(11) DEFAULT 0,
  `products_category` int(11) DEFAULT 0,
  `views_category` int(11) DEFAULT 0,
  `status_category` int(11) DEFAULT 1,
  `date_created_category` date DEFAULT NULL,
  `date_updated_category` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id_category`, `name_category`, `url_category`, `icon_category`, `image_category`, `description_category`, `keywords_category`, `subcategories_category`, `products_category`, `views_category`, `status_category`, `date_created_category`, `date_updated_category`) VALUES
(1, 'Ropa', 'ropa', 'fas fa-tshirt', 'ropa.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'ropa,camisas,pantalones,blusas,faldas', 4, 2, 0, 1, '2024-09-30', '2024-11-24 05:49:46'),
(2, 'Calzado', 'calzado', 'fas fa-shoe-prints', 'calzado.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'calzado,tennis,chanclas,sandalias', 4, 0, 0, 1, '2024-09-30', '2024-09-30 22:37:44'),
(3, 'Tecnología', 'tecnologia', 'fas fa-laptop', 'tecnologia.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'pc,portatil,ordenador,servidor', 4, 0, 0, 1, '2024-09-30', '2024-09-30 20:36:15'),
(4, 'Cursos', 'cursos', 'fas fa-graduation-cap', 'cursos.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'cursos,tutorias,enseñanzas,virtualidad', 5, 1, 0, 1, '2024-09-30', '2024-10-19 08:08:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `id_category_product` int(11) NOT NULL DEFAULT 0,
  `id_subcategory_product` int(11) NOT NULL DEFAULT 0,
  `name_product` text DEFAULT NULL,
  `url_product` text DEFAULT NULL,
  `image_product` text DEFAULT NULL,
  `description_product` text DEFAULT NULL,
  `keywords_product` text DEFAULT NULL,
  `info_product` longtext DEFAULT NULL,
  `views_product` int(11) NOT NULL DEFAULT 0,
  `status_product` int(11) NOT NULL DEFAULT 1,
  `date_created_product` date DEFAULT NULL,
  `date_updated_product` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id_product`, `id_category_product`, `id_subcategory_product`, `name_product`, `url_product`, `image_product`, `description_product`, `keywords_product`, `info_product`, `views_product`, `status_product`, `date_created_product`, `date_updated_product`) VALUES
(1, 1, 1, 'Conjunto 1 Ropa Dama 1', 'conjunto-1-ropa-dama-1', 'conjunto-1-ropa-dama-1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'ropa,dama,lorem,ipsum', '<p><img src=\"/views/assets/css/plugins/summernote/img/blank.gif\" class=\"img\" style=\"display:inline-block;width:25px;height:25px;background:url(\'/views/assets/css/plugins/summernote/img/emoji_spritesheet_0.png\') -250px -150px no-repeat;background-size:675px 175px;\" alt=\":heart:\"><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc nec viverra leo. Nullam mollis orci ante, gravida vestibulum diam rhoncus at. Donec viverra suscipit lobortis.</span><img src=\"/views/assets/css/plugins/summernote/img/blank.gif\" class=\"img\" style=\"display:inline-block;width:25px;height:25px;background:url(\'/views/assets/css/plugins/summernote/img/emoji_spritesheet_0.png\') -75px -75px no-repeat;background-size:675px 175px;\" alt=\":see_no_evil:\"><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\"> </span></p><p><img src=\"/views/assets/img/products/conjunto-1-ropa-dama-1/6593501123.jpg\" style=\"width: 100%;\" class=\"img-fluid\"><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\"><b>Vivamus tristique tincidunt nulla, sed accumsan purus pellentesque eget. Sed blandit est a blandit ullamcorper. Duis ut felis sit amet lacus ullamcorper commodo nec non elit. </b></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Suspendisse tempor erat sed risus consequat, sit amet consectetur magna vehicula. Nam nec mauris eu nisl facilisis lobortis consectetur at tellus. Integer non eleifend massa.</span>                                                                                                                                                                            </p>', 0, 1, '2024-10-01', '2024-10-10 05:51:31'),
(2, 4, 13, 'Curso De Css 1', 'curso-de-css-1', 'curso-de-css-1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sollicitudin enim ante, imperdiet viverra eros tempor sit amet. Vestibulum nec volutpat arcu. In non feugiat lacus. Phasellus nec lectus congue ipsum ultrices sodales.', 'curso,css,html', '%3Cp%3ELorem+ipsum+dolor+sit+amet%2C+consectetur+adipiscing+elit.+Sed+sollicitudin+enim+ante%2C+imperdiet+viverra+eros+tempor+sit+amet.+Vestibulum+nec+volutpat+arcu.+In+non+feugiat+lacus.+Phasellus+nec+lectus+congue+ipsum+ultrices+sodales.%3C%2Fp%3E%3Cp%3E%3Cbr%3E%3C%2Fp%3E%3Cp%3E%3Cimg+src%3D%22%2Fviews%2Fassets%2Fimg%2Fproductscurso-de-css-1%2F2454963137.jpg%22+style%3D%22width%3A+100%25%3B%22+class%3D%22img-fluid%22%3E++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%3C%2Fp%3E', 0, 1, '2024-10-19', '2024-10-19 08:08:47'),
(3, 1, 1, 'Conjunto 2 Ropa Dama 1', 'conjunto-2-ropa-dama-1', 'conjunto-2-ropa-dama-1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'ropa,dama,lorem,ipsum', '<p><img src=\"/views/assets/css/plugins/summernote/img/blank.gif\" class=\"img\" style=\"display:inline-block;width:25px;height:25px;background:url(\'/views/assets/css/plugins/summernote/img/emoji_spritesheet_0.png\') -250px -150px no-repeat;background-size:675px 175px;\" alt=\":heart:\"><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc nec viverra leo. Nullam mollis orci ante, gravida vestibulum diam rhoncus at. Donec viverra suscipit lobortis.</span><img src=\"/views/assets/css/plugins/summernote/img/blank.gif\" class=\"img\" style=\"display:inline-block;width:25px;height:25px;background:url(\'/views/assets/css/plugins/summernote/img/emoji_spritesheet_0.png\') -75px -75px no-repeat;background-size:675px 175px;\" alt=\":see_no_evil:\"><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\"> </span></p><p><img src=\"/views/assets/img/products/conjunto-2-ropa-dama-1/6593501123.jpg\" style=\"width: 100%;\" class=\"img-fluid\"><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\"><b>Vivamus tristique tincidunt nulla, sed accumsan purus pellentesque eget. Sed blandit est a blandit ullamcorper. Duis ut felis sit amet lacus ullamcorper commodo nec non elit. </b></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Suspendisse tempor erat sed risus consequat, sit amet consectetur magna vehicula. Nam nec mauris eu nisl facilisis lobortis consectetur at tellus. Integer non eleifend massa.</span>                                                                                                                                                                            </p>', 0, 1, '2024-10-01', '2024-10-10 05:51:31'),
(4, 1, 1, 'Conjunto 3 Ropa Dama 1', 'conjunto-3-ropa-dama-1', 'conjunto-3-ropa-dama-1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'ropa,dama,lorem,ipsum', '<p><img src=\"/views/assets/css/plugins/summernote/img/blank.gif\" class=\"img\" style=\"display:inline-block;width:25px;height:25px;background:url(\'/views/assets/css/plugins/summernote/img/emoji_spritesheet_0.png\') -250px -150px no-repeat;background-size:675px 175px;\" alt=\":heart:\"><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc nec viverra leo. Nullam mollis orci ante, gravida vestibulum diam rhoncus at. Donec viverra suscipit lobortis.</span><img src=\"/views/assets/css/plugins/summernote/img/blank.gif\" class=\"img\" style=\"display:inline-block;width:25px;height:25px;background:url(\'/views/assets/css/plugins/summernote/img/emoji_spritesheet_0.png\') -75px -75px no-repeat;background-size:675px 175px;\" alt=\":see_no_evil:\"><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\"> </span></p><p><img src=\"/views/assets/img/products/conjunto-3-ropa-dama-1/6593501123.jpg\" style=\"width: 100%;\" class=\"img-fluid\"><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\"><b>Vivamus tristique tincidunt nulla, sed accumsan purus pellentesque eget. Sed blandit est a blandit ullamcorper. Duis ut felis sit amet lacus ullamcorper commodo nec non elit. </b></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Suspendisse tempor erat sed risus consequat, sit amet consectetur magna vehicula. Nam nec mauris eu nisl facilisis lobortis consectetur at tellus. Integer non eleifend massa.</span>                                                                                                                                                                            </p>', 0, 1, '2024-10-01', '2024-10-10 05:51:31'),
(5, 1, 2, 'Conjunto 1 Ropa Hombre 1', 'conjunto-1-ropa-hombre-1', 'conjunto-1-ropa-hombre-1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sodales nulla vel elementum condimentum. Donec nec arcu a enim porta blandit. Donec dapibus euismod urna cursus auctor.', 'ropa,hombre,lorem,ipsum', '<p><img src=\"/views/assets/css/plugins/summernote/img/blank.gif\" class=\"img\" style=\"display:inline-block;width:25px;height:25px;background:url(\'/views/assets/css/plugins/summernote/img/emoji_spritesheet_0.png\') -250px -150px no-repeat;background-size:675px 175px;\" alt=\":heart:\"><span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc nec viverra leo. Nullam mollis orci ante, gravida vestibulum diam rhoncus at. Donec viverra suscipit lobortis.</span><img src=\"/views/assets/css/plugins/summernote/img/blank.gif\" class=\"img\" style=\"display:inline-block;width:25px;height:25px;background:url(\'/views/assets/css/plugins/summernote/img/emoji_spritesheet_0.png\') -75px -75px no-repeat;background-size:675px 175px;\" alt=\":see_no_evil:\"><span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\"> </span></p><p><img src=\"/views/assets/img/products/conjunto-1-ropa-hombre-1/6108177038.jpg\" style=\"width: 100%;\" class=\"img-fluid\"><span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\"><br></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\"><b>Vivamus tristique tincidunt nulla, sed accumsan purus pellentesque eget. Sed blandit est a blandit ullamcorper. Duis ut felis sit amet lacus ullamcorper commodo nec non elit. </b></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\"><br></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\">Suspendisse tempor erat sed risus consequat, sit amet consectetur magna vehicula. Nam nec mauris eu nisl facilisis lobortis consectetur at tellus. Integer non eleifend massa.</span>                                                                                                                                                                            </p>', 0, 1, '2024-11-24', '2024-11-24 05:29:41'),
(6, 1, 2, 'Conjunto 2 Ropa Hombre 1', 'conjunto-2-ropa-hombre-1', 'conjunto-2-ropa-hombre-1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sodales nulla vel elementum condimentum. Donec nec arcu a enim porta blandit. Donec dapibus euismod urna cursus auctor.', 'ropa,hombre,lorem,ipsum', '<p><img src=\"/views/assets/css/plugins/summernote/img/blank.gif\" class=\"img\" style=\"display:inline-block;width:25px;height:25px;background:url(\'/views/assets/css/plugins/summernote/img/emoji_spritesheet_0.png\') -250px -150px no-repeat;background-size:675px 175px;\" alt=\":heart:\"><span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc nec viverra leo. Nullam mollis orci ante, gravida vestibulum diam rhoncus at. Donec viverra suscipit lobortis.</span><img src=\"/views/assets/css/plugins/summernote/img/blank.gif\" class=\"img\" style=\"display:inline-block;width:25px;height:25px;background:url(\'/views/assets/css/plugins/summernote/img/emoji_spritesheet_0.png\') -75px -75px no-repeat;background-size:675px 175px;\" alt=\":see_no_evil:\"><span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\"> </span></p><p><img src=\"/views/assets/img/products/conjunto-2-ropa-hombre-1/6108177038.jpg\" style=\"width: 100%;\" class=\"img-fluid\"><span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\"><br></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\"><b>Vivamus tristique tincidunt nulla, sed accumsan purus pellentesque eget. Sed blandit est a blandit ullamcorper. Duis ut felis sit amet lacus ullamcorper commodo nec non elit. </b></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\"><br></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\">Suspendisse tempor erat sed risus consequat, sit amet consectetur magna vehicula. Nam nec mauris eu nisl facilisis lobortis consectetur at tellus. Integer non eleifend massa.</span>                                                                                                                                                                            </p>', 0, 1, '2024-11-24', '2024-11-24 05:29:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socials`
--

CREATE TABLE `socials` (
  `id_social` int(11) NOT NULL,
  `name_social` text DEFAULT NULL,
  `url_social` text DEFAULT NULL,
  `icon_social` text DEFAULT NULL,
  `color_social` text DEFAULT NULL,
  `date_created_social` date DEFAULT NULL,
  `date_updated_social` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `socials`
--

INSERT INTO `socials` (`id_social`, `name_social`, `url_social`, `icon_social`, `color_social`, `date_created_social`, `date_updated_social`) VALUES
(1, 'facebook', 'https://facebook.com', 'fab fa-facebook-f', 'text-facebook', '2024-09-01', '2024-09-01 21:19:53'),
(2, 'youtube', 'https://youtube.com', 'fab fa-youtube', 'text-youtube', '2024-09-01', '2024-09-01 21:19:53'),
(3, 'twitter', 'https://twitter.com', 'fab fa-twitter', 'text-twitter', '2024-09-01', '2024-09-01 21:21:51'),
(4, 'instagram', 'https://instagram.com', 'fab fa-instagram', 'text-instagram', '2024-09-01', '2024-09-01 21:21:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategories`
--

CREATE TABLE `subcategories` (
  `id_subcategory` int(11) NOT NULL,
  `id_category_subcategory` int(11) NOT NULL DEFAULT 0,
  `name_subcategory` text DEFAULT NULL,
  `url_subcategory` text DEFAULT NULL,
  `image_subcategory` text DEFAULT NULL,
  `description_subcategory` text DEFAULT NULL,
  `keywords_subcategory` text DEFAULT NULL,
  `products_subcategory` int(11) NOT NULL DEFAULT 0,
  `views_subcategory` int(11) NOT NULL DEFAULT 0,
  `status_subcategory` int(11) NOT NULL DEFAULT 1,
  `date_created_subcategory` date DEFAULT NULL,
  `date_updated_subcategory` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `subcategories`
--

INSERT INTO `subcategories` (`id_subcategory`, `id_category_subcategory`, `name_subcategory`, `url_subcategory`, `image_subcategory`, `description_subcategory`, `keywords_subcategory`, `products_subcategory`, `views_subcategory`, `status_subcategory`, `date_created_subcategory`, `date_updated_subcategory`) VALUES
(1, 1, 'Ropa Para Dama', 'ropa-para-dama', 'ropa-para-dama.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'ropa,lorem,ipsum', 1, 0, 1, '2024-09-30', '2024-11-24 04:22:19'),
(2, 1, 'Ropa Para Hombre', 'ropa-para-hombre', 'ropa-para-hombre.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'ropa,lorem,ipsum', 1, 0, 1, '2024-09-30', '2024-11-24 05:49:46'),
(3, 1, 'Ropa Deportiva', 'ropa-deportiva', 'ropa-deportiva.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'ropa,lorem,ipsum', 0, 0, 1, '2024-09-30', '2024-09-30 20:30:43'),
(4, 1, 'Ropa Infantil', 'ropa-infantil', 'ropa-infantil.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'ropa,lorem,ipsum', 0, 0, 1, '2024-09-30', '2024-09-30 20:31:10'),
(5, 2, 'Calzado Para Dama', 'calzado-para-dama', 'calzado-para-dama.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'calzado,lorem,ipsum', 0, 0, 1, '2024-09-30', '2024-09-30 22:37:44'),
(6, 2, 'Calzado Para Hombre', 'calzado-para-hombre', 'calzado-para-hombre.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'calzado,lorem,ipsum', 0, 0, 1, '2024-09-30', '2024-09-30 20:32:34'),
(7, 2, 'Calzado Deportivo', 'calzado-deportivo', 'calzado-deportivo.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'calzado,lorem,ipsum', 0, 0, 1, '2024-09-30', '2024-09-30 20:32:56'),
(8, 2, 'Calzado Infantil', 'calzado-infantil', 'calzado-infantil.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'calzado,lorem,ipsum', 0, 0, 1, '2024-09-30', '2024-09-30 20:33:32'),
(9, 3, 'Télefonos Móvil', 'telefonos-movil', 'telefonos-movil.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'tecnologia,lorem,ipsum', 0, 0, 1, '2024-09-30', '2024-09-30 20:34:48'),
(10, 3, 'Tabletas Electrónicas', 'tabletas-electronicas', 'tabletas-electronicas.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'tecnologia,lorem,ipsum', 0, 0, 1, '2024-09-30', '2024-09-30 20:35:11'),
(11, 3, 'Auriculares', 'auriculares', 'auriculares.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'tecnologia,lorem,ipsum', 0, 0, 1, '2024-09-30', '2024-09-30 20:35:52'),
(12, 3, 'Computadoras', 'computadoras', 'computadoras.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'tecnologia,lorem,ipsum', 0, 0, 1, '2024-09-30', '2024-09-30 20:36:15'),
(13, 4, 'Desarrollo Web', 'desarrollo-web', 'desarrollo-web.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'cursos,lorem,ipsum', 1, 0, 1, '2024-09-30', '2024-10-19 08:08:47'),
(14, 4, 'Aplicaciones Móviles', 'aplicaciones-moviles', 'aplicaciones-moviles.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'cursos,lorem,ipsum', 0, 0, 1, '2024-09-30', '2024-09-30 20:38:43'),
(15, 4, 'Diseño Gráfico', 'diseno-grafico', 'diseno-grafico.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'cursos,lorem,ipsum', 0, 0, 1, '2024-09-30', '2024-09-30 20:39:26'),
(16, 4, 'Marketing Digital', 'marketing-digital', 'marketing-digital.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'cursos,lorem,ipsum', 0, 0, 1, '2024-09-30', '2024-09-30 20:40:07'),
(17, 4, 'Prueba', 'prueba', 'prueba.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'prueba,lorem,ipsum', 0, 0, 1, '2024-09-30', '2024-10-06 18:55:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `templates`
--

CREATE TABLE `templates` (
  `id_template` int(11) NOT NULL,
  `logo_template` text DEFAULT NULL,
  `icon_template` text DEFAULT NULL,
  `cover_template` text DEFAULT NULL,
  `title_template` text DEFAULT NULL,
  `description_template` text DEFAULT NULL,
  `keywords_template` text DEFAULT NULL,
  `fonts_template` text DEFAULT NULL,
  `colors_template` text DEFAULT NULL,
  `active_template` text DEFAULT NULL,
  `date_created_template` date DEFAULT NULL,
  `date_updated_template` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `templates`
--

INSERT INTO `templates` (`id_template`, `logo_template`, `icon_template`, `cover_template`, `title_template`, `description_template`, `keywords_template`, `fonts_template`, `colors_template`, `active_template`, `date_created_template`, `date_updated_template`) VALUES
(1, 'logo.png', 'icono.png', 'cover.jpg', 'Sistema Ecommerce', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae diam accumsan, semper mi sit amet, maximus lectus. Mauris a ipsum venenatis.', '[\"ecommerce\", \"comcercio electrónico\", \"moda\", \"sistemas\"]', '{\"fontFamily\":\"%3Clink%20rel%3D%22preconnect%22%20href%3D%22https%3A%2F%2Ffonts.googleapis.com%22%3E%0A%20%20%20%20%3Clink%20rel%3D%22preconnect%22%20href%3D%22https%3A%2F%2Ffonts.gstatic.com%22%20crossorigin%3E%0A%20%20%20%20%3Clink%20href%3D%22https%3A%2F%2Ffonts.googleapis.com%2Fcss2%3Ffamily%3DUbuntu%2BCondensed%26family%3DUbuntu%3Aital%2Cwght%400%2C300%3B0%2C400%3B0%2C500%3B0%2C700%3B1%2C300%3B1%2C400%3B1%2C500%3B1%2C700%26display%3Dswap%22%20rel%3D%22stylesheet%22%3E\",\"fontBody\":\"Ubuntu\",\"fontSlide\":\"Ubuntu Condensed\"}', '[{\"top\":{\"background\":\"black\",\"color\":\"white\"}},{\"template\":{\"background\":\"#00a6fb\",\"color\":\"white\"}}]', 'ok', '2024-09-01', '2024-09-01 21:36:30'),
(2, 'logo.png', 'icono.png', 'cover.jpg', 'Sistema Ecommerce', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae diam accumsan, semper mi sit amet, maximus lectus. Mauris a ipsum venenatis.', '[\"ecommerce\", \"comcercio electrónico\", \"moda\", \"sistemas\"]', '{\"fontFamily\":\"%3Clink%20rel%3D%22preconnect%22%20href%3D%22https%3A%2F%2Ffonts.googleapis.com%22%3E%0A%3Clink%20rel%3D%22preconnect%22%20href%3D%22https%3A%2F%2Ffonts.gstatic.com%22%20crossorigin%3E%0A%3Clink%20href%3D%22https%3A%2F%2Ffonts.googleapis.com%2Fcss2%3Ffamily%3DMontserrat%3Aital%2Cwght%400%2C100..900%3B1%2C100..900%26display%3Dswap%22%20rel%3D%22stylesheet%22%3E\",\"fontBody\":\"Montserrat\",\"fontSlide\":\"Montserrat\"}', '[{\"top\":{\"background\":\"#03f9b6\",\"color\":\"black\"}},{\"template\":{\"background\":\"#c147b5\",\"color\":\"white\"}}]', NULL, '2024-09-01', '2024-09-01 21:36:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variants`
--

CREATE TABLE `variants` (
  `id_variant` int(11) NOT NULL,
  `id_product_variant` int(11) NOT NULL DEFAULT 0,
  `type_variant` text DEFAULT NULL,
  `media_variant` text DEFAULT NULL,
  `description_variant` text DEFAULT NULL,
  `cost_variant` double NOT NULL DEFAULT 0,
  `price_variant` double NOT NULL DEFAULT 0,
  `offer_variant` text DEFAULT NULL,
  `end_offer_variant` date DEFAULT NULL,
  `stock_variant` int(11) NOT NULL DEFAULT 0,
  `date_created_variant` date DEFAULT NULL,
  `date_updated_variant` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `variants`
--

INSERT INTO `variants` (`id_variant`, `id_product_variant`, `type_variant`, `media_variant`, `description_variant`, `cost_variant`, `price_variant`, `offer_variant`, `end_offer_variant`, `stock_variant`, `date_created_variant`, `date_updated_variant`) VALUES
(1, 1, 'gallery', '[\"37118.jpg\",\"97361.jpg\"]', 'Conjunto Beige', 100, 200, '150', '2024-10-31', 100, '2024-10-19', '2024-10-22 06:06:39'),
(4, 1, 'gallery', '[\"16937.jpg\",\"27778.jpg\"]', 'Conjunto Blanco', 100, 200, '150', '0000-00-00', 100, '2024-10-30', '2024-10-30 06:34:50'),
(7, 1, 'gallery', '[\"31538.jpg\",\"49732.jpg\"]', 'Conjunto Azul', 100, 200, '150', '0000-00-00', 100, '2024-11-24', '2024-11-24 03:38:24'),
(8, 3, 'gallery', '[\"88005.jpg\",\"42589.jpg\"]', 'Conjunto Blanco', 100, 200, '150', '2024-10-31', 100, '2024-10-19', '2024-11-24 04:18:42'),
(9, 3, 'gallery', '[\"84535.jpg\",\"62813.jpg\"]', 'Conjunto Beige', 100, 200, '150', '0000-00-00', 100, '2024-10-30', '2024-11-24 04:18:42'),
(10, 3, 'gallery', '[\"31538.jpg\",\"49732.jpg\"]', 'Conjunto Azul', 100, 200, '150', '0000-00-00', 100, '2024-11-24', '2024-11-24 03:38:24'),
(11, 4, 'gallery', '[\"43481.jpg\",\"93645.jpg\"]', 'Conjunto Azul', 100, 200, '150', '2024-10-31', 100, '2024-10-19', '2024-11-24 04:22:19'),
(12, 4, 'gallery', '[\"16937.jpg\",\"27778.jpg\"]', 'Conjunto Blanco', 100, 200, '150', '0000-00-00', 100, '2024-10-30', '2024-10-30 06:34:50'),
(13, 4, 'gallery', '[\"19110.jpg\",\"43268.jpg\"]', 'Conjunto Beige', 100, 200, '150', '0000-00-00', 100, '2024-11-24', '2024-11-24 04:22:19'),
(14, 5, 'gallery', '[\"58704.jpg\",\"11617.jpg\"]', 'Conjunto Beige', 100, 200, '150', '0000-00-00', 100, '2024-11-24', '2024-11-24 05:26:41'),
(15, 5, 'gallery', '[\"89557.jpg\",\"17890.jpg\"]', 'Conjunto Blanco', 100, 200, '150', '0000-00-00', 100, '2024-11-24', '2024-11-24 05:37:25'),
(16, 6, 'gallery', '[\"45046.jpg\",\"97214.jpg\"]', 'Conjunto Blanco', 100, 200, '150', '2024-10-31', 100, '2024-10-19', '2024-11-24 05:49:46'),
(17, 6, 'gallery', '[\"50139.jpg\",\"24860.jpg\"]', 'Conjunto Beige', 100, 200, '150', '0000-00-00', 100, '2024-11-24', '2024-11-24 05:49:20');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_category_product` (`id_category_product`),
  ADD KEY `id_subcategory_product` (`id_subcategory_product`);

--
-- Indices de la tabla `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id_social`);

--
-- Indices de la tabla `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id_subcategory`),
  ADD KEY `id_category_subcategory` (`id_category_subcategory`);

--
-- Indices de la tabla `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id_template`);

--
-- Indices de la tabla `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id_variant`),
  ADD KEY `id_product_variant` (`id_product_variant`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admins`
--
ALTER TABLE `admins`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `socials`
--
ALTER TABLE `socials`
  MODIFY `id_social` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id_subcategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `templates`
--
ALTER TABLE `templates`
  MODIFY `id_template` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `variants`
--
ALTER TABLE `variants`
  MODIFY `id_variant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category_product`) REFERENCES `categories` (`id_category`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`id_subcategory_product`) REFERENCES `subcategories` (`id_subcategory`);

--
-- Filtros para la tabla `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`id_category_subcategory`) REFERENCES `categories` (`id_category`);

--
-- Filtros para la tabla `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_ibfk_1` FOREIGN KEY (`id_product_variant`) REFERENCES `products` (`id_product`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
