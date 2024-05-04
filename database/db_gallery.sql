-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Bulan Mei 2024 pada 03.07
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_gallery`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `banners`
--

INSERT INTO `banners` (`id`, `title`, `text`, `photo`) VALUES
(1, 'Belajar tidak membuatmu rugi', '\"hidup dengan kebodohan lebih buruk dari hidup penuh dengan ketidaketahuan.\" ', '6a73c57fdf6ca486769569a06f901614.jpg'),
(2, 'Menuntut Ilmu Sedalam Mungkin', '\"Belajar memang melelahkan, namun akan lebih melelahkan lagi jika saat ini kamu tidak belajar.\"', 'bd394fdac662c6faaa5cea6d90bfa01b.jpg'),
(3, 'Terus Maju', ' \"Jangan membuang waktu belajarmu karena apa yang kamu pelajari akan berguna untuk masa depanmu.\"', '87f87a7e07d8427c9e52090aafb33c9d.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `petugas_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `petugas_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 2, 'Pengaturan Halaman', '', 'fas fa-fw fa-cog', 'Y'),
(3, 2, 'Kategori Galery', '', 'fas fa-fw fa-school', 'Y'),
(5, 1, 'Manajemen Admin\r\n', 'petugas', 'fas fa-fw fa-user', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `opening`
--

CREATE TABLE `opening` (
  `id` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `opening`
--

INSERT INTO `opening` (`id`, `judul`, `content`, `photo`) VALUES
(1, 'Merayakan Hari Guru Bersama', 'Merayakan Hari Guru adalah momen istimewa di mana kita menghormati dedikasi, pengetahuan, dan inspirasi yang diberikan oleh para pendidik dalam membimbing generasi masa depan. Setiap tahun, Hari Guru menjadi kesempatan bagi kita untuk menghargai peran penting mereka dalam membentuk masyarakat dan memajukan bangsa.', 'f5853f0876fcef4d0666a8065812f808.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$12$zF4ZveNWuqAyRqZVMRGoJO4.hRfv/6Js.oLPX6sTXvyFofmF84QoW', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1714783439, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(3, '::1', 'tasyarojabilasamroi@mail.com', '$2y$10$ufb5qHckmFIQO0j06ACLhOVx/Bf8Z5C9xowPtUOZcIsEP.GOb.CMa', 'tasyarojabilasamroi@mail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1683943097, NULL, 1, 'gadun', 'rojak', NULL, '081511385307'),
(1, '127.0.0.1', 'administrator', '$2y$12$zF4ZveNWuqAyRqZVMRGoJO4.hRfv/6Js.oLPX6sTXvyFofmF84QoW', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1714783439, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(3, '::1', 'tasyarojabilasamroi@mail.com', '$2y$10$ufb5qHckmFIQO0j06ACLhOVx/Bf8Z5C9xowPtUOZcIsEP.GOb.CMa', 'tasyarojabilasamroi@mail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1683943097, NULL, 1, 'gadun', 'rojak', NULL, '081511385307'),
(1, '127.0.0.1', 'administrator', '$2y$12$zF4ZveNWuqAyRqZVMRGoJO4.hRfv/6Js.oLPX6sTXvyFofmF84QoW', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1714783439, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(3, '::1', 'tasyarojabilasamroi@mail.com', '$2y$10$ufb5qHckmFIQO0j06ACLhOVx/Bf8Z5C9xowPtUOZcIsEP.GOb.CMa', 'tasyarojabilasamroi@mail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1683943097, NULL, 1, 'gadun', 'rojak', NULL, '081511385307');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas_groups`
--

CREATE TABLE `petugas_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `petugas_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `petugas_groups`
--

INSERT INTO `petugas_groups` (`id`, `petugas_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(42, 3, 1),
(1, 1, 1),
(2, 1, 2),
(42, 3, 1),
(1, 1, 1),
(2, 1, 2),
(42, 3, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `photo` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `posts`
--

INSERT INTO `posts` (`id`, `title`, `seo_title`, `content`, `photo`, `is_active`, `date`) VALUES
(10, 'Melaksanakan SMARTREN Ramadhan 1445H Bersama', 'melaksanakan-smartren-ramadhan-1445h-bersama', 'Kegiatan ini diselenggarakan untuk tidak lain tidak bukan merayakan suasana bulan ramadhan yang diisi dengan tablig akbar oleh para guru serta mengaji dan bersholawat dan berdoa pada kelancaran dan berkah yang ada pada bulan ramadan ini.', '-20240425041647.jpg', 'Y', '2024-04-25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `meta_isi` text NOT NULL,
  `meta_judul` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `profile`
--

INSERT INTO `profile` (`id`, `meta_isi`, `meta_judul`, `created_at`) VALUES
(1, 'SMK Indonesia Digital adalah platform daring yang memfasilitasi pembelajaran online bagi siswa dan guru di berbagai sekolah menengah kejuruan di Indonesia. Melalui website ini, siswa dapat mengakses materi pembelajaran, tugas, dan ujian secara digital. Guru dapat memberikan materi, menilai tugas, dan berinteraksi dengan siswa secara online. SMK Indonesia Digital membantu meningkatkan aksesibilitas dan efisiensi dalam pendidikan di era digital saat ini.', 'SMK DIGITAL INDONESIA', '2024-04-25 07:41:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `submenus`
--

CREATE TABLE `submenus` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `sub_title` varchar(50) NOT NULL,
  `sub_url` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `submenus`
--

INSERT INTO `submenus` (`id`, `menu_id`, `sub_title`, `sub_url`, `is_active`) VALUES
(1, 1, 'Profile Web', 'identitas', 'Y'),
(2, 3, 'Galery Sekolah', 'galery', 'Y'),
(3, 3, 'Banner', 'banner', 'Y'),
(5, 3, 'Informasi Terkini', 'forkin', 'Y');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `opening`
--
ALTER TABLE `opening`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `submenus`
--
ALTER TABLE `submenus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
