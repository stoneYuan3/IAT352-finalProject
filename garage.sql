-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2022 at 07:45 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `garage`
--

-- --------------------------------------------------------

--
-- Table structure for table `collection`
--

CREATE TABLE `collection` (
  `collection_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `collection`
--

INSERT INTO `collection` (`collection_id`, `user_id`, `post_id`) VALUES
(1, 1, 4),
(2, 1, 19),
(3, 1, 7),
(4, 1, 3),
(5, 1, 9),
(6, 2, 1),
(7, 2, 14),
(8, 2, 6),
(9, 2, 11),
(10, 2, 12),
(11, 2, 5),
(12, 2, 2),
(13, 2, 9),
(14, 2, 15),
(15, 2, 17),
(16, 2, 3),
(17, 3, 15),
(18, 3, 2),
(19, 3, 3),
(20, 3, 16),
(21, 3, 4),
(22, 3, 18),
(23, 3, 1),
(24, 3, 19),
(25, 4, 18),
(26, 4, 12),
(27, 4, 14),
(28, 4, 9),
(29, 4, 5),
(30, 4, 8),
(31, 6, 4),
(32, 6, 19),
(33, 6, 16),
(34, 6, 9),
(35, 6, 12),
(36, 6, 11),
(37, 6, 6),
(38, 6, 8),
(39, 6, 14),
(40, 6, 7),
(41, 7, 11),
(42, 7, 15),
(43, 7, 3),
(44, 7, 7),
(45, 7, 19),
(46, 7, 17),
(47, 7, 8),
(48, 7, 9),
(49, 8, 5),
(50, 8, 9),
(51, 8, 15),
(52, 8, 17),
(53, 8, 18),
(54, 8, 2),
(55, 9, 12),
(56, 9, 16),
(57, 9, 9),
(58, 9, 2),
(59, 9, 17),
(60, 9, 7),
(61, 9, 3),
(62, 10, 4),
(63, 10, 12),
(64, 10, 18),
(65, 10, 6),
(66, 10, 16),
(67, 10, 17),
(68, 10, 3),
(69, 10, 8),
(70, 10, 7),
(71, 10, 5),
(72, 10, 1),
(73, 11, 3),
(74, 11, 18),
(75, 11, 12),
(76, 11, 1),
(77, 11, 11),
(78, 11, 19),
(79, 11, 6),
(80, 11, 8),
(81, 11, 2),
(82, 11, 7),
(83, 12, 1),
(84, 12, 13),
(85, 12, 3),
(86, 12, 15),
(87, 12, 4),
(88, 12, 16),
(89, 12, 6),
(90, 12, 18),
(91, 13, 2),
(92, 13, 12),
(93, 13, 3),
(94, 13, 16),
(95, 13, 4),
(96, 13, 17),
(97, 13, 6),
(98, 13, 18),
(99, 13, 8),
(100, 14, 1),
(101, 14, 3),
(102, 14, 6),
(103, 14, 9),
(104, 14, 11),
(105, 14, 14),
(106, 14, 16),
(107, 15, 1),
(108, 15, 3),
(109, 15, 4),
(110, 15, 6),
(111, 15, 8),
(112, 15, 9),
(113, 15, 13),
(114, 15, 15),
(115, 15, 17),
(116, 15, 18),
(117, 16, 2),
(118, 16, 4),
(119, 16, 5),
(120, 16, 6),
(121, 16, 7),
(122, 16, 9),
(123, 16, 10),
(124, 17, 1),
(125, 17, 2),
(126, 17, 3),
(127, 17, 4),
(128, 17, 5),
(129, 17, 6),
(130, 17, 7),
(131, 17, 8),
(132, 17, 9),
(133, 17, 10),
(134, 17, 11),
(135, 17, 12),
(136, 17, 13),
(137, 17, 14),
(138, 17, 15),
(139, 17, 16),
(140, 17, 17),
(141, 17, 18),
(142, 17, 19),
(143, 17, 20),
(144, 19, 20),
(145, 19, 19),
(146, 19, 18),
(147, 19, 17),
(148, 19, 16),
(149, 19, 15),
(150, 19, 14),
(151, 19, 13),
(152, 19, 12),
(153, 19, 11),
(154, 19, 10),
(155, 19, 9),
(156, 19, 8),
(157, 19, 7),
(158, 19, 6),
(159, 19, 5),
(160, 19, 4),
(161, 19, 3),
(162, 19, 2),
(163, 19, 1),
(166, 48, 9),
(177, 48, 17),
(189, 48, 3),
(190, 48, 5),
(191, 48, 13),
(192, 48, 10),
(193, 48, 2),
(197, 48, 12),
(200, 48, 28),
(201, 48, 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `upload_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `user_id`, `post_id`, `content`, `upload_time`) VALUES
(1, 2, 1, 'Brilliant 👌 ', '2022-11-17 06:22:34'),
(2, 3, 2, 'Nice work I love it', '2022-11-17 06:23:32'),
(3, 4, 3, 'oh love it', '2022-11-17 06:24:33'),
(4, 5, 4, '莉莉！！YYDS', '2022-11-17 06:25:43'),
(5, 6, 5, 'woowww amazing!!', '2022-11-17 06:26:25'),
(6, 7, 6, 'At the moment, this is my favorite one qWq <3', '2022-11-17 06:27:30'),
(7, 8, 6, 'amazing', '2022-11-17 06:27:57'),
(8, 8, 7, 'Love your sharp lines!', '2022-11-17 06:28:41'),
(9, 9, 7, 'Love this', '2022-11-17 06:28:56'),
(10, 10, 7, '<3', '2022-11-17 06:29:09'),
(11, 9, 8, 'Стиль!', '2022-11-17 06:29:55'),
(12, 10, 8, 'Статная женщина', '2022-11-17 06:30:15'),
(13, 11, 8, 'this is so awesome, good job', '2022-11-17 06:30:40'),
(14, 10, 9, 'cute!', '2022-11-17 06:31:20'),
(15, 11, 9, '卧槽 牛逼', '2022-11-17 06:31:34'),
(16, 12, 9, '真快啊', '2022-11-17 06:31:49'),
(17, 11, 10, 'so good', '2022-11-17 06:32:25'),
(18, 13, 12, 'Como me voy a gozar este curso! enhorabuena Santiago! va a estar genial. Un saludo y cuídate', '2022-11-17 06:35:50'),
(19, 14, 13, 'Amazing article, Jannick! As creators, I think we all have opinions on AI-generated art but this was well articulated and thoughtful with thorough backing on each position. Thank you for sharing! I look forward to seeing more blogs from you and Vizlab Studios.', '2022-11-17 06:37:38'),
(20, 15, 13, 'I now no longer ever found out like it’s far even plausible but one (wdr-02) in every of my confidant pal made $27,000 most effective inside 4 weeks simply finishing this smooth possibility and additionally she has prompted me to avail. up to date information on touring following website….… http://Www.Works75.Com', '2022-11-17 06:37:52'),
(21, 15, 14, 'Ah damn, endometriosis??.... One of my friend has it too oof. Just the thought of it is terrifying. Take care and wish you all the strenght!', '2022-11-17 06:39:16'),
(22, 16, 15, 'Very useful, thank you.', '2022-11-17 06:40:10'),
(23, 17, 16, 'i cant give you \"like\" 😳 it\'s not allowed', '2022-11-17 06:40:57'),
(24, 18, 16, 'Thank you very much, how long have I been waiting for this))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))', '2022-11-17 06:41:17'),
(25, 19, 16, 'More power to your elbow', '2022-11-17 06:41:31'),
(26, 19, 18, 'Коммент для тех людей, кто хочет увидеть альтернативную точку зрения, а не ванильную западную или мега патриотичную.\r\n\r\nАвтор настолько глубок в своем познании, решил картинкой с трупами и лозунгами остановить конфликт, за этим будущее. Ждем еще миллион подобных картинок. Тогда 100% ситуация поменяется и все помирятся.\r\n\r\nПо итогу - либо ты помогаешь миру, либо ты ему мешаешь. Автор сделал свой выбор.', '2022-11-17 06:43:19'),
(27, 1, 18, '艺术搞什么政治', '2022-11-17 06:43:36'),
(28, 2, 18, 'сам то не обляпайся, ты обращался к тем, кто явно сделать не мог ничего, кроме избежания смерти от рук правительства', '2022-11-17 06:43:47'),
(29, 3, 18, 'The Most saddest picture I have seen.\r\nAfter the https://k-electricbills.pk/k-electric-new-connection/ Forums that come from the artist of a new school to join the table of Walmart', '2022-11-17 06:44:04'),
(30, 4, 18, 'Неймовірне терпіння мають люди, які досі намагаються достукатися до громадян росії та до світу своїми закликами, підкріпленими творчістю. Дуже сумно, що аж після шести місяців війни залишаються особистості, які \"не в темі\" та не усвідомлюють що відбувається.', '2022-11-17 06:44:16'),
(31, 5, 18, 'Зачем это выкладывать на платформе с исскуством? И по одному человеку судить о всех русских в целом... Видимо пропоганда все сделала. Такие крутые арты делал, аж жалко', '2022-11-17 06:44:33'),
(32, 6, 19, 'Will there be any way to watch the presentations without attending?', '2022-11-17 06:45:34'),
(33, 7, 19, 'Excited to have you join us, Tyler!', '2022-11-17 06:45:54'),
(34, 7, 19, 'awesome!', '2022-11-17 06:46:04'),
(35, 8, 20, 'Thanks a lot for this article and all your tips!', '2022-11-17 06:46:55'),
(36, 9, 20, 'Thanks for the tips! I was actually just wondering how to speed up my Blender workflow. This gives me a great starting point. smiley', '2022-11-17 06:47:12');

