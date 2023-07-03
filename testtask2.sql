-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Лип 03 2023 р., 12:04
-- Версія сервера: 10.4.28-MariaDB
-- Версія PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `testtask2`
--

-- --------------------------------------------------------

--
-- Структура таблиці `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `author_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `deleted` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `created_at`, `updated_at`, `author_id`, `content`, `deleted`, `user_id`) VALUES
(1, 'title1', '2023-07-01 09:44:37', '2023-07-01 09:44:37', 1, 'wnwknedjkenfjnfmnrf,nfr,n', '2023-07-01 09:44:37', 1),
(2, 'title2', '2023-07-01 09:45:06', '2023-07-01 09:45:06', 2, 'ekndjnj,ewnjewfnjmefnjmnfernnfrnvrf', '2023-07-01 09:45:06', 2),
(4, 'title5', '2023-07-02 05:13:57', '2023-07-02 05:13:57', 0, 'jjeiejdjejjked', '2023-07-02 05:13:57', 3);

-- --------------------------------------------------------

--
-- Структура таблиці `category_blogs`
--

CREATE TABLE `category_blogs` (
  `category_id` int(11) NOT NULL,
  `category_title` varchar(255) NOT NULL,
  `category_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `category_updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `category_deleted` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `category_blogs`
--

INSERT INTO `category_blogs` (`category_id`, `category_title`, `category_created_at`, `category_updated_at`, `category_deleted`) VALUES
(1, 'title1', '2023-07-01 09:48:05', '2023-07-01 09:48:05', '2023-07-01 12:48:05'),
(2, 'title3', '2023-07-01 10:00:46', '2023-07-01 10:00:46', '2023-07-01 13:00:46'),
(3, 'title4', '2023-07-01 10:01:38', '2023-07-01 10:01:38', '2023-07-01 13:01:38');

-- --------------------------------------------------------

--
-- Структура таблиці `per`
--

CREATE TABLE `per` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `category_blog_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `per`
--

INSERT INTO `per` (`id`, `blog_id`, `category_blog_id`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 2, 3);

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE `users` (
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` int(255) NOT NULL,
  `deleted` timestamp NOT NULL DEFAULT current_timestamp(),
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`fname`, `lname`, `email`, `pass`, `deleted`, `id`) VALUES
('effrf', 'gfgfbbgf', 'fddvvfv', 0, '2023-07-02 06:31:17', 4),
('tgrtgrt', 'tgrgtgtr', 'tggttrg', 213324, '2023-07-02 06:31:52', 1);

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Індекси таблиці `category_blogs`
--
ALTER TABLE `category_blogs`
  ADD PRIMARY KEY (`category_id`);

--
-- Індекси таблиці `per`
--
ALTER TABLE `per`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_id` (`blog_id`),
  ADD KEY `category_blog_id` (`category_blog_id`);

--
-- Індекси таблиці `users`
--
ALTER TABLE `users`
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `category_blogs`
--
ALTER TABLE `category_blogs`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `per`
--
ALTER TABLE `per`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `per`
--
ALTER TABLE `per`
  ADD CONSTRAINT `per_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `per_ibfk_2` FOREIGN KEY (`category_blog_id`) REFERENCES `category_blogs` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
