-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-09-2024 a las 23:35:35
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
(1, 'admin', 'Jose Tienda', 'admin@ecommerce.com', '$2a$07$azybxcags23425sdg23sdeanQZqjaf6Birm2NvcYTNtJw24CsO5uq', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3MjcxMTE3NjUsImV4cCI6MTcyNzE5ODE2NSwiZGF0YSI6eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBlY29tbWVyY2UuY29tIn19.GwKNFdejACEvCcpfBYs7jFVbKUdEWrnSYE6SPEdLDTU', '1727198165', '2024-09-01', '2024-09-23 17:16:05');

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
(13, 'Cursos', 'cursos', 'fas fa-graduation-cap', 'cursos.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu massa non ex vulputate congue. Nulla dui ligula, aliquet eget dui nec, vehicula consectetur nibh.', 'cursos,tutorias,enseñanzas,virtualidad', 0, 0, 0, 1, '2024-09-23', '2024-09-23 20:52:14'),
(14, 'Tecnología', 'tecnologia', 'fas fa-laptop', 'tecnologia.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu massa non ex vulputate congue. Nulla dui ligula, aliquet eget dui nec, vehicula consectetur nibh.', 'pc,portatil,ordenador,servidor', 0, 0, 0, 1, '2024-09-23', '2024-09-23 20:52:45'),
(15, 'Calzado', 'calzado', 'fas fa-shoe-prints', 'calzado.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu massa non ex vulputate congue. Nulla dui ligula, aliquet eget dui nec, vehicula consectetur nibh.', 'calzado,tennis,chanclas,sandalias', 0, 0, 0, 1, '2024-09-23', '2024-09-23 20:53:21'),
(16, 'Ropa', 'ropa', 'fas fa-tshirt', 'ropa.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu massa non ex vulputate congue. Nulla dui ligula, aliquet eget dui nec, vehicula consectetur nibh.', 'ropa,camisas,pantalones,blusas,faldas', 0, 0, 0, 1, '2024-09-23', '2024-09-23 20:53:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `id_category_product` int(11) NOT NULL DEFAULT 0,
  `id_subcategory_product` int(11) NOT NULL DEFAULT 0,
  `name_product` text DEFAULT NULL,
  `date_created_product` date DEFAULT NULL,
  `date_updated_product` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
(2, 14, 'Télefonos Móvil', 'telefonos-movil', 'telefonos-movil.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu massa non ex vulputate congue. Nulla dui ligula, aliquet eget dui nec, vehicula consectetur nibh.', 'tecnologia,lorem,ipsum', 0, 0, 1, '2024-09-23', '2024-09-23 20:54:38'),
(3, 14, 'Tabletas Electrónicas', 'tabletas-electronicas', 'tabletas-electronicas.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu massa non ex vulputate congue. Nulla dui ligula, aliquet eget dui nec, vehicula consectetur nibh.', 'tecnologia,lorem,ipsum', 0, 0, 1, '2024-09-23', '2024-09-23 20:55:07'),
(4, 14, 'Computadoras', 'computadoras', 'computadoras.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu massa non ex vulputate congue. Nulla dui ligula, aliquet eget dui nec, vehicula consectetur nibh.', 'tecnologia,lorem,ipsum', 0, 0, 1, '2024-09-23', '2024-09-23 20:55:28'),
(5, 14, 'Auriculares', 'auriculares', 'auriculares.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu massa non ex vulputate congue. Nulla dui ligula, aliquet eget dui nec, vehicula consectetur nibh.', 'tecnologia,lorem,ipsum', 0, 0, 1, '2024-09-23', '2024-09-23 20:55:53'),
(6, 13, 'Desarrollo Web', 'desarrollo-web', 'desarrollo-web.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu massa non ex vulputate congue. Nulla dui ligula, aliquet eget dui nec, vehicula consectetur nibh.', 'cursos,lorem,ipsum', 0, 0, 1, '2024-09-23', '2024-09-23 20:56:57'),
(7, 13, 'Aplicaciones Móviles', 'aplicaciones-moviles', 'aplicaciones-moviles.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu massa non ex vulputate congue. Nulla dui ligula, aliquet eget dui nec, vehicula consectetur nibh.', 'cursos,lorem,ipsum', 0, 0, 1, '2024-09-23', '2024-09-23 20:57:37'),
(8, 13, 'Diseño Gráfico', 'diseno-grafico', 'diseno-grafico.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu massa non ex vulputate congue. Nulla dui ligula, aliquet eget dui nec, vehicula consectetur nibh.', 'cursos,lorem,ipsum', 0, 0, 1, '2024-09-23', '2024-09-23 20:58:05'),
(9, 13, 'Marketing Digital', 'marketing-digital', 'marketing-digital.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu massa non ex vulputate congue. Nulla dui ligula, aliquet eget dui nec, vehicula consectetur nibh.', 'cursos,lorem,ipsum', 0, 0, 1, '2024-09-23', '2024-09-23 20:58:28'),
(10, 16, 'Ropa Para Dama', 'ropa-para-dama', 'ropa-para-dama.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu massa non ex vulputate congue. Nulla dui ligula, aliquet eget dui nec, vehicula consectetur nibh.', 'ropa,lorem,ipsum', 0, 0, 1, '2024-09-23', '2024-09-23 20:59:22'),
(11, 16, 'Ropa Para Hombre', 'ropa-para-hombre', 'ropa-para-hombre.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu massa non ex vulputate congue. Nulla dui ligula, aliquet eget dui nec, vehicula consectetur nibh.', 'ropa,lorem,ipsum', 0, 0, 1, '2024-09-23', '2024-09-23 20:59:47'),
(12, 16, 'Ropa Deportiva', 'ropa-deportiva', 'ropa-deportiva.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu massa non ex vulputate congue. Nulla dui ligula, aliquet eget dui nec, vehicula consectetur nibh.', 'ropa,lorem,ipsum', 0, 0, 1, '2024-09-23', '2024-09-23 21:00:06'),
(13, 16, 'Ropa Infantil', 'ropa-infantil', 'ropa-infantil.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu massa non ex vulputate congue. Nulla dui ligula, aliquet eget dui nec, vehicula consectetur nibh.', 'ropa,lorem,ipsum', 0, 0, 1, '2024-09-23', '2024-09-23 21:00:31'),
(14, 15, 'Calzado Para Dama', 'calzado-para-dama', 'calzado-para-dama.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu massa non ex vulputate congue. Nulla dui ligula, aliquet eget dui nec, vehicula consectetur nibh.', 'calzado,lorem,ipsum', 0, 0, 1, '2024-09-23', '2024-09-23 21:01:10'),
(15, 15, 'Calzado Para Hombre', 'calzado-para-hombre', 'calzado-para-hombre.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu massa non ex vulputate congue. Nulla dui ligula, aliquet eget dui nec, vehicula consectetur nibh.', 'calzado,lorem,ipsum', 0, 0, 1, '2024-09-23', '2024-09-23 21:01:36'),
(16, 15, 'Calzado Deportivo', 'calzado-deportivo', 'calzado-deportivo.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu massa non ex vulputate congue. Nulla dui ligula, aliquet eget dui nec, vehicula consectetur nibh.', 'calzado,lorem,ipsum', 0, 0, 1, '2024-09-23', '2024-09-23 21:01:58'),
(17, 15, 'Calzado Infantil', 'calzado-infantil', 'calzado-infantil.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu massa non ex vulputate congue. Nulla dui ligula, aliquet eget dui nec, vehicula consectetur nibh.', 'calzado,lorem,ipsum', 0, 0, 1, '2024-09-23', '2024-09-23 21:15:47');

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
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT;

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
