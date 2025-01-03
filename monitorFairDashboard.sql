-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 03, 2025 at 03:46 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `monitorFairDashboard`
--

-- --------------------------------------------------------

--
-- Table structure for table `childComments`
--

CREATE TABLE `childComments` (
  `child_comment_id` int(11) NOT NULL,
  `unique_id_post` varchar(500) DEFAULT NULL,
  `comment_unique_id` varchar(255) DEFAULT NULL,
  `child_comment_unique_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `child_commenter_username` varchar(255) DEFAULT NULL,
  `child_commenter_userid` varchar(255) DEFAULT NULL,
  `child_comment_text` longtext DEFAULT NULL,
  `child_comment_like_count` int(11) DEFAULT 0,
  `is_created_by_media_owner` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `likes_id` int(11) NOT NULL,
  `client_account` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `post_code` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `listAkun`
--

CREATE TABLE `listAkun` (
  `list_id` int(11) NOT NULL,
  `client_account` varchar(255) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `listAkun`
--

INSERT INTO `listAkun` (`list_id`, `client_account`, `platform`, `kategori`, `username`) VALUES
(215, '', '', 'test', 'humas_bandung');

-- --------------------------------------------------------

--
-- Table structure for table `listNews`
--

CREATE TABLE `listNews` (
  `list_id` int(11) NOT NULL,
  `client_account` varchar(255) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `query` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `listNews`
--

INSERT INTO `listNews` (`list_id`, `client_account`, `platform`, `kategori`, `query`) VALUES
(1, 'focuson', 'news', 'news', 'jawa barat');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `email`, `password`, `type`) VALUES
(1, 'admin@focuson.com', 'SuperAdmin123', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `mainComments`
--

CREATE TABLE `mainComments` (
  `main_comment_id` int(11) NOT NULL,
  `client_account` varchar(255) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `unique_id_post` varchar(500) DEFAULT NULL,
  `comment_unique_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `child_comment_count` varchar(255) DEFAULT NULL,
  `commenter_username` varchar(255) DEFAULT NULL,
  `commenter_userid` varchar(255) DEFAULT NULL,
  `comment_text` longtext DEFAULT NULL,
  `comment_like_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `query` varchar(255) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `snippet` varchar(255) DEFAULT NULL,
  `photo_url` longtext DEFAULT NULL,
  `thumbnail_url` longtext DEFAULT NULL,
  `published_datetime_utc` datetime DEFAULT NULL,
  `source_url` longtext DEFAULT NULL,
  `source_name` varchar(255) DEFAULT NULL,
  `source_logo_url` longtext DEFAULT NULL,
  `source_favicon_url` longtext DEFAULT NULL,
  `source_publication_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `query`, `title`, `link`, `snippet`, `photo_url`, `thumbnail_url`, `published_datetime_utc`, `source_url`, `source_name`, `source_logo_url`, `source_favicon_url`, `source_publication_id`) VALUES
