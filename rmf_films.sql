-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 29, 2025 at 08:01 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rmf_films`
--

-- --------------------------------------------------------

--
-- Table structure for table `anime_metadata`
--

CREATE TABLE `anime_metadata` (
  `anime_name` varchar(255) NOT NULL,
  `source` enum('tv_series','movies','films') NOT NULL,
  `description` text,
  `genres` varchar(255) DEFAULT NULL,
  `characters` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `anime_metadata`
--

INSERT INTO `anime_metadata` (`anime_name`, `source`, `description`, `genres`, `characters`) VALUES
('5 Centimeters per Second', 'movies', 'A tale of love and distance following the lives of two friends growing apart over the years.', 'Romance,Drama,Slice of Life', '[{\"name\": \"Takaki Tono\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/10/56152.jpg\", \"voice_actor\": \"Kenji Mizuhashi\"}, {\"name\": \"Akari Shinohara\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/6/56151.jpg\", \"voice_actor\": \"Yoshimi Kondou\"}, {\"name\": \"Kanae Sumida\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/5/138139.jpg\", \"voice_actor\": \"Satomi Hanamura\"}]'),
('Attack on Titan', 'films', 'Mankind fights for survival against giant humanoid Titans. Eren Yeager joins the Scout Regiment to uncover the truth and seek revenge.', 'Action,Dark fantasy,Drama', '[{\"name\": \"Eren Yeager\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/10/216895.jpg\", \"voice_actor\": \"Yuki Kaji\"}, {\"name\": \"Mikasa Ackerman\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/9/215563.jpg\", \"voice_actor\": \"Yui Ishikawa\"}, {\"name\": \"Armin Arlert\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/8/220267.jpg\", \"voice_actor\": \"Marina Inoue\"}]'),
('Black Clover', 'films', 'Asta, a boy born without magic, aims to become the Wizard King with the help of his anti-magic powers.', 'Action,Fantasy,Adventure', '[{\"name\": \"Asta\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/8/312836.jpg\", \"voice_actor\": \"Gakuto Kajiwara\"}, {\"name\": \"Yuno\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/6/318765.jpg\", \"voice_actor\": \"Nobunaga Shimazaki\"}, {\"name\": \"Noelle Silva\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/14/338844.jpg\", \"voice_actor\": \"Kana Yuki\"}]'),
('Bleach: Thousand-Year Blood War', 'films', 'Ichigo Kurosaki faces the Quincy army in a full-scale war as secrets about Soul Society are unveiled.', 'Action,Supernatural,Shounen', '[{\"name\": \"Ichigo Kurosaki\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/3/512788.jpg\", \"voice_actor\": \"Masakazu Morita\"}, {\"name\": \"Rukia Kuchiki\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/2/78215.jpg\", \"voice_actor\": \"Fumiko Orikasa\"}, {\"name\": \"Uryu Ishida\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/16/139189.jpg\", \"voice_actor\": \"Noriaki Sugiyama\"}]'),
('Blue Lock', 'films', 'Setelah Jepang kalah di Piala Dunia, proyek Blue Lock dimulai untuk mencari striker egois terbaik. Yoichi Isagi bersaing dalam kompetisi berisiko tinggi.', 'Sports,Psychological,Drama', '[{\"name\": \"Yoichi Isagi\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/6/558080.jpg\", \"voice_actor\": \"Kazuki Ura\"}, {\"name\": \"Meguru Bachira\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/14/491180.jpg\", \"voice_actor\": \"Tasuku Kaito\"}, {\"name\": \"Rin Itoshi\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/11/498288.jpg\", \"voice_actor\": \"Yuma Uchida\"}]'),
('Chainsaw Man', 'films', 'Denji, seorang pemuda miskin, menjadi pemburu iblis untuk melunasi utangnya. Setelah dikhianati dan dibunuh, ia bersatu dengan iblis peliharaannya, Pochita, dan dihidupkan kembali sebagai Chainsaw Man.', 'Action,Dark fantasy,Horror', '[{\"name\": \"Denji\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/3/492407.jpg\", \"voice_actor\": \"Kikunosuke Toya\"}, {\"name\": \"Power\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/7/494969.jpg\", \"voice_actor\": \"Ai Fairouz\"}, {\"name\": \"Aki Hayakawa\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/13/395003.jpg\", \"voice_actor\": \"Shogo Sakata\"}]'),
('Children Who Chase Lost Voices', 'movies', 'A girl journeys to a mysterious world to say goodbye to a lost loved one and discovers its many secrets.', 'Adventure,Fantasy,Drama', '[{\"name\": \"Asuna Watase\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/7/145347.jpg\", \"voice_actor\": \"Hisako Kanemoto\"}, {\"name\": \"Shun\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/7/145369.jpg\", \"voice_actor\": \"Miyu Irino\"}, {\"name\": \"Ryuuji Morisaki\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/3/145363.jpg\", \"voice_actor\": \"Kazuhiko Inoue\"}]'),
('Clannad: After Story', 'tv_series', 'Following the events of Clannad, Tomoya and Nagisa face life challenges as they start a family and learn about hardship and hope.', 'Drama,Romance,Slice of Life', '[{\"name\": \"Tomoya Okazaki\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/6/508343.jpg\", \"voice_actor\": \"Yuichi Nakamura\"}, {\"name\": \"Nagisa Furukawa\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/3/300961.jpg\", \"voice_actor\": \"Mai Nakahara\"}, {\"name\": \"Ushio Okazaki\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/12/48244.jpg\", \"voice_actor\": \"Ai Nonaka\"}]'),
('Death Note', 'films', 'A student discovers a notebook that allows him to kill anyone by writing their name and seeks to rid the world of evil.', 'Psychological,Thriller,Supernatural', '[{\"name\": \"Light Yagami\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/6/63870.jpg\", \"voice_actor\": \"Mamoru Miyano\"}, {\"name\": \"L\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/10/249647.jpg\", \"voice_actor\": \"Kappei Yamaguchi\"}, {\"name\": \"Ryuk\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/10/59125.jpg\", \"voice_actor\": \"Shido Nakamura\"}]'),
('Demon Slayer', 'films', 'Tanjiro Kamado becomes a demon slayer after his family is slaughtered and his sister Nezuko is turned into a demon.', 'Action,Supernatural,Dark fantasy', '[{\"name\": \"Tanjiro Kamado\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/6/386735.jpg\", \"voice_actor\": \"Natsuki Hanae\"}, {\"name\": \"Nezuko Kamado\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/2/378254.jpg\", \"voice_actor\": \"Akari Kitō\"}, {\"name\": \"Zenitsu Agatsuma\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/10/459689.jpg\", \"voice_actor\": \"Hiro Shimono\"}]'),
('Dragon Ball Z', 'films', 'Goku defends Earth against powerful foes including Vegeta, Frieza, Cell, and Majin Buu, with help from friends and family.', 'Action,Martial Arts,Sci-Fi', '[{\"name\": \"Goku\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/15/72546.jpg\", \"voice_actor\": \"Masako Nozawa\"}, {\"name\": \"Vegeta\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/14/86185.jpg\", \"voice_actor\": \"Ryo Horikawa\"}, {\"name\": \"Gohan\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/2/72715.jpg\", \"voice_actor\": \"Masako Nozawa\"}]'),
('Frieren: Beyond Journey’s End', 'films', 'Setelah mengalahkan Raja Iblis, penyihir elf Frieren memulai perjalanan untuk memahami waktu, manusia, dan kehilangan.', 'Adventure,Fantasy,Drama', '[{\"name\": \"Frieren\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/7/525105.jpg\", \"voice_actor\": \"Atsumi Tanezaki\"}, {\"name\": \"Fern\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/13/519083.jpg\", \"voice_actor\": \"Kana Ichinose\"}, {\"name\": \"Stark\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/2/523292.jpg\", \"voice_actor\": \"Chiaki Kobayashi\"}]'),
('Fullmetal Alchemist: Brotherhood', 'films', 'Two brothers use alchemy in their quest to restore their bodies after a failed attempt to bring their mother back to life.', 'Action,Adventure,Drama', '[{\"name\": \"Edward Elric\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/9/72533.jpg\", \"voice_actor\": \"Romi Park\"}, {\"name\": \"Alphonse Elric\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/5/54265.jpg\", \"voice_actor\": \"Rie Kugimiya\"}, {\"name\": \"Roy Mustang\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/11/510227.jpg\", \"voice_actor\": \"Shinichiro Miki\"}]'),
('Gintama°', 'tv_series', 'The oddball samurai Gintoki and his friends fight against dark forces threatening Edo in this action-packed continuation.', 'Action,Comedy,Parody', '[{\"name\": \"Gintoki Sakata\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/15/241479.jpg\", \"voice_actor\": \"Tomokazu Sugita\"}, {\"name\": \"Shinpachi Shimura\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/14/114081.jpg\", \"voice_actor\": \"Daisuke Sakaguchi\"}, {\"name\": \"Kagura\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/2/505912.jpg\", \"voice_actor\": \"Rie Kugimiya\"}]'),
('Hell’s Paradise', 'films', 'Gabimaru, ninja tak terkalahkan, dikirim ke pulau misterius untuk mencari ramuan keabadian di tengah bahaya mengerikan.', 'Action,Dark fantasy,Adventure', '[{\"name\": \"Gabimaru\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/5/497163.jpg\", \"voice_actor\": \"Chiaki Kobayashi\"}, {\"name\": \"Sagiri\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/8/497169.jpg\", \"voice_actor\": \"Yumiri Hanamori\"}, {\"name\": \"Yuzuriha\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/9/497164.jpg\", \"voice_actor\": \"Rie Takahashi\"}]'),
('Hunter x Hunter (2011)', 'tv_series', 'Gon Freecss becomes a Hunter to find his father and discovers a world full of danger, friends, and powerful enemies.', 'Action,Adventure,Fantasy', '[{\"name\": \"Gon Freecss\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/11/174517.jpg\", \"voice_actor\": \"Megumi Han\"}, {\"name\": \"Killua Zoldyck\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/2/327920.jpg\", \"voice_actor\": \"Mariya Ise\"}, {\"name\": \"Kurapika\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/3/549312.jpg\", \"voice_actor\": \"Miyuki Sawashiro\"}]'),
('Jujutsu Kaisen', 'films', 'Yuji Itadori, seorang siswa SMA, bergabung dengan organisasi rahasia penyihir Jujutsu untuk mengalahkan Kutukan kuat bernama Ryomen Sukuna, yang menjadi inang dalam tubuhnya.', 'Adventure,Dark fantasy,Supernatural', '[{\"name\": \"Yuji Itadori\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/6/467646.jpg\", \"voice_actor\": \"Junya Enoki\"}, {\"name\": \"Megumi Fushiguro\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/2/392689.jpg\", \"voice_actor\": \"Yuma Uchida\"}, {\"name\": \"Nobara Kugisaki\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/12/422313.jpg\", \"voice_actor\": \"Asami Seto\"}]'),
('Kanojo Okarishimasu', 'tv_series', 'A college student rents a girlfriend after being dumped, leading to a web of romantic and awkward situations.', 'Romance,Comedy,Drama', '[{\"name\": \"Kazuya Kinoshita\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/9/396701.jpg\", \"voice_actor\": \"Shun Horie\"}, {\"name\": \"Chizuru Mizuhara\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/4/484261.jpg\", \"voice_actor\": \"Sora Amamiya\"}, {\"name\": \"Ruka Sarashina\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/11/409385.jpg\", \"voice_actor\": \"Nao Toyama\"}]'),
('Mashle', 'films', 'Mash Burnedead, seorang pemuda tanpa sihir, menggunakan kekuatan ototnya untuk bertahan di sekolah sihir elit.', 'Action,Comedy,Fantasy', '[{\"name\": \"Mash Burnedead\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/12/410288.jpg\", \"voice_actor\": \"Chiaki Kobayashi\"}, {\"name\": \"Lance Crown\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/10/506220.jpg\", \"voice_actor\": \"Reiji Kawashima\"}, {\"name\": \"Dot Barrett\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/15/506221.jpg\", \"voice_actor\": \"Takuya Eguchi\"}]'),
('Mob Psycho 100', 'tv_series', 'Shigeo \"Mob\" Kageyama is a powerful esper who suppresses his emotions to keep his psychic powers in check while trying to live a normal life.', 'Action,Supernatural,Comedy', '[{\"name\": \"Shigeo Kageyama\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/6/343344.jpg\", \"voice_actor\": \"Setsuo Itō\"}, {\"name\": \"Arataka Reigen\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/16/308364.jpg\", \"voice_actor\": \"Takahiro Sakurai\"}, {\"name\": \"Ritsu Kageyama\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/14/306672.jpg\", \"voice_actor\": \"Miyu Irino\"}]'),
('My Hero Academia', 'films', 'In a world where most humans have superpowers, Izuku Midoriya attends U.A. High School to become a Pro Hero.', 'Action,Superhero,School', '[{\"name\": \"Izuku Midoriya\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/7/299404.jpg\", \"voice_actor\": \"Daiki Yamashita\"}, {\"name\": \"Katsuki Bakugo\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/12/299406.jpg\", \"voice_actor\": \"Nobuhiko Okamoto\"}, {\"name\": \"Shoto Todoroki\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/12/332527.jpg\", \"voice_actor\": \"Yuki Kaji\"}]'),
('Naruto: Shippuden', 'films', 'Naruto Uzumaki continues his quest to become Hokage and save his friend Sasuke while facing dangerous foes from Akatsuki.', 'Action,Adventure,Martial Arts', '[{\"name\": \"Naruto Uzumaki\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/12/61330.jpg\", \"voice_actor\": \"Junko Takeuchi\"}, {\"name\": \"Sasuke Uchiha\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/9/131317.jpg\", \"voice_actor\": \"Noriaki Sugiyama\"}, {\"name\": \"Sakura Haruno\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/9/69275.jpg\", \"voice_actor\": \"Chie Nakamura\"}]'),
('Ni no Kuni', 'movies', 'Two friends are transported to a magical world where they must rescue a princess and make a difficult choice.', 'Fantasy,Adventure,Drama', '[{\"name\": \"Yuu\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/16/434447.jpg\", \"voice_actor\": \"Kento Yamazaki\"}, {\"name\": \"Haru\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/15/434448.jpg\", \"voice_actor\": \"Takahiro Sakurai\"}, {\"name\": \"Asha\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/16/434449.jpg\", \"voice_actor\": \"Mei Nagano\"}]'),
('One Piece', 'films', 'Monkey D. Luffy sets sail with his crew to find the legendary One Piece and become the Pirate King.', 'Action,Adventure,Fantasy', '[{\"name\": \"Monkey D. Luffy\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/9/310307.jpg\", \"voice_actor\": \"Mayumi Tanaka\"}, {\"name\": \"Roronoa Zoro\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/3/100534.jpg\", \"voice_actor\": \"Kazuya Nakai\"}, {\"name\": \"Nami\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/2/263249.jpg\", \"voice_actor\": \"Akemi Okamura\"}]'),
('Paprika', 'movies', 'A psychologist uses a dream device to explore the unconscious minds of patients, but it falls into the wrong hands.', 'Sci-Fi,Psychological,Thriller', '[{\"name\": \"Paprika\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/14/177123.jpg\", \"voice_actor\": \"Megumi Hayashibara\"}, {\"name\": \"Dr. Atsuko Chiba\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/9/116777.jpg\", \"voice_actor\": \"Megumi Hayashibara\"}, {\"name\": \"Dr. Kosaku Tokita\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/2/61462.jpg\", \"voice_actor\": \"Toru Furuya\"}]'),
('Solo Leveling', 'films', 'Sung Jin-Woo, seorang hunter lemah, mendapatkan kemampuan misterius untuk naik level setelah selamat dari dungeon ganda.', 'Action,Fantasy,Adventure', '[{\"name\": \"Sung Jin-Woo\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/2/540692.jpg\", \"voice_actor\": \"Taito Ban\"}, {\"name\": \"Cha Hae-In\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/9/536361.jpg\", \"voice_actor\": \"Reina Ueda\"}, {\"name\": \"Go Gun-Hee\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/3/531270.jpg\", \"voice_actor\": \"Daisuke Hirakawa\"}]'),
('Spy x Family', 'films', 'Seorang mata-mata harus membentuk keluarga palsu demi menjalankan misinya. Tanpa ia ketahui, istri dan anak angkatnya juga memiliki rahasia masing-masing.', 'Action,Comedy,Slice of Life', '[{\"name\": \"Loid Forger\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/2/457747.jpg\", \"voice_actor\": \"Takuya Eguchi\"}, {\"name\": \"Yor Forger\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/11/457934.jpg\", \"voice_actor\": \"Saori Hayami\"}, {\"name\": \"Anya Forger\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/4/457933.jpg\", \"voice_actor\": \"Atsumi Tanezaki\"}]'),
('Steins;Gate', 'tv_series', 'A group of friends accidentally discover a method of time travel and find themselves in a dangerous conspiracy.', 'Sci-Fi,Thriller,Psychological', '[{\"name\": \"Rintarou Okabe\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/6/122643.jpg\", \"voice_actor\": \"Mamoru Miyano\"}, {\"name\": \"Kurisu Makise\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/12/492885.jpg\", \"voice_actor\": \"Asami Imai\"}, {\"name\": \"Mayuri Shiina\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/4/131329.jpg\", \"voice_actor\": \"Kana Hanazawa\"}]'),
('Summer Wars', 'movies', 'A math genius is caught in a virtual conflict threatening the real world when a rogue AI disrupts the digital realm.', 'Sci-Fi,Action,Family', '[{\"name\": \"Kenji Koiso\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/8/380824.jpg\", \"voice_actor\": \"Ryunosuke Kamiki\"}, {\"name\": \"Natsuki Shinohara\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/9/82254.jpg\", \"voice_actor\": \"Nanami Sakuraba\"}, {\"name\": \"Kazuma Ikezawa\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/13/82264.jpg\", \"voice_actor\": \"Mitsuki Tanimura\"}]'),
('Sword Art Online', 'films', 'Players of a virtual reality MMORPG must fight to survive after being trapped in the game with no way out.', 'Sci-Fi,Action,Romance', '[{\"name\": \"Kirito\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/7/204821.jpg\", \"voice_actor\": \"Yoshitsugu Matsuoka\"}, {\"name\": \"Asuna\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/15/262053.jpg\", \"voice_actor\": \"Haruka Tomatsu\"}, {\"name\": \"Yui\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/15/264165.jpg\", \"voice_actor\": \"Itou Kanae\"}]'),
('The Girl Who Leapt Through Time', 'movies', 'A high school girl gains the ability to leap through time, but her actions have unforeseen consequences.', 'Sci-Fi,Romance,Drama', '[{\"name\": \"Makoto Konno\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/7/100762.jpg\", \"voice_actor\": \"Riisa Naka\"}, {\"name\": \"Chiaki Mamiya\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/14/457439.jpg\", \"voice_actor\": \"Takuya Ishida\"}, {\"name\": \"Kousuke Tsuda\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/7/205331.jpg\", \"voice_actor\": \"Mitsutaka Itakura\"}]'),
('The Tale of the Princess Kaguya', 'movies', 'A bamboo cutter finds a tiny girl inside a stalk and raises her as a princess with a mysterious celestial origin.', 'Fantasy,Drama,Historical', '[{\"name\": \"Princess Kaguya\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/6/282662.jpg\", \"voice_actor\": \"Aki Asakura\"}, {\"name\": \"Sanuki no Miyatsuko\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/8/276843.jpg\", \"voice_actor\": \"Takeo Chii\"}, {\"name\": \"Ona\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/6/276844.jpg\", \"voice_actor\": \"Nobuko Miyamoto\"}]'),
('Tokyo Revengers', 'films', 'Takemichi Hanagaki, seorang pria dewasa yang menyadari bisa kembali ke masa lalu untuk mencegah kematian mantan pacarnya akibat konflik geng berbahaya.', 'Action,Drama,Supernatural', '[{\"name\": \"Takemichi Hanagaki\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/6/448782.jpg\", \"voice_actor\": \"Yuki Shin\"}, {\"name\": \"Manjiro Sano\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/4/514406.jpg\", \"voice_actor\": \"Yu Hayashi\"}, {\"name\": \"Ken Ryuguji\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/3/388001.jpg\", \"voice_actor\": \"Tatsuhisa Suzuki\"}]'),
('When Marnie Was There', 'movies', 'A lonely girl sent to the countryside befriends a mysterious girl named Marnie, uncovering deep family secrets.', 'Drama,Mystery,Supernatural', '[{\"name\": \"Anna Sasaki\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/14/282926.jpg\", \"voice_actor\": \"Sara Takatsuki\"}, {\"name\": \"Marnie\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/7/282923.jpg\", \"voice_actor\": \"Kasumi Arimura\"}, {\"name\": \"Yoriko Sasaki\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/3/282930.jpg\", \"voice_actor\": \"Nanako Matsushima\"}]'),
('Wolf Children', 'movies', 'A young mother raises her half-wolf children in the countryside after the death of their werewolf father.', 'Drama,Fantasy,Slice of Life', '[{\"name\": \"Hana\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/8/523753.jpg\", \"voice_actor\": \"Aoi Miyazaki\"}, {\"name\": \"Yuki\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/16/523756.jpg\", \"voice_actor\": \"Haru Kuroki\"}, {\"name\": \"Ame\", \"image_url\": \"https://cdn.myanimelist.net/images/characters/15/523754.jpg\", \"voice_actor\": \"Yukito Nishii\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `films`
--

CREATE TABLE `films` (
  `id` int NOT NULL,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `rating` varchar(50) DEFAULT NULL,
  `category` enum('trending','popular','other') DEFAULT 'other'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `films`
--

INSERT INTO `films` (`id`, `judul`, `poster`, `rating`, `category`) VALUES
(6, 'Attack on Titan', 'https://cdn.myanimelist.net/images/anime/10/47347.jpg', '9.1', 'trending'),
(7, 'Jujutsu Kaisen', 'https://cdn.myanimelist.net/images/anime/1171/109222.jpg', '8.6', 'trending'),
(8, 'Chainsaw Man', 'https://cdn.myanimelist.net/images/anime/1806/126216.jpg', '8.3', 'trending'),
(9, 'Tokyo Revengers', 'https://cdn.myanimelist.net/images/anime/1839/122012.jpg', '8.0', 'trending'),
(10, 'Spy x Family', 'https://cdn.myanimelist.net/images/anime/1441/122795.jpg', '8.5', 'trending'),
(11, 'Blue Lock', 'https://cdn.myanimelist.net/images/anime/1258/126929.jpg', '8.4', 'trending'),
(12, 'Solo Leveling', 'https://cdn.myanimelist.net/images/anime/1801/142390.jpg', '8.7', 'trending'),
(13, 'Mashle', 'https://cdn.myanimelist.net/images/anime/1218/135107.jpg', '7.9', 'trending'),
(14, 'Hell’s Paradise', 'https://cdn.myanimelist.net/images/anime/1075/131925.jpg', '8.2', 'trending'),
(15, 'Frieren: Beyond Journey’s End', 'https://cdn.myanimelist.net/images/anime/1015/138006.jpg', '9.0', 'trending'),
(16, 'Naruto: Shippuden', 'https://cdn.myanimelist.net/images/anime/1565/111305.jpg', '8.7', 'popular'),
(17, 'One Piece', 'https://cdn.myanimelist.net/images/anime/1244/138851.jpg', '9.0', 'popular'),
(18, 'Dragon Ball Z', 'https://cdn.myanimelist.net/images/anime/1277/142022.jpg', '8.2', 'popular'),
(19, 'Demon Slayer', 'https://cdn.myanimelist.net/images/anime/1286/99889.jpg', '8.6', 'popular'),
(20, 'My Hero Academia', 'https://cdn.myanimelist.net/images/anime/10/78745.jpg', '8.1', 'popular'),
(21, 'Death Note', 'https://cdn.myanimelist.net/images/anime/1079/138100.jpg', '9.0', 'popular'),
(22, 'Sword Art Online', 'https://cdn.myanimelist.net/images/anime/11/39717.jpg', '7.9', 'popular'),
(23, 'Fullmetal Alchemist: Brotherhood', 'https://cdn.myanimelist.net/images/anime/1208/94745.jpg', '9.1', 'popular'),
(24, 'Black Clover', 'https://cdn.myanimelist.net/images/anime/2/88336.jpg', '8.0', 'popular'),
(25, 'Bleach: Thousand-Year Blood War', 'https://cdn.myanimelist.net/images/anime/1164/138058.jpg', '8.8', 'popular');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int NOT NULL,
  `judul` varchar(255) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `tahun` year DEFAULT NULL,
  `rating` decimal(3,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `judul`, `gambar`, `tahun`, `rating`) VALUES
(11, 'The Girl Who Leapt Through Time', 'https://resizing.flixster.com/ihfyrH-AKCJbrCUSbCiEJsKPJ3A=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzc2MTU0ODhhLTk4MjMtNGM1Mi1hNWFiLWI5ZmI1MmMxMmE4NS5qcGc=', 2006, '8.2'),
(12, '5 Centimeters per Second', 'https://m.media-amazon.com/images/I/61nQilfQknL._AC_UF894,1000_QL80_.jpg', 2007, '7.6'),
(13, 'Paprika', 'https://m.media-amazon.com/images/I/91nM-blCPsL.jpg', 2006, '8.0'),
(14, 'Wolf Children', 'https://i0.wp.com/gkids.com/wp-content/uploads/2025/04/WLFCH_KeyArt_Web_Dated_2025-04-14-min.jpg?fit=1000%2C1463&ssl=1', 2012, '8.5'),
(15, 'Summer Wars', 'https://m.media-amazon.com/images/M/MV5BMTYyOTk3OTQzM15BMl5BanBnXkFtZTcwMjU4NDYyNA@@._V1_.jpg', 2009, '8.2'),
(16, 'The Tale of the Princess Kaguya', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhnb8w2skc4e9yq-4P2TN45hgVJevNU6pSW7b2qYoOmXAs_wvNku0VP_uxQbYVlXrbZdX9j9vkRgHkfXc-eNoIROOw6YqsSjs_ZvO3IRUuGJgITkG1YEc4P42TMSje0MBotwc8PsxWHrko/s1600/kaguya-poster-compressed.jpg', 2013, '8.3'),
(17, 'When Marnie Was There', 'https://resizing.flixster.com/5ljZmB7n__vlOL3hAtwX9kLcm48=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzExZmIxZjFlLTM1YTctNDM5ZS04ZGNlLTc4YjkyYzkxMWFlNC5qcGc=', 2014, '8.1'),
(18, 'Ni no Kuni', 'https://image.api.playstation.com/vulcan/img/cfn/11307DgqlKnt8IuPAjA7qC4MASlP52YxuBBkn09PCIw0M5loyDGjGyHKF8PoxoiRu5mZ-JUbJmRqiwMJ__VBv5lVzZ0tQ1H0.png', 2019, '6.7'),
(19, 'Children Who Chase Lost Voices', 'https://resizing.flixster.com/pLuJqCtm-8qSYFxnsKE-udT9Xb8=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzhlOTIyM2FiLTk0NTAtNDNjZS1iNGFhLThkOGUyZTljNmMwZS5qcGc=', 2011, '7.5');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `image_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`id`, `name`, `image_url`) VALUES
(1, 'Miyazaki, Hayao', 'https://cdn.myanimelist.net/images/voiceactors/1/54606.jpg'),
(2, 'Oda, Eiichiro', 'https://cdn.myanimelist.net/images/voiceactors/2/74096.jpg'),
(3, 'Takahashi, Rie', 'https://cdn.myanimelist.net/images/voiceactors/3/78665.jpg'),
(4, 'Tsuda, Kenjirou', 'https://cdn.myanimelist.net/images/voiceactors/2/63379.jpg'),
(5, 'Kishimoto, Masashi', 'https://cdn.myanimelist.net/images/voiceactors/2/42365.jpg'),
(6, 'Hayami, Saori', 'https://cdn.myanimelist.net/images/voiceactors/1/84514.jpg'),
(7, 'Sawano, Hiroyuki', 'https://cdn.myanimelist.net/images/voiceactors/1/82144.jpg'),
(8, 'Anno, Hideaki', 'https://cdn.myanimelist.net/images/voiceactors/2/54280.jpg'),
(9, 'Kon, Satoshi', 'https://cdn.myanimelist.net/images/voiceactors/3/46672.jpg'),
(10, 'Inoue, Takehiko', 'https://cdn.myanimelist.net/images/voiceactors/1/48570.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `people_details`
--

CREATE TABLE `people_details` (
  `person_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `profile_image_url` varchar(512) DEFAULT NULL,
  `known_for_department` varchar(100) DEFAULT NULL,
  `known_credits_count` int DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `place_of_birth` varchar(255) DEFAULT NULL,
  `biography` text,
  `also_known_as` json DEFAULT NULL,
  `known_for_films` json DEFAULT NULL,
  `film_credits` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `people_details`
--

INSERT INTO `people_details` (`person_id`, `name`, `profile_image_url`, `known_for_department`, `known_credits_count`, `gender`, `birth_date`, `place_of_birth`, `biography`, `also_known_as`, `known_for_films`, `film_credits`) VALUES
(1, 'Miyazaki, Hayao', 'https://cdn.myanimelist.net/images/voiceactors/1/54606.jpg', 'Directing', 50, 'Male', '1941-01-05', 'Bunkyō, Tokyo, Japan', 'Hayao Miyazaki (born January 5, 1941) is a Japanese animator, director, producer, screenwriter, author, and manga artist. A co-founder of Studio Ghibli, he is widely regarded as one of the most accomplished filmmakers in the history of animation. Miyazaki\'s works are characterized by their imaginative storytelling, richly detailed worlds, and themes of environmentalism, pacifism, and feminism.Some of his most notable films include *My Neighbor Totoro* (1988), *Princess Mononoke* (1997), *Spirited Away* (2001), which won the Academy Award for Best Animated Feature, and *Howl\'s Moving Castle* (2004). His films have received critical acclaim and have been commercially successful worldwide.Miyazaki retired multiple times but returned to filmmaking, with his latest project being *The Boy and the Heron* (2023). His influence on animation and storytelling has inspired countless creators and continues to shape the industry.Description above from various sources, including Studio Ghibli and public interviews.', '[\"宮崎 駿\", \"미야자키 하야오\", \"宫崎骏\", \"Хаяо Миядзаки\", \"هياو ميازاكي\", \"Hayao Miyazaki\"]', '[{\"alt\": \"My Neighbor Totoro\", \"title\": \"My Neighbor Totoro\", \"image_url\": \"https://image.tmdb.org/t/p/w200/rtGDOeG9LzoerkDGZF9dnVeLppL.jpg\"}, {\"alt\": \"Spirited Away\", \"title\": \"Spirited Away\", \"image_url\": \"https://image.tmdb.org/t/p/original/fJGWeVHGuLSWbGShaxICAUCzBE5.jpg\"}, {\"alt\": \"Princess Mononoke\", \"title\": \"Princess Mononoke\", \"image_url\": \"https://image.tmdb.org/t/p/w200/pdtzEreKvKAlqa2YEBaGwiA45V8.jpg\"}, {\"alt\": \"Howl\'s Moving Castle\", \"title\": \"Howl\'s Moving Castle\", \"image_url\": \"https://th.bing.com/th/id/OIP.4DHhEX0BYU0JtB_C2j7BMQHaLH?rs=1&pid=ImgDetMain\"}]', '[{\"year\": \"2002\", \"popup_title\": \"Mei to Koneko Bus\", \"popup_image_url\": \"https://cdn.myanimelist.net/images/anime/1034/99602.jpg\", \"credit_role_main\": \"Grandmother Nekobasu\", \"popup_description\": \"One windy day, Mei Kusakabe ventures outside to play despite the turbulent weather. But just as she is about to indulge in her caramel candy, a sudden whirlwind appears and begins to chase her! Retreating back into the house, Mei discovers that her pursuer is a young Nekobasu, and after deciding on a sweet truce, the two quickly become friends. The baby Nekobasu returns that evening and invites Mei to travel with him—marking the start of their exhilarating adventure in and around the bustling forest.\", \"credit_role_secondary\": \"as Supporting\"}, {\"year\": \"2002\", \"popup_title\": \"Mei to Koneko Bus\", \"popup_image_url\": \"https://cdn.myanimelist.net/images/anime/1034/99602.jpg\", \"credit_role_main\": \"Totoro\", \"popup_description\": \"One windy day, Mei Kusakabe ventures outside to play despite the turbulent weather. But just as she is about to indulge in her caramel candy, a sudden whirlwind appears and begins to chase her! Retreating back into the house, Mei discovers that her pursuer is a young Nekobasu, and after deciding on a sweet truce, the two quickly become friends. The baby Nekobasu returns that evening and invites Mei to travel with him—marking the start of their exhilarating adventure in and around the bustling forest.\", \"credit_role_secondary\": \"as Supporting\"}, {\"year\": \"2013\", \"popup_title\": \"The Wind Rises\", \"popup_image_url\": \"https://vistapointe.net/images/the-wind-rises-4.jpg\", \"credit_role_main\": \"Kaze Tachinu\", \"popup_description\": \"Despite his nearsightedness preventing him from becoming a pilot, Jirou Horikoshi pursues his dream of designing airplanes like his hero, Caproni, by studying aeronautical engineering in Tokyo. After saving a maid during the Great Kanto Earthquake of 1923—an event that also connects him to Naoko Satomi—Jirou\'s journey unfolds amid decades of turmoil leading to World War II. As he works on the Mitsubishi A6M Zero fighter, he is forced to confront the moral cost of his creations and the struggles of his personal life, ultimately facing the painful question: what is the true price of chasing a beautiful dream?\", \"credit_role_secondary\": \"The Wind Rises\"}]'),
(2, 'Oda, Eiichiro', 'https://cdn.myanimelist.net/images/voiceactors/2/74096.jpg', 'Writing', 120, 'Male', '1975-01-01', 'Kumamoto, Japan', 'Eiichiro Oda is a Japanese manga artist and the creator of the popular manga series One Piece. First serialized in Weekly Shonen Jump in 1997, One Piece has become one of the best-selling manga series of all time. Known for its intricate storylines, unique characters, and imaginative world-building, Oda has garnered worldwide acclaim. His dedication to storytelling and deep connection with fans has made him a central figure in modern manga culture. The series has inspired anime adaptations, films, and a global fan base, with the story\'s conclusion expected within the next few years.', '[\"尾田 栄一郎\", \"Eiichirō Oda\", \"Oda-sensei\"]', '[{\"alt\": \"One Piece Film: Red\", \"title\": \"One Piece Film: Red\", \"image_url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4b9V9zMfPaQrx3_LYuzDwYIE_QBb92UkwIA&s\"}, {\"alt\": \"One Piece (Anime)\", \"title\": \"One Piece (Anime)\", \"image_url\": \"https://www.gamereactor.asia/media/54/new1piece_4425493b.jpg\"}, {\"alt\": \"One Piece (Manga)\", \"title\": \"One Piece (Manga)\", \"image_url\": \"https://awsimages.detik.net.id/community/media/visual/2024/04/20/top-7-cover-terbaik-manga-one-piece-6.webp?w=1200\"}]', '[{\"year\": \"1997\", \"popup_title\": \"One Piece (Manga)\", \"popup_image_url\": \"https://awsimages.detik.net.id/community/media/visual/2024/04/20/top-7-cover-terbaik-manga-one-piece-6.webp?w=1200\", \"credit_role_main\": \"Author\", \"popup_description\": \"The story follows Monkey D. Luffy, a young man with the ability to stretch like rubber after eating a Devil Fruit. He sets off on a journey to find the One Piece treasure and become the Pirate King.\", \"credit_role_secondary\": \"Illustrator\"}, {\"year\": \"1999\", \"popup_title\": \"One Piece (Anime)\", \"popup_image_url\": \"https://www.gamereactor.asia/media/54/new1piece_4425493b.jpg\", \"credit_role_main\": \"Original Creator\", \"popup_description\": \"Adaptation of the manga into an anime series produced by Toei Animation. Follows the adventures of Luffy and his crew as they search for the One Piece.\", \"credit_role_secondary\": \"Story\"}, {\"year\": \"2022\", \"popup_title\": \"One Piece Film: Red\", \"popup_image_url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4b9V9zMfPaQrx3_LYuzDwYIE_QBb92UkwIA&s\", \"credit_role_main\": \"Original Creator\", \"popup_description\": \"Uta, the most beloved singer in the world, is known for concealing her own identity. For the first time ever, she will reveal herself to the world at a live concert. The venue fills with fans—including pirates, the Navy, and the Straw Hats. But her shocking connection to Shanks sets off a new adventure.\", \"credit_role_secondary\": \"Story and Characters\"}]'),
(3, 'Takahashi, Rie', 'https://cdn.myanimelist.net/images/voiceactors/3/78665.jpg', 'Acting', 80, 'Female', '1994-02-27', 'Saitama, Japan', 'Rie Takahashi is a Japanese voice actress and singer affiliated with 81 Produce. She made her debut in the 2010s and quickly gained popularity for her energetic and emotive voice performances. Rie has voiced many iconic characters in modern anime, and is especially known for voicing Megumin in *KonoSuba*, Emilia in *Re:Zero*, and Takagi in *Teasing Master Takagi-san*. In addition to her voice work, she also performs theme songs and character songs. Takahashi has become one of the most prominent seiyuu of her generation and is well-loved by fans for her talent and charisma.', '[\"高橋 李依\", \"たかはし りえ\", \"Rie Takahashi\"]', '[{\"alt\": \"KonoSuba: God\'s Blessing on This Wonderful World!\", \"title\": \"KonoSuba\", \"image_url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5uJshIBtAIyE0lJ2-gFEsHsVVE5E951cgmg&s\"}, {\"alt\": \"Re:Zero - Starting Life in Another World\", \"title\": \"Re:Zero\", \"image_url\": \"https://m.media-amazon.com/images/M/MV5BNTY1M2NjMTItOGFhNi00NDU3LWExNzQtZGY2YWJlYzExNmU3XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg\"}, {\"alt\": \"Teasing Master Takagi-san\", \"title\": \"Teasing Master Takagi-san\", \"image_url\": \"https://m.media-amazon.com/images/M/MV5BNjliYzA2OWQtNTI3Mi00OTc4LWJlZDktNzhmZTc5YjhiZDEyXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg\"}]', '[{\"year\": \"2016\", \"popup_title\": \"KonoSuba: God\'s Blessing on This Wonderful World!\", \"popup_image_url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5uJshIBtAIyE0lJ2-gFEsHsVVE5E951cgmg&s\", \"credit_role_main\": \"Voice Actress\", \"popup_description\": \"Rie Takahashi voices Megumin, an explosion magic-obsessed archwizard in this fantasy comedy. Her performance became iconic for its eccentricity and catchphrases.\", \"credit_role_secondary\": \"Megumin\"}, {\"year\": \"2016\", \"popup_title\": \"Re:Zero - Starting Life in Another World\", \"popup_image_url\": \"https://m.media-amazon.com/images/M/MV5BNTY1M2NjMTItOGFhNi00NDU3LWExNzQtZGY2YWJlYzExNmU3XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg\", \"credit_role_main\": \"Voice Actress\", \"popup_description\": \"She portrays Emilia, a half-elf girl who becomes the central figure in Subaru\'s journey through an alternate world filled with danger and mystery.\", \"credit_role_secondary\": \"Emilia\"}, {\"year\": \"2018\", \"popup_title\": \"Teasing Master Takagi-san\", \"popup_image_url\": \"https://m.media-amazon.com/images/M/MV5BNjliYzA2OWQtNTI3Mi00OTc4LWJlZDktNzhmZTc5YjhiZDEyXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg\", \"credit_role_main\": \"Voice Actress\", \"popup_description\": \"Takahashi plays the role of Takagi, a witty and calm middle school girl who enjoys playfully teasing her classmate Nishikata. Her voice adds charm to the character’s mischievous yet kind personality.\", \"credit_role_secondary\": \"Takagi\"}]'),
(4, 'Tsuda, Kenjirou', 'https://cdn.myanimelist.net/images/voiceactors/2/63379.jpg', 'Acting', 100, 'Male', '1971-06-11', 'Osaka, Japan', 'Kenjirou Tsuda is a Japanese voice actor, narrator, and actor affiliated with AND STIR Inc. Known for his deep and distinctive voice, Tsuda has played a wide range of characters in anime, films, and video games. He gained widespread recognition for roles such as Seto Kaiba in *Yu-Gi-Oh!*, Nanami Kento in *Jujutsu Kaisen*, and Tatsu in *The Way of the Househusband*. Aside from voice acting, Tsuda has also appeared in live-action productions and is appreciated for his artistic versatility and mature presence.', '[\"津田 健次郎\", \"つだ けんじろう\", \"Kenjiro Tsuda\"]', '[{\"alt\": \"Yu-Gi-Oh!\", \"title\": \"Yu-Gi-Oh!\", \"image_url\": \"https://m.media-amazon.com/images/M/MV5BYzNkNjA1YTctMzU3ZS00ZWY3LWJjNjYtMTgyMmI0YWVkNjU4XkEyXkFqcGc@._V1_.jpg\"}, {\"alt\": \"Jujutsu Kaisen\", \"title\": \"Jujutsu Kaisen\", \"image_url\": \"https://m.media-amazon.com/images/M/MV5BNmI1MmYxNWQtY2E5NC00ZTlmLWIzZGEtNzM1YmE3NDA5NzhjXkEyXkFqcGc@._V1_.jpg\"}, {\"alt\": \"The Way of the Househusband\", \"title\": \"The Way of the Househusband\", \"image_url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTS10ypCZbHGyqvVIIYhgNDpjmspx-JbffHWQ&s\"}]', '[{\"year\": \"2000\", \"popup_title\": \"Yu-Gi-Oh!\", \"popup_image_url\": \"https://m.media-amazon.com/images/M/MV5BYzNkNjA1YTctMzU3ZS00ZWY3LWJjNjYtMTgyMmI0YWVkNjU4XkEyXkFqcGc@._V1_.jpg\", \"credit_role_main\": \"Voice Actor\", \"popup_description\": \"Kenjirou Tsuda voices Seto Kaiba, the charismatic and competitive rival in this iconic card battle anime. His powerful voice added intensity and depth to the role.\", \"credit_role_secondary\": \"Seto Kaiba\"}, {\"year\": \"2020\", \"popup_title\": \"Jujutsu Kaisen\", \"popup_image_url\": \"https://m.media-amazon.com/images/M/MV5BNmI1MmYxNWQtY2E5NC00ZTlmLWIzZGEtNzM1YmE3NDA5NzhjXkEyXkFqcGc@._V1_.jpg\", \"credit_role_main\": \"Voice Actor\", \"popup_description\": \"He portrays Nanami Kento, a calm and calculating jujutsu sorcerer with a strong sense of duty. Tsuda’s delivery gave the character an authoritative edge.\", \"credit_role_secondary\": \"Nanami Kento\"}, {\"year\": \"2021\", \"popup_title\": \"The Way of the Househusband\", \"popup_image_url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTS10ypCZbHGyqvVIIYhgNDpjmspx-JbffHWQ&s\", \"credit_role_main\": \"Voice Actor\", \"popup_description\": \"Tsuda voices Tatsu, a former yakuza boss turned househusband. His deadpan comedic delivery made the character both hilarious and iconic.\", \"credit_role_secondary\": \"Tatsu\"}]'),
(5, 'Kishimoto, Masashi', 'https://cdn.myanimelist.net/images/voiceactors/2/42365.jpg', 'Writing', 25, 'Male', '1974-11-08', 'Okayama, Japan', 'Masashi Kishimoto is a Japanese manga artist, writer, and film director best known for creating the popular manga series *Naruto*. Debuting in *Weekly Shōnen Jump* in 1999, *Naruto* became one of the most successful manga series of all time, spawning a massive franchise including anime, movies, games, and merchandise. Kishimoto’s storytelling and character development have had a significant impact on global pop culture. Following the end of *Naruto*, he also contributed to its sequel series *Boruto: Naruto Next Generations* as a supervisor and later as a writer.', '[\"岸本 斉史\", \"きしもと まさし\", \"Masashi Kishimoto\"]', '[{\"alt\": \"Naruto Manga Volume 1 Cover\", \"title\": \"Naruto\", \"image_url\": \"https://upload.wikimedia.org/wikipedia/en/9/94/NarutoCoverTankobon1.jpg\"}, {\"alt\": \"Naruto Shippuden\", \"title\": \"Naruto Shippuden\", \"image_url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuj3hzwHplx7Lo_v41xOr-YomdHqIWJ2tldg&s\"}, {\"alt\": \"Boruto: Naruto Next Generations\", \"title\": \"Boruto\", \"image_url\": \"https://www.viu.com/ott/id/articles/wp-content/uploads/2022/01/anime-boruto-naruto-next-generations-sub-indo-viu.jpg\"}]', '[{\"year\": \"1999\", \"popup_title\": \"Naruto\", \"popup_image_url\": \"https://upload.wikimedia.org/wikipedia/en/9/94/NarutoCoverTankobon1.jpg\", \"credit_role_main\": \"Manga Artist\", \"popup_description\": \"Masashi Kishimoto created and wrote *Naruto*, which follows the journey of a young ninja determined to become the strongest in his village. The series became a global phenomenon.\", \"credit_role_secondary\": \"Creator / Author\"}, {\"year\": \"2007\", \"popup_title\": \"Naruto Shippuden\", \"popup_image_url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuj3hzwHplx7Lo_v41xOr-YomdHqIWJ2tldg&s\", \"credit_role_main\": \"Original Creator\", \"popup_description\": \"*Naruto Shippuden* is the sequel to the original series, continuing Naruto Uzumaki’s journey into adulthood. Kishimoto continued providing creative oversight and storyline.\", \"credit_role_secondary\": \"Story & Supervision\"}, {\"year\": \"2016\", \"popup_title\": \"Boruto: Naruto Next Generations\", \"popup_image_url\": \"https://www.viu.com/ott/id/articles/wp-content/uploads/2022/01/anime-boruto-naruto-next-generations-sub-indo-viu.jpg\", \"credit_role_main\": \"Writer\", \"popup_description\": \"*Boruto* is the next chapter in the Naruto saga, following the son of Naruto Uzumaki. Initially supervising, Kishimoto later took over writing the manga.\", \"credit_role_secondary\": \"Story Supervisor / Writer\"}]'),
(6, 'Hayami, Saori', 'https://cdn.myanimelist.net/images/voiceactors/1/84514.jpg', 'Acting', 90, 'Female', '1991-05-29', 'Tokyo, Japan', 'Saori Hayami is a renowned Japanese voice actress and singer affiliated with I\'m Enterprise. She began her career in the mid-2000s and is celebrated for her calm, elegant voice and wide emotional range. Hayami has voiced a multitude of beloved characters across various genres, including Yukino Yukinoshita in *My Teen Romantic Comedy SNAFU*, Shinobu Kocho in *Demon Slayer: Kimetsu no Yaiba*, and Yor Forger in *Spy × Family*. In addition to voice acting, she has an active career as a solo singer and often performs character songs. Her graceful presence and consistent performance have made her a fan favorite in the anime industry.', '[\"早見 沙織\", \"はやみ さおり\", \"Saori Hayami\"]', '[{\"alt\": \"My Teen Romantic Comedy SNAFU\", \"title\": \"My Teen Romantic Comedy SNAFU\", \"image_url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIWsDwQeRtxXWrLaL0twezREyusU-Z0D4RDw&s\"}, {\"alt\": \"Demon Slayer: Kimetsu no Yaiba\", \"title\": \"Demon Slayer: Kimetsu no Yaiba\", \"image_url\": \"https://m.media-amazon.com/images/M/MV5BMWU1OGEwNmQtNGM3MS00YTYyLThmYmMtN2FjYzQzNzNmNTE0XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg\"}, {\"alt\": \"Spy × Family\", \"title\": \"Spy × Family\", \"image_url\": \"https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2025/03/21/3013564162.jpg\"}]', '[{\"year\": \"2013\", \"popup_title\": \"My Teen Romantic Comedy SNAFU\", \"popup_image_url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIWsDwQeRtxXWrLaL0twezREyusU-Z0D4RDw&s\", \"credit_role_main\": \"Voice Actress\", \"popup_description\": \"Hayami voices Yukino Yukinoshita, a smart and cool high school girl known for her blunt honesty and intellect. Her performance added depth and nuance to the character.\", \"credit_role_secondary\": \"Yukino Yukinoshita\"}, {\"year\": \"2019\", \"popup_title\": \"Demon Slayer: Kimetsu no Yaiba\", \"popup_image_url\": \"https://m.media-amazon.com/images/M/MV5BMWU1OGEwNmQtNGM3MS00YTYyLThmYmMtN2FjYzQzNzNmNTE0XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg\", \"credit_role_main\": \"Voice Actress\", \"popup_description\": \"Saori Hayami plays Shinobu Kocho, the graceful and mysterious insect pillar. Her voice elegantly matches Shinobu’s calm and eerie demeanor.\", \"credit_role_secondary\": \"Shinobu Kocho\"}, {\"year\": \"2022\", \"popup_title\": \"Spy × Family\", \"popup_image_url\": \"https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2025/03/21/3013564162.jpg\", \"credit_role_main\": \"Voice Actress\", \"popup_description\": \"She voices Yor Forger, a deadly yet kind-hearted assassin who balances family life with secret missions. Hayami\'s voice captures Yor’s strength and innocence perfectly.\", \"credit_role_secondary\": \"Yor Forger\"}]'),
(7, 'Sawano, Hiroyuki', 'https://cdn.myanimelist.net/images/voiceactors/1/82144.jpg', 'Music', 70, 'Male', '1980-09-12', 'Tokyo, Japan', 'Hiroyuki Sawano is a renowned Japanese composer, arranger, and musician best known for his powerful and cinematic musical scores in anime, film, and television. He gained widespread recognition for his work on *Attack on Titan*, where his intense orchestral and vocal compositions became a defining aspect of the series. Sawano is also known for scoring *Kill la Kill*, *Aldnoah.Zero*, and *Mobile Suit Gundam Unicorn*, among others. Under his vocal project \"SawanoHiroyuki[nZk]\", he collaborates with various artists to produce emotionally charged vocal tracks. His signature style blends epic orchestration, electronic elements, and dynamic vocals, making him a standout figure in the world of anime music.', '[\"澤野 弘之\", \"さわの ひろゆき\", \"Hiroyuki Sawano\", \"SawanoHiroyuki[nZk]\"]', '[{\"alt\": \"Attack on Titan\", \"title\": \"Attack on Titan\", \"image_url\": \"https://awsimages.detik.net.id/community/media/visual/2025/01/25/attack-on-titan-the-last-attack.jpeg?w=1200\"}, {\"alt\": \"Kill la Kill\", \"title\": \"Kill la Kill\", \"image_url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcUCvl_8rsOniKaN7JtcOFptHRHP79f4of3g&s\"}, {\"alt\": \"Mobile Suit Gundam Unicorn\", \"title\": \"Mobile Suit Gundam Unicorn\", \"image_url\": \"https://m.media-amazon.com/images/M/MV5BNmQzNDViYzktMDFjYS00Y2ZhLWJhMjctMjlhZmZkZGEwMDFjXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg\"}]', '[{\"year\": \"2013\", \"popup_title\": \"Attack on Titan\", \"popup_image_url\": \"https://awsimages.detik.net.id/community/media/visual/2025/01/25/attack-on-titan-the-last-attack.jpeg?w=1200\", \"credit_role_main\": \"Composer\", \"popup_description\": \"Sawano composed the intense and unforgettable soundtrack for *Attack on Titan*, with iconic tracks like \'Vogel im Käfig\' and \'Call Your Name\' that elevated the anime\'s emotional and dramatic moments.\", \"credit_role_secondary\": \"Soundtrack\"}, {\"year\": \"2013\", \"popup_title\": \"Kill la Kill\", \"popup_image_url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcUCvl_8rsOniKaN7JtcOFptHRHP79f4of3g&s\", \"credit_role_main\": \"Composer\", \"popup_description\": \"His high-energy and genre-blending soundtrack brought life to the action-packed series, with dynamic tracks like \'Before My Body Is Dry\' becoming instant fan favorites.\", \"credit_role_secondary\": \"Soundtrack\"}, {\"year\": \"2010\", \"popup_title\": \"Mobile Suit Gundam Unicorn\", \"popup_image_url\": \"https://m.media-amazon.com/images/M/MV5BNmQzNDViYzktMDFjYS00Y2ZhLWJhMjctMjlhZmZkZGEwMDFjXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg\", \"credit_role_main\": \"Composer\", \"popup_description\": \"Sawano\'s majestic orchestral compositions added a cinematic layer to the *Gundam Unicorn* series, with pieces like \'Unicorn\' and \'RE:I AM\' standing out for their epic scale.\", \"credit_role_secondary\": \"Soundtrack\"}]'),
(8, 'Anno, Hideaki', 'https://cdn.myanimelist.net/images/voiceactors/2/54280.jpg', 'Directing', 60, 'Male', '1960-05-22', 'Ube, Yamaguchi, Japan', 'Hideaki Anno is a Japanese animator, filmmaker, and actor, best known as the creator of the groundbreaking anime *Neon Genesis Evangelion*. A co-founder of Studio Gainax and later founder of Studio Khara, Anno is renowned for his emotionally complex storytelling and experimental direction. Evangelion revolutionized the mecha genre with its psychological depth and deconstruction of anime tropes. Beyond animation, Anno has directed live-action films such as *Shin Godzilla* and *Shin Kamen Rider*, bringing his bold visual style to iconic Japanese franchises. His works are known for introspective characters, apocalyptic themes, and philosophical undertones.', '[\"庵野 秀明\", \"あんの ひであき\", \"Hideaki Anno\"]', '[{\"alt\": \"Neon Genesis Evangelion\", \"title\": \"Neon Genesis Evangelion\", \"image_url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwEk59YrfcCFI1wUGxN53_Qw8n6WDPw-iWFg&s\"}, {\"alt\": \"Shin Godzilla\", \"title\": \"Shin Godzilla\", \"image_url\": \"https://m.media-amazon.com/images/M/MV5BNjg5ODA1NzQtZmNmNy00MmFhLTk1YjUtYTM2NDNmNjY4ODA1XkEyXkFqcGc@._V1_.jpg\"}, {\"alt\": \"Shin Kamen Rider\", \"title\": \"Shin Kamen Rider\", \"image_url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXPkEVBtgHyXvlv1DVqUmZZ2v5umMEI2ac0w&s\"}]', '[{\"year\": \"1995\", \"popup_title\": \"Neon Genesis Evangelion\", \"popup_image_url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwEk59YrfcCFI1wUGxN53_Qw8n6WDPw-iWFg&s\", \"credit_role_main\": \"Director\", \"popup_description\": \"Anno created and directed *Evangelion*, a seminal anime that redefined the mecha genre with its dark psychological themes, innovative storytelling, and iconic characters like Shinji and Rei.\", \"credit_role_secondary\": \"Creator, Screenwriter\"}, {\"year\": \"2016\", \"popup_title\": \"Shin Godzilla\", \"popup_image_url\": \"https://m.media-amazon.com/images/M/MV5BNjg5ODA1NzQtZmNmNy00MmFhLTk1YjUtYTM2NDNmNjY4ODA1XkEyXkFqcGc@._V1_.jpg\", \"credit_role_main\": \"Director\", \"popup_description\": \"Anno co-directed and co-wrote *Shin Godzilla*, a modern reboot of the classic kaiju franchise. The film was praised for its political satire, unique direction, and fresh take on Godzilla.\", \"credit_role_secondary\": \"Co-Writer\"}, {\"year\": \"2023\", \"popup_title\": \"Shin Kamen Rider\", \"popup_image_url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXPkEVBtgHyXvlv1DVqUmZZ2v5umMEI2ac0w&s\", \"credit_role_main\": \"Director\", \"popup_description\": \"As part of his \'Shin\' reimagining projects, Anno directed *Shin Kamen Rider*, paying tribute to the original series while exploring deeper philosophical and humanistic themes.\", \"credit_role_secondary\": \"Writer\"}]'),
(9, 'Kon, Satoshi', 'https://cdn.myanimelist.net/images/voiceactors/3/46672.jpg', 'Directing', 20, 'Male', '1963-10-12', 'Kushiro, Hokkaido, Japan', 'Satoshi Kon was a visionary Japanese director, screenwriter, and animator renowned for his surreal, psychological works that blurred the line between reality and illusion. His debut feature film *Perfect Blue* gained international acclaim for its intense narrative and complex character study. Kon continued to explore the boundaries of identity and perception in *Millennium Actress*, *Tokyo Godfathers*, and *Paprika*. His distinctive editing style, narrative layering, and visual transitions influenced directors worldwide, including Darren Aronofsky and Christopher Nolan. Kon passed away in 2010 at the age of 46, leaving behind a legacy of profound and thought-provoking cinema.', '[\"今 敏\", \"こん さとし\", \"Satoshi Kon\"]', '[{\"alt\": \"Perfect Blue\", \"title\": \"Perfect Blue\", \"image_url\": \"https://m.media-amazon.com/images/S/pv-target-images/268c0ab2c03c157d50abd84b6f8da569de938def8ad0a4a7ab164dc400635cfb.jpg\"}, {\"alt\": \"Paprika\", \"title\": \"Paprika\", \"image_url\": \"https://m.media-amazon.com/images/M/MV5BZGJkYjkyMDUtM2U3ZC00NDM3LWI0MzItZjU5MmYwYjg2YmIwXkEyXkFqcGc@._V1_.jpg\"}, {\"alt\": \"Tokyo Godfathers\", \"title\": \"Tokyo Godfathers\", \"image_url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnudnRZnEfBUlqWQBt2-BWK4nTO0kOmlPyJA&s\"}]', '[{\"year\": \"1997\", \"popup_title\": \"Perfect Blue\", \"popup_image_url\": \"https://m.media-amazon.com/images/S/pv-target-images/268c0ab2c03c157d50abd84b6f8da569de938def8ad0a4a7ab164dc400635cfb.jpg\", \"credit_role_main\": \"Director\", \"popup_description\": \"Kon\'s debut film, a psychological thriller that follows a pop idol\'s descent into madness. The film is known for its chilling suspense and groundbreaking narrative style.\", \"credit_role_secondary\": \"Screenwriter\"}, {\"year\": \"2003\", \"popup_title\": \"Tokyo Godfathers\", \"popup_image_url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnudnRZnEfBUlqWQBt2-BWK4nTO0kOmlPyJA&s\", \"credit_role_main\": \"Director\", \"popup_description\": \"This heartwarming yet dramatic tale follows three homeless individuals who discover an abandoned baby on Christmas Eve. Kon masterfully blends emotion with social commentary.\", \"credit_role_secondary\": \"Screenwriter\"}, {\"year\": \"2006\", \"popup_title\": \"Paprika\", \"popup_image_url\": \"https://m.media-amazon.com/images/M/MV5BZGJkYjkyMDUtM2U3ZC00NDM3LWI0MzItZjU5MmYwYjg2YmIwXkEyXkFqcGc@._V1_.jpg\", \"credit_role_main\": \"Director\", \"popup_description\": \"A visually stunning exploration of dreams and reality, *Paprika* inspired many Western filmmakers. Kon\'s direction makes this film a landmark in animation and sci-fi cinema.\", \"credit_role_secondary\": \"Screenwriter\"}]'),
(10, 'Inoue, Takehiko', 'https://cdn.myanimelist.net/images/voiceactors/1/48570.jpg', 'Directing', 15, 'Male', '1967-01-12', 'Okuchi, Kagoshima, Japan', 'Takehiko Inoue is a renowned Japanese manga artist, illustrator, and film director, best known for his groundbreaking sports manga *Slam Dunk*, which helped popularize basketball in Japan. His works are admired for their detailed art, expressive characters, and philosophical depth. Inoue also created *Vagabond*, an epic manga adaptation of the life of samurai Miyamoto Musashi, and *Real*, which explores wheelchair basketball and human perseverance. In 2022, Inoue made his directorial debut with *The First Slam Dunk*, a cinematic continuation of his iconic basketball saga that was praised for its animation and emotional storytelling.', '[\"井上 雄彦\", \"いのうえ たけひこ\", \"Takehiko Inoue\"]', '[{\"alt\": \"Slam Dunk\", \"title\": \"Slam Dunk\", \"image_url\": \"https://m.media-amazon.com/images/M/MV5BNjIyYjg4YWUtNTM2OS00YTc3LWE5NTEtZTdmMDdiMzE1OGJjXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg\"}, {\"alt\": \"Vagabond\", \"title\": \"Vagabond\", \"image_url\": \"https://images-cdn.ubuy.co.id/65c531703c88906d1e2d3ff8-vagabond-vol-1-manga-in-japanese.jpg\"}, {\"alt\": \"The First Slam Dunk\", \"title\": \"The First Slam Dunk\", \"image_url\": \"https://cinemags.org/wp-content/uploads/2024/07/The-First-Slam-Dunk.png\"}]', '[{\"year\": \"1990\", \"popup_title\": \"Slam Dunk\", \"popup_image_url\": \"https://m.media-amazon.com/images/M/MV5BNjIyYjg4YWUtNTM2OS00YTc3LWE5NTEtZTdmMDdiMzE1OGJjXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg\", \"credit_role_main\": \"Manga Artist\", \"popup_description\": \"Inoue\'s breakthrough basketball manga, *Slam Dunk*, became a cultural phenomenon. It combined thrilling sports action with emotional growth and humor, inspiring a generation.\", \"credit_role_secondary\": \"Writer, Illustrator\"}, {\"year\": \"1998\", \"popup_title\": \"Vagabond\", \"popup_image_url\": \"https://images-cdn.ubuy.co.id/65c531703c88906d1e2d3ff8-vagabond-vol-1-manga-in-japanese.jpg\", \"credit_role_main\": \"Manga Artist\", \"popup_description\": \"A dramatic and philosophical take on the life of Miyamoto Musashi. Inoue\'s art and storytelling in *Vagabond* are widely considered a pinnacle in manga history.\", \"credit_role_secondary\": \"Writer, Illustrator\"}, {\"year\": \"2022\", \"popup_title\": \"The First Slam Dunk\", \"popup_image_url\": \"https://cinemags.org/wp-content/uploads/2024/07/The-First-Slam-Dunk.png\", \"credit_role_main\": \"Director\", \"popup_description\": \"Marking his directorial debut, Inoue brought the spirit of *Slam Dunk* to the big screen with a modern take. The film blends fast-paced animation with deep emotional beats.\", \"credit_role_secondary\": \"Screenwriter\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `tv_series`
--

CREATE TABLE `tv_series` (
  `id` int NOT NULL,
  `judul` varchar(255) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `tahun` year DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tv_series`
--

INSERT INTO `tv_series` (`id`, `judul`, `gambar`, `tahun`, `rating`) VALUES
(13, 'Mob Psycho 100', 'https://www.viu.com/ott/id/articles/wp-content/uploads/2021/04/anime-mob-psycho-100-season-1-sub-indo-viu.jpg', 2023, '9.31'),
(14, 'Clannad: After Story', 'https://m.media-amazon.com/images/I/81R8HeREVwL.jpg', 2009, '9.10'),
(15, 'Steins;Gate', 'https://m.media-amazon.com/images/M/MV5BZjI1YjZiMDUtZTI3MC00YTA5LWIzMmMtZmQ0NTZiYWM4NTYwXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 2011, '9.07'),
(17, 'Gintama°', 'https://m.media-amazon.com/images/M/MV5BNTMzNjE0N2ItNjFiYi00NmIzLTk1MzMtZWFjNThjMzI5MTJlXkEyXkFqcGc@._V1_.jpg', 2015, '9.05'),
(18, 'Hunter x Hunter (2011)', 'https://external-preview.redd.it/Fa9WLQgYV_G31MN9ZTtAAifpvRU1ZqOa9kXtT4Yc9Jk.jpg?auto=webp&s=226dd3fd7acc5a070e32b77b05176095e02ab1f7', 2011, '9.03'),
(19, 'Kanojo Okarishimasu', 'https://m.media-amazon.com/images/M/MV5BNThiMDM2MTktNGMwYi00NTY3LWEyMzQtNDg1NDBlYWIwYTU3XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 2019, '9.05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$S06qYLoLy9.hU/uSndYaw.hrMhT0gxhGS/29nxlGss95KnFj1uVsO');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anime_metadata`
--
ALTER TABLE `anime_metadata`
  ADD PRIMARY KEY (`anime_name`);

--
-- Indexes for table `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `people_details`
--
ALTER TABLE `people_details`
  ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `tv_series`
--
ALTER TABLE `tv_series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `films`
--
ALTER TABLE `films`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `people_details`
--
ALTER TABLE `people_details`
  MODIFY `person_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tv_series`
--
ALTER TABLE `tv_series`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
