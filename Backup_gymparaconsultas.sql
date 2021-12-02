-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 01-12-2021 a las 08:39:29
-- Versión del servidor: 5.7.34
-- Versión de PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gimnasioCodehouse`
--
DROP DATABASE IF EXISTS `gimnasioCodehouse`;
CREATE DATABASE IF NOT EXISTS `gimnasioCodehouse` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `gimnasioCodehouse`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `edad` int(2) NOT NULL,
  `genero` enum('f','m') COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_inscripcion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cuota` decimal(5,2) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `dni` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profesor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `apellidos`, `direccion`, `email`, `edad`, `genero`, `fecha_inscripcion`, `cuota`, `fecha_nacimiento`, `dni`, `profesor_id`) VALUES
(2, 'Patric', 'Organ', '965 Shopko Lane', 'porgan1@ow.ly', 21, 'm', '2016-05-24 20:00:00', '39.90', '1994-10-14', '526001763t', 2),
(3, 'Ewart', 'Standish-Brooks', 'Calle Granvia 29, 28013 Madrid', 'estandishbrooks2@google.com', 52, 'm', '2021-12-01 07:53:09', '16.90', '1960-11-20', '427150345t', 3),
(4, 'Deena', 'Quemby', '7 Almo Hill', 'dquemby3@tumblr.com', 48, 'f', '2016-11-09 22:00:00', '39.90', '2011-02-01', '245568244s', 4),
(5, 'Codi', 'Audritt', '6755 Susan Trail', 'caudritt4@bbb.org', 43, 'm', '2019-06-27 20:00:00', '39.90', '1985-12-06', '975563827p', 5),
(6, 'Cinderella', 'Trengrove', '72100 Hoffman Street', 'ctrengrove5@wordpress.org', 43, 'f', '2020-08-28 20:00:00', '16.90', '1988-06-13', '677595912p', 1),
(7, 'Teressa', 'Goracci', '73 Susan Circle', 'tgoracci6@washington.edu', 53, 'f', '2017-05-24 20:00:00', '39.90', '2018-01-26', '653498027i', 2),
(8, 'Ernst', 'Cheeke', '', 'echeeke7@bravesites.com', 21, 'f', '2021-02-17 22:00:00', '16.90', '2000-08-26', '144019769p', 3),
(9, 'Mohammed', 'Wardall', '691 Mifflin Hill', 'mwardall8@netlog.com', 35, 'm', '2018-02-06 22:00:00', '39.90', '2003-08-29', '696514621s', 4),
(10, 'Rosene', 'Brewis', '44194 Grim Lane', 'rbrewis9@wiley.com', 29, 'f', '2019-10-10 20:00:00', '39.90', '1979-01-31', '761741154u', 5),
(11, 'Orsa', 'Fentem', '783 Melrose Road', 'ofentema@nbcnews.com', 43, 'f', '2018-08-05 20:00:00', '16.90', '1974-02-22', '714119403u', 11),
(12, 'Clarabelle', 'Laurie', '43308 Sugar Court', 'claurieb@cdc.gov', 54, 'f', '2019-12-10 22:00:00', '16.90', '1980-06-30', '679023157s', 12),
(13, 'Erie', 'Thurman', '307 Forest Run Parkway', '', 75, 'm', '2018-01-03 22:00:00', '39.90', '1979-09-16', '985575453j', 13),
(14, 'Desmund', 'Oxtiby', '2 Hermina Trail', 'doxtibyd@weibo.com', 41, 'm', '2017-01-25 22:00:00', '16.90', '1981-03-08', '514585691g', 14),
(15, 'Wilmar', 'Jupe', '7043 Tennyson Plaza', 'wjupee@vk.com', 65, 'm', '2017-06-07 20:00:00', '39.90', '1999-05-08', '806409735y', 15),
(16, 'Linnell', 'Trunchion', '070 Orin Way', 'ltrunchionf@intel.com', 54, 'f', '2018-07-06 20:00:00', '16.90', '1984-06-07', '734777413k', 16),
(17, 'Bengt', 'Meconi', '99805 Northwestern Avenue', 'bmeconig@bluehost.com', 59, 'm', '2020-06-08 20:00:00', '16.90', '1986-07-25', '127523425m', 17),
(18, 'Almire', 'Ascroft', '063 Waubesa Crossing', 'aascrofth@soup.io', 47, 'f', '2020-02-24 22:00:00', '16.90', '2010-01-21', '929710951u', 18),
(19, 'Pearl', 'Slowgrave', '8 Ilene Place', 'wslowgravei@wikimedia.org', 20, 'f', '2019-08-10 20:00:00', '39.90', '1971-08-09', '483308551s', 19),
(20, 'Gray', 'Baxstar', '07 Rowland Pass', 'gbaxstarj@samsung.com', 57, 'f', '2017-06-26 20:00:00', '16.90', '1972-05-02', '502143356n', 20),
(21, 'Sylvester', 'Batecok', '5 Helena Terrace', 'sbatecokk@imageshack.us', 28, 'm', '2021-04-09 20:00:00', '16.90', '2017-04-28', '309632997g', 21),
(22, 'Lula', 'O\'Henecan', '8339 Erie Park', 'lohenecanl@histats.com', 71, 'f', '2017-11-27 22:00:00', '16.90', '1965-01-16', '142913706n', 22),
(23, 'Laney', 'McCamish', '0 2nd Point', 'lmccamishm@last.fm', 64, 'm', '2019-06-30 20:00:00', '39.90', '1995-02-14', '352893494r', 5),
(24, 'Dorey', 'Goggen', '9590 Village Terrace', 'dgoggenn@tmall.com', 40, 'f', '2017-10-16 20:00:00', '16.90', '1972-05-02', '529183263d', 24),
(25, 'Ennis', 'Geare', '33662 Talisman Crossing', 'egeareo@free.fr', 54, 'm', '2017-08-24 20:00:00', '39.90', '1961-12-11', '976916926z', 25),
(26, 'Gilemette', 'Quinnette', '3374 Debra Street', 'gquinnettep@4shared.com', 27, 'f', '2016-12-11 22:00:00', '39.90', '1973-09-12', '646998403s', 26),
(27, 'Carolan', 'Harber', '', 'charberq@tripod.com', 26, 'f', '2020-04-25 20:00:00', '16.90', '2003-07-31', '759950979n', 5),
(28, 'Pearl', 'Wartnaby', '444 Oneill Drive', 'dwartnabyr@theguardian.com', 71, 'f', '2020-01-27 22:00:00', '39.90', '1986-01-29', '371217632h', 28),
(29, 'Joycelin', 'Sacker', '50 Declaration Place', 'jsackers@aol.com', 56, 'f', '2019-07-03 20:00:00', '16.90', '1969-01-09', '051159619k', 29),
(30, 'Gareth', 'Draysay', '6831 Di Loreto Avenue', 'gdraysayt@eepurl.com', 50, 'm', '2020-07-13 20:00:00', '16.90', '1968-08-11', '345816750b', 30),
(31, 'Ringo', 'Clem', '9 Monica Place', 'rclemu@tinyurl.com', 32, 'm', '2018-07-19 20:00:00', '39.90', '1960-07-07', '427000097e', 5),
(32, 'Bruis', 'Iacovielli', '9 Del Mar Park', 'biacovielliv@hao123.com', 43, 'm', '2020-05-22 20:00:00', '16.90', '2005-12-19', '765409381l', 32),
(33, 'Wenonah', 'Roubay', '09 Jenna Trail', 'wroubayw@digg.com', 47, 'f', '2021-02-06 22:00:00', '39.90', '1975-11-25', '192860146e', 33),
(34, 'Anabelle', 'Geldart', '7958 Spenser Circle', 'ageldartx@ebay.com', 31, 'f', '2017-11-15 22:00:00', '16.90', '2016-09-23', '828823923o', 5),
(35, 'Floris', 'Thecham', '6692 Sutherland Center', 'fthechamy@cocolog-nifty.com', 72, 'f', '2018-04-18 20:00:00', '16.90', '2007-07-26', '420772216j', 5),
(36, 'Carola', 'Rosenblath', '99 Thackeray Place', 'crosenblathz@cbslocal.com', 26, 'f', '2018-02-01 22:00:00', '16.90', '1969-03-15', '503229277x', 36),
(37, 'Katuscha', 'Crannach', '2 Stephen Park', 'kcrannach10@mozilla.org', 39, 'f', '2016-07-30 20:00:00', '39.90', '2002-02-16', '596891627f', 37),
(38, 'Carlyn', 'Shillan', '2370 Cody Avenue', 'cshillan11@ocn.ne.jp', 50, 'f', '2020-02-27 22:00:00', '39.90', '2011-03-03', '745648620s', 5),
(39, 'Ramon', 'Hirtz', '5999 Sunfield Pass', 'rhirtz12@wiley.com', 29, 'm', '2018-06-15 20:00:00', '39.90', '1975-10-23', '715202972y', 39),
(40, 'Budd', 'Blacklock', '42647 Thackeray Hill', 'bblacklock13@livejournal.com', 75, 'm', '2020-05-18 20:00:00', '39.90', '2002-08-27', '385077906p', 40),
(41, 'Gerrie', 'Hatherall', '45 Stephen Trail', 'ghatherall14@geocities.jp', 42, 'f', '2017-11-03 22:00:00', '39.90', '2021-04-30', '804718072l', 12),
(42, 'Vernor', 'McKnockiter', '1834 Judy Alley', 'vmcknockiter15@elegantthemes.com', 73, 'm', '2019-08-21 20:00:00', '39.90', '1980-06-24', '354095136u', 12),
(43, 'Reba', 'Guisler', '2 Farmco Alley', 'rguisler16@51.la', 54, 'f', '2018-08-22 20:00:00', '39.90', '2013-11-17', '981013381y', 12),
(44, 'Tatum', 'Hansemann', '66 Nevada Point', 'thansemann17@webnode.com', 43, 'f', '2020-10-13 20:00:00', '39.90', '1981-05-09', '834462241a', 21),
(45, 'Leodora', 'Lightwing', '3 Oakridge Trail', 'llightwing18@is.gd', 42, 'f', '2019-03-18 22:00:00', '16.90', '2007-09-21', '200550262a', 45),
(46, 'Nolan', 'Lovekin', '72 Prairieview Center', 'nlovekin19@printfriendly.com', 72, 'm', '2020-11-23 22:00:00', '16.90', '1977-12-16', '176552537h', 46),
(47, 'Ferdie', 'Haston', '03610 Lillian Circle', 'fhas_ton1a@slideshare.net', 74, 'm', '2016-07-17 20:00:00', '16.90', '1998-04-04', '518179291c', 5),
(48, 'Eugene', 'Gough', '4399 Westend Center', 'egough1b@ucoz.com', 66, 'm', '2016-08-18 20:00:00', '16.90', '1989-09-23', '504005780m', 12),
(49, 'Clemente', 'Olifaunt', '51 Northwestern Point', 'colifaunt1c@blogspot.com', 59, 'm', '2019-02-19 22:00:00', '16.90', '1996-11-09', '288949468d', 49),
(50, 'Kain', 'Woolward', '32 Prairieview Avenue', 'kwoolward1d@dion.ne.jp', 55, 'm', '2017-01-29 22:00:00', '16.90', '2015-11-25', '751493176d', 12),
(51, 'Kristi', 'Bohman', '54 Westend Way', 'kbohman1e@soundcloud.com', 60, 'f', '2019-06-18 20:00:00', '39.90', '1968-07-31', '769702894p', 5),
(52, 'Luisa', 'Laverock', '8066 Center Lane', 'llaverock1f@github.com', 23, 'f', '2019-06-26 20:00:00', '16.90', '1980-07-17', '324270299i', 52),
(53, 'Marsh', 'Noulton', '58 Graceland Trail', 'mnoulton1g@nsw.gov.au', 63, 'm', '2019-07-14 20:00:00', '39.90', '2016-08-06', '128265610c', 53),
(54, 'Hill', 'Danielli', '56 Thackeray Hill', 'hdanielli1h@tmall.com', 45, 'm', '2017-10-04 20:00:00', '16.90', '2014-07-18', '202792381t', 5),
(55, 'Osbert', 'Carverhill', '0277 Darwin Park', 'ocarverhill1i@baidu.com', 64, 'm', '2019-07-09 20:00:00', '16.90', '1977-02-08', '349918153e', 55),
(56, 'Merell', 'Vasovic', '69384 Dakota Way', 'mva_sovic1j@alexa.com', 25, 'm', '2017-04-13 20:00:00', '39.90', '1998-04-17', '634812216t', 56),
(57, 'Ollie', 'Darben', '36 Bowman Parkway', 'odarben1k@webeden.co.uk', 33, 'm', '2017-07-28 20:00:00', '39.90', '2005-11-27', '864265129p', 57),
(58, 'Shae', 'Anfossi', '0223 Schurz Drive', 'sanfossi1l@de.vu', 67, 'f', '2018-11-17 22:00:00', '39.90', '2006-02-21', '364951093x', 58),
(59, 'Rafe', 'Durand', '65614 Mesta Road', 'rdur_and1m@gravatar.com', 33, 'm', '2017-04-17 20:00:00', '16.90', '1995-07-02', '027308983p', 59),
(60, 'Gail', 'Jollie', '95238 Dunning Avenue', 'gjollie1n@nhs.uk', 23, 'f', '2018-07-01 20:00:00', '39.90', '1983-12-30', '778580916m', 60),
(61, 'Carolann', 'Mandal', '57 Cascade Hill', 'cmandal1o@salon.com', 20, 'f', '2017-02-15 22:00:00', '16.90', '1985-09-23', '165247107d', 61),
(62, 'Garrett', 'Catcherside', '2 Harbort Junction', 'gcatcherside1p@simplemachines.org', 53, 'm', '2019-07-18 20:00:00', '16.90', '2017-04-07', '011992113w', 62),
(63, 'Diena', 'Josilevich', '5 1st Drive', 'djosilevich1q@prnewswire.com', 64, 'f', '2019-07-21 20:00:00', '16.90', '2007-08-19', '072849552p', 63),
(64, 'Lemar', 'Allon', '657 Green Alley', 'lallon1r@tripod.com', 66, 'm', '2020-10-16 20:00:00', '16.90', '2004-03-09', '924040156g', 64),
(65, 'Adamo', 'Ubsdell', '9211 Lyons Alley', 'aubsdell1s@yahoo.com', 60, 'm', '2020-07-11 20:00:00', '16.90', '1995-04-23', '017694183p', 65),
(66, 'Ania', 'Earney', '934 Luster Junction', 'aearney1t@ftc.gov', 38, 'f', '2018-12-18 22:00:00', '16.90', '1963-11-02', '331802559x', 66),
(67, 'Corabel', 'Headford', '52 Nelson Park', 'cheadford1u@zimbio.com', 46, 'f', '2019-12-06 22:00:00', '39.90', '2020-10-28', '581918306f', 67),
(68, 'Jerrilee', 'Hallyburton', '28347 Northview Hill', 'jhallyburton1v@chicagotribune.com', 37, 'f', '2016-08-20 20:00:00', '16.90', '1973-01-01', '772482388j', 68),
(69, 'Barde', 'Schoular', '6030 Fair Oaks Pass', 'bschoular1w@nydailynews.com', 38, 'm', '2019-04-03 20:00:00', '16.90', '2013-03-26', '906767526x', 69),
(70, 'Horten', 'Frere', '38870 Johnson Terrace', 'hfrere1x@360.cn', 47, 'm', '2017-11-10 22:00:00', '39.90', '2020-09-23', '180702013m', 70),
(71, 'Sherman', 'Feathers', '4579 Charing Cross Center', 'sfeathers1y@tmall.com', 24, 'm', '2016-10-30 22:00:00', '16.90', '1966-05-12', '992249436x', 71),
(72, 'Haydon', 'Coger', '50 Arapahoe Plaza', 'hcoger1z@economist.com', 66, 'm', '2019-12-15 22:00:00', '16.90', '1999-04-09', '659987726y', 72),
(73, 'Minne', 'Crass', '2043 Continental Parkway', 'mcrass20@hexun.com', 34, 'f', '2016-07-24 20:00:00', '16.90', '2005-11-29', '639738852a', 5),
(74, 'Asa', 'Duffell', '43625 Lyons Circle', 'aduffell21@seesaa.net', 72, 'm', '2016-08-20 20:00:00', '39.90', '2020-11-17', '477849554u', 74),
(75, 'Jonathon', 'Slater', '596 Almo Lane', 'jslater22@pen.io', 67, 'm', '2019-09-08 20:00:00', '39.90', '1962-01-15', '822574866q', 75),
(76, 'Meriel', 'Fowells', '9608 Corben Circle', 'mfowells23@so-net.ne.jp', 43, 'f', '2019-09-27 20:00:00', '16.90', '1974-05-01', '045533860x', 76),
(77, 'Kaine', 'MacKenzie', '48434 Southridge Road', 'kmackenzie24@amazon.co.jp', 32, 'm', '2018-03-14 22:00:00', '16.90', '2014-12-07', '015939865a', 77),
(78, 'Ellynn', 'Girsch', '9 Packers Trail', 'egirsch25@chronoengine.com', 66, 'f', '2018-05-18 20:00:00', '39.90', '2015-07-20', '429646041m', 5),
(79, 'Justin', 'Hazle', '065 Manufacturers Crossing', 'jhazle26@wufoo.com', 69, 'm', '2021-01-12 22:00:00', '16.90', '1969-05-07', '621700496a', 2),
(80, 'Witty', 'Franchi', '80124 Milwaukee Road', 'wfranchi27@squarespace.com', 39, 'm', '2019-10-14 20:00:00', '16.90', '2010-08-23', '006967227v', 3),
(81, 'Larisa', 'Hallibone', '56 2nd Court', 'lhallibone28@accuweather.com', 34, 'f', '2016-08-18 20:00:00', '16.90', '1974-02-14', '732850555u', 81),
(82, 'Virginia', 'Jerzak', '635 5th Parkway', 'vjerzak29@webeden.co.uk', 32, 'f', '2020-07-29 20:00:00', '16.90', '2017-10-19', '069127182v', 5),
(83, 'Odille', 'Rosbrough', '2018 Victoria Parkway', 'orosbrough2a@unesco.org', 68, 'f', '2016-08-07 20:00:00', '39.90', '1981-06-15', '939805619x', 83),
(84, 'Noell', 'Francescozzi', '461 Algoma Plaza', 'nfrancescozzi2b@zdnet.com', 52, 'f', '2018-07-25 20:00:00', '16.90', '1971-10-17', '103165319y', 84),
(85, 'Lonee', 'Vautre', '41 Kipling Court', 'lvautre2c@jiathis.com', 53, 'f', '2019-10-13 20:00:00', '39.90', '1968-09-11', '216724920j', 85),
(86, 'Renell', 'Kerrigan', '17 Hanson Street', 'rkerrigan2d@sohu.com', 25, 'f', '2018-02-03 22:00:00', '39.90', '1967-05-14', '803333355z', 86),
(87, 'Hale', 'Sinfield', '07 Carey Crossing', 'hsinfield2e@dmoz.org', 59, 'm', '2018-10-21 20:00:00', '16.90', '1987-01-15', '020193739r', 5),
(88, 'Drew', 'Holywell', '70614 Thackeray Place', 'dholywell2f@tumblr.com', 60, 'm', '2021-04-30 20:00:00', '16.90', '2019-02-18', '077660129y', 88),
(89, 'Damita', 'Daviddi', '975 Amoth Hill', 'ddaviddi2g@smugmug.com', 55, 'f', '2020-11-24 22:00:00', '39.90', '1964-08-20', '821047555n', 89),
(90, 'Peta', 'Topping', '334 Larry Junction', 'ptopping2h@economist.com', 32, 'f', '2020-09-12 20:00:00', '16.90', '1988-03-03', '868317926z', 5),
(91, 'Curt', 'Cleator', '514 Little Fleur Hill', 'ccleator2i@nba.com', 61, 'm', '2021-03-07 22:00:00', '16.90', '1991-11-03', '402621604k', 91),
(92, 'Alexis', 'Patinkin', '62049 Morningstar Place', 'apatinkin2j@vinaora.com', 32, 'm', '2020-10-19 20:00:00', '16.90', '2004-05-31', '388188251p', 92),
(93, 'Caroline', 'Isworth', '910 Utah Park', 'cisworth2k@house.gov', 69, 'f', '2019-02-18 22:00:00', '16.90', '1992-12-19', '774477014z', 93),
(94, 'Flemming', 'Churchley', '129 Kipling Park', 'fchurchley2l@forbes.com', 50, 'm', '2018-07-18 20:00:00', '39.90', '2000-12-09', '010547249m', 94),
(95, 'Rafferty', 'Dauncey', '05 Laurel Hill', 'rdauncey2m@vimeo.com', 33, 'm', '2016-05-26 20:00:00', '16.90', '1973-11-06', '242747140l', 95),
(96, 'Noelani', 'Ritson', '444 Hansons Alley', 'nritson2n@bloglovin.com', 71, 'f', '2018-07-11 20:00:00', '39.90', '2002-03-17', '792405952j', 5),
(97, 'Elisha', 'Lias', '91642 Welch Point', 'elias2o@elpais.com', 51, 'm', '2019-10-05 20:00:00', '16.90', '1992-08-06', '542210764a', 5),
(98, 'Rudie', 'McLeod', '05 Fairview Avenue', 'rmcleod2p@state.tx.us', 67, 'm', '2019-07-19 20:00:00', '39.90', '1976-03-15', '109456596r', 5),
(99, 'Nikolas', 'Charlick', '74723 Clove Way', 'ncharlick2q@globo.com', 62, 'm', '2019-10-16 20:00:00', '16.90', '1976-08-08', '818521105u', 5),
(100, 'Ricca', 'Beveredge', '9 Talisman Crossing', 'rbeveredge2r@tamu.edu', 60, 'f', '2021-03-04 22:00:00', '39.90', '1974-08-19', '485706377o', 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicios`
--

DROP TABLE IF EXISTS `ejercicios`;
CREATE TABLE `ejercicios` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ejercicios`
--

INSERT INTO `ejercicios` (`id`, `titulo`) VALUES
(1, 'dominadas'),
(2, 'pesas'),
(3, 'cinta correr'),
(4, 'eliptica'),
(6, 'abdominales'),
(7, 'flexiones'),
(8, 'spinning'),
(9, 'hit'),
(10, 'natacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

DROP TABLE IF EXISTS `profesores`;
CREATE TABLE `profesores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `experiencia` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`id`, `nombre`, `experiencia`) VALUES
(1, 'José', 4),
(2, 'Glenna Shepherd', 19),
(3, 'Tamara Solomon', 16),
(4, 'Isabelle Rowe', 13),
(5, 'Nora Contreras', 14),
(6, 'Bryar Simon', 7),
(7, 'Hu Buck', 16),
(8, 'Dolan Shannon', 12),
(9, 'Theodore Ballard', 20),
(10, 'Amela Gill', 6),
(11, 'Christen Gibbs', 11),
(12, 'Dexter Sutton', 12),
(13, 'Ezekiel Kidd', 10),
(14, 'Fulton Carrillo', 5),
(15, 'Deacon Le', 14),
(16, 'Forrest Potts', 13),
(17, 'Cooper Richardson', 5),
(18, 'Ulric Hall', 10),
(19, 'Lane Hammond', 9),
(20, 'Troy Frye', 8),
(21, 'Prescott Mendoza', 9),
(22, 'Nina Wells', 12),
(23, 'Adrienne Johns', 7),
(24, 'Thomas Hurley', 7),
(25, 'Harlan Mccullough', 11),
(26, 'Anne Wilkins', 16),
(27, 'Carissa Moon', 11),
(28, 'Cheyenne Sharp', 9),
(29, 'Ria Stout', 18),
(30, 'Zena Buckner', 7),
(31, 'McKenzie Cooley', 2),
(32, 'Halla Alexander', 19),
(33, 'Lysandra Robles', 18),
(34, 'Sloane Sheppard', 18),
(35, 'Upton Blackwell', 19),
(36, 'Hanae Gutierrez', 3),
(37, 'Jolene Martin', 2),
(38, 'Paloma Mcdonald', 17),
(39, 'Cadman Cochran', 9),
(40, 'Francis Kelley', 7),
(41, 'Kasimir Montgomery', 15),
(42, 'Laurel Lee', 14),
(43, 'Lane Adkins', 7),
(44, 'Carol Mccullough', 19),
(45, 'Shad Strong', 5),
(46, 'Austin Foster', 7),
(47, 'Daquan Watkins', 20),
(48, 'Knox Mitchell', 16),
(49, 'Alfonso Blair', 7),
(50, 'Phoebe Collier', 3),
(51, 'Joshua Young', 8),
(52, 'Anthony Williams', 5),
(53, 'Otto Lewis', 12),
(54, 'Jesse Vance', 20),
(55, 'Robert Burch', 11),
(56, 'Kato Fowler', 13),
(57, 'Megan Wyatt', 13),
(58, 'Zia Garza', 15),
(59, 'Nash Howe', 2),
(60, 'Edan Odom', 15),
(61, 'Tanner Little', 19),
(62, 'Chester Workman', 17),
(63, 'Barrett Rojas', 19),
(64, 'Dai Mack', 2),
(65, 'Jamal Mckinney', 2),
(66, 'Anthony Bradley', 7),
(67, 'Thor Frye', 4),
(68, 'Nehru Hoover', 19),
(69, 'Natalie Hopkins', 18),
(70, 'Elton Cross', 19),
(71, 'Lenore Cooke', 10),
(72, 'Maia Castillo', 12),
(73, 'Kaye Vinson', 14),
(74, 'Keiko Duffy', 3),
(75, 'Patience Clark', 7),
(76, 'Flavia Schwartz', 13),
(77, 'Kitra Bruce', 15),
(79, 'Camden Cunningham', 2),
(80, 'Germaine Martin', 5),
(81, 'Carl Finley', 18),
(82, 'Desirae Powell', 12),
(83, 'Nolan Clarke', 15),
(84, 'Bruno Guy', 2),
(85, 'Knox Mullins', 18),
(86, 'Micah Shepard', 9),
(87, 'Sheila Wooten', 5),
(88, 'Jasmine Stuart', 9),
(89, 'Edan Walsh', 5),
(90, 'Keegan Galloway', 7),
(91, 'Rina Griffin', 18),
(92, 'Heidi Richmond', 3),
(93, 'Rajah Snow', 7),
(94, 'Daria Baldwin', 8),
(95, 'Rose Stout', 14),
(96, 'Phelan Miles', 11),
(97, 'Emerald Baxter', 14),
(98, 'Ori Bell', 14),
(99, 'Ashton Cline', 11),
(100, 'Meredith Herman', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbi_clientes_ejercicios`
--

DROP TABLE IF EXISTS `tbi_clientes_ejercicios`;
CREATE TABLE `tbi_clientes_ejercicios` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `ejercicio_id` int(11) NOT NULL,
  `repeticiones` int(2) NOT NULL,
  `minutos` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbi_clientes_ejercicios`
--

INSERT INTO `tbi_clientes_ejercicios` (`id`, `cliente_id`, `ejercicio_id`, `repeticiones`, `minutos`) VALUES
(1, 46, 9, 89, '00:33:36'),
(2, 46, 6, 80, '00:52:41'),
(3, 43, 10, 60, '00:09:37'),
(4, 42, 3, 10, '00:34:36'),
(5, 34, 4, 64, '00:25:18'),
(6, 8, 7, 74, '00:51:00'),
(7, 46, 7, 10, '00:04:33'),
(8, 32, 1, 20, '00:19:51'),
(10, 28, 8, 61, '00:34:32'),
(13, 16, 7, 70, '00:02:05');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_clientes_profesores1_idx` (`profesor_id`);

--
-- Indices de la tabla `ejercicios`
--
ALTER TABLE `ejercicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbi_clientes_ejercicios`
--
ALTER TABLE `tbi_clientes_ejercicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_clientes_has_ejercicicios_ejercicicios1_idx` (`ejercicio_id`),
  ADD KEY `fk_clientes_has_ejercicicios_clientes_idx` (`cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `ejercicios`
--
ALTER TABLE `ejercicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `tbi_clientes_ejercicios`
--
ALTER TABLE `tbi_clientes_ejercicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_clientes_profesores1` FOREIGN KEY (`profesor_id`) REFERENCES `profesores` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Filtros para la tabla `tbi_clientes_ejercicios`
--
ALTER TABLE `tbi_clientes_ejercicios`
  ADD CONSTRAINT `fk_clientes_has_ejercicicios_clientes` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_clientes_has_ejercicicios_ejercicicios1` FOREIGN KEY (`ejercicio_id`) REFERENCES `ejercicios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