(1, 'jawa barat', 'Prakiraan Cuaca Jawa Barat Terbaru: Bandung, Bekasi, Bogor, Depok serta Wilayah Lain', 'https://regional.kontan.co.id/news/prakiraan-cuaca-jawa-barat-terbaru-bandung-bekasi-bogor-depok-serta-wilayah-lain', 'Prakiraan Cuaca BMKG wilayah Jawa Barat, termasuk Bogor, Bekasi, Bandung, Cirebon, Tasikmalaya, Sukabumi, Cianjur (17 Desember 2024).', 'https://foto.kontan.co.id/GtusLm-D39Zyh70dNK3w-WtE-Xo=/640x360/smart/2021/06/18/2004518022p.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNU9NMjl5WWtWeGVIUm9VR2gwVFJDb0FSaXNBaWdCTWdhQlFJeVBNUVk=-w200-h200-p-df-rw', '2024-12-16 21:36:21', 'https://regional.kontan.co.id', 'Regional Kontan', NULL, 'https://encrypted-tbn2.gstatic.com/faviconV2?url=https://regional.kontan.co.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqMggKIixDQklTR3dnTWFoY0tGWEpsWjJsdmJtRnNMbXR2Ym5SaGJpNWpieTVwWkNnQVAB'),
(2, 'jawa barat', 'LPBINU Jabar Selenggarakan FGD Literasi Bencana di Pesisir Selatan Jawa Barat dan Banten', 'https://jabar.nu.or.id/kota-bandung/lpbinu-jabar-selenggarakan-fgd-literasi-bencana-di-pesisir-selatan-jawa-barat-dan-banten-EYjTt', 'Kegiatan ini bertujuan meningkatkan pemahaman masyarakat terkait risiko bencana, khususnya melalui peran Desa Tangguh Bencana (Destana). Ketua ...', 'https://storage.nu.or.id/storage/post/16_9/mid/gambar-whatsapp-2024-12-17-pukul-070606-8989a555_1734398094.webp', 'https://news.google.com/api/attachments/CC8iL0NnNHhlRlpaYURKUGFqaFhWV05XVFJDb0FSaXNBaWdCTWdrQmdJNmxRYVhJRFFJ=-w200-h200-p-df-rw', '2024-12-17 00:00:51', 'https://jabar.nu.or.id', 'NU Online Jabar', 'https://lh3.googleusercontent.com/UDSshqHquQ6T6hJ3KvezuwtAuoJV1x7ofVlQ5gKHnmOe_1lEp7Bcbetw5527gdtK3Px-lnh2OcA', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://jabar.nu.or.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMLOizwsw4r3mAw'),
(3, 'jawa barat', 'Pemdaprov Jawa Barat Akan Gelar Forum Diaspora Jabar Chapter IV Fokus memfasilitasi peluang beasiswa internasional', 'https://jabarprov.go.id/berita/pemdaprov-jawa-barat-akan-gelar-forum-diaspora-jabar-chapter-iv-fokus-memfasilitasi-pelua-16839', 'Mengusung tema “Peran Kemitraan Diaspora dalam Mendukung Pembangunan Sumber Daya Manusia Jawa Barat Berwawasan Global,” forum ini menjadi wadah ...', 'https://dvgddkosknh6r.cloudfront.net/live/media/img/1734349837-Screenshot-2024-12-16-184436.jpg', 'https://news.google.com/api/attachments/CC8iL0NnNDVjblZvWlY5ak4wVlhObmRzVFJDeUFSaWJBaWdCTWdrSmdvcnd4S005N0FF=-w200-h200-p-df-rw', '2024-12-16 11:54:28', 'https://jabarprov.go.id', 'Pemerintah Provinsi Jawa Barat', NULL, 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://jabarprov.go.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqKggKIiRDQklTRlFnTWFoRUtEMnBoWW1GeWNISnZkaTVuYnk1cFpDZ0FQAQ'),
(4, 'jawa barat', 'Jabar: Opsen Pajak untuk peningkatan kapasitas fiskal kabupaten/kota', 'https://jabar.antaranews.com/berita/566834/jabar-opsen-pajak-untuk-peningkatan-kapasitas-fiskal-kabupaten-kota', 'Terdapat pula penyesuaian tarif pajak kendaraan tahun 2025 yang dituangkan dalam Peraturan Daerah Nomor 9 tahun 2023 tentang Pajak Daerah dan ...', 'https://cdn.antaranews.com/cache/800x1600/2024/12/16/IMG-20241008-WA0000.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNTFaa1V6UjBkd0xUbGFPRkZEVFJDLUFoaWZBU2dCTWdZQmNZN0RMZ2M=-w200-h200-p-df-rw', '2024-12-17 00:31:40', 'https://jabar.antaranews.com', 'ANTARA Jawa Barat', 'https://lh3.googleusercontent.com/-AYMxaG2g_G_ToBbQHnI8ICGjex1zG-0e3mhq1RuzfrIdYKyfRFJb-cJjJBcPDo5RKopD3K4', 'https://encrypted-tbn1.gstatic.com/faviconV2?url=https://jabar.antaranews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMNzylwsw_ZuvAw'),
(5, 'jawa barat', 'Milangkala ke-15 IMHJB, Momentum Pererat Solidaritas Bikers Jawa Barat', 'https://jabarekspres.com/berita/2024/12/17/milangkala-ke-15-imhjb-momentum-pererat-solidaritas-bikers-jawa-barat/', 'Acara bertajuk Milangkala 15 Tahun IMHJB digelar di Gedung Sate, Jalan Diponegoro, Bandung, pada Sabtu (14/7), bertepatan dengan peluncuran ...', 'https://jabarekspres.com/wp-content/uploads/2024/12/WhatsApp-Image-2024-12-17-at-09.12.17.jpeg', 'https://news.google.com/api/attachments/CC8iK0NnNDBWVXRUZDNsS1FXcE1NMk5tVFJEQ0FSaURBaWdCTWdZQjBJVEZTQU0=-w200-h200-p-df-rw', '2024-12-17 02:41:25', 'https://jabarekspres.com', 'Jabar Ekspres', 'https://lh3.googleusercontent.com/MQimdr86Ck6CC1XumB2KkWjhNkSpCFG4dYOkHacxglocWyJ_4xQz1Rn4rHeF7lVXxJMyvp0', 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://jabarekspres.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAiEDbQdpRCEHpcktOp9O9a2X0qFAgKIhA20HaUQhB6XJLTqfTvWtl9'),
(6, 'jawa barat', 'Mantan Ketua KPU Jawa Barat Ummi Wahyuni Ajukan Keberatan Atas Putusan DKPP, Ini Isinya - Radar Bogor', 'https://radarbogor.jawapos.com/politik/2475430551/mantan-ketua-kpu-jawa-barat-ummi-wahyuni-ajukan-keberatan-atas-putusan-dkpp-ini-isinya', 'Dalam putusannya DKPP menyatakan Ummi Wahyuni bersalah telah melanggar kode etik dan diputuskan diberhentikan dari jabatannya sebagai Ketua KPU ...', 'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p2/247/2024/12/17/Ummi-Wahyuni-2536035453.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNTBiazlJYUROT1drcGtSbTFtVFJDM0FSaVRBaWdCTWdZdEZaTE9GUW8=-w200-h200-p-df-rw', '2024-12-17 02:43:41', 'https://radarbogor.jawapos.com', 'Jawa Pos', NULL, 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://radarbogor.jawapos.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqNAgKIi5DQklTSEFnTWFoZ0tGbkpoWkdGeVltOW5iM0l1YW1GM1lYQnZjeTVqYjIwb0FBUAE'),
(7, 'jawa barat', 'Prospek Cuaca Mingguan Periode 10–17 Desember 2024: Bibit Siklon Tropis dan Aktivitas Madden-Julian Oscillation (MJO) Turut Memicu Hujan Lebat di Indonesia', 'https://www.bmkg.go.id/cuaca/prospek-cuaca-mingguan/prospek-cuaca-mingguan-periode-10-17-desember-2024-bibit-siklon-tropis-dan-aktivitas-madden-julian-oscillation-mjo-turut-memicu-hujan-lebat-di-indonesia', 'Prospek Cuaca Mingguan Periode 10–17 Desember 2024: Bibit Siklon Tropis dan Aktivitas Madden-Julian Oscillation (MJO) Turut Memicu Hujan Lebat ...', 'https://i0.wp.com/content.bmkg.go.id/wp-content/uploads/Prospek-cuaca-mingguan-A.jpg?fit=1280%2C720&ssl=1', 'https://news.google.com/api/attachments/CC8iK0NnNHlha2RpZWpsV1VsWnFha1JzVFJDb0FSaXNBaWdCTWdhTmNZN3BNQVk=-w200-h200-p-df-rw', '2024-12-16 20:11:15', 'https://www.bmkg.go.id', 'BMKG', NULL, 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://www.bmkg.go.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqJAgKIh5DQklTRUFnTWFnd0tDbUp0YTJjdVoyOHVhV1FvQUFQAQ'),
(8, 'jawa barat', 'Bey Machmudin Harap Satgas Pangan Jawa Barat Hadirkan Solusi Keselarasan Data - Pikiran Rakyat Jabar', 'https://jabar.pikiran-rakyat.com/jawa-barat/pr-3658882877/bey-machmudin-harap-satgas-pangan-jawa-barat-hadirkan-solusi-keselarasan-data', 'Tak hanya itu, Bey berharap dengan adanya Satgas Pangan dapat meningkatkan kesejahteraan bagi para petani. Hal tersebut akan dibahas saat ...', 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/1200x675/photo/2024/12/17/3391552978.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNWhUMU4zUVhNNVUyTjJiR3RVVFJDb0FSaXNBaWdCTWdhUndJb0t3UVU=-w200-h200-p-df-rw', '2024-12-17 03:03:13', 'https://jabar.pikiran-rakyat.com', 'Pikiran Rakyat Jabar', 'https://lh3.googleusercontent.com/ucAmm9UBkMfWwInzdZOHYupOxeCCh0ugBdSC-NPGbxNRWCJgQkAb1X_xHVAW_emSrMl4DjyDcA', 'https://encrypted-tbn1.gstatic.com/faviconV2?url=https://jabar.pikiran-rakyat.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMN3IqQww78i2BA'),
(9, 'jawa barat', 'BNPB Percepat Penanganan Darurat Bencana Hidrometeorologi Basah Di Jawa Barat Dengan Operasi Modifikasi Cuaca', 'https://jabarprov.go.id/berita/bnpb-percepat-penanganan-darurat-bencana-hidrometeorologi-basah-di-jawa-barat-dengan-oper-16764', 'JAKARTA – Untuk mendukung penanganan darurat bencana hidrometeorologi basah di wilayah Sukabumi dan Cianjur, Jawa Barat.', 'https://dvgddkosknh6r.cloudfront.net/live/media/img/1733970249-IMG-20241212-WA0007.jpg', 'https://news.google.com/api/attachments/CC8iI0NnNDVkVjlqVVcwMVoyNUtOMXBWVFJEQ0FSaURBaWdCTWdB=-w200-h200-p-df-rw', '2024-12-16 13:56:17', 'https://jabarprov.go.id', 'Pemerintah Provinsi Jawa Barat', NULL, 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://jabarprov.go.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqKggKIiRDQklTRlFnTWFoRUtEMnBoWW1GeWNISnZkaTVuYnk1cFpDZ0FQAQ'),
(10, 'jawa barat', 'Riksa Budaya Jawa Barat 2024, Upaya Pelestarian Kebudayaan', 'https://jabarprov.go.id/berita/riksa-budaya-jawa-barat-2024-upaya-pelestarian-kebudayaan-16783', 'Pemerintah Daerah Provinsi Jawa Barat berkolaborasi dengan Pemerintah Daerah Kota Bogor, menggelar Riksa Budaya Jawa Barat di Alun-alun Kota ...', 'https://dvgddkosknh6r.cloudfront.net/live/media/img/1733991014-IMG-20241212-WA0007-(1).jpg', 'https://news.google.com/api/attachments/CC8iK0NnNXZRVGt3TkUwMWRtaDFSMlJaVFJDM0FSaVRBaWdCTWdZQmtJSkJ0Z1k=-w200-h200-p-df-rw', '2024-12-16 14:01:21', 'https://jabarprov.go.id', 'Pemerintah Provinsi Jawa Barat', NULL, 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://jabarprov.go.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqKggKIiRDQklTRlFnTWFoRUtEMnBoWW1GeWNISnZkaTVuYnk1cFpDZ0FQAQ'),
(11, 'jawa barat', 'Pj. Bupati Bekasi Optimis Desa Karangsatu Juara P2WKSS Tingkat Jawa Barat', 'https://jabarprov.go.id/berita/pj-bupati-bekasi-optimis-desa-karangsatu-juara-p2wkss-tingkat-jawa-barat-16779', 'Pj. Bupati Bekasi, Dedy Supriyadi mengatakan program terpadu P2WKSS merupakan upaya untuk meningkatkan peran perempuan agar berpartisipasi aktif ...', 'https://dvgddkosknh6r.cloudfront.net/live/media/img/1733981138-WhatsApp-Image-2024-12-11-at-14.51.15.jpeg', 'https://news.google.com/api/attachments/CC8iI0NnNUpibkJ1TVZZdFNtaFRVMlZCVFJDM0FSaVRBaWdCTWdB=-w200-h200-p-df-rw', '2024-12-16 14:01:21', 'https://jabarprov.go.id', 'Pemerintah Provinsi Jawa Barat', NULL, 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://jabarprov.go.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqKggKIiRDQklTRlFnTWFoRUtEMnBoWW1GeWNISnZkaTVuYnk1cFpDZ0FQAQ'),
(12, 'jawa barat', 'Pemda Kota Bandung Terima DIPA Petikan dan Buku Alokasi TKD 2025', 'https://jabarprov.go.id/berita/pemda-kota-bandung-terima-dipa-petikan-dan-buku-alokasi-tkd-2025-16772', 'Dalam acara tersebut, Pemda Kota Bandung menerima Daftar Isian Pelaksanaan Anggaran (DIPA) Petikan dan Buku Alokasi Transfer ke Daerah (TKD) ...', 'https://dvgddkosknh6r.cloudfront.net/live/media/img/1733980577-WhatsApp-Image-2024-12-11-at-7.03.55-PM.jpeg', 'https://news.google.com/api/attachments/CC8iK0NnNUdSMjEzVlVKaFRrUTJjVGhJVFJDM0FSaVRBaWdCTWdhRmtJZ3J1Z2M=-w200-h200-p-df-rw', '2024-12-16 13:51:07', 'https://jabarprov.go.id', 'Pemerintah Provinsi Jawa Barat', NULL, 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://jabarprov.go.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqKggKIiRDQklTRlFnTWFoRUtEMnBoWW1GeWNISnZkaTVuYnk1cFpDZ0FQAQ'),
(13, 'jawa barat', 'Antisipasi Bencana, DPRD Jawa Barat Sosialisasikan Perda Nomor 4 Tahun 2023', 'https://hasanah.id/antisipasi-bencana-dprd-jawa-barat-sosialisasikan-perda-nomor-4-tahun-2023', 'H. Tom Maskun, M.Pd, melakukan sosialisasi Peraturan Daerah (Perda) No. 4 Tahun 2023 tentang Rencana Perlindungan dan Pengelolaan Lingkungan ...', 'https://hasanah.id/wp-content/uploads/2024/12/TOM-MASKUN.jpeg', 'https://news.google.com/api/attachments/CC8iJ0NnNHhkREl5UlVsRk1WWnFiVEozVFJDc0FSaW1BaWdCTWdNQndBSQ=-w200-h200-p-df-rw', '2024-12-17 01:35:06', 'https://hasanah.id', 'Hasanah.id', 'https://lh3.googleusercontent.com/Lj69HGegsEfz5_NfYJz_4MQnSkpu5Ic8GGt-azPebNbTwdYVPIX_CFOaybst6iRQdkaDcpBhChY', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://hasanah.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAiEE0us3IRvIcUCSYynfciWRIqFAgKIhBNLrNyEbyHFAkmMp33IlkS'),
(14, 'jawa barat', 'Putusan MA Bikin Sakit Hati, Calon Gubernur Jawa Barat Ambil Langkah Mengejutkan untuk Segera Bebaskan Para Terpidana Kasus Kematian Vina Cirebon', 'https://www.tvonenews.com/berita/nasional/279003-putusan-ma-bikin-sakit-hati-calon-gubernur-jawa-barat-ambil-langkah-mengejutkan-untuk-segera-bebaskan-para-terpidana-kasus-kematian-vina-cirebon', 'Mahkamah Agung (MA) resmi memutuskan menolak permohonan Peninjauan Kembali yang diajukan para terpidana kasus kematian Vina dan Eky di Cirebon.', NULL, NULL, '2024-12-17 00:08:53', 'https://www.tvonenews.com', 'tvOneNews.com', 'https://lh3.googleusercontent.com/u1n7D199aEkYstjpd4uP-ZP6GNr2rrqw42-n-aLoMz3TsBGk81B0y1VsAtL-IjeFMVZh71vA0w', 'https://encrypted-tbn2.gstatic.com/faviconV2?url=https://www.tvonenews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMNOLnAsw5ZW0Aw'),
(15, 'jawa barat', 'Diskominfo Jabar Gelar Reviu Penyelenggaraan Statistik Sektoral Triwulan IV di Garut', 'https://jabarprov.go.id/berita/diskominfo-jabar-gelar-reviu-penyelenggaraan-statistik-sektoral-triwulan-iv-di-garut-16791', 'Dinas Komunikasi dan Informatika (Diskominfo) Provinsi Jawa Barat menggelar kegiatan Reviu Lanjutan Penyelenggaraan Statistik Sektoral ...', 'https://dvgddkosknh6r.cloudfront.net/live/media/img/1734077387-IMG-20241212-WA0362.jpg', 'https://news.google.com/api/attachments/CC8iL0NnNTJWekpzZVRsVlUwaEZabEU0VFJDb0FSaXNBaWdCTWdrSmc1TEZLcWhNN0FF=-w200-h200-p-df-rw', '2024-12-16 14:06:38', 'https://jabarprov.go.id', 'Pemerintah Provinsi Jawa Barat', NULL, 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://jabarprov.go.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqKggKIiRDQklTRlFnTWFoRUtEMnBoWW1GeWNISnZkaTVuYnk1cFpDZ0FQAQ'),
(16, 'jawa barat', 'Perlindungan Ketenagakerjaan, Pemda Kota Bandung Ikuti Rakor Implementasi Inpres Nomor 2 Tahun 2021', 'https://jabarprov.go.id/berita/perlindungan-ketenagakerjaan-pemda-kota-bandung-ikuti-rakor-implementasi-inpres-nomor-2-16843', '“Undang-Undang Nomor 24 Tahun 2011, tujuannya adalah untuk menjamin kesejahteraan tenaga kerja, mengurangi risiko kerja, memberikan perlindungan ...', 'https://dvgddkosknh6r.cloudfront.net/live/media/img/1734351653-WhatsApp-Image-2024-12-16-at-1.49.50-PM-(2).jpeg', 'https://news.google.com/api/attachments/CC8iMkNnNUZTRWMxYmpsck5GcFZPRlZ0VFJDM0FSaVRBaWdCTWdzSk1JZ0dLcVlOODJqTm9R=-w200-h200-p-df-rw', '2024-12-16 13:56:12', 'https://jabarprov.go.id', 'Pemerintah Provinsi Jawa Barat', NULL, 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://jabarprov.go.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqKggKIiRDQklTRlFnTWFoRUtEMnBoWW1GeWNISnZkaTVuYnk1cFpDZ0FQAQ'),
(17, 'jawa barat', '7 Universitas Kedokteran Terbaik di Jakarta dan Jawa Barat yang Terakreditasi Unggul, Salah Satunya di Bandung - Klik Pendidikan', 'https://www.klikpendidikan.id/news/35814163882/7-universitas-kedokteran-terbaik-di-jakarta-dan-jawa-barat-yang-terakreditasi-unggul-salah-satunya-di-bandung', 'Inilah 7 universitas kedokteran terbaik di Jakarta dan Jawa Barat yang resmi terakreditasi unggul oleh BAN PT. Salah satunya di Bandung.', 'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/358/2024/12/17/Salah-satu-universitas-kedokteran-terbaik-di-Jakarta-dan-Jawa-Barat-2239512310.png', 'https://news.google.com/api/attachments/CC8iK0NnNVlYM2RGWXpkaE9EUTBNRkIyVFJDM0FSaVRBaWdCTWdhbGtZeHVzUVk=-w200-h200-p-df-rw', '2024-12-17 02:14:13', 'https://www.klikpendidikan.id', 'Klik Pendidikan', 'https://lh3.googleusercontent.com/28PBAYC8aO94AyEVn3R9QYHP_7N43mAhTo1NBhgKKrlL1cFlrHV479iLiV4caXM4n2VfZStyViM', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://www.klikpendidikan.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMPe-sQswhNrIAw'),
(18, 'jawa barat', 'Daftar Harta Kekayaan Gubernur, Wali Kota, Bupati Terpilih se-Jawa Barat, Kakak Cakra Khan Terendah', 'https://batam.tribunnews.com/2024/12/17/daftar-harta-kekayaan-gubernur-wali-kota-bupati-terpilih-se-jawa-barat-kakak-cakra-khan-terendah', 'Terkaya ketiga adalah Wakil Bupati Terpilih Kabupaten Bogor, Ade Ruhandi dengan total harta kekayaan mencapai Rp 62 miliar untuk periodik 2023.', 'https://asset-2.tstatic.net/batam/foto/bank/images/Bupati-Pangandaran-2024-Citra-Pitriyami.jpg', 'https://news.google.com/api/attachments/CC8iL0NnNXBOa3BOYXpKd1JsSnhUSEV4VFJDb0FSaXNBaWdCTWdtRk1ZNmxGbW8xalFF=-w200-h200-p-df-rw', '2024-12-17 02:49:00', 'https://batam.tribunnews.com', 'Tribun Batam', 'https://lh3.googleusercontent.com/DaZxYgFtE0_1EALrQIqQmLveiKx0UvtZWeAGIoWNGhFfeG24wdx_Ns4c4KBzjFh4Wd44LzUOKho', 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://batam.tribunnews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMIWNjgsw-fagAw'),
(19, 'jawa barat', 'Perkuat Sinergi dan Kolaborasi, OJK Provinsi Jawa Barat Gelar Journalist Class', 'https://jabar.tribunnews.com/2024/12/16/perkuat-sinergi-dan-kolaborasi-ojk-provinsi-jawa-barat-gelar-journalist-class', 'Otoritas Jasa Keuangan (OJK) Provinsi Jawa Barat berkomitmen untuk terus melakukan kolaborasi dan sinergi dengan seluruh pemangku kepentingan, ...', 'https://asset-2.tstatic.net/jabar/foto/bank/images/adv-ojk.jpg', 'https://news.google.com/api/attachments/CC8iL0NnNURSbTlqZW1zeVUwWkNhRTFJVFJDb0FSaXNBaWdCTWdrQkFhU3RDS3pRNVFJ=-w200-h200-p-df-rw', '2024-12-16 14:20:24', 'https://jabar.tribunnews.com', 'Tribun Jabar', 'https://lh3.googleusercontent.com/aMBt0lNSnJ4udWLxQxMOzSe8e2_gpMMNFiH-DP2xu4d93AklpGCFvhMJHtFZKZOGWFtrmmIF', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://jabar.tribunnews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMIKKjgsw1OWgAw'),
(20, 'jawa barat', 'Program P2WKSS Ubah Wajah Desa Cipancar, Kini Lebih Berdaya dan Mandiri', 'https://jabarprov.go.id/berita/program-p2wkss-ubah-wajah-desa-cipancar-kini-lebih-berdaya-dan-mandiri-16819', 'Desa Cipancar, Kecamatan Leles, yang menjadi Lokasi Fokus (Lokus) Program Terpadu Peningkatan Peranan Wanita Menuju Keluarga Sehat Sejahtera ...', 'https://dvgddkosknh6r.cloudfront.net/live/media/img/1734186714-sabtu10.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNHdOVXBoUVhWMFNIZFNRMmw0VFJDM0FSaVRBaWdCTWdhZFpKQ3JxUWM=-w200-h200-p-df-rw', '2024-12-16 13:51:30', 'https://jabarprov.go.id', 'Pemerintah Provinsi Jawa Barat', NULL, 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://jabarprov.go.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqKggKIiRDQklTRlFnTWFoRUtEMnBoWW1GeWNISnZkaTVuYnk1cFpDZ0FQAQ'),
(21, 'jawa barat', 'Rencana Pemekaran Daerah di Jabar, 9 Calon Daerah Otonomi Baru Sudah Disetujui di Tingkat Provinsi', 'https://jabar.tribunnews.com/2024/12/17/rencana-pemekaran-daerah-di-jabar-9-calon-daerah-otonomi-baru-sudah-disetujui-di-tingkat-provinsi', 'Dengan jumlah penduduk sekitar 50 juta jiwa, Jawa Barat menjadi provinsi dengan populasi terbesar di Indonesia, namun hanya memiliki 27 ...', 'https://asset-2.tstatic.net/jabar/foto/bank/images/gedung-sate-yess.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNVlTMHRhVHpCSmRqbEJUbmwwVFJDb0FSaXNBaWdCTWdZQndZWkV5UU0=-w200-h200-p-df-rw', '2024-12-17 02:17:43', 'https://jabar.tribunnews.com', 'Tribun Jabar', 'https://lh3.googleusercontent.com/aMBt0lNSnJ4udWLxQxMOzSe8e2_gpMMNFiH-DP2xu4d93AklpGCFvhMJHtFZKZOGWFtrmmIF', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://jabar.tribunnews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMIKKjgsw1OWgAw'),
(22, 'jawa barat', 'Pekan Kebudayaan Daerah Jawa Barat 2024, Harmoni Keberagaman 3 Wilayah Budaya', 'https://disparbud.jabarprov.go.id/pekan-kebudayaan-daerah-jawa-barat-2024-harmoni-keberagaman-3-wilayah-budaya/', '“Pekan Kebudayaan Daerah Jawa Barat Tahun 2024 merupakan rangkaian kerja bidang kebudayaan Provinsi Jawa Barat di daerah, termasuk Kota Sukabumi ...', 'https://disparbud.jabarprov.go.id/wp-content/uploads/2024/12/IMG_8575-scaled.jpg', 'https://news.google.com/api/attachments/CC8iI0NnNVllREJ5UVRoWWQwbGpMVkpKVFJDb0FSaXNBaWdCTWdB=-w200-h200-p-df-rw', '2024-12-16 03:44:49', 'https://disparbud.jabarprov.go.id', 'Dinas Pariwisata dan Kebudayaan Provinsi Jawa Barat', NULL, 'https://encrypted-tbn1.gstatic.com/faviconV2?url=https://disparbud.jabarprov.go.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqOAgKIjJDQklTSHdnTWFoc0tHV1JwYzNCaGNtSjFaQzVxWVdKaGNuQnliM1l1WjI4dWFXUW9BQVAB'),
(23, 'jawa barat', 'Saat Tari-Tarian di Jawa Barat Punah, Coba Siapa yang Mesti Tanggungjawab - Priangan Insider', 'https://prianganinsider.pikiran-rakyat.com/budaya/pr-3838881527/saat-tari-tarian-di-jawa-barat-punah-coba-siapa-yang-mesti-tanggungjawab', 'Jawa Barat, provinsi yang dikenal sebagai gudangnya seni dan budaya, memiliki segudang warisan tari tradisional yang unik dan penuh makna.', 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/1200x675/photo/2024/12/16/1887725068.jpg', 'https://news.google.com/api/attachments/CC8iL0NnNDNTMFZITjJwamN6VjVORGRVVFJDb0FSaXNBaWdCTWdtUlE0YXBIZVZjVHdF=-w200-h200-p-df-rw', '2024-12-17 01:00:00', 'https://prianganinsider.pikiran-rakyat.com', 'Priangan Insider', 'https://lh3.googleusercontent.com/o7BkGspdcLm8U7qp6V98lTOSrD4m4bLkaX2nseFGVSWDWPD03vWehO9BzedeLpGPYm-hTdw3HT8', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://prianganinsider.pikiran-rakyat.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMNC8oAwwseSwBA'),
(24, 'jawa barat', 'Sukses Gelar Piala Soeratin, Depok Ditunjuk jadi Tuan Rumah Liga 4 Jawa Barat', 'https://jurnaldepok.id/sukses-gelar-piala-soeratin-depok-ditunjuk-jadi-tuan-rumah-liga-4-jawa-barat/', 'Kota Depok menjadi tuan rumah Kompetisi Liga 4 Jawa Barat Seri 1 yang digelar selama tiga minggu. Sekretaris Askot PSSI Kota Depok, Syafrudin ...', 'https://jurnaldepok.id/wp-content/uploads/2023/08/png-transparent-football-player-kickball-athlete-baquetas-game-hand-sport.png', 'https://news.google.com/api/attachments/CC8iK0NnNUxUVkV5TVdWMmExaEJjVzlmVFJEN0FSakpBU2dCTWdhdEFwd3lpUXM=-w200-h200-p-df-rw', '2024-12-17 01:33:53', 'https://jurnaldepok.id', 'JurnalDepok', NULL, 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://jurnaldepok.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqKQgKIiNDQklTRkFnTWFoQUtEbXAxY201aGJHUmxjRzlyTG1sa0tBQVAB'),
(25, 'jawa barat', 'Pemda Kota Bandung Optimis Kawasan Bawah Flyover Mochtar Kusumaatmadja Tertata', 'https://jabarprov.go.id/berita/pemda-kota-bandung-optimis-kawasan-bawah-flyover-mochtar-kusumaatmadja-tertata-16834', 'PORTALJABAR, KOTA BANDUNG - Penataan kawasan di bawah flyover Mochtar Kusumaatmadja terus menunjukkan perkembangan yang positif.', 'https://dvgddkosknh6r.cloudfront.net/live/media/img/1734252812-WhatsApp-Image-2024-12-15-at-10.26.33-AM.jpeg', 'https://news.google.com/api/attachments/CC8iL0NnNXVhMTk0U0c0NFUzZGFYMUV6VFJDM0FSaVRBaWdCTWdrQlVwQVRJYW01S3dJ=-w200-h200-p-df-rw', '2024-12-16 13:56:12', 'https://jabarprov.go.id', 'Pemerintah Provinsi Jawa Barat', NULL, 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://jabarprov.go.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqKggKIiRDQklTRlFnTWFoRUtEMnBoWW1GeWNISnZkaTVuYnk1cFpDZ0FQAQ'),
(26, 'jawa barat', 'Garut Raih Swasti Saba Wistara 2023, Bukti Komitmen Menuju Kabupaten Sehat', 'https://jabarprov.go.id/berita/garut-raih-swasti-saba-wistara-2023-bukti-komitmen-menuju-kabupaten-sehat-16756', 'Garut kembali menorehkan prestasi gemilang di bidang kesehatan dengan meraih Penghargaan Swasti Saba Wistara dalam Penilaian Kabupaten/Kota ...', 'https://dvgddkosknh6r.cloudfront.net/live/media/img/1733924135-rabu7.jpg', 'https://news.google.com/api/attachments/CC8iL0NnNVZkWE5UUlZSV2IzbEhWemc1VFJDb0FSaXNBaWdCTWdrQlFKcFduS21RaVFJ=-w200-h200-p-df-rw', '2024-12-16 13:51:14', 'https://jabarprov.go.id', 'Pemerintah Provinsi Jawa Barat', NULL, 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://jabarprov.go.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqKggKIiRDQklTRlFnTWFoRUtEMnBoWW1GeWNISnZkaTVuYnk1cFpDZ0FQAQ'),
(27, 'jawa barat', 'Rencana Pemekaran Provinsi Jawa Barat, Daerah Ini Akan Jadi Provinsi Baru', 'https://www.tintahijau.com/pemerintahan/rencana-pemekaran-provinsi-jawa-barat-daerah-ini-akan-jadi-provinsi-baru/', 'Provinsi Bogor Raya dirancang sebagai pemekaran dari Jawa Barat dan telah disiapkan untuk berdiri jika mendapatkan persetujuan dari pemerintah ...', 'https://www.tintahijau.com/wp-content/uploads/2024/12/Peta-Jawa-Barat.jpg', 'https://news.google.com/api/attachments/CC8iL0NnNXhTamxQTVRWc1lXVkVWVWRLVFJDM0FSaVRBaWdCTWdrSkFZb3FzYVl0UUFN=-w200-h200-p-df-rw', '2024-12-16 06:09:55', 'https://www.tintahijau.com', 'TINTAHIJAU.com', NULL, 'https://encrypted-tbn2.gstatic.com/faviconV2?url=https://www.tintahijau.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqKQgKIiNDQklTRkFnTWFoQUtEblJwYm5SaGFHbHFZWFV1WTI5dEtBQVAB'),
(28, 'jawa barat', 'Alfath Alima Hakim dan Maheswara Yogha Putra Al Ardha Sukses Raih Gelar Mojang Jajaka Pinilih 2024', 'https://disparbud.jabarprov.go.id/alfath-alima-hakim-dan-maheswara-yogha-putra-al-ardha-sukses-raih-gelar-mojang-jajaka-pinilih-2024/', 'Kegiatan ini merupakan kolaborasi Pemerintah Provinsi Jawa Barat dengan Paguyuban Mojang Jajaka Jawa Barat. Acara dibuka langsung oleh Pj ...', 'https://disparbud.jabarprov.go.id/wp-content/uploads/2024/12/A7R09767-scaled.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNUVYek01WkdnM1ZESlpTVEF5VFJDM0FSaVRBaWdCTWdhUlFZZ3BIZ28=-w200-h200-p-df-rw', '2024-12-16 11:49:40', 'https://disparbud.jabarprov.go.id', 'Dinas Pariwisata dan Kebudayaan Provinsi Jawa Barat', NULL, 'https://encrypted-tbn1.gstatic.com/faviconV2?url=https://disparbud.jabarprov.go.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqOAgKIjJDQklTSHdnTWFoc0tHV1JwYzNCaGNtSjFaQzVxWVdKaGNuQnliM1l1WjI4dWFXUW9BQVAB'),
(29, 'jawa barat', 'BMKG: Peringatan Dini Cuaca Jawa Barat, Bandung Hujan Lebat Disertai Angin Kencang di Sore Hari, Selasa 17 Desember 2024 - Portal Tebo', 'https://www.portaltebo.id/nasional/57314161359/bmkg-peringatan-dini-cuaca-jawa-barat-bandung-hujan-lebat-disertai-angin-kencang-di-sore-hari-selasa-17-desember-2024', 'Rilis terbaru BMKG menginformasikan terkait peringatan dini cuaca ekstrem wilayah Provinsi Jawa Barat. Selasa 17 Desember 2024. Hujan Lebat.', 'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/573/2023/10/20/kaltim-o2-3523332037.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNUpha0pOV0hwNGVFSmFaRmRwVFJDM0FSaVRBaWdCTWdZUms0anFRUVE=-w200-h200-p-df-rw', '2024-12-16 22:00:00', 'https://www.portaltebo.id', 'Portal tebo', 'https://lh3.googleusercontent.com/foS_qBW_LBuyh_OkCC-WgoUowDqAfXHn-vTzfj9sXxKjwiN0fWVSaj8-cpRiD9jB21rgoA_Xjg', 'https://encrypted-tbn2.gstatic.com/faviconV2?url=https://www.portaltebo.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMKCevAswrbnTAw'),
(30, 'jawa barat', 'Garut Tuan Rumah Porseni Harmoni Beragama ke-III Tingkat Jawa Barat', 'https://spjnews.id/2024/12/16/garut-tuan-rumah-porseni-harmoni-beragama-ke-iii-tingkat-jawa-barat/', '“ Selain sebagai ajang Porseni, kegiatan ini bertujuan mempererat silaturahmi para penyuluh agama di Jawa Barat,” ujarnya. Ia juga menyoroti ...', 'https://spjnews.id/wp-content/uploads/2024/12/IMG-20241216-WA0006.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNVdVWEZoV1hWMU5tRXdOVTl1VFJDOEFSaU1BaWdCTWdZQmtJeHRRUVk=-w200-h200-p-df-rw', '2024-12-16 21:09:27', 'https://spjnews.id', 'spjnews', NULL, 'https://encrypted-tbn2.gstatic.com/faviconV2?url=https://spjnews.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqJAgKIh5DQklTRUFnTWFnd0tDbk53YW01bGQzTXVhV1FvQUFQAQ'),
(31, 'jawa barat', 'Daftar Harta Kekayaan Semua Bupati dan Wali Kota Terpilih di Jawa Barat, Jawa Tengah, Jawa Timur', 'https://manado.tribunnews.com/2024/12/17/daftar-harta-kekayaan-semua-bupati-dan-wali-kota-terpilih-di-jawa-barat-jawa-tengah-jawa-timur', 'Rincian total harta kekayaan Bupati dan Wali Kota pemenang Pilkada 2024 di seluruh Kabupaten/Kota wilayah Provinsi se-Jawa ini, berdasarkan data ...', 'https://asset-2.tstatic.net/manado/foto/bank/images/Dafta-Harta-Kekayaan-Semua-Bupati-dan-Wali-Kota-Terpilih-di-Jawa-Barat-Jawa-Tengah-Jawa-Timur.jpg', 'https://news.google.com/api/attachments/CC8iI0NnNXdaMUpEY1ZGdFNXMVVjREZJVFJDb0FSaXNBaWdCTWdB=-w200-h200-p-df-rw', '2024-12-16 19:41:00', 'https://manado.tribunnews.com', 'Tribun Manado', 'https://lh3.googleusercontent.com/tN_y-3a5Yk3KlBCeM4yIiezCOZUMTes7VOr2mx9c5ZcD-lZCoTNJIHjn0jN7iQt4ysF7l674mQ', 'https://encrypted-tbn2.gstatic.com/faviconV2?url=https://manado.tribunnews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMMObjgsw2YGhAw'),
(32, 'jawa barat', 'Resmi Naik 6,5%, UMP Jakarta 2025 Terbesar Di Indonesia, Terkecil Jawa Tengah', 'https://regional.kontan.co.id/news/resmi-naik-65-ump-jakarta-2025-terbesar-di-indonesia-terkecil-jawa-tengah', 'UMP 2025 - Jakarta. Upah Minimum Provinsi (UMP) tahun 2025 resmi ditetapkan dengan kenaikan 6,5%. Dengan kenaikan tersebut, UMP Jakarta 2025 ...', 'https://foto.kontan.co.id/wZmhg2DF-kM607vQar78wG5TCsM=/640x360/smart/2024/02/12/961671732p.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNXNiWGhSWWw5RlozWjZWMHBHVFJDb0FSaXNBaWdCTWdhaEE0S09FUW8=-w200-h200-p-df-rw', '2024-12-16 22:00:00', 'https://regional.kontan.co.id', 'Regional Kontan', NULL, 'https://encrypted-tbn2.gstatic.com/faviconV2?url=https://regional.kontan.co.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqMggKIixDQklTR3dnTWFoY0tGWEpsWjJsdmJtRnNMbXR2Ym5SaGJpNWpieTVwWkNnQVAB'),
(33, 'jawa barat', 'Kanwil Kemenkumham Jabar Laksanakan Rapat Monev dan Implementasi Bisnis & HAM Daerah Bersama Pemprov Jabar', 'https://jabar.kemenkumham.go.id/berita-utama/kanwil-kemenkumham-jabar-laksanakan-rapat-monev-dan-implementasi-bisnis-ham-daerah-bersama-pemprov-jabar', 'Adapun dalam rapat Monev bersama Pemprov Jabar ini membahas mengenai capaian Aksi Bisnis & HAM (BHAM) di wilayah Jabar, yang mana Aksi BHAM ...', 'https://jabar.kemenkumham.go.id/images/2024/12/16/Rapat%20HAM/Artboard%201.jpg', 'https://news.google.com/api/attachments/CC8iI0NnNUpaMHhaTjNOT1JWRmhlRFZDVFJDLUFSaUtBaWdCTWdB=-w200-h200-p-df-rw', '2024-12-16 08:51:27', 'https://jabar.kemenkumham.go.id', 'kemenkumham jabar', NULL, 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://jabar.kemenkumham.go.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqNQgKIi9DQklTSFFnTWFoa0tGMnBoWW1GeUxtdGxiV1Z1YTNWdGFHRnRMbWR2TG1sa0tBQVAB'),
(34, 'jawa barat', 'Bey Machmudin: Pembangunan \"Flyover\" Nurtanio Ditargetkan Rampung Akhir Mei 2025', 'https://jabarprov.go.id/berita/bey-machmudin-pembangunan-flyover-nurtanio-ditargetkan-rampung-akhir-mei-2025-16840', '\"Kami meninjau pembangunan flyover Nurtanio, ini nilai investasinya Rp63 miliar dan ditargetkan selesai akhir Mei 2025,\" ucap Bey Machmudin saat ...', 'https://dvgddkosknh6r.cloudfront.net/live/media/img/1734350931-3bc2ddc3-84e3-4876-ad20-908f76bea2e1.jpg', 'https://news.google.com/api/attachments/CC8iI0NnNWlhRk13TTIxNk4yTmhURWRyVFJDM0FSaVRBaWdCTWdB=-w200-h200-p-df-rw', '2024-12-16 12:09:59', 'https://jabarprov.go.id', 'Pemerintah Provinsi Jawa Barat', NULL, 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://jabarprov.go.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqKggKIiRDQklTRlFnTWFoRUtEMnBoWW1GeWNISnZkaTVuYnk1cFpDZ0FQAQ'),
(35, 'jawa barat', 'Prakiraan Cuaca Jawa Barat 17 Desember 2024, Semua Wilayah Diguyur Hujan di Siang Hari', 'https://www.sukabumiupdate.com/science/151240/prakiraan-cuaca-jawa-barat-17-desember-2024-semua-wilayah-diguyur-hujan-di-siang-hari', 'Sebagian besar wilayah Jawa Barat termasuk Sukabumi dan sekitarnya diperkirakan mengalami cuaca hujan ringan hingga deras saat siang hari ...', 'https://media.sukabumiupdate.com/media/2024/04/12/1712925655_66192bd7777ba_O1y9vMZBt1YBS1dJ4x1r.webp', 'https://news.google.com/api/attachments/CC8iK0NnNXlVRFJ1YjNCTFJubFlabEp5VFJDb0FSaXNBaWdCTWdhNVVZWVNxUVE=-w200-h200-p-df-rw', '2024-12-16 21:55:31', 'https://www.sukabumiupdate.com', 'Sukabumi Update', 'https://lh3.googleusercontent.com/zkCFSAMXLL04hFdtvEvHlKijNxEEVO2m1I57_C8mTnqw-HIk71_aNdsjvbQvOwO57si_km0w8VM', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://www.sukabumiupdate.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMOvoogswrvO6Aw'),
(36, 'jawa barat', 'UMK di Kabupaten/Kota Jawa Barat Naik 6,5 Persen Bisa Beda-beda, Ini 8 Faktor yang Mempengaruhinya', 'https://jabar.tribunnews.com/2024/12/16/umk-di-kabupatenkota-jawa-barat-naik-65-persen-bisa-beda-beda-ini-8-faktor-yang-mempengaruhinya', 'Upah Minimum Kabupaten/Kota Jawa Barat 2025 jika naik 6,5 persen besaran kenaikannya berbeda-beda, berikut beberapa faktor yang ...', 'https://asset-2.tstatic.net/jabar/foto/bank/images/Ilustrasi-uang-rupiah-sejumlah-bantuan-sosial-bansos-dari-pemerintah.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNVFRV0pCVVhOSGN6UTJOMlpTVFJDb0FSaXNBaWdCTWdZcEVKQ3lGQWs=-w200-h200-p-df-rw', '2024-12-16 10:35:00', 'https://jabar.tribunnews.com', 'Tribun Jabar', 'https://lh3.googleusercontent.com/aMBt0lNSnJ4udWLxQxMOzSe8e2_gpMMNFiH-DP2xu4d93AklpGCFvhMJHtFZKZOGWFtrmmIF', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://jabar.tribunnews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMIKKjgsw1OWgAw'),
(37, 'jawa barat', 'Ika Siti Rahmatika Bersama Komisi II DPRD Jabar Lakukan Kunjungan Kerja ke Cabang Dinas Kehutanan Wilayah VIII', 'https://hasanah.id/ika-siti-rahmatika-bersama-komisi-ii-dprd-jabar-lakukan-kunjungan-kerja-ke-cabang-dinas-kehutanan-wilayah-viii', 'Ika Siti Rahmatika, S.E., bersama rombongan Komisi II DPRD Jabar melakukan kunjungan kerja (kunker) ke Cabang Dinas Kehutanan Wilayah VIII.', 'https://hasanah.id/wp-content/uploads/2024/12/Ika.png', 'https://news.google.com/api/attachments/CC8iK0NnNVdOMmcwUlVzMGIyTlJTSGhuVFJEQ0FSaURBaWdCTWdZQnNJQW9UQUk=-w200-h200-p-df-rw', '2024-12-17 01:49:21', 'https://hasanah.id', 'Hasanah.id', 'https://lh3.googleusercontent.com/Lj69HGegsEfz5_NfYJz_4MQnSkpu5Ic8GGt-azPebNbTwdYVPIX_CFOaybst6iRQdkaDcpBhChY', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://hasanah.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAiEE0us3IRvIcUCSYynfciWRIqFAgKIhBNLrNyEbyHFAkmMp33IlkS'),
(38, 'jawa barat', 'Anggota DPRD Jawa Barat, M Faizin Tegaskan Pemerintah Wajib Persiapkan Nataru Dengan Serius - Radar Depok', 'https://www.radardepok.com/politik/94614161591/anggota-dprd-jawa-barat-m-faizin-tegaskan-pemerintah-wajib-persiapkan-nataru-dengan-serius', 'Jelang Nataru, Anggota DPRD Jawa Barat Fraksi PKB, M Faizin minta pemerintah serius persiapkan nataru dengan serius, terutama jalan.', 'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/946/2024/07/28/D-faizin-2233519708.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNVdVVVkwVFRSemRGOXZUbHB1VFJDM0FSaVRBaWdCTWdhbGRaRHNMUWM=-w200-h200-p-df-rw', '2024-12-16 13:09:34', 'https://www.radardepok.com', 'Radar Depok', 'https://lh3.googleusercontent.com/QvlNJ1qoST__s7vgUURZDgoJY0Up-AJVAtxT7xBon9wS8IV1_pGAbK26R6ZrNz0VWVtNaYNZFmQ', 'https://encrypted-tbn1.gstatic.com/faviconV2?url=https://www.radardepok.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMPyYuQswibTQAw'),
(39, 'jawa barat', 'Pj Gubernur Jabar ingin Satgas Pangan optimal genjot produktivitas', 'https://www.antaranews.com/berita/4532174/pj-gubernur-jabar-ingin-satgas-pangan-optimal-genjot-produktivitas?utm_source=antaranews&utm_medium=desktop&utm_campaign=popular_right', 'Penjabat (Pj) Gubernur Jawa Barat Bey Triadi Machmudin mengungkapkan Pemprov Jabar ingin kehadiran Satgas Pangan optimal untuk menggenjot ...', 'https://cdn.antaranews.com/cache/1200x800/2023/03/13/Panen-Padi.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNWtRWGgyVGpaRVZsRXdWRFZ4VFJDM0FSaVRBaWdCTWdZQnNveXJQUVk=-w200-h200-p-df-rw', '2024-12-16 16:08:26', 'https://www.antaranews.com', 'ANTARA', 'https://lh3.googleusercontent.com/paG9_kLvy5PBqgGqPLaGc5tgluEM_d7jJ4HHbLs0f1QbM3Mn92vvqzy3_w9DqXhkMhD0h7gypQ', 'https://encrypted-tbn1.gstatic.com/faviconV2?url=https://www.antaranews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAiENVkiqJ5sNr-AI5dBUehMbAqFAgKIhDVZIqiebDa_gCOXQVHoTGw'),
(40, 'jawa barat', 'Dana Kampanye Jeje-Asep Paling Kecil di Pilbup Bandung Barat', 'https://www.detik.com/jabar/pilkada/d-7689247/dana-kampanye-jeje-asep-paling-kecil-di-pilbup-bandung-barat', 'Pasangan Sundaya-Asep Ilyas menerima dana kampanye sebesar Rp372.295.000 dengan jumlah pengeluaran kampanye sebesar Rp194.970.000 dengan hasil ...', 'https://awsimages.detik.net.id/community/media/visual/2024/09/24/gaya-deretan-selebriti-saat-penetapan-nomor-urut-pilkada-2024-3_169.jpeg?w=1200', 'https://news.google.com/api/attachments/CC8iL0NnNHlVVjlYVTE5a1gyZHROVGRXVFJDb0FSaXJBaWdCTWdtQlFZZ0lOaVkxaGdJ=-w200-h200-p-df-rw', '2024-12-16 16:00:45', 'https://www.detik.com', 'detikJabar', 'https://lh3.googleusercontent.com/moeqArfb-g4BtcbeFKUUuqI5nl0Vjnj8HVbbwpA7JgBUQd-ko3fSU4L_qWMVSaMvJSmYL4PlRA', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://www.detik.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMLOswAswxcfXAw'),
(41, 'jawa barat', 'Pj Gubernur Jabar ingin Satgas Pangan optimal genjot produktivitas', 'https://www.antaranews.com/berita/4532174/pj-gubernur-jabar-ingin-satgas-pangan-optimal-genjot-produktivitas', 'Penjabat (Pj) Gubernur Jawa Barat Bey Triadi Machmudin mengungkapkan Pemprov Jabar ingin kehadiran Satgas Pangan optimal untuk menggenjot ...', 'https://cdn.antaranews.com/cache/1200x800/2023/03/13/Panen-Padi.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNWtRWGgyVGpaRVZsRXdWRFZ4VFJDM0FSaVRBaWdCTWdZQnNveXJQUVk=-w200-h200-p-df-rw', '2024-12-16 16:08:26', 'https://www.antaranews.com', 'ANTARA', 'https://lh3.googleusercontent.com/paG9_kLvy5PBqgGqPLaGc5tgluEM_d7jJ4HHbLs0f1QbM3Mn92vvqzy3_w9DqXhkMhD0h7gypQ', 'https://encrypted-tbn1.gstatic.com/faviconV2?url=https://www.antaranews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAiENVkiqJ5sNr-AI5dBUehMbAqFAgKIhDVZIqiebDa_gCOXQVHoTGw'),
(42, 'jawa barat', 'Sistem PAS Berbasis Digital Tingkatkan Efisiensi dan Kualitas Pendidikan di Jawa Barat', 'https://www.liputan6.com/citizen6/read/5838588/sistem-pas-berbasis-digital-tingkatkan-efisiensi-dan-kualitas-pendidikan-di-jawa-barat', 'Dengan menggunakan aplikasi Pijar Sekolah, seluruh proses pengoreksian dan perhitungan nilai kini dilakukan secara otomatis. Hasil ujian pun ...', 'https://cdn1-production-images-kly.akamaized.net/OD0P8hjDv5a9tDMewBSvjBgZ4nU=/0x116:2400x1468/1200x675/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/4465100/original/003467700_1686708688-ed-us-RwZzAcRmbbI-unsplash.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNWpjRTlZYTBwV04wUkRNVGxXVFJDb0FSaXNBaWdCTWdhbFE0aE5JUWs=-w200-h200-p-df-rw', '2024-12-16 13:04:44', 'https://www.liputan6.com', 'Liputan6.com', 'https://lh3.googleusercontent.com/n1CLsZ1Zu6j5FGCVZKNnEzG-RF-3o_FwWKTaIuaj5DFspoYCjal1wBPmfGgz4q410Rkn4HuV7A', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://www.liputan6.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMN229AowxaOfAw'),
(43, 'jawa barat', 'Pemkab Bekasi tetapkan UMK 2025 sebesar Rp5,5 juta', 'https://m.antaranews.com/amp/berita/4532206/pemkab-bekasi-tetapkan-umk-2025-sebesar-rp55-juta', 'Pemerintah Kabupaten (Pemkab) Bekasi, Jawa Barat, menetapkan Upah Minimum Kabupaten (UMK) tahun 2025 sebesar Rp5,56 juta atau naik 6,5 ...', 'https://cdn.antaranews.com/cache/1200x800/2024/12/16/id10933.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNUJlRWg1WVUxS2VVbHpNRkY0VFJDM0FSaVRBaWdCTWdZQm9JalJ2QVk=-w200-h200-p-df-rw', '2024-12-16 16:26:15', 'https://m.antaranews.com', 'ANTARA', NULL, 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://m.antaranews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqKQgKIiNDQklTRkFnTWFoQUtEbUZ1ZEdGeVlXNWxkM011WTI5dEtBQVAB'),
(44, 'jawa barat', 'KPID Jabar Ungkap Pelanggaran Ramah Perempuan-Anak Masih Mendominasi', 'https://www.detik.com/jabar/berita/d-7689657/kpid-jabar-ungkap-pelanggaran-ramah-perempuan-anak-masih-mendominasi', 'KPID Jabar memaparkan hasil penelitian 2020-2024, menyoroti pelanggaran konten ramah perempuan dan anak. Revisi UU Penyiaran juga diusulkan ...', 'https://awsimages.detik.net.id/community/media/visual/2024/12/16/kegiatan-ekspose-hasil-penelitian-pengawasan-isi-siaran-di-aula-kantor-kpid-jabar-senin-16122024_169.jpeg?w=1200', 'https://news.google.com/api/attachments/CC8iJ0NnNDJlamxmYlVOak5UaFJkRVJzVFJDb0FSaXNBaWdCTWdNQm9BSQ=-w200-h200-p-df-rw', '2024-12-16 22:00:09', 'https://www.detik.com', 'detikJabar', 'https://lh3.googleusercontent.com/moeqArfb-g4BtcbeFKUUuqI5nl0Vjnj8HVbbwpA7JgBUQd-ko3fSU4L_qWMVSaMvJSmYL4PlRA', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://www.detik.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMLOswAswxcfXAw'),
(45, 'jawa barat', 'Kanim Bandung menjadi Wilayah Bebas Korupsi tahun 2024', 'https://jabar.antaranews.com/berita/566778/kanim-bandung-menjadi-wilayah-bebas-korupsi-tahun-2024', 'Kantor Imigrasi Kelas I Tempat Pemeriksaan Imigrasi TPI Bandung menjadi Wilayah Bebas dari Korupsi WBK pada tahun 2024 usai meraih predikat ...', 'https://cdn.antaranews.com/cache/800x1600/2024/12/16/IMG_20241216_223940.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNUNSbEpmWm04d1RrNXFOMEpIVFJDLUFoaWZBU2dCTWdZQlFKYW9KQWc=-w200-h200-p-df-rw', '2024-12-16 22:11:31', 'https://jabar.antaranews.com', 'ANTARA Jawa Barat', 'https://lh3.googleusercontent.com/-AYMxaG2g_G_ToBbQHnI8ICGjex1zG-0e3mhq1RuzfrIdYKyfRFJb-cJjJBcPDo5RKopD3K4', 'https://encrypted-tbn1.gstatic.com/faviconV2?url=https://jabar.antaranews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMNzylwsw_ZuvAw'),
(46, 'jawa barat', '250 Delegasi BPD Majalengka Mengikuti Jambore se-Jawa Barat di Kuningan - Pikiran Rakyat Jabar', 'https://jabar.pikiran-rakyat.com/jawa-barat/pr-3658881478/250-delegasi-bpd-majalengka-mengikuti-jambore-se-jawa-barat-di-kuningan', 'Sebanyak 250 delegasi BPD kabupaten Majalengka mengikuti kegiatan Jambore se-Jawa Barat di Kuningan, selama dua hari.', 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/1200x675/photo/2024/12/16/1921526993.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNWtWREpKTVZSck1FRlBXRVpQVFJDb0FSaXNBaWdCTWdZQlFKcEFvQWs=-w200-h200-p-df-rw', '2024-12-16 13:03:44', 'https://jabar.pikiran-rakyat.com', 'Pikiran Rakyat Jabar', 'https://lh3.googleusercontent.com/ucAmm9UBkMfWwInzdZOHYupOxeCCh0ugBdSC-NPGbxNRWCJgQkAb1X_xHVAW_emSrMl4DjyDcA', 'https://encrypted-tbn1.gstatic.com/faviconV2?url=https://jabar.pikiran-rakyat.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMN3IqQww78i2BA'),
(47, 'jawa barat', 'DPRD Jabar Harap Alokasi APBN 2025 untuk Jabar Bisa Tekan Kemiskinan dan Stunting', 'https://bandung.bisnis.com/read/20241216/549/1824759/dprd-jabar-harap-alokasi-apbn-2025-untuk-jabar-bisa-tekan-kemiskinan-dan-stunting', 'Alokasi Anggaran Pendapatan dan Belanja Negara (APBN) untuk Provinsi Jawa Barat tahun 2025 diproyeksikan mencapai Rp122,19 triliun.', 'https://images.bisnis.com/posts/2024/12/16/1824759/iswara_1734356146.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNTBObWRIY0ZkR2FUTm5ORkJaVFJDM0FSaVRBaWdCTWdheE00QlFIUWs=-w200-h200-p-df-rw', '2024-12-16 13:35:46', 'https://bandung.bisnis.com', 'Bisnis Jabar', NULL, 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://bandung.bisnis.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqLggKIihDQklTR0FnTWFoUUtFbUpoYm1SMWJtY3VZbWx6Ym1sekxtTnZiU2dBUAE'),
(48, 'jawa barat', 'Buruh Jabar Mengawal Kenaikan UMK 2025 Minimal 6,5 Persen', 'https://bandungbergerak.id/article/detail/1598497/buruh-jabar-mengawal-kenaikan-umk-2025-minimal-6-5-persen', 'Upah Minimum Provinsi (UMP) telah ditetapkan 6,5 persen. Maka, para buruh menuntut kenaikan UMK kabupaten/kota di Jabar minimal 6,5 persen. Aksi ...', 'https://bandungbergerak.id/cdn/1/2/1/7/6/12176.JPG', 'https://news.google.com/api/attachments/CC8iK0NnNU1jVTlITUdwa2VqaDFTbk0wVFJDb0FSaXNBaWdCTWdZQkk0cUNOUVE=-w200-h200-p-df-rw', '2024-12-17 00:09:01', 'https://bandungbergerak.id', 'BandungBergerak.id', NULL, 'https://encrypted-tbn1.gstatic.com/faviconV2?url=https://bandungbergerak.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMJLcpQwwpNS0BA'),
(49, 'jawa barat', 'BMKG Modifikasi Cuaca di Jalur Mudik Natal 2024 dan Tahun Baru 2025', 'https://www.kompas.id/artikel/bmkg-modifikasi-cuaca-di-jalur-mudik-natal-2024-dan-tahun-baru-2025', 'Potensi bencana bisa terjadi di semua wilayah yang dilewati pemudik, baik di jalur arteri, penyeberangan, maupun sebagian jalan tol.', 'https://assetd.kompas.id/Tc93_k19vkAr4VC8U6hbA8vD6eQ=/fit-in/1024x1920/filters:format(webp):quality(80)/https://asset.kgnewsroom.com/photo/pre/2022/12/15/96a4317d-a0fd-407b-94ac-78112784a173_jpg.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNXFZMjFpV1dGMFYwZGFlV3haVFJDVEFoaTNBU2dCTWdZQmNZZ0t4Z00=-w200-h200-p-df-rw', '2024-12-16 13:20:00', 'https://www.kompas.id', 'kompas.id', 'https://lh3.googleusercontent.com/ld2dGUdoV1DXztklYfjaU5U4oJZmMyYuTQOx9IPRvWNFEnzcWAx30_9z1sR8CDVKxIYGuu8s8g', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://www.kompas.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAiEGSBygQoppgZPGrHPBveILQqFAgKIhBkgcoEKKaYGTxqxzwb3iC0'),
(50, 'jawa barat', 'Kembali Terpilih Jadi Ketua Pengprov Muaythai Jawa Barat, Evi Silviadi Berkomitmen Bangun Muaythai Berbasis Industrialisasi', 'https://www.lampusatu.com/olahraga/kembali-terpilih-jadi-ketua-pengprov-muaythai-jawa-barat-evi-silviadi-berkomitmen-bangun-muaythai-berbasis-industrialisasi/', 'Usai dinyatakan terpilih kembali, Evi menyatakan siap melanjutkan kepemimpinan Muaythai Jabar periode ketiganya. Periode 2024-2029. Periode ...', 'https://www.lampusatu.com/wp-content/uploads/2024/12/IMG-20241216-WA0052.webp', 'https://news.google.com/api/attachments/CC8iK0NnNVdORFF4YWtSbWFqaE1MV3RZVFJDREFoakNBU2dCTWdZQmtJNG5PUVk=-w200-h200-p-df-rw', '2024-12-16 15:24:43', 'https://www.lampusatu.com', 'Lampusatu.com', NULL, 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://www.lampusatu.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMJfpngswrvO2Aw'),
(51, 'jawa barat', 'Ketum PSSI: Melawan Filipina, timnas Indonesia harus menang', 'https://jabar.antaranews.com/berita/566818/ketum-pssi-melawan-filipina-timnas-indonesia-harus-menang', 'Ketua Umum Persatuan Sepak Bola Seluruh Indonesia (PSSI) Erick Thohir menargetkan timnas Indonesia harus menang pada laga terakhir babak ...', 'https://cdn.antaranews.com/cache/800x1600/2024/12/16/E.jpeg', 'https://news.google.com/api/attachments/CC8iK0NnNUljM2xhVGxacFVIQnNTalJLVFJDLUFoaWZBU2dCTWdZQlk0YU9LUWc=-w200-h200-p-df-rw', '2024-12-16 22:44:06', 'https://jabar.antaranews.com', 'ANTARA Jawa Barat', 'https://lh3.googleusercontent.com/-AYMxaG2g_G_ToBbQHnI8ICGjex1zG-0e3mhq1RuzfrIdYKyfRFJb-cJjJBcPDo5RKopD3K4', 'https://encrypted-tbn1.gstatic.com/faviconV2?url=https://jabar.antaranews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMNzylwsw_ZuvAw'),
(52, 'jawa barat', 'Pemkab Garut edukasi kepsek tertib kelola dana BOSP', 'https://jabar.antaranews.com/berita/566758/pemkab-garut-edukasi-kepsek-tertib-kelola-dana-bosp', 'Pemerintah Kabupaten Garut, Jawa Barat menggelar bimbingan teknis untuk mengedukasi kepala sekolah agar memiliki kemampuan lebih tertib ...', 'https://cdn.antaranews.com/cache/800x1600/2024/12/16/IMG_20241216_184551.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNXljblZWV25GVFF6VTVXalJwVFJDLUFoaWZBU2dCTWdZQkFvWWxsUW8=-w200-h200-p-df-rw', '2024-12-16 14:03:00', 'https://jabar.antaranews.com', 'ANTARA Jawa Barat', 'https://lh3.googleusercontent.com/-AYMxaG2g_G_ToBbQHnI8ICGjex1zG-0e3mhq1RuzfrIdYKyfRFJb-cJjJBcPDo5RKopD3K4', 'https://encrypted-tbn1.gstatic.com/faviconV2?url=https://jabar.antaranews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMNzylwsw_ZuvAw'),
(53, 'jawa barat', 'Gelar Rakor, LDNU Jawa Barat Evaluasi Kepengurusan dan Bahas Program Kerja 2025', 'https://jabar.nu.or.id/kota-bandung/gelar-rakor-ldnu-jawa-barat-evaluasi-kepengurusan-dan-bahas-program-kerja-2025-9UVqy', 'Lembaga Dakwah Pengurus Wilayah Nahdlatul Ulama (LD-PWNU) Jawa Barat menggelar rapat koordinasi yang bertempat di Gedung Dakwah PWNU Jawa Barat, ...', 'https://storage.nu.or.id/storage/post/16_9/mid/whatsapp-image-2024-12-15-at-235210_1734282046.webp', 'https://news.google.com/api/attachments/CC8iI0NnNUhVRkZRZG5Od1QwWmtYMG95VFJDb0FSaXNBaWdCTWdB=-w200-h200-p-df-rw', '2024-12-16 03:32:08', 'https://jabar.nu.or.id', 'NU Online Jabar', 'https://lh3.googleusercontent.com/UDSshqHquQ6T6hJ3KvezuwtAuoJV1x7ofVlQ5gKHnmOe_1lEp7Bcbetw5527gdtK3Px-lnh2OcA', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://jabar.nu.or.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMLOizwsw4r3mAw');
INSERT INTO `news` (`news_id`, `query`, `title`, `link`, `snippet`, `photo_url`, `thumbnail_url`, `published_datetime_utc`, `source_url`, `source_name`, `source_logo_url`, `source_favicon_url`, `source_publication_id`) VALUES
(54, 'jawa barat', 'Pesan Erick Thohir pada Shin: \"Jangan banyak mengeluh\"', 'https://jabar.antaranews.com/berita/566790/pesan-erick-thohir-pada-shin-jangan-banyak-mengeluh', '\"Jangan banyak bicara, jangan banyak ngeluh, kita fokus sajalah. Kita fokus di program yang kita sudah sepakati,\" kata Erick ketika ditemui awak ...', 'https://cdn.antaranews.com/cache/1200x800/2024/12/17/ET-2.jpeg', 'https://news.google.com/api/attachments/CC8iK0NnNU5ZMHBCZEcxalFrbHBhekZZVFJDM0FSaVRBaWdCTWdZTkVJeHZwUWc=-w200-h200-p-df-rw', '2024-12-16 22:28:54', 'https://jabar.antaranews.com', 'ANTARA Jawa Barat', 'https://lh3.googleusercontent.com/-AYMxaG2g_G_ToBbQHnI8ICGjex1zG-0e3mhq1RuzfrIdYKyfRFJb-cJjJBcPDo5RKopD3K4', 'https://encrypted-tbn1.gstatic.com/faviconV2?url=https://jabar.antaranews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMNzylwsw_ZuvAw'),
(55, 'jawa barat', 'Computer Based Test Mudahkan Penilaian Akhir Sekolah di Jawa Barat', 'https://jabar.tribunnews.com/2024/12/16/computer-based-test-mudahkan-penilaian-akhir-sekolah-di-jawa-barat', 'Menilik data Pijar Sekolah, hingga September 2024 lalu, fitur CBT (Computer Based Test) sudah dipercaya lebih dari 200 sekolah di Jawa Barat ...', 'https://asset-2.tstatic.net/jabar/foto/bank/images/CBT-Mudahkan-Penilaian-Akhir-Sekolah-di-Jawa-Barat.jpg', 'https://news.google.com/api/attachments/CC8iL0NnNTJlak5XYkRWNlVYRmpWbVYyVFJDb0FSaXNBaWdCTWdrTk1JcXlJR2lDVUFF=-w200-h200-p-df-rw', '2024-12-16 12:13:00', 'https://jabar.tribunnews.com', 'Tribun Jabar', 'https://lh3.googleusercontent.com/aMBt0lNSnJ4udWLxQxMOzSe8e2_gpMMNFiH-DP2xu4d93AklpGCFvhMJHtFZKZOGWFtrmmIF', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://jabar.tribunnews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMIKKjgsw1OWgAw'),
(56, 'jawa barat', 'Sekda Herman Suryatman Ajak Akademisi Berkontribusi untuk Indonesia Emas 2045', 'https://jabarprov.go.id/berita/sekda-herman-suryatman-ajak-akademisi-berkontribusi-untuk-indonesia-emas-2045-16813', 'Sekretaris Daerah Provinsi Jawa Barat Herman Suryatman mengajak akademisi untuk bersama menjemput Indonesia Emas 2045.', 'https://dvgddkosknh6r.cloudfront.net/live/media/img/1734185783-sabtu4.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNHpkSEpNTVhkME1HeHdTMG8yVFJDM0FSaVRBaWdCTWdZWkk0d3BtUW8=-w200-h200-p-df-rw', '2024-12-16 13:51:14', 'https://jabarprov.go.id', 'Pemerintah Provinsi Jawa Barat', NULL, 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://jabarprov.go.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqKggKIiRDQklTRlFnTWFoRUtEMnBoWW1GeWNISnZkaTVuYnk1cFpDZ0FQAQ'),
(57, 'jawa barat', 'PABPDSI Jawa Barat Sukses Selenggarakan Jambore Desa Se-jawa Barat', 'https://faktanews24.com/cirebon-raya/pabpdsi-jawa-barat-sukses-selenggarakan-jambore-desa-se-jawa-barat.html', 'PABPDSI jawa barat sukses selenggarakan jambore desa se-jawa barat ,pada hari sabtu dan minggu tanggal 14-15 desember 2024. Bertempat di open ...', 'https://faktanews24.com/wp-content/uploads/2024/12/IMG-20241216-WA0042.jpg?v=1734385634', 'https://news.google.com/api/attachments/CC8iL0NnNVRjVjlKVGpkRGIyaFdiVEpoVFJEQ0FSaURBaWdCTWdrUk1ZeHFGV1ZGandF=-w200-h200-p-df-rw', '2024-12-16 21:49:16', 'https://faktanews24.com', 'Faktanews24', NULL, 'https://encrypted-tbn2.gstatic.com/faviconV2?url=https://faktanews24.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqKggKIiRDQklTRlFnTWFoRUtEMlpoYTNSaGJtVjNjekkwTG1OdmJTZ0FQAQ'),
(58, 'jawa barat', 'Tingkat Partisipasi Jabar Anjlok, Ahmad Sebut Banyak Faktor', 'https://www.rri.co.id/pilkada-2024/1195678/tingkat-partisipasi-jabar-anjlok-ahmad-sebut-banyak-faktor', 'Dalam Perhelatan Pilkada Serentak 2024 Tingkat partisipasi masyarakat mengalami penurunan signifikan. Berdasarkan data dari Komisi Pemilihan ...', 'https://cdn.rri.co.id/berita/Bandung/o/1734363080661-images_(8)/dug1b2eji3bn1mq.jpeg', 'https://news.google.com/api/attachments/CC8iK0NnNHdXbmN4U2twYVN6TTFiWE5oVFJEQ0FSaURBaWdCTWdhMUk0eHdRUVU=-w200-h200-p-df-rw', '2024-12-16 15:41:00', 'https://www.rri.co.id', 'rri.co.id', NULL, 'https://encrypted-tbn2.gstatic.com/faviconV2?url=https://www.rri.co.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMLTXngswy-G2Aw'),
(59, 'jawa barat', 'Buruh Jawa Barat Tuntut Kenaikan UMK 2025 Minimal 6,5 Persen', 'https://foto.tempo.co/read/118457/buruh-jawa-barat-tuntut-kenaikan-umk-2025-minimal-65-persen', 'Buruh menuntut agar pemerintah menetapkan UMK tahun 2025 dengan minimal kenaikan sebesar 6,5 persen dari nilai UMK tahun 2024.', 'https://statik.tempo.co/data/2024/12/16/id_1362618/1362618_720.jpg', 'https://news.google.com/api/attachments/CC8iL0NnNVRNbEZSWmtzM1VteHNiR2xyVFJDb0FSaXNBaWdCTWdtQklJNWdqLXJJQ3dJ=-w200-h200-p-df-rw', '2024-12-16 12:00:00', 'https://foto.tempo.co', 'Tempo.co', NULL, 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://foto.tempo.co&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqKAgKIiJDQklTRXdnTWFnOEtEV1p2ZEc4dWRHVnRjRzh1WTI4b0FBUAE'),
(60, 'jawa barat', 'Tips hadapi sejumlah penyakit pancaroba', 'https://jabar.antaranews.com/berita/566810/tips-hadapi-sejumlah-penyakit-pancaroba', 'Medical Manager Halodoc dr. Monica Cynthia Dewi memberikan sejumlah tips untuk menghadapi penyakit musiman saat pancaroba seperti Infeksi ...', 'https://cdn.antaranews.com/cache/800x1600/2024/10/31/Ilustrasi-penyakit-pancaroba.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNVZWRjlqVm1kd1VDMURPUzFEVFJDLUFoaWZBU2dCTWdhQkFvTGhFQXM=-w200-h200-p-df-rw', '2024-12-16 22:38:01', 'https://jabar.antaranews.com', 'ANTARA Jawa Barat', 'https://lh3.googleusercontent.com/-AYMxaG2g_G_ToBbQHnI8ICGjex1zG-0e3mhq1RuzfrIdYKyfRFJb-cJjJBcPDo5RKopD3K4', 'https://encrypted-tbn1.gstatic.com/faviconV2?url=https://jabar.antaranews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMNzylwsw_ZuvAw'),
(61, 'jawa barat', 'Rajapolah, Tasikmalaya Sentra Kerajinan Anyaman di Wilayah Jawa Barat yang Tembus Pasar Dunia', 'https://www.goodnewsfromindonesia.id/2024/12/16/rajapolah-tasikmalaya-sentra-kerajinan-anyaman-di-wilayah-jawa-barat-yang-tembus-pasar-dunia', 'Rajapolah, Tasikmalaya sebagai pusat pemasaran dan promosi kerajinan anyaman terbesar di wilayah Jawa Barat yang produknya tembus pasar ...', 'https://cdngnfi2.sgp1.digitaloceanspaces.com/gnfi/uploads/articles/large-rajapolah-tasikmalaya-sentra-kerajinan-anyaman-di-wilayah-jawa-barat-yang-tembus-pasar-dunia-iEM6KRZOTL.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNVdTME5FVTBKYU0zZDRkMFJuVFJDM0FSaVRBaWdCTWdZRms0eWxOZ2M=-w200-h200-p-df-rw', '2024-12-16 14:39:59', 'https://www.goodnewsfromindonesia.id', 'Good News From Indonesia', 'https://lh3.googleusercontent.com/BUVhaAgsvnCAnqKaRzSKnR-LUVYnJwxRGtwW9rMChBUJWZFTgRNaPE_qSi6znEBH5gXT2ORp2Q', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://www.goodnewsfromindonesia.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMJ-KmQswr5SxAw'),
(62, 'jawa barat', 'Terulang Lagi, Seorang Lansia di Bandung Meninggal dalam Kesendirian', 'https://www.kompas.id/artikel/terulang-lagi-seorang-lansia-di-bandung-meninggal-dalam-kesendirian', 'BANDUNG, KOMPAS - Seorang pria bernama Edi Haryanto (62) ditemukan meninggal dunia di sebuah rumah kontrakannya di Kota Bandung, Jawa Barat, ...', 'https://assetd.kompas.id/PFY3UwBC4QCkgB7pcEq8iGPWO5A=/fit-in/1024x721/filters:format(webp):quality(80)/https://cdn-dam.kompas.id/images/2024/12/16/04382f72808e25922fecb1979c5d57b3-Videoshot_20241216_185056_copy_339x191.jpg', 'https://news.google.com/api/attachments/CC8iL0NnNDVZbkY2VXpsSU9IcDFTbGszVFJDb0FSaXJBaWdCTWdrQllvaUxyYVBJcmdF=-w200-h200-p-df-rw', '2024-12-16 12:35:00', 'https://www.kompas.id', 'kompas.id', 'https://lh3.googleusercontent.com/ld2dGUdoV1DXztklYfjaU5U4oJZmMyYuTQOx9IPRvWNFEnzcWAx30_9z1sR8CDVKxIYGuu8s8g', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://www.kompas.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAiEGSBygQoppgZPGrHPBveILQqFAgKIhBkgcoEKKaYGTxqxzwb3iC0'),
(63, 'jawa barat', 'Samakan Persepsi, Dishub Jabar Gelar Rakor Angkutan Nataru', 'https://www.rri.co.id/jawa-barat/nataru/1194946/samakan-persepsi-dishub-jabar-gelar-rakor-angkutan-nataru', 'Dinas Perhubungan (Dishub) Jawa Barat menggelar Rapat Koordinasi Rencana Operasi Penyelenggaraan Angkutan Natal 2024 dan Tahun Baru 2025 dengan ...', 'https://cdn.rri.co.id/berita/Bandung/o/1734345408115-DSC04626/ahc5y21foghjyjg.jpeg', 'https://news.google.com/api/attachments/CC8iK0NnNTRSbFJPTjNaSlRUVnpUV05rVFJDM0FSaVRBaWdCTWdZVllZU05xUWc=-w200-h200-p-df-rw', '2024-12-16 11:09:00', 'https://www.rri.co.id', 'rri.co.id', NULL, 'https://encrypted-tbn2.gstatic.com/faviconV2?url=https://www.rri.co.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMLTXngswy-G2Aw'),
(64, 'jawa barat', 'Persikotas Sempurna di Grup C Liga 4 seri II Jawa Barat usai Kalahkan Super Progresif 1-0 Tadi Sore', 'https://jabar.tribunnews.com/2024/12/16/persikotas-sempurna-di-grup-c-liga-4-seri-ii-jawa-barat-usai-kalahkan-super-progresif-1-0-tadi-sore', 'Persikotas mengalahkan Super Progresif 1-0 di pertandingan yang dimainkan di Lapangan Inspire Arena, Parongpong.', 'https://asset-2.tstatic.net/jabar/foto/bank/images/persikotas-vs-super-progresif.jpg', 'https://news.google.com/api/attachments/CC8iI0NnNDNjMFJ5VFhKUWJISklhMkppVFJDb0FSaXNBaWdCTWdB=-w200-h200-p-df-rw', '2024-12-16 11:11:58', 'https://jabar.tribunnews.com', 'Tribun Jabar', 'https://lh3.googleusercontent.com/aMBt0lNSnJ4udWLxQxMOzSe8e2_gpMMNFiH-DP2xu4d93AklpGCFvhMJHtFZKZOGWFtrmmIF', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://jabar.tribunnews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMIKKjgsw1OWgAw'),
(65, 'jawa barat', 'UMK dan UMSK Kota Bekasi 2025 Siap Diserahkan ke Gubernur Jawa Barat untuk Penetapan', 'https://radarbekasi.id/2024/12/16/umk-dan-umsk-kota-bekasi-2025-siap-diserahkan-ke-gubernur-jawa-barat-untuk-penetapan/', 'Dewan Pengupahan Kota (Depeko) Bekasi lebih dulu menyepakati kenaikan UMK 6,5 persen atau sebesar Rp347.322. Sedangkan UMSK disepakati 7,5 ...', 'https://rbasset.s3.ap-southeast-1.amazonaws.com/2024/12/16162333/buruh1.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNXFTMWhXUVRCdGEyaFlRMVZqVFJDcEFSaXFBaWdCTWdZQmtaSmdPUWM=-w200-h200-p-df-rw', '2024-12-16 09:24:14', 'https://radarbekasi.id', 'Radar Bekasi', 'https://lh3.googleusercontent.com/ujNu3SJ5kF3MTjPMFPX7OPUKH7x8sNDWiziAWAWTSna1-EvN5mJJHu4YZbR3x2otYzQmJG4nfLw', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://radarbekasi.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMMDNvAswzejTAw'),
(66, 'jawa barat', 'Moka Sumedang Nurul dan Dicky Torehkan Prestasi pada Pasanggiri Moka Jabar 2024', 'https://sumedangkab.go.id/berita/detail/moka-sumedang-nurul-dan-dicky-torehkan-prestasi-pada-pasanggiri-moka-jabar-2024', 'Nurul Aprilia asal Kecamatan Tanjungkerta menjadi Juara ke-2 dan Dicky Andhika Pebriana asal Kecamatan Buahdua menjadi juara kategori Jajaka ...', 'https://sumedangkab.go.id/data/images/featured_image/uploads/berita_20241216050557.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNTVaR3hRTjJ4b1JtdDNVazFrVFJDMkFSaVZBaWdCTWdhUk01YUpJUWs=-w200-h200-p-df-rw', '2024-12-16 10:08:52', 'https://sumedangkab.go.id', 'Detail Video - Kabupaten Sumedang', NULL, 'https://encrypted-tbn1.gstatic.com/faviconV2?url=https://sumedangkab.go.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqLQgKIidDQklTRndnTWFoTUtFWE4xYldWa1lXNW5hMkZpTG1kdkxtbGtLQUFQAQ'),
(67, 'jawa barat', 'Serah Terima Jabatan Ketua PIPAS Jawa Barat, Lapas Purwakarta Hadir Bersama UPT Se-CIPURWABESUKA - Kompasiana.com', 'https://www.kompasiana.com/lapaspwk/675fcc1b34777c6b0f215c73/serah-terima-jabatan-ketua-pipas-jawa-barat-lapas-purwakarta-hadir-bersama-upt-se-cipurwabesuka', 'Ketua PIPAS Jabar sebelumnya Liza Robianto melaksanakan serah-terima jabatan kepada Ketua PIPAS Jabar yang baru yaitu Ika Wachid Wibowo. Selain ...', 'https://assets-a2.kompasiana.com/items/album/2024/12/16/ig-1-675fcbb9ed641570836e5be2.jpg?t=o&v=780', 'https://news.google.com/api/attachments/CC8iK0NnNWpiMFp1VFVOb05IVkxWMFZpVFJEZ0FSamdBU2dCTWdhUlFwQnBPUVk=-w200-h200-p-df-rw', '2024-12-16 06:43:39', 'https://www.kompasiana.com', 'Kompasiana.com', 'https://lh3.googleusercontent.com/Q-Ob8NTR7F6_XHZ5d5UTdcI4gs_2APCv7RFYxb54bDb38FgB7SykuirZ1BDE4bZXPcy6mVhoMQ', 'https://encrypted-tbn1.gstatic.com/faviconV2?url=https://www.kompasiana.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMJaC0wsw5Z3qAw'),
(68, 'jawa barat', 'Daftar Harta Kekayaan Wakil Wali Kota dan Wabup Terpilih se-Jawa Barat Pilkada 2024, Siapa Terkaya?', 'https://manado.tribunnews.com/2024/12/16/daftar-harta-kekayaan-wakil-wali-kota-dan-wabup-terpilih-se-jawa-barat-pilkada-2024-siapa-terkaya', 'Berikut daftar harta kekayaan pasangan Gubernur, Wali Kota dan Bupati yang terpilih di Pilkada Serentak 2024.', 'https://asset-2.tstatic.net/manado/foto/bank/images/Ade-Ruhandi-Siti-Farida-Ramzi.jpg', 'https://news.google.com/api/attachments/CC8iL0NnNTJXRkZDU2pkNGEycFlWMDFSVFJDb0FSaXNBaWdCTWdrQlFKaU9KT25JU2dJ=-w200-h200-p-df-rw', '2024-12-16 12:57:38', 'https://manado.tribunnews.com', 'Tribun Manado', 'https://lh3.googleusercontent.com/tN_y-3a5Yk3KlBCeM4yIiezCOZUMTes7VOr2mx9c5ZcD-lZCoTNJIHjn0jN7iQt4ysF7l674mQ', 'https://encrypted-tbn2.gstatic.com/faviconV2?url=https://manado.tribunnews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMMObjgsw2YGhAw'),
(69, 'jawa barat', 'Peninjauan proyek jalan layang Nurtanio di Bandung', 'https://jabar.antaranews.com/foto/566766/peninjauan-proyek-jalan-layang-nurtanio-di-bandung', 'PJ Gubernur Jawa Barat Bey Machmudin bersama perwakilan dari Ditjen Bina Marga Kementerian Pekerjaan Umum meninjau proyek Jalan Layang Nurtanio di Andir, ...', 'https://cdn.antaranews.com/cache/730x487/2024/12/16/Peninjauan-Proyek-Jalan-Layang-Nurtanio-161224-rai-3_1.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNXJOVEZvWVVGMVNEaE9XVWx3VFJDM0FSaVRBaWdCTWdZdGtJNXdQQVk=-w200-h200-p-df-rw', '2024-12-16 14:45:36', 'https://jabar.antaranews.com', 'ANTARA Jawa Barat', 'https://lh3.googleusercontent.com/-AYMxaG2g_G_ToBbQHnI8ICGjex1zG-0e3mhq1RuzfrIdYKyfRFJb-cJjJBcPDo5RKopD3K4', 'https://encrypted-tbn1.gstatic.com/faviconV2?url=https://jabar.antaranews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMNzylwsw_ZuvAw'),
(70, 'jawa barat', 'Pembangunan jalan layang Nurtanio ditarget rampung Mei 2025', 'https://jabar.antaranews.com/berita/566746/pembangunan-jalan-layang-nurtanio-ditarget-rampung-mei-2025?page=all', '\"Pembangunan flyover Nurtanio yang nilai investasinya Rp63 miliar dan ditargetkan selesai akhir Mei 2025,\" kata Pj Gubernur Jabar Bey Triadi ...', 'https://cdn.antaranews.com/cache/1200x800/2024/12/16/IMG-20241216-WA0008_1.jpg', 'https://news.google.com/api/attachments/CC8iI0NnNTBTMHRXZWpWeVpESkhRbWt3VFJDM0FSaVRBaWdCTWdB=-w200-h200-p-df-rw', '2024-12-16 12:26:45', 'https://jabar.antaranews.com', 'ANTARA Jawa Barat', 'https://lh3.googleusercontent.com/-AYMxaG2g_G_ToBbQHnI8ICGjex1zG-0e3mhq1RuzfrIdYKyfRFJb-cJjJBcPDo5RKopD3K4', 'https://encrypted-tbn1.gstatic.com/faviconV2?url=https://jabar.antaranews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMNzylwsw_ZuvAw'),
(71, 'jawa barat', 'Kolaborasi PLN Group Jabar dan Srikandi PLN Salurkan Bantuan Ratusan Paket untuk Warga Terdampak Banjir dan Longsor di Jawa Barat', 'http://radarsukabumi.com/ekonomi/kolaborasi-pln-group-jabar-dan-srikandi-pln-salurkan-bantuan-ratusan-paket-untuk-warga-terdampak-banjir-dan-longsor-di-jawa-barat/?PageSpeed=noscript', 'Bantuan hadir dalam bentuk bahan makanan dan perlengkapan seperti beras 2.5 kg, mie instan, kopi, cookies, pasta gigi, sabun mandi, obat-obatan, ...', 'https://radarsukabumi.com/wp-content/uploads/2024/12/Kolaborasi-PLN-Group-Jabar-dan-Srikandi-PLN.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNTVRVmRTY21ONGFVeG5iVFozVFJDM0FSaVRBaWdCTWdZQkVwWXJtUWc=-w200-h200-p-df-rw', '2024-12-16 16:29:54', 'http://radarsukabumi.com', 'radarsukabumi.com', NULL, 'https://encrypted-tbn3.gstatic.com/faviconV2?url=http://radarsukabumi.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMLSglQswrYGrAw'),
(72, 'jawa barat', 'Pemkab Garut membentuk sukarelawan Siaga Kampung Bencana', 'https://jabar.antaranews.com/berita/566734/pemkab-garut-membentuk-sukarelawan-siaga-kampung-bencana?page=all', 'Pemerintah Kabupaten Garut, Jawa Barat membentuk sukarelawan Siaga Kampung Bencana dari kalangan masyarakat umum di 11 kampung tersebar di ...', 'https://cdn.antaranews.com/cache/800x1600/2024/12/16/IMG_20241216_180211.jpg', 'https://news.google.com/api/attachments/CC8iL0NnNXdjR0ZJZW5aelpHODBjRFI2VFJDLUFoaWZBU2dCTWdrQmNKSjNyS2ZRN2dF=-w200-h200-p-df-rw', '2024-12-16 12:15:00', 'https://jabar.antaranews.com', 'ANTARA Jawa Barat', 'https://lh3.googleusercontent.com/-AYMxaG2g_G_ToBbQHnI8ICGjex1zG-0e3mhq1RuzfrIdYKyfRFJb-cJjJBcPDo5RKopD3K4', 'https://encrypted-tbn1.gstatic.com/faviconV2?url=https://jabar.antaranews.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMNzylwsw_ZuvAw'),
(73, 'jawa barat', 'Pembangunan Jalan Tol Baru di Jawa Barat: Harapan dan Tantangan di Tengah Ambisi JORR 3 - Klik Lubuklinggau', 'https://lubuklinggau.pikiran-rakyat.com/nasional/pr-2918881274/pembangunan-jalan-tol-baru-di-jawa-barat-harapan-dan-tantangan-di-tengah-ambisi-jorr-3', 'Salah satu rencana besar saat ini adalah proyek pembangunan jalan tol di Jawa Barat, yang akan melintasi tiga kabupaten di provinsi tersebut.', 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/1200x675/photo/2024/12/14/3316987084.jpg', 'https://news.google.com/api/attachments/CC8iK0NnNWFaR1pEZW05NFduZHVWRzlPVFJDb0FSaXNBaWdCTWdZQmdJb0x0UVU=-w200-h200-p-df-rw', '2024-12-16 13:00:00', 'https://lubuklinggau.pikiran-rakyat.com', 'Klik Lubuklinggau', 'https://lh3.googleusercontent.com/Fty4dkCRS705WPZCQHYvldcADYcMu7WA0ND8xOhJtbv8Xqbtl6Fs_oJyZZo5m9WmadnTYnWwZg', 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://lubuklinggau.pikiran-rakyat.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMO7Hvgsw--LVAw'),
(74, 'jawa barat', 'Soroti Masalah Pendidikan, Ono Surono Surati Pj Gubernur Jabar', 'https://www.detik.com/jabar/berita/d-7689025/soroti-masalah-pendidikan-ono-surono-surati-pj-gubernur-jabar', 'Wakil Ketua DPRD Jawa Barat Ono Surono menulis surat terbuka yang ditujukan kepada Pj Gubernur Jawa Barat Bey Mahmudin.', 'https://awsimages.detik.net.id/community/media/visual/2024/10/10/wakil-ketua-dprd-jabar-ono-surono-1_169.jpeg?w=1200', 'https://news.google.com/api/attachments/CC8iK0NnNHhTVmxYTUdRMFZXSXpUbmxOVFJDb0FSaXNBaWdCTWdZbFZwYnRKUWc=-w200-h200-p-df-rw', '2024-12-16 14:00:20', 'https://www.detik.com', 'detikJabar', 'https://lh3.googleusercontent.com/moeqArfb-g4BtcbeFKUUuqI5nl0Vjnj8HVbbwpA7JgBUQd-ko3fSU4L_qWMVSaMvJSmYL4PlRA', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://www.detik.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMLOswAswxcfXAw'),
(75, 'jawa barat', 'Bawaslu Catat Kasus Ujaran Kebencian Pilkada Tertinggi di Jawa Barat', 'https://hasanah.id/bawaslu-catat-kasus-ujaran-kebencian-pilkada-tertinggi-di-jawa-barat', 'Dalam 75 hari masa kampanye, tercatat 56 kasus ujaran kebencian di Kota Bandung, disusul Kabupaten Garut dan Kota Bogor dengan masing-masing 23 ...', 'https://hasanah.id/wp-content/uploads/2024/12/WhatsApp-Image-2024-12-13-at-9.52.40-PM-620x375.jpeg', 'https://news.google.com/api/attachments/CC8iK0NnNW9iek5XYVd0dmNERm5YMDlKVFJDdUFSaWhBaWdCTWdhSmtaUW5OUWM=-w200-h200-p-df-rw', '2024-12-16 14:02:18', 'https://hasanah.id', 'Hasanah.id', 'https://lh3.googleusercontent.com/Lj69HGegsEfz5_NfYJz_4MQnSkpu5Ic8GGt-azPebNbTwdYVPIX_CFOaybst6iRQdkaDcpBhChY', 'https://encrypted-tbn3.gstatic.com/faviconV2?url=https://hasanah.id&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAiEE0us3IRvIcUCSYynfciWRIqFAgKIhBNLrNyEbyHFAkmMp33IlkS'),
(76, 'jawa barat', 'Pembangunan Jalan Tol di Jawa Barat: Bagian dari JORR 3 dan Melintasi Tiga Kabupaten - Klik Lubuklinggau', 'https://lubuklinggau.pikiran-rakyat.com/nasional/pr-2918881151/pembangunan-jalan-tol-di-jawa-barat-bagian-dari-jorr-3-dan-melintasi-tiga-kabupaten', 'JORR 3 sendiri merupakan proyek ambisius yang bertujuan untuk menciptakan jalan lingkar luar Jakarta yang lebih luas, sehingga beban lalu lintas ...', 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/1200x675/photo/2024/06/30/4079547348.jpg', 'https://news.google.com/api/attachments/CC8iI0NnNXVWSEpNWjNseU4ycGZWSGwwVFJDb0FSaXNBaWdCTWdB=-w200-h200-p-df-rw', '2024-12-16 12:00:00', 'https://lubuklinggau.pikiran-rakyat.com', 'Klik Lubuklinggau', 'https://lh3.googleusercontent.com/Fty4dkCRS705WPZCQHYvldcADYcMu7WA0ND8xOhJtbv8Xqbtl6Fs_oJyZZo5m9WmadnTYnWwZg', 'https://encrypted-tbn0.gstatic.com/faviconV2?url=https://lubuklinggau.pikiran-rakyat.com&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL', 'CAAqBwgKMO7Hvgsw--LVAw');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `client_account` varchar(255) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `unique_id_post` varchar(255) DEFAULT NULL,
  `post_code` varchar(255) DEFAULT '''''',
  `is_pinned` tinyint(1) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `followers` int(11) DEFAULT NULL,
  `following` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `thumbnail_url` longtext DEFAULT NULL,
  `caption` longtext DEFAULT NULL,
  `comments` int(25) DEFAULT 0,
  `likes` int(25) DEFAULT 0,
  `playCount` int(11) DEFAULT NULL,
  `shareCount` int(11) DEFAULT NULL,
  `downloadCount` int(11) DEFAULT NULL,
  `collectCount` int(11) DEFAULT NULL,
  `media_name` varchar(255) DEFAULT '',
  `product_type` varchar(255) DEFAULT '',
  `tagged_users` longtext DEFAULT '\'\''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `startDate`, `endDate`) VALUES
(1, '2011-11-24', '2020-11-24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `main_id` int(11) NOT NULL,
  `client_account` varchar(255) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `profile_pic_url` longtext DEFAULT NULL,
  `followers` int(11) DEFAULT 0,
  `following` int(11) DEFAULT 0,
  `mediaCount` int(11) DEFAULT 0,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`main_id`, `client_account`, `kategori`, `platform`, `username`, `user_id`, `profile_pic_url`, `followers`, `following`, `mediaCount`, `update_date`) VALUES
(448, 'bandung@juara.com', 'test', 'instagram', 'humas_bandung', '3539086690', NULL, 104860, 667, 6078, '2024-12-16 11:24:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `childComments`
--
ALTER TABLE `childComments`
  ADD PRIMARY KEY (`child_comment_id`),
  ADD UNIQUE KEY `child_comment_unique_id` (`child_comment_unique_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`likes_id`),
  ADD UNIQUE KEY `unique_like` (`post_code`(100),`user_id`(100),`username`(100),`fullname`(100)) USING BTREE;

--
-- Indexes for table `listAkun`
--
ALTER TABLE `listAkun`
  ADD PRIMARY KEY (`list_id`);

--
-- Indexes for table `listNews`
--
ALTER TABLE `listNews`
  ADD PRIMARY KEY (`list_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `mainComments`
--
ALTER TABLE `mainComments`
  ADD PRIMARY KEY (`main_comment_id`),
  ADD UNIQUE KEY `comment_unique_id` (`comment_unique_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD UNIQUE KEY `unique_id_post` (`unique_id_post`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`main_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `childComments`
--
ALTER TABLE `childComments`
  MODIFY `child_comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2515;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `likes_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25131;

--
-- AUTO_INCREMENT for table `listAkun`
--
ALTER TABLE `listAkun`
  MODIFY `list_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT for table `listNews`
--
ALTER TABLE `listNews`
  MODIFY `list_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mainComments`
--
ALTER TABLE `mainComments`
  MODIFY `main_comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48353;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8225;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `main_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=449;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
