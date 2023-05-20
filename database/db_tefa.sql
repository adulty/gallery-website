-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2023 at 06:25 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tefa`
--

-- --------------------------------------------------------

--
-- Table structure for table `agenda`
--

CREATE TABLE `agenda` (
  `id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agenda`
--

INSERT INTO `agenda` (`id`, `photo`) VALUES
(5, 'dc3c6237115ce2e3050ee1b1e79429fb.png');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `text`, `photo`) VALUES
(1, 'Belajar tidak membuatmu rugi', '\"hidup dengan kebodohan lebih buruk dari hidup penuh dengan ketidaketahuan.\" ', '19ca6581f8162a827e7d71c635a80c52.jpg'),
(2, 'Menuntut Ilmu Sedalam Mungkin', '\"Belajar memang melelahkan, namun akan lebih melelahkan lagi jika saat ini kamu tidak belajar.\"', 'c9a5c067cc0d52d0c3d86972fba1fcd9.jpg'),
(3, 'Terus Maju', ' \"Jangan membuang waktu belajarmu karena apa yang kamu pelajari akan berguna untuk masa depanmu.\"', '9e9dd884b459dd84c1e995bd9e58eaf9.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `bg_majors`
--

CREATE TABLE `bg_majors` (
  `id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bg_majors`
--

INSERT INTO `bg_majors` (`id`, `photo`) VALUES
(1, '4dfdb28ddb055c58b1e92933c35e3079.png');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `comment` varchar(250) NOT NULL,
  `status` enum('Active','Block') NOT NULL DEFAULT 'Active',
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `hubins`
--

CREATE TABLE `hubins` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hubins`
--

INSERT INTO `hubins` (`id`, `name`, `photo`, `website`) VALUES
(3, 'PT BONET UTAMA', 'pt-bonet-utama-20230512090107.png', 'www.bonet.co.id'),
(4, 'PT ASKI (PT Astra Komponen Indonesia)', 'pt-aski-pt-astra-komponen-indonesia-20230512090240.jpg', 'www.astra-otoparts.com'),
(11, 'Universitas Pertahanan Republik Indonesia (UNHAN)', 'universitas-pertahanan-republik-indonesia-unhan-20230512090717.png', 'www.idu.ac.id');

-- --------------------------------------------------------

--
-- Table structure for table `identity`
--

