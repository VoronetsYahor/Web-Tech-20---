-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               8.0.19 - MySQL Community Server - GPL
-- Операционная система:         Win64
-- HeidiSQL Версия:              11.0.0.5958
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных carrent
CREATE DATABASE IF NOT EXISTS `carrent` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `carrent`;

-- Дамп структуры для таблица carrent.emulatebank
CREATE TABLE IF NOT EXISTS `emulatebank` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `money` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `userMoney_FK` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы carrent.emulatebank: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `emulatebank` DISABLE KEYS */;
/*!40000 ALTER TABLE `emulatebank` ENABLE KEYS */;

-- Дамп структуры для таблица carrent.penalty_ticket
CREATE TABLE IF NOT EXISTS `penalty_ticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticket_Id` int NOT NULL,
  `user_id` int NOT NULL,
  `admin_id` int NOT NULL,
  `vehicle_id` int NOT NULL,
  `description` varchar(256) NOT NULL DEFAULT '',
  `cost` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `penaltyUser_FK` (`user_id`),
  KEY `penaltyAdmin_FK` (`admin_id`),
  KEY `penaltyVehicle_FK` (`vehicle_id`),
  KEY `penaltyTicket_FK` (`ticket_Id`),
  CONSTRAINT `penaltyAdmin_FK` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  CONSTRAINT `penaltyTicket_FK` FOREIGN KEY (`ticket_Id`) REFERENCES `tickets` (`id`),
  CONSTRAINT `penaltyUser_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `penaltyVehicle_FK` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы carrent.penalty_ticket: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `penalty_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `penalty_ticket` ENABLE KEYS */;

-- Дамп структуры для таблица carrent.tickets
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `vehicle_id` int NOT NULL,
  `manager_id` int DEFAULT NULL,
  `cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `description` varchar(256) NOT NULL DEFAULT '',
  `dateFrom` datetime NOT NULL,
  `dateTo` datetime NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_FK` (`user_id`),
  KEY `vehicle_FK` (`vehicle_id`),
  KEY `manager_FK` (`manager_id`),
  CONSTRAINT `manager_FK` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `vehicle_FK` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы carrent.tickets: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` (`id`, `user_id`, `vehicle_id`, `manager_id`, `cost`, `description`, `dateFrom`, `dateTo`, `status`) VALUES
	(1, 8, 4, NULL, 15.60, '{"string": "Description1"}', '2020-12-09 18:00:00', '2020-12-10 18:00:00', 1),
	(5, 8, 4, NULL, 15.60, 'Null', '2020-12-10 05:30:00', '2020-12-11 05:30:00', 1);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;

-- Дамп структуры для таблица carrent.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `lastName` varchar(50) NOT NULL DEFAULT '',
  `patronymic` varchar(50) NOT NULL DEFAULT '',
  `age` date NOT NULL,
  `currentMoney` decimal(10,0) DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `admin` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы carrent.users: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `lastName`, `patronymic`, `age`, `currentMoney`, `password`, `email`, `admin`) VALUES
	(7, 'Админ', 'Админ', 'Админ', '1986-06-11', NULL, '2c549606a3edcb6438e1d70937sf938cz3a66bf8258742681bb210d6f7cceeba', 'ambslaur@gmail.com', b'1'),
	(8, 'Вdдvм', 'Руgаfкdй', 'sлеaсdsдрович', '1988-07-22', NULL, '2c549606a3edcb6438e10709373f938ce3a66b88258742681bb210d6f7cceeba', 'vsdam.rubsckf@yafdgx.by', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Дамп структуры для таблица carrent.vehicle
CREATE TABLE IF NOT EXISTS `vehicle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `dayCost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `description` varchar(256) DEFAULT NULL,
  `imagePath` varchar(512) DEFAULT NULL,
  `class` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы carrent.vehicle: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` (`id`, `name`, `dayCost`, `description`, `imagePath`, `class`) VALUES
	(4, 'VW Passat', 15.60, 'Описание1', '..\\images\\passat.jpg', 0);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
