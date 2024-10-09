-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-10-2024 a las 06:56:04
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
(1, 'admin', 'Jose Tienda', 'admin@ecommerce.com', '$2a$07$azybxcags23425sdg23sdeanQZqjaf6Birm2NvcYTNtJw24CsO5uq', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3Mjg0NDY4NjYsImV4cCI6MTcyODUzMzI2NiwiZGF0YSI6eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBlY29tbWVyY2UuY29tIn19.V4PMDIVWRMV-fvAQDqgENaEqgDlmpoAsIB3tz1QaUoI', '1728533266', '2024-09-01', '2024-10-09 04:07:46');

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
(1, 'Ropa', 'ropa', 'fas fa-tshirt', 'ropa.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'ropa,camisas,pantalones,blusas,faldas', 4, 1, 0, 1, '2024-09-30', '2024-10-09 04:48:13'),
(2, 'Calzado', 'calzado', 'fas fa-shoe-prints', 'calzado.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'calzado,tennis,chanclas,sandalias', 4, 0, 0, 1, '2024-09-30', '2024-09-30 22:37:44'),
(3, 'Tecnología', 'tecnologia', 'fas fa-laptop', 'tecnologia.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'pc,portatil,ordenador,servidor', 4, 0, 0, 1, '2024-09-30', '2024-09-30 20:36:15'),
(4, 'Cursos', 'cursos', 'fas fa-graduation-cap', 'cursos.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'cursos,tutorias,enseñanzas,virtualidad', 5, 0, 0, 1, '2024-09-30', '2024-10-06 18:56:23');

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
(1, 1, 1, 'Conjunto 1 Ropa Dama 1', 'conjunto-1-ropa-dama-1', 'conjunto-1-ropa-dama-1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'ropa,dama,lorem,ipsum', '<p><img src=\"/views/assets/css/plugins/summernote/img/blank.gif\" class=\"img\" style=\"display:inline-block;width:25px;height:25px;background:url(\'/views/assets/css/plugins/summernote/img/emoji_spritesheet_0.png\') -250px -150px no-repeat;background-size:675px 175px;\" alt=\":heart:\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc nec viverra leo. Nullam mollis orci ante, gravida vestibulum diam rhoncus at. Donec viverra suscipit lobortis.</span><img src=\"/views/assets/css/plugins/summernote/img/blank.gif\" class=\"img\" style=\"display:inline-block;width:25px;height:25px;background:url(\'/views/assets/css/plugins/summernote/img/emoji_spritesheet_0.png\') -75px -75px no-repeat;background-size:675px 175px;\" alt=\":see_no_evil:\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"> </span></p><p><img src=\"/views/assets/img/temp/6593501123.jpg\" style=\"width: 100%;\" class=\"img-fluid\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><b>Vivamus tristique tincidunt nulla, sed accumsan purus pellentesque eget. Sed blandit est a blandit ullamcorper. Duis ut felis sit amet lacus ullamcorper commodo nec non elit. </b></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span></p><p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Suspendisse tempor erat sed risus consequat, sit amet consectetur magna vehicula. Nam nec mauris eu nisl facilisis lobortis consectetur at tellus. Integer non eleifend massa.</span>                                                                                                                                                                            </p>', 0, 1, '2024-10-01', '2024-10-09 04:48:12');

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
(1, 1, 'Ropa Para Dama', 'ropa-para-dama', 'ropa-para-dama.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'ropa,lorem,ipsum', 1, 0, 1, '2024-09-30', '2024-10-09 04:48:13'),
(2, 1, 'Ropa Para Hombre', 'ropa-para-hombre', 'ropa-para-hombre.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'ropa,lorem,ipsum', 0, 0, 1, '2024-09-30', '2024-09-30 20:30:14'),
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
(13, 4, 'Desarrollo Web', 'desarrollo-web', 'desarrollo-web.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet erat quis varius finibus. Maecenas dignissim maximus ligula ac dignissim. Maecenas ac ex at ipsum ultricies pulvinar.', 'cursos,lorem,ipsum', 0, 0, 1, '2024-09-30', '2024-09-30 20:37:56'),
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
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