CREATE TABLE `identity` (
  `id` int(11) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `identity`
--

INSERT INTO `identity` (`id`, `meta_title`, `meta_description`, `meta_keyword`, `photo`) VALUES
(1, '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed nisl ut metus molestie dignissim eu vitae nisi. Phasellus molestie ut quam eu accumsan. Mauris sit amet orci a ante suscipit pharetra. Integer sodales, augue vel volutpat faucibus, nunc lectus feugiat mi, in vestibulum ex arcu commodo purus. Donec in sagittis enim, ac dignissim neque. Aenean nec quam a enim volutpat tempus. Cras eget ex lacus.', 'TEFA SMK 1 TRIPLE \"J\"', '18efe02e7fcc5c6a4ee8c619e501a7d9.png');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `majors`
--

CREATE TABLE `majors` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `user_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 2, 'Pengaturan Web', '', 'fas fa-fw fa-cog', 'Y'),
(3, 2, 'Manajemen Media', '', 'fas fa-fw fa-school', 'Y'),
(4, 2, 'Struktur TEFA', 'struktur', 'fas fa-fw fa-sitemap', 'Y'),
(5, 1, 'Manajemen User', 'user', 'fas fa-fw fa-user', 'Y'),
(6, 2, 'Profile', '', 'fas fa-fw fa-home', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `opening`
--

CREATE TABLE `opening` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `opening`
--

INSERT INTO `opening` (`id`, `content`, `photo`) VALUES
(1, 'TEFA RPL SMK 1 TRIPLE “J” ini bertujuan untuk meningkatkan kompetensi siswa/siswi \r\nsecara langsung melalui perusahaan atau industri yang  terkait.\r\ndidalam tefa juga siswa/siswi tidak hanya memperaktikan Soft Skill dalam pembelajaran,\r\nada juga belajar untuk dapat bekerja secara tim, melatih kemampuan komunikasi secara interpersonal, siswa/siswi juga mendapatkan pengalaman secara langsung dan latihan bekerja untuk memasuki dunia kerja nantinya, dan dapat menjembatani kesenjangan kompetensi antara kebutuhan industri dan pengetahuan sekolah untuk menyadarkan bahwa mengajar siswa/siswi seharusnya lebih dari sekedar apa yang terdapat dalam buku.', 'd7ed78a7080287a51525bc109329589d.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `portfolios`
--

CREATE TABLE `portfolios` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `photo` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `portfolios`
--

INSERT INTO `portfolios` (`id`, `title`, `seo_title`, `content`, `photo`, `is_active`, `date`) VALUES
(5, 'Aplikasi Perpustakaan Sekolah', 'aplikasi-perpustakaan-sekolah', 'Aplikasi Perpustakaan Sekolah ini di buat oleh siswa dan siswi SMK 1 Triple \'J\' Jurusan RPL (Rekayasa Perangkat Lunak). Aplikasi Perpustakaan Sekolah ini mempermudah murid atau guru untuk meminjam atau membaca buku dengan mudah dan di manapun dan kapanpun, Aplikasi ini juga mudah untuk di mengerti dari yang muda dan yang lansia. aplikasi inipun memiliki banyak sekali buku untuk di baca bisa untuk kalangan anak-anak, remaja,dewasa, dan lansia. Aplikasi Perpustakaan Sekolah selalu memiliki buku terbaru.', '-20230513093628.jpg', 'Y', '2023-05-13'),
(6, 'Eat All Snake', 'eat-all-snake', 'Aplikasi Eat All Snake ini di buat oleh salah satu siswa SMK 1 Triple \'J\' Jurusan RPL (Rekayasa Perangkat Lunak). Eat All Snake ini adalah sebuah Game yang mudah di pahami, Eat All Snake juga  bisa di mainkan oleh semua kalangan, Eat All Snake Mudah dan Menyanangkan. ', '-20230513080815.jpg', 'Y', '2023-05-13'),
(7, 'Aplikasi Ujian Berbasis Website', 'aplikasi-ujian-berbasis-website', 'Aplikasi Ujian Berbasis Website ini adalah Aplikasi yang di buat oleh siswa dan siswi SMK 1 Triple \'J\' Jurusan RPL (Rekayasa Perangkat Lunak) Dalam memecakan suatu masalah karna banyaknya murid yang mengeluh karna ujian sekolah offline, karna itu siswa dan siswi memecakan masalah dengan membuat suatu Aplikasi Website. Aplikasi ini juga memudahkan dalam ujian sekolah karna lebih aman dan bisa dimanapun. Aplikasi ini juga lebih modern.', '-20230513093658.jpg', 'Y', '2023-05-13'),
(8, 'Aplikasi Website Sekolah', 'aplikasi-website-sekolah', 'Aplikasi Website Sekolah di buat oleh siswa dan siswi SMK 1 Triple \'J\' Jurusan RPL (Rekayasa Perangkat Lunak). Aplikasi ini di buat agar kita bisa melihat sekolah tanpa harus ke sekolah atau secara online hanya masuk ke Website Sekolah kita bisa lihat apa saja tentang sekolah. Aplikasi Website Sekolah ini mudah untuk di liat .', '-20230513080941.jpg', 'Y', '2023-05-13'),
(9, 'Super Blowing', 'super-blowing', 'Aplikasi ini di buat oleh salah satu siswa SMK 1 Triple \'J\' Jurusan RPL(Rekayasa Perangkat Lunak). Aplikasi Super Blowing adalah sebuah Aplikasi Game untuk bermain, sangkat mudah untuk di mainkan dan mudah untuk di pahami permainannya. Aplikasi ini juga memiliki desain yang sangat unik. ', '-20230513081033.jpg', 'Y', '2023-05-13'),
(10, 'Pengumpulan koin', 'pengumpulan-koin', 'Aplikasi Pengumpul Koin di buat oleh siswa dan siswi SMK 1 Triple \'J\' Jurusan RPL(Rekayasan Perangkat Lunak). Aplikasi ini adalah sebuah Game Pengumpul Koin yang sangkat mudah di mainkan untuk semua kalangan dan bisa membantu menghilangkan rasa penat dan gamood, Mudah dan Menyenangkan.', '-20230513081108.jpg', 'Y', '2023-05-13'),
(11, 'Sistem Informasi Poin Pelanggaran Siswa', 'sistem-informasi-poin-pelanggaran-siswa', 'Aplikasi Sistem Informasi Poin Pelanggaran Siswa ini di buat oleh siswa dan siswi SMK 1 Triple \'J\' Jurusan RPL(Rekayasan Perangkat Lunak). Aplikasi ini di buat agar memudahkan Guru BK untuk memberi poin atau sangsi kepada murid yang melanggar, bisa kita lihat juga Pelanggaran apa saja yang tidak boleh di Langgar oleh siswa dan siswi.', '-20230513081132.jpg', 'Y', '2023-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `photo` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `seo_title`, `content`, `photo`, `is_active`, `date`) VALUES
(10, 'Membuat Aplikasi Dengan Android Studio Bersama PT ASKII.', 'membuat-aplikasi-dengan-android-studio-bersama-pt-askii', 'siswa dan siswi SMK 1 Triple \'J\' kelas XI RPL (Rekayasa Perangkat Lunak) mendapatakan pembelajaran tentang pembuatan Aplikasi Android dengan menggunakan Android Studio di bimbing langsung oleh PT ASKII.', 'belajar-membuat-aplikasi-android-dengan-android-studio-bersama-pt-askii-20230512091500.jpg', 'Y', '2023-05-13'),
(11, 'Belajar Membuat Website dengan Tailwind CSS bersama PT BONET UTAMA.', 'belajar-membuat-website-dengan-tailwind-css-bersama-pt-bonet-utama', 'Di sini  kami belajar tentang membuat suatu website dengan orang yang berpengalaman', 'belajar-membuat-website-dengan-tailwind-css-bersama-pt-bonet-utama-20230512091819.jpg', 'Y', '2023-05-13'),
(12, 'Belajar dan Pemahaman Robotik dengan UNHAN RI.', 'belajar-dan-pemahaman-robotik-dengan-unhan-ri', 'SMK 1 Triple \'J\' Mendapatkan Bimbingan langsung dari cadet UNHAN RI(Universitas Pertahanan Republik Indonesia) Falkultas Sains dan Teknologi Pertahanan, khusunya bagi siswa dan siswi kelas X dan XI RPL(Rekayasa Perangkat Lunak) Tentang Robotik. Selama 8 - 19 Mei 2023.', '-20230512092235.jpg', 'Y', '2023-05-13'),
(13, 'PKL Mandiri bersama dengan PT BONET UTAMA INDONESIA.', 'pkl-mandiri-bersama-dengan-pt-bonet-utama-indonesia', 'PKL(Praktek Kerja Lapangan), Mandiri ini adalah sebuah Program yang harus di Laksanakan oleh semua siswa dan siswi \r\nSMK 1 Triple \'J\', PKL Mandiri ini di Laksanakan adalah syarat khusus dari sekolah untuk kelulusan bagi siswa dan siswi SMK 1 Triple \'J\', PKL Mandiri Kelas XI RPL ini di bimbing langsung oleh PT BONET UTAMA INDONESIA.', 'pkl-mandiri-bersama-dengan-pt-bonet-utama-indonesia-20230512092432.jpg', 'Y', '2023-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `structure`
--

CREATE TABLE `structure` (
  `id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `structure`
--

INSERT INTO `structure` (`id`, `photo`) VALUES
(1, 'e7bdf5f25ee57a0c2de4d59723298ff3.png');

-- --------------------------------------------------------

--
-- Table structure for table `submenus`
--

CREATE TABLE `submenus` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `sub_title` varchar(50) NOT NULL,
  `sub_url` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `submenus`
--

INSERT INTO `submenus` (`id`, `menu_id`, `sub_title`, `sub_url`, `is_active`) VALUES
(1, 1, 'Identitas Web', 'identitas', 'Y'),
(2, 1, 'Sambutan', 'sambutan', 'Y'),
(3, 3, 'Banner', 'banner', 'Y'),
(4, 3, 'Hubungan Industri', 'hubin', 'Y'),
(5, 3, 'Berita', 'berita', 'Y'),
(6, 3, 'Background Produk', 'background', 'Y'),
(7, 3, 'Portfolio', 'portfolio', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$12$zF4ZveNWuqAyRqZVMRGoJO4.hRfv/6Js.oLPX6sTXvyFofmF84QoW', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1684547113, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(3, '::1', 'tasyarojabilasamroi@mail.com', '$2y$10$ufb5qHckmFIQO0j06ACLhOVx/Bf8Z5C9xowPtUOZcIsEP.GOb.CMa', 'tasyarojabilasamroi@mail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1683943097, NULL, 1, 'gadun', 'rojak', NULL, '081511385307');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(42, 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bg_majors`
--
ALTER TABLE `bg_majors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hubins`
--
ALTER TABLE `hubins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `identity`
--
ALTER TABLE `identity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opening`
--
ALTER TABLE `opening`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `structure`
--
ALTER TABLE `structure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `submenus`
--
ALTER TABLE `submenus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bg_majors`
--
ALTER TABLE `bg_majors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hubins`
--
ALTER TABLE `hubins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `identity`
--
ALTER TABLE `identity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `majors`
--
ALTER TABLE `majors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `opening`
--
ALTER TABLE `opening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `structure`
--
ALTER TABLE `structure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `submenus`
--
ALTER TABLE `submenus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `submenus`
--
ALTER TABLE `submenus`
  ADD CONSTRAINT `submenus_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`);

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
