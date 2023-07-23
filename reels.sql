-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2023 at 12:07 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `django`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add frame', 7, 'add_frame'),
(26, 'Can change frame', 7, 'change_frame'),
(27, 'Can delete frame', 7, 'delete_frame'),
(28, 'Can view frame', 7, 'view_frame'),
(29, 'Can add category', 8, 'add_category'),
(30, 'Can change category', 8, 'change_category'),
(31, 'Can delete category', 8, 'delete_category'),
(32, 'Can view category', 8, 'view_category'),
(33, 'Can add animation', 9, 'add_animation'),
(34, 'Can change animation', 9, 'change_animation'),
(35, 'Can delete animation', 9, 'delete_animation'),
(36, 'Can view animation', 9, 'view_animation'),
(37, 'Can add template', 10, 'add_template'),
(38, 'Can change template', 10, 'change_template'),
(39, 'Can delete template', 10, 'delete_template'),
(40, 'Can view template', 10, 'view_template'),
(41, 'Can add like', 11, 'add_like'),
(42, 'Can change like', 11, 'change_like'),
(43, 'Can delete like', 11, 'delete_like'),
(44, 'Can view like', 11, 'view_like');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$d6rMmcshwCwlTmOIRQnvzz$y3n+H2jzzFFDMFJXkMiS8gQwqBVNTxqsbZOSoHVHKnc=', '2023-07-11 08:33:10.030786', 1, 'admin', '', '', '', 1, 1, '2023-05-15 21:21:14.120341');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-05-16 19:48:43.080970', '1', 'Category object (1)', 1, '[{\"added\": {}}]', 8, 1),
(2, '2023-05-16 19:48:56.988455', '2', 'Category object (2)', 1, '[{\"added\": {}}]', 8, 1),
(3, '2023-05-16 19:49:12.237541', '3', 'Category object (3)', 1, '[{\"added\": {}}]', 8, 1),
(4, '2023-05-16 19:49:22.919415', '4', 'Category object (4)', 1, '[{\"added\": {}}]', 8, 1),
(5, '2023-05-16 19:49:31.152538', '5', 'Category object (5)', 1, '[{\"added\": {}}]', 8, 1),
(6, '2023-05-16 19:49:50.815760', '6', 'Category object (6)', 1, '[{\"added\": {}}]', 8, 1),
(7, '2023-05-16 19:50:06.889432', '7', 'Category object (7)', 1, '[{\"added\": {}}]', 8, 1),
(8, '2023-05-17 10:48:20.753532', '1', 'Template object (1)', 1, '[{\"added\": {}}]', 10, 1),
(9, '2023-05-17 14:05:39.521798', '1', 'Animation object (1)', 1, '[{\"added\": {}}]', 9, 1),
(10, '2023-05-17 14:05:59.263419', '2', 'Animation object (2)', 1, '[{\"added\": {}}]', 9, 1),
(11, '2023-05-17 14:07:49.165795', '1', 'Frame object (1)', 1, '[{\"added\": {}}]', 7, 1),
(12, '2023-05-17 14:08:00.345756', '2', 'Frame object (2)', 1, '[{\"added\": {}}]', 7, 1),
(13, '2023-05-17 20:03:52.336569', '2', 'Frame object (2)', 2, '[{\"changed\": {\"fields\": [\"Template\", \"Animation\"]}}]', 7, 1),
(14, '2023-05-17 20:04:00.520905', '1', 'Frame object (1)', 2, '[{\"changed\": {\"fields\": [\"Template\", \"Animation\"]}}]', 7, 1),
(15, '2023-05-31 21:16:13.389654', '2', 'zoom_in', 2, '[{\"changed\": {\"fields\": [\"Video\"]}}]', 9, 1),
(16, '2023-05-31 21:18:33.017139', '2', 'zoom_in', 2, '[{\"changed\": {\"fields\": [\"Video\"]}}]', 9, 1),
(17, '2023-05-31 21:19:49.303007', '1', 'live another life', 2, '[{\"changed\": {\"fields\": [\"Video url\"]}}]', 10, 1),
(18, '2023-05-31 21:26:26.988879', '1', 'live another life', 2, '[{\"changed\": {\"fields\": [\"Music url\"]}}]', 10, 1),
(19, '2023-05-31 21:30:33.684960', '1', 'live another life', 2, '[{\"changed\": {\"fields\": [\"Video url\"]}}]', 10, 1),
(20, '2023-06-09 09:09:30.336088', '2', 'new exam', 1, '[{\"added\": {}}]', 10, 1),
(21, '2023-06-11 18:49:58.292203', '2', 'new exam', 3, '', 10, 1),
(22, '2023-06-11 18:49:58.296206', '1', 'live another life', 3, '', 10, 1),
(23, '2023-06-11 19:52:15.807207', '3', 'January TikTok mashup', 1, '[{\"added\": {}}]', 10, 1),
(24, '2023-06-11 20:25:19.144160', '3', 'simple', 1, '[{\"added\": {}}]', 9, 1),
(25, '2023-06-11 20:27:59.849872', '3', 'January TikTok mashup', 2, '[{\"changed\": {\"fields\": [\"Frame nbr\"]}}]', 10, 1),
(26, '2023-06-11 21:09:58.462930', '3', 'Frame object (3)', 1, '[{\"added\": {}}]', 7, 1),
(27, '2023-06-11 21:10:24.121229', '4', 'Frame object (4)', 1, '[{\"added\": {}}]', 7, 1),
(28, '2023-06-11 21:13:55.831757', '5', 'Frame object (5)', 1, '[{\"added\": {}}]', 7, 1),
(29, '2023-06-11 21:14:43.222700', '6', 'Frame object (6)', 1, '[{\"added\": {}}]', 7, 1),
(30, '2023-06-11 21:14:55.185536', '7', 'Frame object (7)', 1, '[{\"added\": {}}]', 7, 1),
(31, '2023-06-11 21:17:13.196552', '8', 'Frame object (8)', 1, '[{\"added\": {}}]', 7, 1),
(32, '2023-06-11 21:17:44.237152', '9', 'Frame object (9)', 1, '[{\"added\": {}}]', 7, 1),
(33, '2023-06-11 21:18:20.450116', '10', 'Frame object (10)', 1, '[{\"added\": {}}]', 7, 1),
(34, '2023-06-11 21:18:30.725635', '11', 'Frame object (11)', 1, '[{\"added\": {}}]', 7, 1),
(35, '2023-06-11 21:19:07.328931', '12', 'Frame object (12)', 1, '[{\"added\": {}}]', 7, 1),
(36, '2023-06-11 21:32:06.404415', '12', 'Frame object (12)', 2, '[{\"changed\": {\"fields\": [\"IsImage\"]}}]', 7, 1),
(37, '2023-06-14 21:38:34.395921', '1', 'simple', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 9, 1),
(38, '2023-06-14 21:39:11.154737', '2', 'zoom_in', 2, '[{\"changed\": {\"fields\": [\"Video\"]}}]', 9, 1),
(39, '2023-06-14 21:39:30.722440', '3', 'zoom_out', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Video\"]}}]', 9, 1),
(40, '2023-06-14 21:39:51.672407', '1', 'simple', 2, '[{\"changed\": {\"fields\": [\"Video\"]}}]', 9, 1),
(41, '2023-06-15 13:14:53.790729', '3', 'January TikTok mashup', 2, '[{\"changed\": {\"fields\": [\"Video url\"]}}]', 10, 1),
(42, '2023-06-16 07:12:34.386071', '4', 'test_template', 1, '[{\"added\": {}}]', 10, 1),
(43, '2023-06-16 07:12:52.266748', '13', 'Frame object (13)', 1, '[{\"added\": {}}]', 7, 1),
(44, '2023-06-16 07:13:01.772061', '14', 'Frame object (14)', 1, '[{\"added\": {}}]', 7, 1),
(45, '2023-06-16 07:13:14.570407', '15', 'Frame object (15)', 1, '[{\"added\": {}}]', 7, 1),
(46, '2023-06-16 15:43:17.073029', '3', 'January TikTok mashup', 2, '[{\"changed\": {\"fields\": [\"Frame nbr\"]}}]', 10, 1),
(47, '2023-06-16 16:05:50.759118', '4', 'test_template', 3, '', 10, 1),
(48, '2023-06-16 16:06:03.251047', '3', 'Frame object (3)', 2, '[{\"changed\": {\"fields\": [\"Animation\"]}}]', 7, 1),
(49, '2023-06-16 16:06:07.712355', '4', 'Frame object (4)', 2, '[{\"changed\": {\"fields\": [\"Animation\"]}}]', 7, 1),
(50, '2023-06-16 16:06:13.229162', '5', 'Frame object (5)', 2, '[{\"changed\": {\"fields\": [\"Animation\"]}}]', 7, 1),
(51, '2023-06-16 16:06:18.148605', '6', 'Frame object (6)', 2, '[{\"changed\": {\"fields\": [\"Animation\"]}}]', 7, 1),
(52, '2023-06-16 16:06:26.233280', '7', 'Frame object (7)', 2, '[{\"changed\": {\"fields\": [\"Animation\"]}}]', 7, 1),
(53, '2023-06-16 16:06:34.512096', '8', 'Frame object (8)', 2, '[{\"changed\": {\"fields\": [\"Animation\"]}}]', 7, 1),
(54, '2023-06-16 16:06:38.910108', '9', 'Frame object (9)', 2, '[{\"changed\": {\"fields\": [\"Animation\"]}}]', 7, 1),
(55, '2023-06-16 16:06:42.947113', '10', 'Frame object (10)', 2, '[{\"changed\": {\"fields\": [\"Animation\"]}}]', 7, 1),
(56, '2023-06-16 16:06:46.663075', '11', 'Frame object (11)', 2, '[{\"changed\": {\"fields\": [\"Animation\"]}}]', 7, 1),
(57, '2023-06-16 16:06:50.098695', '11', 'Frame object (11)', 2, '[]', 7, 1),
(58, '2023-06-16 16:06:53.731871', '12', 'Frame object (12)', 2, '[{\"changed\": {\"fields\": [\"Animation\"]}}]', 7, 1),
(59, '2023-07-20 12:14:45.397952', '5', 'Ready For It‘ by Taylor Swift', 1, '[{\"added\": {}}]', 10, 1),
(60, '2023-07-20 12:15:17.454196', '16', 'Frame object (16)', 1, '[{\"added\": {}}]', 7, 1),
(61, '2023-07-20 12:15:38.296690', '16', 'Frame object (16)', 2, '[{\"changed\": {\"fields\": [\"IsImage\"]}}]', 7, 1),
(62, '2023-07-20 12:16:16.686738', '17', 'Frame object (17)', 1, '[{\"added\": {}}]', 7, 1),
(63, '2023-07-20 12:16:32.896459', '18', 'Frame object (18)', 1, '[{\"added\": {}}]', 7, 1),
(64, '2023-07-20 12:16:51.039334', '19', 'Frame object (19)', 1, '[{\"added\": {}}]', 7, 1),
(65, '2023-07-20 12:17:06.043994', '20', 'Frame object (20)', 1, '[{\"added\": {}}]', 7, 1),
(66, '2023-07-20 12:17:28.655581', '21', 'Frame object (21)', 1, '[{\"added\": {}}]', 7, 1),
(67, '2023-07-20 12:18:49.715569', '21', 'Frame object (21)', 2, '[{\"changed\": {\"fields\": [\"Time\"]}}]', 7, 1),
(68, '2023-07-20 12:19:07.267697', '22', 'Frame object (22)', 1, '[{\"added\": {}}]', 7, 1),
(69, '2023-07-20 12:19:26.342936', '23', 'Frame object (23)', 1, '[{\"added\": {}}]', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'reels', 'animation'),
(8, 'reels', 'category'),
(7, 'reels', 'frame'),
(11, 'reels', 'like'),
(10, 'reels', 'template'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-05-15 21:07:37.255967'),
(2, 'auth', '0001_initial', '2023-05-15 21:07:37.543998'),
(3, 'admin', '0001_initial', '2023-05-15 21:07:37.616023'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-05-15 21:07:37.624026'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-05-15 21:07:37.632027'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-05-15 21:07:37.672011'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-05-15 21:07:37.712022'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-05-15 21:07:37.728018'),
(9, 'auth', '0004_alter_user_username_opts', '2023-05-15 21:07:37.736018'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-05-15 21:07:37.760021'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-05-15 21:07:37.760021'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-05-15 21:07:37.768038'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-05-15 21:07:37.784031'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-05-15 21:07:37.800028'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-05-15 21:07:37.808045'),
(16, 'auth', '0011_update_proxy_permissions', '2023-05-15 21:07:37.824028'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-05-15 21:07:37.840051'),
(18, 'sessions', '0001_initial', '2023-05-15 21:07:37.856032'),
(19, 'reels', '0001_initial', '2023-05-15 21:57:51.189490'),
(20, 'reels', '0002_remove_frame_video_alter_frame_animation_and_more', '2023-05-17 20:00:46.654342'),
(21, 'reels', '0003_video', '2023-05-17 20:00:46.661464'),
(22, 'reels', '0004_block_delete_video_remove_frame_animation', '2023-05-17 20:00:46.722634'),
(23, 'reels', '0005_block_animation', '2023-05-17 20:00:46.741637'),
(24, 'reels', '0006_frame_animation_frame_template_delete_block', '2023-05-17 20:00:46.783681'),
(25, 'reels', '0007_remove_frame_type_frame_isimage_and_more', '2023-05-18 09:57:05.503255'),
(26, 'reels', '0008_alter_animation_video', '2023-06-08 12:48:34.348949'),
(27, 'reels', '0009_alter_frame_url_alter_template_video_url', '2023-06-08 12:48:34.398262'),
(28, 'reels', '0010_alter_frame_url', '2023-06-08 12:48:34.438166'),
(29, 'reels', '0011_alter_animation_video_alter_frame_url_and_more', '2023-06-08 12:48:34.452173'),
(30, 'reels', '0012_alter_frame_url', '2023-06-08 12:48:34.458470'),
(31, 'reels', '0013_alter_template_music_url', '2023-06-08 12:48:34.492015'),
(32, 'reels', '0014_alter_template_music_url', '2023-06-08 12:48:34.503982'),
(33, 'reels', '0015_like', '2023-06-08 12:48:34.560379'),
(34, 'reels', '0016_alter_like_template', '2023-06-08 18:15:15.805705'),
(35, 'reels', '0017_alter_like_template', '2023-06-08 18:16:05.394866'),
(36, 'reels', '0018_alter_like_template', '2023-06-08 18:17:00.495848'),
(37, 'reels', '0019_alter_frame_url', '2023-06-11 20:30:44.566622'),
(38, 'reels', '0020_alter_frame_url', '2023-06-11 20:54:52.674394'),
(39, 'reels', '0021_alter_animation_video', '2023-06-11 20:57:14.228974');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4b103n5673a0h20ejgu9fuoz14gdsoez', '.eJxVjDsOwjAQBe_iGllrry0tlPScwdr1BweQLcVJhbg7iZQC2jcz760Cr0sN68hzmJK6KKNOv5twfOa2g_Tgdu869rbMk-hd0Qcd-tZTfl0P9--g8qhbXTgjnqkgSHEoxXpHxlrPUayHbKEUcogUk_eACMROosAmkM9ijPp8Ad10N4A:1q4Sfc:eb25M3DV0-qgsiG4pGgkYvTci25rxya4OAtbBQMkf3Y', '2023-06-14 20:43:48.276802'),
('59dn9au6ol4ygrycoz29vaw342yk5pyu', '.eJxVjDsOwjAQBe_iGllrry0tlPScwdr1BweQLcVJhbg7iZQC2jcz760Cr0sN68hzmJK6KKNOv5twfOa2g_Tgdu869rbMk-hd0Qcd-tZTfl0P9--g8qhbXTgjnqkgSHEoxXpHxlrPUayHbKEUcogUk_eACMROosAmkM9ijPp8Ad10N4A:1pzNKr:h54A5q1-JKIxUe1Aq6Z7y8JBn5_I8q23Sy1v-mqIjNs', '2023-05-31 20:01:21.404381'),
('dyg1mzj7qnhyoj3fowuolnhw17xw2poa', '.eJxVjDsOwjAQBe_iGllrry0tlPScwdr1BweQLcVJhbg7iZQC2jcz760Cr0sN68hzmJK6KKNOv5twfOa2g_Tgdu869rbMk-hd0Qcd-tZTfl0P9--g8qhbXTgjnqkgSHEoxXpHxlrPUayHbKEUcogUk_eACMROosAmkM9ijPp8Ad10N4A:1qJ8o2:VLj6XS_uS4O8INgOxCKwvpcNYG2aQMWmLnGQp4NPISA', '2023-07-25 08:33:10.038806'),
('jtgj6nfues7xuiyogpme1ecso6p4jx97', '.eJxVjDsOwjAQBe_iGllrry0tlPScwdr1BweQLcVJhbg7iZQC2jcz760Cr0sN68hzmJK6KKNOv5twfOa2g_Tgdu869rbMk-hd0Qcd-tZTfl0P9--g8qhbXTgjnqkgSHEoxXpHxlrPUayHbKEUcogUk_eACMROosAmkM9ijPp8Ad10N4A:1q9XpL:vU0fcUYAJLE2keq55neHCL85mA2w0rf-1if5J_reNZc', '2023-06-28 21:14:51.322693'),
('xijrkv11gtol3o2lr2sqztzht4uxr84m', '.eJxVjDsOwjAQBe_iGllrry0tlPScwdr1BweQLcVJhbg7iZQC2jcz760Cr0sN68hzmJK6KKNOv5twfOa2g_Tgdu869rbMk-hd0Qcd-tZTfl0P9--g8qhbXTgjnqkgSHEoxXpHxlrPUayHbKEUcogUk_eACMROosAmkM9ijPp8Ad10N4A:1pyzBz:ArFjnJDY92qnR2yyPY8IsyZbn71QIi1uXy2urlXwjFs', '2023-05-30 18:14:35.733862');

-- --------------------------------------------------------

--
-- Table structure for table `reels_animation`
--

CREATE TABLE `reels_animation` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `video` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reels_animation`
--

INSERT INTO `reels_animation` (`id`, `name`, `video`) VALUES
(1, 'simple', ''),
(2, 'zoom_in', 'animations/zoom_in.mp4'),
(3, 'zoom_out', 'animations/zoom_out.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `reels_category`
--

CREATE TABLE `reels_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reels_category`
--

INSERT INTO `reels_category` (`id`, `name`) VALUES
(1, 'Travel'),
(2, 'Motivation'),
(3, 'Fashion'),
(4, 'Summer'),
(5, 'Food'),
(6, 'Partner'),
(7, 'Relax');

-- --------------------------------------------------------

--
-- Table structure for table `reels_frame`
--

CREATE TABLE `reels_frame` (
  `id` bigint(20) NOT NULL,
  `time` double NOT NULL,
  `fixe` tinyint(1) NOT NULL,
  `url` varchar(100) NOT NULL,
  `animation_id` bigint(20) DEFAULT NULL,
  `template_id` bigint(20) DEFAULT NULL,
  `isImage` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reels_frame`
--

INSERT INTO `reels_frame` (`id`, `time`, `fixe`, `url`, `animation_id`, `template_id`, `isImage`) VALUES
(3, 0.3, 0, '', 1, 3, 1),
(4, 0.3, 0, '', 1, 3, 1),
(5, 0.3, 0, '', 1, 3, 1),
(6, 0.3, 0, '', 1, 3, 1),
(7, 0.3, 0, '', 1, 3, 1),
(8, 3.4, 0, '', 1, 3, 0),
(9, 0.3, 0, '', 1, 3, 1),
(10, 0.3, 0, '', 1, 3, 1),
(11, 0.3, 0, '', 1, 3, 1),
(12, 2.6, 0, '', 1, 3, 0),
(16, 1.67, 0, '', 1, 5, 0),
(17, 0.89, 0, '', 1, 5, 1),
(18, 0.74, 0, '', 1, 5, 1),
(19, 0.72, 0, '', 1, 5, 1),
(20, 0.81, 0, '', 1, 5, 1),
(21, 0.74, 0, '', 1, 5, 1),
(22, 0.75, 0, '', 1, 5, 1),
(23, 0.56, 0, '', 1, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reels_like`
--

CREATE TABLE `reels_like` (
  `id` bigint(20) NOT NULL,
  `user_id` longtext NOT NULL,
  `template_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reels_template`
--

CREATE TABLE `reels_template` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `music_name` varchar(50) NOT NULL,
  `music_url` varchar(255) NOT NULL,
  `frame_nbr` int(11) NOT NULL,
  `time` double NOT NULL,
  `video_url` varchar(100) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reels_template`
--

INSERT INTO `reels_template` (`id`, `name`, `music_name`, `music_url`, `frame_nbr`, `time`, `video_url`, `category_id`) VALUES
(3, 'January TikTok mashup', 'mashup', 'music/January_TikTok_mashup.MP3', 10, 8.4, 'templates/January_TikTok_mashup_qwu6zcP.mp4', 1),
(5, 'Ready For It‘ by Taylor Swift', 'Ready For It‘ by Taylor Swift', 'music/0720.MP3', 8, 6.88, 'templates/Transition_to_Ready_For_It_by_Taylor_Swift__App_CapCut_ShortsMitMarietta.mp4', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `reels_animation`
--
ALTER TABLE `reels_animation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reels_category`
--
ALTER TABLE `reels_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reels_frame`
--
ALTER TABLE `reels_frame`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reels_frame_animation_id_aef3ae70_fk_reels_animation_id` (`animation_id`),
  ADD KEY `reels_frame_template_id_d30357b8_fk_reels_template_id` (`template_id`);

--
-- Indexes for table `reels_like`
--
ALTER TABLE `reels_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reels_like_template_id_fa6d62d6` (`template_id`);

--
-- Indexes for table `reels_template`
--
ALTER TABLE `reels_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reels_template_category_id_cf6f4c88_fk_reels_category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `reels_animation`
--
ALTER TABLE `reels_animation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reels_category`
--
ALTER TABLE `reels_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reels_frame`
--
ALTER TABLE `reels_frame`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `reels_like`
--
ALTER TABLE `reels_like`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reels_template`
--
ALTER TABLE `reels_template`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `reels_frame`
--
ALTER TABLE `reels_frame`
  ADD CONSTRAINT `reels_frame_animation_id_aef3ae70_fk_reels_animation_id` FOREIGN KEY (`animation_id`) REFERENCES `reels_animation` (`id`),
  ADD CONSTRAINT `reels_frame_template_id_d30357b8_fk_reels_template_id` FOREIGN KEY (`template_id`) REFERENCES `reels_template` (`id`);

--
-- Constraints for table `reels_template`
--
ALTER TABLE `reels_template`
  ADD CONSTRAINT `reels_template_category_id_cf6f4c88_fk_reels_category_id` FOREIGN KEY (`category_id`) REFERENCES `reels_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