-- --------------------------------------------------------

--
-- Table structure for table `following`
--

CREATE TABLE `following` (
  `user_id` int(11) NOT NULL,
  `followed_user_id` int(11) NOT NULL,
  `follow_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `following`
--

INSERT INTO `following` (`user_id`, `followed_user_id`, `follow_id`) VALUES
(1, 3, 1),
(1, 18, 2),
(1, 6, 3),
(1, 5, 4),
(2, 5, 5),
(2, 9, 6),
(2, 10, 7),
(3, 8, 8),
(4, 8, 9),
(4, 2, 10),
(5, 9, 11),
(5, 9, 12),
(5, 3, 13),
(5, 11, 14),
(5, 19, 15),
(5, 18, 16),
(5, 6, 17),
(5, 8, 18),
(5, 2, 19),
(5, 3, 20),
(7, 9, 21),
(7, 3, 22),
(7, 6, 23),
(7, 12, 24),
(7, 10, 25),
(7, 19, 26),
(8, 4, 27),
(8, 11, 28),
(10, 11, 29),
(12, 1, 30),
(12, 2, 31),
(12, 3, 32),
(12, 4, 33),
(14, 1, 34),
(14, 3, 35),
(14, 6, 36),
(14, 9, 37),
(14, 12, 38),
(13, 2, 39),
(13, 4, 40),
(13, 7, 41),
(13, 9, 42),
(13, 13, 43),
(13, 16, 44),
(19, 1, 45),
(19, 2, 46),
(19, 4, 47),
(19, 7, 48),
(19, 9, 49),
(19, 10, 50),
(19, 11, 51),
(19, 14, 52),
(19, 16, 53),
(19, 17, 54),
(48, 3, 76),
(48, 1, 80);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `image_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`image_id`, `post_id`, `image_content`) VALUES
(1, 1, 'post_1.jpg'),
(2, 2, 'post_2.jpg'),
(3, 3, 'post_3.jpg'),
(4, 4, 'post_4.jpg'),
(5, 5, 'post_5.jpg'),
(6, 6, 'post_6.jpg'),
(7, 7, 'post_7.jpg'),
(8, 8, 'post_8.jpg'),
(9, 9, 'post_9.jpg'),
(10, 10, 'post_10.jpg'),
(11, 14, 'post_14.jpg'),
(12, 15, 'post_15.jpg'),
(13, 24, 'planet9_Wallpaper_5000x2813.jpg'),
(14, 25, 'Nitro_Wallpaper_5000x2813.jpg'),
(15, 26, 'v2-acad2d5abf3d5d0ac13fefa79018a8a0_r.jpg'),
(16, 27, 'kate-fox-au-trickster-witch.jpg'),
(17, 28, 'kate-fox-nazuna-nanakusa.jpg'),
(18, 32, 'v2-723e0ae77c3f8f9d418ac1be529eccdb.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `category` tinyint(4) NOT NULL,
  `upload_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `description`, `category`, `upload_time`) VALUES
(1, 1, 'KIRIKO sketches', 1, '2022-11-21 00:11:15'),
(2, 2, 'Arcane sketches', 1, '2022-11-17 02:29:19'),
(3, 3, 'Ribbon', 1, '2022-11-17 02:34:36'),
(4, 4, 'Dragoon\r\n\r\nThis new work is not new,i will always try my best!\r\nThe original painting is from Yuri Choe.', 1, '2022-11-17 02:41:56'),
(5, 5, 'The Hobbit - Illustration project\r\n\r\nA collection of drawings I made inspired by the character of The Hobbit by Tolkien. ', 1, '2022-11-17 02:46:06'),
(6, 6, 'INFECTUS BESTIARY: Plaga\r\n\r\nThe fifth monster from the Infectus Bestiary – Plaga.', 1, '2022-11-17 02:50:59'),
(7, 7, 'SHARK\r\n\r\nDesigned a cyber mage as practice.', 1, '2022-11-17 02:57:08'),
(8, 8, 'REd23\r\n\r\nСтримы, их записи и доп материалы доступны для подписчиков бусти https://boosty.to/digitalcombine\r\nStreams, their recordings and additional materials are available for Boosty subscribers https://boosty.to/digitalcombine', 1, '2022-11-17 03:07:52'),
(9, 9, 'cyberpunk edgerunner Lucy\r\n\r\n随便做做，很久没有直接卡线建模了，还好没忘。', 1, '2022-11-17 03:11:50'),
(10, 10, 'master', 1, '2022-11-17 03:20:06'),
(11, 11, 'Boost your texturing with smart mask in substance 3d painter\r\n\r\nIn this video, you learn how to create your own customizable smart mask in substance 3d painter and later use it in your project to speed up your texturing.\r\n\r\nAlso, I\'ve prepared a pack of 84 high-quality smart masks with free samples that you can download from the link below.\r\n\r\nDownload: https://www.artstation.com/a/21802688 \r\n\r\nA pack of 84 High-Detail and completely customizable smart masks (spmsk) to increase realism and enhance your workflow\r\n\r\nAdvantages of this package:\r\n\r\nCustomizable 84 Smart Masks (spmsk) \r\n\r\nHigh-quality preview \r\n\r\n100% made with substance painter \r\n\r\nFree Sample \r\n\r\nFree Tutorial \r\n\r\ncompatible Substance 3D Painter, version 7.3.0 \r\n\r\ncustom shelf preview \r\n\r\nAll patterns created with shape manipulation using default texture and maps in substance painter', 2, '2022-11-17 03:35:49'),
(12, 12, 'My first Domestika Course is here!!\r\n\r\nEN \r\n\r\n• Hi guys the trailer for my first Domestika Course is out!! \r\n\r\n• This course has English Subtitles and Spanish audio 🙂 \r\n\r\n• From today you have 7 Days to buy it with a 60% disccount and you can access to the content from November 7, feel free to share it and thank you so much for your support!! 😃\r\n\r\n-------------------------------------------------------------------------------\r\n\r\nES\r\n\r\n• Que tal compas, por aca vengo a compartirles el trailer de mi primer curso Con Domestika !! \r\n\r\n• A partir de hoy tienen 7 días para poder comprarlo con un descuento del 60% y podrán acceder al contenido del mismo a partir del 7 de Noviembre, así que les recomiendo que guarden estas fechas. 😃\r\n\r\nCourse: https://www.domestika.org/es/courses/4214-diseno-de-personajes-estilo-dark-fantasy-en-zbrush/santiagobetancur87 \r\n\r\nTrailer:\r\nhttps://youtu.be/sfVP0njLvwQ\r\n\r\nI hope you find this course useful, enjoy!\r\n\r\n¡Espero que el tutorial les sea de ayuda y que lo disfruten! ', 2, '2022-11-17 04:55:38'),
(13, 13, 'OH NO! IS CONCEPT ART DYING?\r\n\r\nThe past year there has been a lot of discussion and controversy on social media about Midjourney (and similar art prompt AI’s) and its uses for generating concept art. We have been exploring these tools and, through our artist network, seen many others experiment with them too. This has resulted in exclamations such as “Concept art is dead!” or “This is the end of concept artists!”. This begs the question: Is concept art really dying? Is our entire art niche in danger of becoming obsolete?\r\n\r\n… so, is it? Well, we certainly don’t think so.\r\n\r\nIt’s a tool! And, as with any other tool there are pros and cons. But, with Midjourney, and similar AI art prompts, there are some contentious ways in which they are being developed and employed.\r\n\r\nThis article reflects our views on how we see AI art’s current use within the gaming industry for the purpose of creating concept art.\r\nConcept art solves problems\r\n\r\nReferring to one of my previous articles, I defined concept art as an approach to solving creative problems through art. As stated above, Midjourney is a “tool” and, as such, does not solve problems on its own. An artist or designer needs to operate and direct the tool before it is of any use. It is great for inspiration or cloud watching, trying things out and getting inspired. But it cannot make a final delivery for you. That would be malpractice.\r\n\r\nIf you are using Midjourney output as your final result, you will be pushing the workload onto the art director you are working for. They have hired you to solve their visual problems, so if you deliver an AI output and cannot explain the reasoning behind the choices made or incorporate feedback given by the art director, you have failed in your task as concept artist. The art director might as well be using this tool themselves without hiring you for it.\r\n\r\nThis brings me to my main point about AI art prompts being “just tools”: if there is no artistic intention or interpretation behind the images, it is just a “sophisticated” machine outputting images. If the results have no culture or opinion, no ethical or otherwise meaningful and conscious consideration put into them, it is just “junk food”. It might be fast and get you a feeling of being full. But it is empty calories with limited nutritional value.\r\n\r\nIf the purpose of concept art is solving problems, you, as a concept artist, should be able to answer the questions of “Why, how, and what” of the final designs that you produce. Every aspect of your art is conscious decision. You, the artist, have consciously chosen to design your art in one way, and therefore simultaneously chosen NOT to design things in a thousand different ways. An AI art prompt will, at it’s very best, be able to answer one thing for you – and that is: “What”. It is “what” you asked it to be and nothing more. “How” and “Why” will remain unanswered.\r\n\r\nSo, it is important to remember that AI Prompts are a tool among many other tools, and not a quick fix that can be used to solve problems on its own. Nor is it a threat or a substitute to concept artists, as long as the artists focuses on problem solving.\r\nWhose art is it anyway? \r\n\r\nOn Midjourney’s website you can read their Terms of Service regarding copyright:\r\n\r\n    “Rights you give to Midjourney: By using the Services, you grant to Midjourney, its successors, and assigns a perpetual, worldwide, non-exclusive, sublicensable no-charge, royalty-free, irrevocable copyright license to reproduce, prepare Derivative Works of, publicly display, publicly perform, sublicense, and distribute text, and image prompts you input into the Services, or Assets produced by the service at your direction. This license survives termination of this Agreement by any party, for any reason.”\r\n\r\nIn other words, Midjourney will get the right to use your output in their system – no confidentiality and no discretion. Even if you come up with something unique, others can replicate it and Midjourney themselves can use it too for whichever purposes they may have.\r\n\r\n    “Your Rights: Subject to the above license, you own all Assets you create with the Services. This does not apply if you fall under the exceptions below.”\r\n\r\nExceptions being, not paying for the right type of user license. And even if you do own it, as stated above, so will Midjourney.\r\n\r\nOne of the most controversial uses I see, is artists posting Midjourney output on their social media and claiming it as their own creation, given they have written the prompts. The way I see it, you might as well post an image you found by searching with the right words on Pinterest. You cannot use it as your own! Pinterest or Google would probably be an even faster way to find a great image. You do not have sole ownership of the images and are infringing others’ rights as well if you input “in the style of [Artist Name]”. If you go to the Louvre and take a picture of The Mona Lisa, your photograph will be unique – one of a kind – but you still won’t be the creator of The Mona Lisa. You just have a nice photo of a painting. And in the world of AI Prompts, the photo will not even be yours.\r\n\r\nEven more controversial is the way in which the AI’s have been trained. The harvest of unwilling, uncredited, unpaid artwork is an atrocity. You would never grab 100 peoples hard work and do a gallery exhibition that you charge money for, without involving any of the artists. So, grabbing 5 billion images without consent to train your AI is immoral and could be considered a massive copyright infringement. \r\nThe art test\r\n\r\nWhile doing an internal art challenge at our studio, I tried using Midjourney to create my concept art. The theme of the art challenge was “Wait, Are We the Bad Guys?”. \r\n\r\nI used this phrase as basis input for the for prompt.  After some failed attempts I found a much better reference by searching on Google. Now, I am aware that I cannot use the Google result as my own creation, but neither will I use Midjourney’s output.\r\n\r\n Admittedly, my goal here was to try to communicate an idea and not to create a beautiful piece of art. And that is the exact point, when highlighting the use of AI art for concept art! Problem solving does not necessarily need to be a high definition, polished illustrations. It CAN be a polished illustration; but 90 % of the time concept art are ideas, sketches, colour tests, and different visualizations that solves specific creative problems. \r\n\r\n On the other hand, if you are an illustrator whose actual goal it is to create a beautiful piece of artwork for a client, the issue of ownership and user rights becomes an even bigger problem for you and your client. You will need to accept the shared ownership with Midjourney, the risk of subsequent derivative use of the art your prompt produces, and potential copyright obligations to all the artwork and artists the AI has used as reference.\r\nWhat about the future? \r\n\r\nSo, what does this mean for the future of concept art? When tools to make art becomes more accessible the standard will rise, so artists must perform even better to stand out. Every time a new area of tools or methods emerges, you should learn about it, weigh out the pros and cons, and dip your feet in it, to see if it can help your workflow. If you dismiss new tools, you will fall behind. If every concept artist had dismissed photo-bashing or 3D programs (or for that sake Photoshop, back in the 90’s), relying only on what was available at the time, the current standard would be considerably lower.\r\n\r\nConcept artists whose primary value is their design skills, creative thinking, and ability to adapt new tools and methods, while critically evaluating which tools are best for the job, will become even more valuable than concept artists who can “just” do the art.\r\n\r\nWith that in mind, concept art is very far from dying. It is transitioning, though. And it will transition again and again, as it has always done. That is the essence of creative problem solving. We change our methods and approaches every time we find new tools and techniques, which makes us better and more effective as artists and creative thinkers.\r\n\r\nHowever, as a final note, I do hope that the unwilling harvest of art will become illegal practice very soon. While it might not kill concept art, it can severely damage and undermine the artists who make a living out of producing art. AI’s should compete on and uphold the same standards, practices, and copyright laws as any other artist. \r\n\r\n\r\nBy Jannick Lund, CEO, Vizlab Studios ApS', 2, '2022-11-17 05:12:28'),
(14, 14, 'Personal commissions are OPEN\r\n\r\nAfter a long time I’m OPENING personal commissions! My endometriosis keeps getting worse with each month so I’m opening these to gather some money for doctor visits. Please check the prices and policies over at my official website HERE. I’ll have a few spots available! \r\n\r\nI also offer prints from my works at my INPRNT here, which earnings I’ll also use for doctors. Thanks for everyone’s support!', 2, '2022-11-17 05:21:29'),
(15, 15, 'TEXTURING WEAPONS: FROM \"A\"​ TO \"Z\"​\r\n\r\nBlacksteinn artist Vsevolod Ushaev decided to share his method of creating realistic and high quality textures of weapons. Vsevolod focused on modern firearms and described the entire process: from basic materials to the smallest scuffs and artistic nuances. Enjoy reading ;)\r\n\r\n\r\nCOLLECTING REFERENCES\r\n\r\nSome people underestimate this step, but it is actually the most important. We simply can not imagine in our heads, how and what is made of the weapon that we are going to move in 3D. Or rather, in theory we can, but it will be inaccurate, unreasonable and difficult to reproduce. Not to mention the details - for example, how individual parts wear out, how it \"scratches\" when dropped, how it becomes after being repaired or repainted, and so on. Our materials have to look like the real thing and have physical properties just like the real guns.\r\n\r\nWe texture in Physically Based Rendering (PBR). So the first thing we do is go into the browser and look for pictures of the gun we want in the highest possible quality. Some search engines have a high resolution search filter to avoid low-res. For example, in Bing.\r\n\r\nBut thematic refs should also be found on thematic sites. These can be online auctions, reviews from gun owners, and forums. Often you can see already shabby guns there, which is more interesting for texturing than factory shiny ones.\r\n\r\nAfter gaining a lot of refs, you should determine which one is your main reference point. This should be the most \"tasty\" picture: detailed, artistic, quality. It is important to remember one nuance: the same weapon model can be made at different times and at different factories. So carefully check the refs, otherwise you will get some absurd mess.\r\n\r\nI recommend using PureRef for storing and viewing refs. It\'s easy to group them, and you can lock the window so you always have the references in front of you.\r\n\r\nAlso, don\'t forget or be ashamed to add other artists\' work to the refboard. For example, it could be guns from the latest installments of Call of Duty or Escape from Tarkov. Of course, you don\'t need to transfer someone else\'s view - along with someone else\'s mistakes. However, there\'s nothing wrong with picking up some details in the approach of more experienced gunsmiths. Moreover, it is very useful and can inspire new work.\r\n\r\n\r\nSETTING UP SUBSTANCE PAINTER\r\n\r\nSubstance Painter is a modern texturing classic. Try to always work in the current version, because with updates come useful features. For example, the new Substance has the Academy Color Encoding System (ACES) color profile by default. Also it is installed in Unreal Engine - so if you\'re going to import your model into Unreal, use ACES. You can put it in an old version of Painter too, here\'s a link to Gumroad. Install it as a color lut.\r\n\r\nAs HDRI I use Tomoco Studio, Soft: 1 - Front, 2 - Blacks and a slightly modified map from Studio Small 03 HDRI site - Poly Haven. While working, I advise you to switch between them periodically, because Roughness in particular looks different in different lighting.\r\n\r\nAnd be sure to set up the scene right away in the software or engine where you will present your work. This will help to quickly check how the textures will look in the final render. Unreal Engine, Marmoset Toolbag, Blender or render engines like Redshift and Octane are great. I almost always render in Marmoset - it\'s simple and handy. They\'ve added a lot of cool features in the new version, so there\'s no desire to change it for other software. Although knowledge of Unreal can be very useful to you. Of course, you will have to make some fuss with it, but you will get awesome results and at the job interview you will boast that you have experience in the game engine.\r\n\r\nWhich Pipeline to choose is up to you. It\'s best to understand both, because you might get both on a project. I was a long time afraid to try Specular/Glossiness, but in the end decided - and did not regret it. Very pleased with the ability to change the color of the glare. It gives you more control.\r\n\r\n\r\nTHE BASE MATERIAL AND ITS IMPORTANCE\r\n\r\nTexture creation starts with the base material. How accurately you replicate it from the reference material will determine - without exaggeration - the entire result. The scratches and chips, so beloved by many, are added at the very end and are more of a cosmetic nature. But the whole point is in the basemat.\r\n\r\nGuns are made from more or less the same materials - there are very few of them. Mostly steel, aluminum, polymer, plastic, Bakelite, wood, and anodized metals. Ideally, you should get your own library for each, so you don\'t have to create a material from scratch every time. But remember, a smart material made in Roughness/Metallic won\'t work in Specular/Glossiness. That\'s why you need to use a converter. There is one on Gumroad.\r\n\r\nTo make a basemat, find as \"clean\" a reference of your gun as possible. As if it had just come out of the factory. This can be tough, but always take the time to find a reference.\r\n\r\nThe first thing we do is create a fill layer. You don\'t want to put the slider on the extreme settings. Remember that nothing in nature is perfect black or perfect white. Immediately put noises, gradients, recessed darkening by AO, edge lightening by Curvature, and various color variations on this layer. \r\n\r\nNever do the whole gun in one color. Play with shades. Guns always look richer if there is a color breakdown on each part. You can also try overlaying some pictures with gradients of the right colors (but with a very small percentage of the transparency parameter). This way you can achieve nice shimmers, especially on metal. For example you can take a look at the work of Mykola Myhalenko from 4A Games.\r\n\r\nNow let\'s talk about noise. This is an important aspect of almost any material, because noises add to the material\'s realism. They should always be used on roughness and on color - it all depends on the material.\r\n\r\nFor the color noise, I use the default Color Sum map for Painter. I advise you to try all the blending options and play with transparency. The important thing is that the noise should not stand out. Its mission is to work on the general feeling. In addition, it is better to use several noises at different scales.\r\n\r\nThere is classic White Noise for overlaying noise in the other channels. Moreover, it has contrast options, which gives you more flexible settings for different tasks. Also, nobody forbids using ready-made maps with correct PBR parameters from Quixel as a base.\r\n\r\nTo summarize this section: never leave the base material blank. Often newbies make one fill - and immediately start adding damage. Sit on the basemat for a while longer, play with it. Remember: it\'s the foundation of the whole model.\r\n\r\nTHE ROUGHNESS CHANNEL\r\n\r\nNow let\'s move on to another important parameter: roughness. If we create a model for the first-person game, then every time the player turns, there should be glare on the weapon. And whether they will be nice or not depends on the roughness.\r\n\r\nOn the ArtStation, you can often see noisy, shallow, dirty roughness that is unpleasant to look at. How to avoid it? There is a 70/30 rule - the accent distribution rule. Never overlay a grunge texture you like on an entire model. Preferably, draw accent spots by hand using a flatbed. That way you can more accurately transfer what you see on the ref to the model.\r\n\r\n\r\nABOUT ARTISTIC COMPONENT\r\n\r\nIn 3D, there is a parameter of artistry. And if a 3D artist should go to art school, it is only to better understand this parameter. The artistic eye helps to make the work not boring. You need to be able to control the viewer\'s gaze, to guide him through the rendering, focusing on important details. If you just repeat the reference, you won\'t get that. I include color, contrast, accents, strokes, as well as the relationship between elements in the concept of artistry.\r\n\r\nAlways look at the references carefully. You\'ll find interesting and memorable elements that will add personality to your work.\r\n\r\nArtistry is very difficult to learn. In classical courses, there is almost no attention to it. But I will mention a few sources that helped me personally to pump up this parameter:\r\n\r\n    Stream on CG Allies about weapons (russian)\r\n    ArtOfSoulburn channel\r\n    Igor Dyatlov\'s Streams and Draft Punk 2019 Course (russian)\r\n    Evgenii Park\'s streams and Hard Surface course (russian)\r\n    Alex senechal Visual Design Basics course\r\n\r\nAlso in 3D, knowledge from related fields such as concept art, engineering, industrial design is very helpful.\r\n\r\nFor example, as a not-so-great example of artistry, consider... One of my works, the Walther P38 pistol. There are no accents here. If I were to do it now, in addition to my only points of attraction - chips on height, I would add oil stains, dust or a more interesting roughness. The crumpling on the magazine is also an element that adds interest, but deformation has to be handled very carefully, given the properties of the particular metal.\r\n\r\nDAMAGE\r\n\r\nDamage is anything that happened to the gun during use:\r\n\r\n    chips\r\n    scuffs\r\n    dirt\r\n    paint defects\r\n    dust\r\n    scratches\r\n\r\nTo accurately recreate them, you will need the appropriate texture maps, generators and alphas. There are enough generators in Painter, but alphas are something you will have to look for. Often the authors of texture courses leave such stuff behind. Or look for damage packs on ArtStation.\r\n\r\nYou probably know about the Metal Edge Wear generator in Painter. Often beginner artists, ignoring the refs, apply it to the whole model - and leave it that way. Don\'t do that. Generators are highly conspicuous and show that this is exactly what a 3D model is. I mean, that\'s not how it works in life. I don\'t mean to say that generators are bad. On the contrary, if you approach the process with your head and know how to use generators in moderation, they become an indispensable tool. For example, do not be afraid to brush over places where generators have not worked well.\r\n\r\nIn general, never be afraid of manual work. There are a lot of good texture brushes in Substance. So, if you are doing some beat up rifle with peeling paint, you won\'t be able to just paint over the texture of the worn off paint - all the flaws will immediately catch the eye.\r\n\r\n\r\nTO SUM IT UP\r\n\r\nNever stop learning. Watch the tutorials and try out new pipelines. There are plenty of cool tutorials, including free ones.\r\n\r\nAnd remember: even the best textures can be ruined by rendering with bad lighting. \r\n\r\nIf you\'ve read to this point, give it a like! And you can share your impressions in the comments. And ask questions, of course!', 2, '2022-11-17 05:28:09'),
(16, 16, 'Learn Unreal Archviz For Free\r\n\r\nHey! \r\n\r\nFor those who don’t know, I have started to dedicate time to create more free learning content! \r\n\r\nEducation is in important factor in anyone’s life. Sadly a lot of us don’t have this opportunity..\r\n\r\nwith my platform, I want to give people a better chance of using unreal engine to innovate to world and pursuit their passion! \r\n\r\nYou can find free learning content here: https://www.youtube.com/@wesselhuizenga\r\n\r\n\r\n\r\nThank you for al the support and kind words over the years! It means a lot! \r\n\r\nThis is just the beginning, stay tuned for more!!', 2, '2022-11-17 05:34:29'),
(17, 17, 'THE FOUNTAIN OF SOULS UPDATE - The Sägs floater world\r\n\r\nHello everyone! I\'m currently working on my next big concept art post for my Fountain of Souls: The Sägs floater world.\r\n\r\n\r\nThe sky of the Salt lands, and the world of Od’ by an extent, is populated by billions upon billions of airborne beings called “floaters”. These silent living things come in many shapes and sizes: from the size of a hand to some as big as cathedrals, they offer a wonderful spectacle of colorful bioluminescence along with regular deadly lightning storms.\r\n\r\nIt is in the western pans, in between the Astalai city and the Nelouan region, drifts the biggest one of all. Called the Floater-world, the behemoth is like a center of gravity for its other smaller peers, as well as the life source for this fragile ecosystem.\r\n\r\nThe Sägs are the self proclaimed protector of that said equilibrium. Inhabiting between the warm and humid epidermis folds, these daring people have left the ground to live ever closer to their sky gods and to run away from certain destruction from many more powerful foes. Now they reign supreme and unchallenged over the salt lands for well over a millenia… Who controls the sky, controls the ground. \r\n\r\nInitial concepts of the floater world I\'ve done back in 2020. It showcases how it would appear at day and night. I\'m not currently very satisfied with the overall look as it lacks a bit of personality and doesn\'t really stand out from its other smaller peers. \r\n\r\nThese are the latest concepts of the floater-world I\'ve done. I like the idea that the Floater-world is a VERY old living thing that has went through many hurdles. To better illustrate its age, i felt like playing with large and grotesque protuberances was the right way to go too. If you guys have a preference between all of them, feel free to let me know in the comments! \r\n\r\nUntil then! ', 2, '2022-11-17 05:40:19'),
(18, 3, 'ну что, молчите?\r\n\r\nполгода назад я обращался к русским фолловерам с глупой надеждой на то, что они не будут молча поддерживать геноцид украинцев. спустя какое-то время я этот пост удалил, так как русские оказались немым, глухим, слепым и послушным стадом.\r\nну вот, сегодня будьте добры, начинайте пожинать плоды своего молчания. вы думали, война вас не каснется? думали, это где-то далеко? ну что ж, теперь она рядом. повестки, армия, фронт, похоронки. ешьте, не обляпайтесь, восточные соседи)', 2, '2022-11-17 05:43:31'),
(19, 18, 'Speaking at Unreal Fest This Year!\r\n\r\nHey everyone,\r\n\r\nReally excited to announce I\'ll be speaking at Unreal Fest in New Orleans next week! \r\n\r\nThe event will be from the 17th to the 20th covering all the industries that include Unreal Engine. \r\n\r\nI\'ll be doing 3 presentations:\r\n\r\nBuilding an Online Presence With Your Game Art Portfolio \r\n\r\nFireside Chat: How to Impress Recruiters with Your 3D Portfolio\r\n\r\nCreating Interactive Illustrations in UE5\r\n\r\n\r\nTo get more details and for registration you can check out the official site here!\r\n\r\nhttps://www.unrealengine.com/en-US/events/unreal-fest-2022', 2, '2022-11-17 05:49:41'),
(20, 19, 'Developing Speed in 3D Art\r\n\r\n1.Intro\r\n\r\nIn this post I’m going to go over some of my general thoughts and philosophy when it comes to speed in 3D art.  All the usual caveats apply - I’m not any kind of ultimate dispenser of sacred knowledge. I’m just a silly little guy. But I do think I have something valuable to say here.Let’s define things a little here. What do I even mean by speed? Well, that should be fairly obvious - the amount of time it takes you to complete an asset, character or environment. \r\n\r\nFor the purposes of this post I’ll make the clarification that I’m not talking about rushing things, being hasty. Sacrificing quality in order to get things done is something you have to often do in production, but it’s not a desirable state of being. \r\n\r\nThough perhaps there’s a point to be made here about knowing when something is good enough and knowing where to cut corners.\r\n\r\nIt might be more helpful to use the term Efficiency. But I’ll stick with speed for this post. \r\n\r\n\r\n2. Speed - Does it matter?\r\n\r\nYes. But no actually. As with all things in art and life, it depends! \r\n\r\n\r\nIf you’re more of a beginner or in the early stages of your 3D art training I would say simply don’t worry about speed. It’ll come eventually. This applies to a large chunk of people in the “intermediate” category as well. Don’t worry about it! Speed is mostly a measure of experience. And you’ll almost inevitably develop it over time along with your other skills. However, there can certainly be cases where you’re able to produce quality work but at such a slow pace that it can hinder your project/job/career. Perhaps you’ve noticed that your work is just as good as your peers, but you get there slower than you’d like? \r\n\r\n3. How do you get faster?\r\n\r\nI would argue that speed is mainly a direct measure of experience. Of course things don’t always correlate perfectly and there are edge cases.\r\n\r\nExperience isn’t linear. No matter how experienced you are, if you’re learning something brand new you won’t be blazing fast at the start. \r\n\r\nSo what does this mean? I think Speed is only meaningful in the context of production and when creating assets for which you have a standardized pipeline. RnD and other exploratory work don’t really follow the same rules. Experience can be further split up into two rough categories - I’ll call these the macro and micro levels:\r\n\r\nMacro level means knowing what you want to achieve and how to get there. Having great artistic fundamentals, a trained eye and a good overall idea of what the process will look like from beginning to end. Micro level is the moment-to-moment work inside your 3D package. This is about knowing your program and all the various tricks you can use to speed up your work. In broad terms, Macro level stuff is not something I or anyone can teach - certainly not in a single blog post. It’s years of accumulated knowledge from various sources and deliberate practice. Though perhaps I can help guide your thinking in the next section.\r\n\r\nMicro level on the other hand can be quite easily taught - it’s every quick YouTube tutorial you’ve ever googled about how to use a specific feature in a program.  But the challenge there is accumulating enough of this knowledge in bits and pieces until you’ve mastered whatever program you’re working in. \r\n\r\n4. How to think about art production\r\n\r\nPlan well, reuse smartly, don’t waste time on things no one will see. Pipeline first!As boring as it may sound, I think the best way to get consistently faster is by having a solid plan at the start and standardizing as much of your process as possible into repeatable and predictable chunks and trusting the process. \r\n\r\nBy approaching art production from a pipeline-first perspective, you can more easily reuse work, resources or techniques, and make better estimates about how long something will take you. The latter can be incredibly important in a production setting. \r\n\r\nYou should always be on the lookout for things to improve your workflows. I invite anyone who’s read this far to take a good look at your day-to-day processes in whatever software you use and question whether you’re doing things in the most optimal way possible. The answer is very likely no. \r\n\r\nI certainly don’t. So everyone’s got room to improve. But there’s a slight contradiction here: I’m advocating for standardization while also saying you should be improving and thus changing up your methods all the time. So what gives? \r\n\r\nI think it’s important to recognize that there’s a tension between those two aspects of our work. \r\n\r\nMost of the time I resolve this by incorporating small changes to my workflow immediately, and larger ones I evaluate between projects or at the start of a new one. Certainly be very wary of changing anything that affects the final look of your assets if you’re in the middle of a project. I want to stress not being hasty just for the sake of speed again. Doing sloppy work will most likely mean redoing things and you end up spending way more time on things in the end. \r\n\r\nAnd again, a lot of this comes down to just plain old experience. The best way to get faster is to get those reps in. Make 3D art. Over and over. Every day.\r\n\r\nGet a few hundred props under your belt and you’ll have a much better idea about how long something will take, and will probably be able to describe in detail exactly how you’d execute an asset just by looking at the concept. Same goes for characters, environments etc.\r\n\r\n\r\nOnce you’ve made enough assets, everything can be seen as just a remixing of things you’ve already made. This is how human brains work - we contextualize new things based on lived experience. After a while most new assets are just a mash-up of techniques you’ve already used in previous ones. \r\n\r\nAnd even slightly more abstract aspects of art like composition and color can be remixed and reused!  \r\n\r\n5. Software-specific methods\r\n\r\nIn this section I’ll discuss software-specific tips and tricks, but still start with generalizations.\r\n\r\nThis might make some people mad but I’m a huge advocate for keybinds. Pressing keyboard shortcuts is significantly faster than clicking through menus. Pie menus are a halfway point and can be nice, but only if they aren’t bloated with too many options and you memorize them so you can quickly flick to whichever option you want. \r\n\r\nThe difference between near-instantaneous keypresses and clicking through menus may not feel like much but it adds up over time. However! I will point out that this is the microest of micro-improvements when it comes to speed. Experience on the macro level usually has a much larger effect on speed. A master painter is able to do with a few brush strokes what an amateur needs hours of noodling for, no matter how fast the amateur moves their brush. So, my recommendation is to look for actions that you find yourself repeating often and keybinding as many of those as possible. I try to do this in every program if possible. Similarly, you should look for things to automate and standardize whenever possible. Standardize your master materials in Unreal, or reuse parts of them in future projects. Standardize your texture export presets in Substance. Figure out a reliable and efficient import-export pipeline between all of your programs so you never get any surprises. Have a mental checklist for all the things you need to do on every asset and make sure to go through those every time. Or even better, automate all of that. Congratulations! You’re a pipeline tech artist. \r\n\r\nSo, let’s talk about poly modeling. Specifically in Blender. This isn’t a tutorial about any specific techniques, but here’s some stuff I find helpful.\r\n\r\nIn my view the most important thing you can do is to improve the way you do selections. Selecting the elements you want quickly and reliably is, to me, at the core of becoming a good modeler. Selecting what elements you want to do an operation to is always the first step in any operation.That’s why I recommend getting familiar with, and eventually adding shortcuts to, all the advanced selection options found here in the Select menu:\r\n\r\nSelect similar (Shift-G) is also incredibly powerful and can help you a ton in making quick selections.\r\n\r\nI highly recommend making use of the LoopTools addon, specifically the Relax, Circle and Space options. These give you loads of freedom to always alter topology after creating it, so you can focus more on form and less on specific edge loop counts. Especially handy for retopology.Speaking of retopo, make sure to enable the F2 addon. This, in combination with Grid Fill and the tools above will massively speed up your retopology work. \r\n\r\n\r\n6. Summary\r\n\r\nSpeed comes mostly from experience. Beginners should not worry about speed - quality comes first. Knowing what they want to achieve and how to get there is the primary way experienced artists are able to work fast. Though micro-level speed improvements such as shortcuts can help too. You should always be looking to create steady production pipelines for yourself in order to be able to standardize your asset creation methods and share techniques and resources across assets and projects. You should constantly be on the lookout for new ways to improve your workflows. \r\n\r\n\r\nThanks for reading!', 2, '2022-11-17 05:54:51'),
(24, 48, 'nice pic', 1, '2022-12-01 01:04:16'),
(25, 48, '', 1, '2022-12-01 01:17:38'),
(26, 48, '', 1, '2022-12-09 19:25:39'),
(27, 1, '', 1, '2022-12-09 19:27:39'),
(28, 1, '', 1, '2022-12-10 00:29:15'),
(31, 48, 'this is bullshit!', 2, '2022-12-10 01:38:56'),
(32, 48, '', 1, '2022-12-10 06:42:38');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `tag_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_id`, `post_id`, `tag_name`) VALUES
(1, 1, 'Digital 2D'),
(2, 1, 'Sketches'),
(3, 1, 'Anime & Manga'),
(4, 1, 'Comic Art'),
(5, 2, 'Digital 2D'),
(6, 2, 'Portraits'),
(7, 2, 'Game Art'),
(8, 2, 'Concept Art'),
(9, 2, 'arcane'),
(10, 2, 'league of legends'),
(11, 2, 'vi'),
(12, 2, 'caitlyn'),
(13, 2, 'cupcake'),
(14, 2, 'pride'),
(15, 3, 'Digital 3D'),
(16, 3, 'Horror'),
(17, 3, 'Creatures'),
(18, 4, 'Digital 3D'),
(19, 4, 'Character Modeling'),
(20, 4, 'Character Design'),
(21, 4, 'Concept Art'),
(22, 5, 'Digital 2D'),
(23, 5, 'Character Design'),
(24, 5, 'Illustration'),
(25, 5, 'Fantasy'),
(26, 5, 'LOTR'),
(27, 5, 'The Hobbit'),
(28, 5, 'Tolkien'),
(29, 5, 'Goblins'),
(30, 5, 'Orcs'),
(31, 5, 'Gollum'),
(32, 5, 'Bilbo'),
(33, 5, 'Gandalf'),
(34, 5, 'Smaug'),
(35, 5, 'Dragon'),
(36, 5, 'Illustration'),
(37, 5, 'Fantasy'),
(38, 5, 'Watercolor'),
(39, 5, 'Procreate'),
(40, 5, 'Character Design'),
(41, 5, 'Fantasy Illustration'),
(42, 5, 'Digital 2D'),
(43, 6, 'Digital 2D'),
(44, 6, 'Character Design'),
(45, 6, 'Book Illustration'),
(46, 6, 'Creatures'),
(47, 6, 'Digital 2D'),
(48, 6, 'Digital Art'),
(49, 6, 'Illustration'),
(50, 6, 'Book Illustration'),
(51, 6, 'Fantasy, Bestiary'),
(52, 6, 'Character Design'),
(53, 6, 'Concept Art'),
(54, 6, 'Monster'),
(55, 6, 'Mutations'),
(56, 6, 'Horror'),
(57, 6, 'Creature'),
(58, 6, 'Infection'),
(59, 6, 'Plague'),
(60, 6, 'Death Angel'),
(61, 6, 'Rats'),
(62, 7, 'Digital 2D'),
(63, 7, 'Character Design'),
(64, 7, 'Illustration'),
(65, 7, 'Concept Art'),
(66, 8, 'Digital 3D'),
(67, 8, 'Character Design'),
(68, 9, 'Digital 3D'),
(69, 9, 'Character Modeling'),
(70, 9, 'Stylized'),
(71, 9, 'Portraits'),
(72, 9, 'lucy'),
(73, 9, 'cyberpunk'),
(74, 9, 'edgerunners'),
(75, 10, 'Digital 2D'),
(76, 10, 'Environmental Concept Art & Design'),
(77, 10, 'Game Art'),
(78, 10, 'Concept Art'),
(79, 10, 'concept art'),
(80, 11, 'substance 3d painter'),
(81, 11, 'smart mask'),
(82, 11, 'materials'),
(83, 11, 'render'),
(84, 11, 'cgi'),
(85, 11, 'texturing'),
(86, 11, 'rust'),
(87, 11, 'old'),
(88, 11, 'edge'),
(89, 11, 'scratch'),
(90, 12, 'course'),
(91, 12, 'domestika'),
(92, 12, 'creature design'),
(93, 12, 'character design'),
(94, 12, 'zbrush'),
(95, 12, 'concept art'),
(96, 12, 'illustration'),
(97, 12, 'cgi'),
(98, 12, 'octane render'),
(99, 12, 'pixologic'),
(100, 13, 'midjourney'),
(101, 13, 'ai'),
(102, 13, 'concept art'),
(103, 13, 'concept design'),
(104, 13, 'problem solving'),
(105, 13, 'creativity'),
(106, 13, 'tools'),
(107, 13, 'art prompt'),
(108, 13, 'world building'),
(109, 13, 'preproduction'),
(110, 14, 'commissions'),
(111, 14, 'digital art'),
(112, 14, 'digital painting'),
(113, 14, 'fantasy art'),
(114, 14, 'tarot'),
(115, 14, 'impressionism'),
(116, 14, 'prints'),
(117, 14, 'surreal art'),
(118, 15, 'gameartanddesign'),
(119, 15, '3dmodeling'),
(120, 15, '3dartist'),
(121, 15, 'zbrush'),
(122, 15, 'substancepainter'),
(123, 15, 'videogaming'),
(124, 15, 'videogames'),
(125, 15, '3d'),
(126, 15, 'texturing'),
(127, 15, 'textures'),
(128, 16, 'learning'),
(129, 16, 'tutorial'),
(130, 16, 'youtube'),
(131, 16, 'unrealengine'),
(132, 16, 'lumen'),
(133, 16, 'realtime'),
(134, 16, 'design'),
(135, 16, 'archviz'),
(136, 17, 'thefountainofsouls'),
(137, 17, 'brsnd'),
(138, 17, 'concept art'),
(139, 17, 'environmentdesign'),
(140, 17, 'floaterworld'),
(141, 17, 'worldbuilding'),
(142, 19, 'unreal'),
(143, 19, 'engine'),
(144, 19, 'ue5'),
(145, 24, 'Digital 2D'),
(146, 24, 'illustration'),
(147, 24, 'poster'),
(148, 25, ''),
(149, 26, ''),
(152, 31, 'random'),
(153, 32, 'abstract'),
(154, 32, 'political satire'),
(155, 32, 'China');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` char(255) NOT NULL,
  `avatar` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `album_cover` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `email`, `password`, `avatar`, `description`, `album_cover`) VALUES
