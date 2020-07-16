-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2020 年 7 月 16 日 16:37
-- サーバのバージョン： 10.4.11-MariaDB
-- PHP のバージョン: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `gsacf_d06_25`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `kadai_recipe_table`
--

CREATE TABLE `kadai_recipe_table` (
  `id` int(12) NOT NULL,
  `recipename` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `howto` varchar(320) COLLATE utf8_unicode_ci NOT NULL,
  `recipe_image` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `kadai_recipe_table`
--

INSERT INTO `kadai_recipe_table` (`id`, `recipename`, `category`, `howto`, `recipe_image`) VALUES
(13, 'トマトとなすのチーズ焼き', '1', 'mcmcmcmcmm', 'DSC00070.JPG'),
(14, 'トマトとなすのチーズ焼き', '1', 'kkk', 'DSC08491.JPG'),
(15, 'トマトとなすのチーズ焼き', '1', 'aaaa', 'DSC00122.JPG'),
(16, 'トマトとなすのチーズ焼き', '1', 'zzz', 'DSC00053.JPG'),
(17, 'トマトとなすのチーズ焼き', '0', '１１１', 'DSC00070.JPG'),
(18, 'トマトとなすのチーズ焼き', 'ダイエットレシピ', 'っっs', 'DSC00038.JPG'),
(19, 'とうもろこしとしらすのご飯', '骨活レシピ', '1.お米をとぐ\r\n2.とうもろこしを芯と実にわける\r\n3.aaaaa', 'DSC00070.JPG'),
(20, 'レモンヨーグルトチーズケーキ', 'ダイエットレシピ', '1.aaaaaaaa\r\n2.ssssssss', 'DSC00070.JPG'),
(21, 'トマトとなすのチーズ焼き', 'ダイエットレシピ', 'qqqqqq', 'DSC00038.JPG'),
(22, 'レモンヨーグルトチーズケーキ', '骨活レシピ', 'チーズチーズチーズチーズチーズチーズチーズチーズチーズチーズチーズチーズチーズチーズ', 'DSC00070.JPG');

-- --------------------------------------------------------

--
-- テーブルの構造 `like_table`
--

CREATE TABLE `like_table` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `todo_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `like_table`
--

INSERT INTO `like_table` (`id`, `user_id`, `todo_id`, `created_at`) VALUES
(3, 1, 5, '2020-07-11 16:37:22'),
(5, 1, 6, '2020-07-11 16:38:49'),
(6, 1, 7, '2020-07-11 16:38:50'),
(7, 1, 8, '2020-07-11 16:38:53'),
(9, 1, 9, '2020-07-11 16:46:19'),
(10, 1, 11, '2020-07-11 16:46:23'),
(11, 1, 12, '2020-07-11 16:46:24'),
(14, 3, 5, '2020-07-11 16:51:13'),
(15, 3, 6, '2020-07-11 16:51:14'),
(16, 3, 7, '2020-07-11 16:51:15'),
(17, 3, 8, '2020-07-11 16:51:22'),
(18, 3, 9, '2020-07-11 16:51:22'),
(19, 3, 11, '2020-07-11 16:51:24'),
(20, 3, 12, '2020-07-11 16:51:24');

-- --------------------------------------------------------

--
-- テーブルの構造 `Nutrition_facts`
--

CREATE TABLE `Nutrition_facts` (
  `id` int(12) NOT NULL,
  `food_group` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `food_number` int(12) NOT NULL,
  `food_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `energy` int(12) DEFAULT NULL,
  `protein` int(12) DEFAULT NULL,
  `fat` int(12) DEFAULT NULL,
  `carbohydrate` int(12) DEFAULT NULL,
  `dietaryfiber` int(12) DEFAULT NULL,
  `calcium` int(12) DEFAULT NULL,
  `sodium` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `todo_table`
--

CREATE TABLE `todo_table` (
  `id` int(12) NOT NULL,
  `todo` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `deadline` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `todo_table`
--

INSERT INTO `todo_table` (`id`, `todo`, `deadline`, `created_at`, `updated_at`) VALUES
(3, 'php勉強！！！！！！', '2020-06-29', '2020-06-29 23:21:41', '2020-07-05 16:52:32'),
(4, '課題woooooo', '2020-07-02', '2020-06-29 23:21:54', '2020-06-30 19:34:09'),
(5, '打ち合わせ', '2020-07-01', '2020-06-29 23:22:03', '2020-06-29 23:22:03'),
(6, '西南女学院大学授業', '2020-06-29', '2020-06-29 23:22:43', '2020-06-30 19:34:42'),
(7, 'リゾスポ', '2020-06-30', '2020-06-29 23:22:50', '2020-06-29 23:22:50'),
(8, '西南女学院大学4年生', '2020-06-30', '2020-06-29 23:23:23', '2020-06-29 23:23:23'),
(9, 'abe', '2020-07-02', '2020-06-30 16:08:00', '2020-06-30 16:08:00'),
(10, 'abeさん', '2020-07-03', '2020-06-30 18:42:09', '2020-06-30 18:42:09'),
(11, 'abe', '2020-07-08', '2020-07-02 17:37:56', '2020-07-02 17:37:56'),
(12, 'abe', '2020-07-16', '2020-07-02 18:02:25', '2020-07-02 18:02:25'),
(13, 'ごはんたべる', '2020-07-07', '2020-07-05 16:52:10', '2020-07-05 16:52:10'),
(14, 'ごはんたべるrururu', '2020-07-24', '2020-07-09 00:07:20', '2020-07-09 00:07:20'),
(15, 'ごはんたべるyoyoyoyo', '2020-07-10', '2020-07-09 00:07:52', '2020-07-09 00:07:52');

-- --------------------------------------------------------

--
-- テーブルの構造 `users_table`
--

CREATE TABLE `users_table` (
  `id` int(12) NOT NULL,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `is_admin` int(1) NOT NULL,
  `is_deleted` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `users_table`
--

INSERT INTO `users_table` (`id`, `username`, `password`, `is_admin`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'etsuo', '222222', 1, 0, '2020-07-04 16:08:57', '2020-07-05 16:08:57'),
(2, 'etsuo', '222222', 1, 0, '2020-07-04 16:08:57', '2020-07-05 16:08:57'),
(3, 'teshima', '666666', 0, 0, '2020-07-09 00:04:40', '2020-07-09 00:04:40'),
(4, 'etsukoteshima', '888888', 1, 0, '2020-07-09 00:03:17', '2020-07-09 00:04:40'),
(5, 'qqqqqq', '121212', 0, 0, '2020-07-09 16:21:09', '2020-07-09 16:21:09'),
(6, '', '', 0, 0, '2020-07-09 16:54:41', '2020-07-09 16:54:41'),
(7, 'masato', '555555', 0, 0, '2020-07-16 19:45:57', '2020-07-16 19:45:57'),
(8, 'hiroki', '777777', 0, 0, '2020-07-16 19:46:10', '2020-07-16 19:46:10');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `kadai_recipe_table`
--
ALTER TABLE `kadai_recipe_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `like_table`
--
ALTER TABLE `like_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `Nutrition_facts`
--
ALTER TABLE `Nutrition_facts`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `todo_table`
--
ALTER TABLE `todo_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `users_table`
--
ALTER TABLE `users_table`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルのAUTO_INCREMENT
--

--
-- テーブルのAUTO_INCREMENT `kadai_recipe_table`
--
ALTER TABLE `kadai_recipe_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- テーブルのAUTO_INCREMENT `like_table`
--
ALTER TABLE `like_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- テーブルのAUTO_INCREMENT `Nutrition_facts`
--
ALTER TABLE `Nutrition_facts`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `todo_table`
--
ALTER TABLE `todo_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- テーブルのAUTO_INCREMENT `users_table`
--
ALTER TABLE `users_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
