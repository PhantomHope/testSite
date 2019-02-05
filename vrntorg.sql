-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Фев 04 2019 г., 20:17
-- Версия сервера: 5.7.23
-- Версия PHP: 7.0.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `vrntorg`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `name`) VALUES
(1, 'Шкафы холодильные', 'Наш магазин предоставляет качественные, инновационные холодильные шкафы по привлекательной цене.', 'fridges'),
(2, 'Акции месяца', 'В феврале вы получаете крупную скидку на следующий перечень товаров', 'discounts'),
(3, 'Витрины', 'Наш магазин предоставляет широкий выбор витрин. Вы можете выбрать витрину для любой цели.', 'showCase');

-- --------------------------------------------------------

--
-- Структура таблицы `category_products`
--

CREATE TABLE `category_products` (
  `categoryID` int(10) UNSIGNED NOT NULL,
  `productID` int(15) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `category_products`
--

INSERT INTO `category_products` (`categoryID`, `productID`) VALUES
(1, 1),
(1, 2),
(3, 3),
(3, 4),
(2, 1),
(2, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(15) UNSIGNED NOT NULL,
  `article` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `article`, `title`, `description`, `price`) VALUES
(1, 'ВЕ185', 'Шкаф холодильный Бирюса 154EKSSN', 'Холодильный шкаф Бирюса 154EKSSNZ предназначен для демонстрации, охлаждения и кратковременного хранения скоропортящихся продуктов и напитков на предприятиях общественного питания и торговли. Модель рассчитана на работу при температуре окружающего воздуха от 16 до 32 °С и относительной влажности не более 55%.', 19809),
(2, 'ВА743', 'Шкаф холодильный POLAIR DM 102-Bravo', 'Шкаф холодильный polair dm 102-bravo (+1...+10) по отличной цене с доставкой по Воронежу и Воронежской области, а при необходимости забрать заказ с территории нашего склада. Доставка в Липецк, Курск, Белгород, Орёл, Тамбов, и другие города России осуществляется с помощью транспортных компаний. Уточнить стоимость и наличие товара, а также любую другую интересующую вас информацию вы можете у наших менеджеров. Ознакомьтесь со всеми представленными предложениями в среднетемпературные со стеклянными дверьми, сравните цены и выберите для себя самый оптимальный вариант.', 31395),
(3, 'БГ060', 'Витрина холодильная кондитерская Нарочь 150 ВВК', 'Витрина холодильная кондитерская предназначена для кратковременного хранения и демонстрации кондитерских изделий. Индикатор температуры в охлаждаемом объеме. Пенополиуретановая изоляция корпуса, боковин, столешницы. Столешница из декоративной нержавеющей стали. Шторки из оргстекла Подсветка внутреннего объема. Выдвижные противни из нержавеющей стали. Автоматическая оттайка. Стандартное цветовое исполнение - красное пламя 3000 RAL или легкий синий 5012 RAL.', 65499),
(4, 'БД532', 'Витрина холодильная Полюс серия : АРГО Люкс XL ВХС-1,2', 'Холодильная витрина Полюс ВХС-1,2 Арго XL Люкс предназначена для демонстрации и продажи десертов, сэндвичей, йогуртов или просто охлаждённых напитков.', 42900);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `category_products`
--
ALTER TABLE `category_products`
  ADD KEY `FK_categoryID` (`categoryID`),
  ADD KEY `FK_productID` (`productID`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`article`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(15) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `category_products`
--
ALTER TABLE `category_products`
  ADD CONSTRAINT `FK_categoryID` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `FK_productID` FOREIGN KEY (`productID`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
