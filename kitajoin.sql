-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2020 at 05:10 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kitajoin`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_12_07_122845_create_oauth_providers_table', 1),
(4, '2020_02_27_085421_create_profiles_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_providers`
--

CREATE TABLE `oauth_providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refresh_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interest` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `program` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `semester` smallint(6) DEFAULT NULL,
  `ept` smallint(6) DEFAULT NULL,
  `ip` double(8,2) DEFAULT NULL,
  `contact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experience` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `name`, `interest`, `department`, `program`, `semester`, `ept`, `ip`, `contact`, `experience`, `desc`, `bio`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Fahmi Idris', 'Sepak Bola', 'Teknik Komputer dan Informatika', 'D3 Teknik Informatika', 4, NULL, NULL, '0895342472822', NULL, NULL, NULL, NULL, '2020-02-29 21:52:16', '2020-02-29 21:52:16'),
(2, 2, 'Adi Widyanto', 'Game', 'Teknik Komputer dan Informatika', 'D3 Teknik Informatika', 4, NULL, NULL, '081224147770', NULL, NULL, NULL, NULL, '2020-02-29 23:38:47', '2020-02-29 23:38:47'),
(3, 3, 'Akbar Nur Faishal', 'Futsal', 'Teknik Komputer dan Informatika', 'D3 Teknik Informatika', 4, NULL, NULL, '081214735147', NULL, NULL, NULL, NULL, '2020-02-29 23:42:24', '2020-02-29 23:42:24'),
(4, 4, 'Nadira Arasya', 'Programming', 'Teknik Komputer dan Informatika', 'D3 Teknik Informatika', 4, NULL, NULL, '085711714447', NULL, NULL, NULL, NULL, '2020-02-29 23:43:23', '2020-02-29 23:43:23'),
(5, 5, 'Kresna Bayu', 'Programming', 'Teknik Komputer dan Informatika', 'D3 Teknik Informatika', 4, NULL, NULL, '081214506954', NULL, NULL, NULL, NULL, '2020-02-29 23:44:30', '2020-02-29 23:44:30'),
(6, 6, 'Dimas Ahmad', 'Programming', 'Teknik Komputer dan Informatika', 'D3 Teknik Informatika', 4, NULL, NULL, '081321708902', NULL, NULL, NULL, NULL, '2020-02-29 23:45:09', '2020-02-29 23:45:09'),
(7, 7, 'Ivan Eka', 'Desain', 'Teknik Komputer dan Informatika', 'D3 Teknik Informatika', 4, NULL, NULL, '085889769716', NULL, NULL, NULL, NULL, '2020-02-29 23:45:58', '2020-02-29 23:45:58'),
(8, 8, 'Rendi Kamil', 'Game', 'Teknik Komputer dan Informatika', 'D3 Teknik Informatika', 4, NULL, NULL, '082240225834', NULL, NULL, NULL, NULL, '2020-02-29 23:47:34', '2020-02-29 23:47:34'),
(9, 9, 'Hana Kirana', 'Seni Tari', 'Teknik Komputer dan Informatika', 'D3 Teknik Informatika', 4, 470, NULL, 'Empty', NULL, NULL, NULL, NULL, '2020-02-29 23:52:03', '2020-02-29 23:52:03'),
(10, 10, 'Syifa Nurmaitsa', 'Game', 'Administrasi Niaga', 'D3 Administrasi Bisnis', 4, NULL, NULL, '085659699374', NULL, NULL, 'Orang tasik', NULL, '2020-03-01 02:57:31', '2020-03-01 02:57:31'),
(11, 11, 'Fitra Mulya Saputra', 'Desain', 'Teknik Sipil', 'D3 Teknik Konstruksi Gedung', 4, 480, 3.08, '087804664400', 'Juara 3 Lomba Teknologi Tepat Guna Kab. Bekasi 2013', NULL, 'Gk tau, intinya aku humble, baik hati tidak sombong, murah senyum, gampang mengeluh', NULL, '2020-03-01 02:58:32', '2020-03-01 02:58:32'),
(12, 12, 'Dafi Majid Fadhlih', 'Programming', 'Teknik Komputer dan Informatika', 'D3 Teknik Informatika', 2, NULL, 3.55, 'Empty', NULL, NULL, NULL, NULL, '2020-03-01 02:59:46', '2020-03-01 02:59:46'),
(13, 13, 'Nadia Putri Damayanti', 'Desain', 'Teknik Komputer dan Informatika', 'D3 Teknik Informatika', 4, NULL, NULL, 'nadiashlaf@gmail.com', NULL, NULL, NULL, NULL, '2020-03-01 03:00:39', '2020-03-01 03:00:39'),
(14, 14, 'Fahitha Salsabila', 'Bahasa Asing', 'Teknik Konversi Energi', 'D3 Teknik Konversi Energi', 4, NULL, 2.85, 'Empty', NULL, NULL, NULL, NULL, '2020-03-01 03:01:29', '2020-03-01 03:01:29'),
(15, 15, 'Sabila Nurul Aeni', 'Manajemen', 'Administrasi Niaga', 'D3 Manajemen Pemasaran', 6, NULL, 3.45, 'Empty', 'Peringkat 10 Business Competition Diestanatalis Polban 2019', NULL, 'Saya Sabila, lahir di Bandung. Senang membaca novel dan rajin menabung. Saya punya cita-cita jadi pengusaha dan banggain + bahagiain orang tua.', NULL, '2020-03-01 03:02:00', '2020-03-01 03:02:00'),
(16, 16, 'Siti Asri', 'Bulu Tangkis', 'Akuntansi', 'D4 Akuntansi ', 4, NULL, NULL, 'Empty', NULL, NULL, NULL, NULL, '2020-03-01 03:02:38', '2020-03-01 03:02:38'),
(17, 17, 'Olivia Delvira Fratama', 'Public Speaking', 'Teknik Konversi Energi', 'D4 Teknik Konservasi Energi', 4, NULL, 3.15, 'Empty', 'Best Presenter Sanitasi Nasional', NULL, 'Olivia Delvira Fratama lahir Bandunf, 9 Juli 2000. Anak pertama, tidak suka makan pedas dan makanan makanan yang bertekstur aneh. ', NULL, '2020-03-01 03:03:26', '2020-03-01 03:03:26'),
(18, 18, 'Nur Ramadhan', 'Public Speaking', 'Administrasi Niaga', 'D3 Administrasi Bisnis', 4, 463, 3.80, '089644465719', NULL, NULL, NULL, NULL, '2020-03-01 03:04:03', '2020-03-01 03:04:03'),
(19, 19, 'Muhammad Nauval Shidiq', 'Basket', 'Teknik Elektro', 'D4 Teknik Elektronika', 4, NULL, NULL, '082214433067', 'Kejuaraan Basket Nasional', NULL, 'TTL : 1 Februari 2000\r\nAgama : Islam\r\nRiwayat Pendidikan :\r\nSdn leuwi bandung 1\r\nSmpn 1 baleendah\r\nSman 1 baleendah\r\nPolban\r\n', NULL, '2020-03-01 03:04:42', '2020-03-01 03:04:42'),
(20, 20, 'Muhamad Toriq Chaerul Insani', 'Basket', 'Akuntansi', 'D4 Keuangan Syariah', 4, NULL, NULL, '088222226048', NULL, NULL, 'Hobiku bermain bola basket. Ini cape tapi aku senang', NULL, '2020-03-01 03:05:13', '2020-03-01 03:05:13'),
(21, 21, 'Fakhira Salsabilla', 'Keenergian', 'Teknik Konversi Energi', 'D4 Teknologi Pembangkit Tenaga Listrik', 4, NULL, NULL, 'idline; fakhirasp_29', NULL, NULL, 'nama lengkap fakhira salsabilla putri, lahir di Cimahi, 29 April 2000, saat ini status saya sebagai mahasiswa Teknik konversi energi di pilteknik negeri bandung, saya memilih jurusan ini dikarenakan untuk menunjang karir saya kedepannya', NULL, '2020-03-01 03:05:46', '2020-03-01 03:05:46'),
(23, 23, 'Nabil Putra Hadiyani', 'Futsal', 'Teknik Komputer dan Informatikan', 'D4 Teknik Informatika', 2, NULL, NULL, '089616892044', NULL, NULL, NULL, NULL, '2020-03-01 20:26:04', '2020-03-01 20:26:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Fahmi Idris', 'fahmi.idris.tif18@polban.ac.id', NULL, '$2y$10$MfkQ6gih2AEDXzdNl8FryeqMT/j6xScULw2z.FXrd0LVO6x.FcN92', NULL, '2020-02-29 21:52:16', '2020-02-29 21:52:16'),
(2, 'Adi Widyanto', 'adi.widyanto.tif18@polban.ac.id', NULL, '$2y$10$aC5LBKjyY912i42Qccy.duOm9MMf3x3kbUabL339toUn8slNMZeyO', NULL, '2020-02-29 23:38:47', '2020-02-29 23:38:47'),
(3, 'Akbar Nur Faishal', 'akbar.nur.tif18@polban.ac.id', NULL, '$2y$10$X1uNktYE/s3xCF5oxxwm7uSbQUXOJe1BZuj..PYe5sEmbev/zNClq', NULL, '2020-02-29 23:42:24', '2020-02-29 23:42:24'),
(4, 'Nadira Arasya', 'nadira.arasya.tif18@polban.ac.id', NULL, '$2y$10$.dsnxQLrr5g7Q95jblBPz.KD6PjOBpXCtWtpG6tkhKOvexq6XS0/W', NULL, '2020-02-29 23:43:23', '2020-02-29 23:43:23'),
(5, 'Kresna Bayu', 'kresna.bayu.tif18@polban.ac.id', NULL, '$2y$10$7q.pAuGPcluNDG7suLvBUuaoUu1tWx68TUDMeZx1drenssZW77/Uq', NULL, '2020-02-29 23:44:30', '2020-02-29 23:44:30'),
(6, 'Dimas Ahmad', 'dimas.ahmad.tif18@polban.ac.id', NULL, '$2y$10$xlr7tGRExbwo2yZVxJj1GOaXoACbSShx.8F0VQVs6QRcAXGPcyZUe', NULL, '2020-02-29 23:45:09', '2020-02-29 23:45:09'),
(7, 'Ivan Eka', 'ivan.eka.tif18@polban.ac.id', NULL, '$2y$10$XSoPPYKoc5w.dWbzc7sNA.ECh1RYUzCTBVADUxlrzPKyjWwkD3Tfi', NULL, '2020-02-29 23:45:58', '2020-02-29 23:45:58'),
(8, 'Rendi Kamil', 'rendi.kamil.tif18@polban.ac.id', NULL, '$2y$10$2bsZYIVOhJWKed4jsAzCbusijj.a9RpLic2l.90x2ulDv7wWRnAZW', NULL, '2020-02-29 23:47:34', '2020-02-29 23:47:34'),
(9, 'Dwiana Kamila', 'dwiana.kamila.tif18@polban.ac.id', NULL, '$2y$10$bsD2Jgew5VLP6jTbRIYLG.7JP4FEvlHONWB8s1TCKnLUwD3LDRu.W', NULL, '2020-02-29 23:51:26', '2020-02-29 23:51:26'),
(10, 'Hana Kirana', 'hana.kirana.tif18@polban.ac.id', NULL, '$2y$10$p./.Mk96c0JZCJHSjLAvoOypgBXefGV.w6y20CjW8humSbSjb1Eia', NULL, '2020-02-29 23:52:03', '2020-02-29 23:52:03'),
(11, 'Syifa Nurmaitsa', 'syifa.nurmaitsa.abs18@polban.ac.id', NULL, '$2y$10$BCuVEoE/3t./sN2u.hxcT.wukJvh3sgGjXSr5Kp/GpR8C.pXl6V22', NULL, '2020-03-01 02:57:31', '2020-03-01 02:57:31'),
(12, 'Fitra Mulya Saputra', 'fitra.mulya.tkgd18@polban.ac.id', NULL, '$2y$10$UWV/rIPPVRaZJboXJUxJ5OrjTLh0o84yHCCdwb4a7pLJNi4H/uEvW', NULL, '2020-03-01 02:58:32', '2020-03-01 02:58:32'),
(13, 'Dafi Majid Fadhlih', 'dafi.majid.tif19@polban.ac.id', NULL, '$2y$10$XNPxB/lSOCT/O1/tjST62eMOANCgVNJ9lDKQbMEpR/PDJU5KpiRGS', NULL, '2020-03-01 02:59:46', '2020-03-01 02:59:46'),
(14, 'Nadia Putri Damayanti', 'nadia.putri.tif18@polban.ac.id', NULL, '$2y$10$IghvcX3a5meOWded1cK8Lee/vAHxApg7Yc/yMZMIqDt14K5jbNXWS', NULL, '2020-03-01 03:00:39', '2020-03-01 03:00:39'),
(15, 'Fahitha Salsabila', 'fahitha23@gmail.com', NULL, '$2y$10$wjZL96FakiByy1.20bpDFekMs3kcJ90a3w5kqEPpQHaMeM2RihOrK', NULL, '2020-03-01 03:01:29', '2020-03-01 03:01:29'),
(16, 'Sabila Nurul Aeni', 'sabilanurulaeni80@gmail.com', NULL, '$2y$10$n/CYafwjuzoeYvU4mzNQou/EndpkifOC6FmlsxKjVVk5bO52Y3.T2', NULL, '2020-03-01 03:02:00', '2020-03-01 03:02:00'),
(17, 'Siti Asri', 'siti.asri.akun418@polban.ac.id', NULL, '$2y$10$8/T1GrFbtQF6lsuzuu1OpOtyMwJsjmrZTrd24fUeJIQ4xyXIf8S6G', NULL, '2020-03-01 03:02:38', '2020-03-01 03:02:38'),
(18, 'Olivia Delvira Fratama', 'oliviadelviraf@gmail.com', NULL, '$2y$10$u11eAk0qhqCbiu/8VvIaOuHfCIkBNkv9EQ9pRZ37GoQHByb/lnS9u', NULL, '2020-03-01 03:03:26', '2020-03-01 03:03:26'),
(19, 'Nur Ramadhan', 'nur.ramadhan.abs18@polban.ac.id', NULL, '$2y$10$BawwmK1Vf7t4Ig/YRN8yb.S1FPbVIsTiFZrjcPdG48x2umgxFmfsG', NULL, '2020-03-01 03:04:03', '2020-03-01 03:04:03'),
(20, 'Muhammad Nauval Shidiq', 'muhammad.nauval.tele418@polban.ac.id', NULL, '$2y$10$ib4YTLOrPFR1eY5llT6KCunYDHD6XY1Z.VNFf9oggmREMS8loNtp.', NULL, '2020-03-01 03:04:42', '2020-03-01 03:04:42'),
(21, 'Muhamad Toriq Chaerul Insani', 'muhamad.toriq.ksy18@polban.ac.id', NULL, '$2y$10$VTav1JvEC5JnQe67k6nhSOAANcLyqWQMUFVt8UeyFgmOGIoW6Jzhu', NULL, '2020-03-01 03:05:13', '2020-03-01 03:05:13'),
(22, 'Fakhira Salsabilla', 'fakhira.salsabilla.tptl18@polban.ac.id', NULL, '$2y$10$J7/LED0UdbwRWUxQp7150.EieoAIqh2yIV/vDi7tueRi9K2RNdnt.', NULL, '2020-03-01 03:05:46', '2020-03-01 03:05:46'),
(23, 'Nabil Putra Hadiyani', 'nabil.putra.tif419@polban.ac.id', NULL, '$2y$10$VHD4uk9WHgTjZZXzxOGcg.zczxJ7ilEiXqX07mYgtpQC6HcFPxUhW', NULL, '2020-03-01 20:26:04', '2020-03-01 20:26:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_providers`
--
ALTER TABLE `oauth_providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_providers_user_id_foreign` (`user_id`),
  ADD KEY `oauth_providers_provider_user_id_index` (`provider_user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_providers`
--
ALTER TABLE `oauth_providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `oauth_providers`
--
ALTER TABLE `oauth_providers`
  ADD CONSTRAINT `oauth_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