(1, 'Kate Fox', 'k_fox@fox.com', '$2y$10$2seUqvIe69/79gqaA60ZluG/ZbYZrhny53DDMBUoiRkmwanPSx61m', 'avatar_1.jpg', 'If you like my work - support me here: https://www.patreon.com/katefox', 'album_cover_1.jpg'),
(2, 'Julian Futanto', 'j_futanto@riotgames.com', '$2y$10$sgvJAgGqgvTjwOAPhaiifetuN85sfOKQ1R2PiQQpIWofngiMsO4aG', 'avatar_2.jpg', 'I love concept art\r\n\r\nPlease email or message me for my unpublished work', 'album_cover_2.jpg'),
(3, 'Sadan Vague', 's_vague@gmail.com', '$2y$10$6c6QnI.wHR0THqSAZZe32OvzxUDEzLlMGxu0Z386FyrQmbteQiLVe', 'avatar_3.jpg', 'Few years in a small indie game studio as an artist. Many years as a traditional sculptor. Currently working as freelance artist, working with creatures, monsters and all that beautiful stuff. ', 'album_cover_3.jpg'),
(4, 'Kara king', 'k_king@artstation.com', '$2y$10$MDy2SWUHu27B31sbxBABoOXGMiMu5OFz7bRL6CVD8A3//14OOqYWi', 'avatar_4.jpg', '更喜欢生物', 'album_cover_4.jpg'),
(5, 'James Castillo', 'j_castillo@artstation.com', '$2y$10$g.iiwneCN1RwBQRr9HJ7iuxV3A5E6H7rldWLFno0vFyY4Rlmyiaka', 'avatar_5.jpg', '', 'album_cover_5.jpg'),
(6, 'MLarty', 'MLarty@artstation.com', '$2y$10$E.qisI1efhwVtua.1jMqiOmBRAvGbacrd5QJChLyLjUOZ1pnkZkRK', 'avatar_6.jpg', '', 'album_cover_6.jpg'),
(7, 'Lucia Hsiang', 'l_hsiang@gmail.com', '$2y$10$n.A/O6hHsSVJJLitcdK8MeX.KVtIDSjIKf5jRJMasGT9F0mo386KS', 'avatar_7.jpg', '', 'album_cover_7.jpg'),
(8, 'Evgeniia Petrova', 'v_petrova@gmail.com', '$2y$10$wHmmGIjw3/kBBWYbV1lwK.jgvHYcM6UDwOJvLUbckynA/TdjOkL/u', 'avatar_8.jpg', '_________________', 'album_cover_8.jpg'),
(9, 'Lele Chen', 'l_chen@gmail.com', '$2y$10$2QjRh2SJdUOktBJi2UWHq.fRht/Z436DFar6FP53vYgcAK6jY6UBK', 'avatar_9.jpg', 'Digital Art Masters vol 9', 'album_cover_9.jpg'),
(10, 'Davood Moghaddami', 'd_moghaddami@gmail.com', '$2y$10$6yHivZFhxPoGoZa9tBoFgerpeaxiAfzUg5n3HXgesg18YFzjf1VMi', 'avatar_10.jpg', 'In the beginning of my art journey, I used analog media to paint nature which was my main interest. After getting familiar with the digital media, I started my career as a character designer. Then I realized I am also interested in pre-production. (Concept art, storyboard and background design). I also worked as a concept artist, costume and environment designer in cinema. Overall one thing that brings happiness to my life is creativity.', 'album_cover_10.jpg'),
(11, 'Javad Rajabzade', 'j_rajabzade@gmail.com', '$2y$10$.iUNkXnFDEq36Eik0aPdaOv/D1SxHO8moFyM2lgU13CY3N4YegxBm', 'avatar_11.jpg', 'Hi, my name is Javad and I\'ll be glad to assist you. I create photoreal CG imagery for product marketing and 3D models for apps & web solutions. Let me know if there\'s anything I can help you with', 'album_cover_11.jpg'),
(12, 'Santiago Betancur', 'contact.sbetancur@gmail.com', '$2y$10$Eoa0/Uig7JLBQnCLrp4Bwe03yknDgC3GPcywxcI0CffjTRfK.P132', 'avatar_12.jpg', 'My name is Santiago Betancur, I am a Concept Artist from Colombia, focused on character and creature design, also I love to watch movies, play videogames and tell stories through images! I have experience working for Indi videogames, shortfilms, commercials, advertising, Digital illustration, and collectibles. ', 'album_cover_12.jpg'),
(13, 'Vizlab Studios', 'contact@vizlabstudios.com', '$2y$10$Nq3dH7mAMYgWXct4dXDVEu6wz4oQRgUeotMkbjTdFoahtmct0vFNe', 'avatar_13.jpg', '“That’s great! I hadn’t thought of it that way!” is a common phrase used by the game studios we help with visual development and concept art creation. We think, we design, and we deliver! That is why our philosophy is “Brains over Brushes”.\r\n\r\nThe Explorative Concept Design approach is the backbone of our Concept Design Framework. By combining concept art skills with game design and elements of design thinking Vizlab Studios create compelling visual development and concept art that conveys the essence of your game.\r\n\r\nOur framework is based on collaboration, transparency, and an in depth understanding of each engagement. Understanding and defining what is valuable in each individual client project makes it possible to adapt our method and approach to your specific needs and goals. ', 'album_cover_13.jpg'),
(14, 'Valentina Remenar', 'v_remenar@gmail.com', '$2y$10$/7ICCFL.ZvJTzA90dQDPAOysaXypdnBkevkw3iswkTJukvgyntuxm', 'avatar_14.jpg', 'Valentina Remenar is a traditional and digital illustrator, concept artist and graphic designer from Croatia, currently based in Slovenia, who works primarily on game concepts, book covers, posters, character design, and digital illustrations. Some of her clients include Riot Games, Blizzard, Marvel, Wizards Of The Coast, Valve, Outfit7 Ltd. (Ekipa2 d.o.o. subsidiary), West Studio, 3dtotal, ImagineFX, DeviantArt, Celsys...', 'album_cover_14.jpg'),
(15, 'Blacksteinn', 'blacksteinn@external.com', '$2y$10$3i.Xuy7OzDqNJUJHByje8efOKVVRty6dr1a1ugNSzK8i.CppZ0.He', 'avatar_15.jpg', 'Blacksteinn is an independent external game development studio. We are based in Almaty (Kazakhstan).\r\n\r\nWe offer the best art development services:\r\n\r\n• 3D art\r\n• 2D concept art\r\n• Animation\r\n\r\nThe company is founded by veterans of the gaming industry with rich experience in creating computer graphics for AAA projects. We provide external art production for games across different genres and platforms. We are working with the world’s largest game developers (CD Projekt RED, Remedy Entertainment, Id Software, Obsidian Entertainment, Wargaming.net, etc.).\r\n\r\nA few words about us:\r\n\r\n• We provide full-cycle 3D production for AAA games.\r\n• We are 40+ professional artists.\r\n• We have a great game development experience with all kinds of work: props, vehicles, weapons, characters, etc.\r\n• We carry out strict internal project management, so we guarantee compliance with deadlines.\r\n• We guarantee the security of your data and work on the project. We have several degrees of IT protection.\r\n• We provide stability, reliability, and quality in everyday work with our partners!\r\n\r\nWe are passionate about creating the best art for the games. Therefore, we guarantee that we will treat your project with the same care and attention as our own. The game industry is our life and passion.\r\n\r\nBlacksteinn is your reliable assistant. You can entrust us with your game project.', 'album_cover_15.jpg'),
(16, 'Wessel Huizenga', 'w_huizenga@gmail.com', '$2y$10$4WBbDqqbOjvca8jSHzU39OqeoLQKZvw/N4DZelUyvcFgoRi/uNoda', 'avatar_16.jpg', 'Hi! I’m a very passionate and hard working archviz artist.\r\n\r\nWith a background in creating game environments, I’m able to setup optimized archviz scenes using realtime render engines.\r\n\r\nI currently work as a VR and AR designer at Van Wijnen. Here I develop photoreal real-time experiences, for customers that are looking to buy unbuilt property. Visualising property helps customers making better desccions when buying their future home. VR enables to see build property on a 1:1 scale.\r\n\r\nOn the side I help people develop their skill in real-time archviz, sell products through my ArtStation store and develop tutorials for artstation learning.\r\n\r\nMy long term goal is to push the archviz industry towards using real-time game engines. By pushing my own quality on a daily base, I want to show the possibillity an engine like Unreal Engine 4 has. It greatly increases render time, allows for instant changes in material and is able to setup multiple innovative tours within hours. This all can be done with clients to receive immediate feedback!\r\n\r\nIn my free time I Love to travel the world and explore the many diffrent cultures the world has to offer. I photograph all the places I come to feed my creativity and create amazing memories!', 'album_cover_16.jpg'),
(17, 'Pierre Broissand', 'p_broissand@gmail.com', '$2y$10$FkVeTSNJ/5AYANmtviALYOTm/FbOASPOht6uMvec4N35EiAXPw69y', 'avatar_17.jpg', 'Looking for work! ', 'album_cover_17.jpg'),
(18, 'Tyler Smith', 'tyler_smith@gmail.com', '$2y$10$ku2JbKeTiqD40UCKM4x5u.FIjPv9TuYR/aovBMyRD4T5p4AZl2PEC', 'avatar_19.jpg', 'Senior Level environment artist.', 'album_cover_19.jpg'),
(19, 'Santeri Soininen', 'santerisoininen1@gmail.com', '$2y$10$rHwLX/P/ssNunhF.hxbYWOqP0rhJlQ0C5itucniE6FHabUttjqUzC', 'avatar_20.jpg', '3D Artist', 'album_cover_20.jpg'),
(48, 'Jack', 'jack_yuan@sfu.ca', '$2y$10$9bdMA41U9MTN5j.gcxMwmOiwX5JEAdoBwSSv8OghSdIWjhlQGFnOy', '4a3d9a4f5533a420.jpg', NULL, 'v2-723e0ae77c3f8f9d418ac1be529eccdb.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE `views` (
  `view_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `view_count` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `views`
--

INSERT INTO `views` (`view_id`, `post_id`, `view_count`) VALUES
(1, 7, 1),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `visitor_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `ip_address` varbinary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`collection_id`),
  ADD KEY `have_collection` (`user_id`),
  ADD KEY `collected_in` (`post_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `has_comments` (`post_id`),
  ADD KEY `posted_by` (`user_id`);

--
-- Indexes for table `following`
--
ALTER TABLE `following`
  ADD PRIMARY KEY (`follow_id`),
  ADD KEY `is_followed` (`followed_user_id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `has_image` (`post_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `uploaded_by` (`user_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`),
  ADD KEY `has_tags` (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`view_id`),
  ADD KEY `has_views` (`post_id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`visitor_id`),
  ADD KEY `viewed_by` (`post_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `collection`
--
ALTER TABLE `collection`
  MODIFY `collection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `following`
--
ALTER TABLE `following`
  MODIFY `follow_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
  MODIFY `view_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `visitor_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `collection`
--
ALTER TABLE `collection`
  ADD CONSTRAINT `collected_in` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `have_collection` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `has_comments` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posted_by` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `following`
--
ALTER TABLE `following`
  ADD CONSTRAINT `is_followed` FOREIGN KEY (`followed_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `is_following` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `has_image` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `uploaded_by` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `has_tags` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE;

--
-- Constraints for table `views`
--
ALTER TABLE `views`
  ADD CONSTRAINT `has_views` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE;

--
-- Constraints for table `visitors`
--
ALTER TABLE `visitors`
  ADD CONSTRAINT `viewed_by` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
