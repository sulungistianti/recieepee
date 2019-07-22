-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 11, 2019 at 05:19 AM
-- Server version: 5.5.61-38.13-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `viavio7b_recipe_app_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `address` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `username`, `password`, `email`, `address`, `image`) VALUES
(1, 'admin', 'admin', 'viaviwebtech@gmail.com', 'rajkot', 'profile.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `cid` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_image` varchar(255) NOT NULL,
  `category_image_icon` varchar(255) NOT NULL,
  `status` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cid`, `category_name`, `category_image`, `category_image_icon`, `status`) VALUES
(1, 'Appetizer', '42379_78439_Appetizer.jpg', '73609_ic_5.png', 1),
(2, 'Desserts', '49420_64123_dessert-minis.jpg', '80926_ic_9.png', 1),
(3, 'Breakfast', '55456_36373_Breakfast.jpg', '98516_ic_1.png', 1),
(4, 'Healthy', '53537_32058_Healthy.jpg', '13878_ic_8.png', 1),
(5, 'Salad', '12482_14682_salad.jpg', '21414_ic_3.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rating`
--

CREATE TABLE `tbl_rating` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `rate` int(11) NOT NULL,
  `dt_rate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_rating`
--

INSERT INTO `tbl_rating` (`id`, `recipe_id`, `user_id`, `ip`, `rate`, `dt_rate`, `message`) VALUES
(1, 12, 6, '590E2238-87E1-4489-83B1-8B60F0534A34', 4, '2019-04-08 05:16:23', 'Great recipe'),
(2, 17, 6, '8fd4a881a624f7e1', 5, '2019-04-08 10:04:37', 'nice'),
(3, 15, 6, '8fd4a881a624f7e1', 0, '2019-04-08 10:05:17', 'good'),
(4, 9, 6, '8fd4a881a624f7e1', 5, '2019-04-08 10:05:32', 'wow'),
(5, 6, 6, '8fd4a881a624f7e1', 5, '2019-04-08 10:11:20', 'wow good'),
(6, 5, 6, '8fd4a881a624f7e1', 5, '2019-04-08 10:14:01', 'good'),
(7, 4, 6, '8fd4a881a624f7e1', 5, '2019-04-08 10:15:50', 'nice'),
(8, 15, 13, '5ec2124a5e45c744', 5, '2019-04-09 09:30:48', 'good recipe'),
(9, 8, 13, 'b9dbf6657fc2ad07', 5, '2019-04-10 04:24:21', 'good'),
(10, 7, 6, '590E2238-87E1-4489-83B1-8B60F0534A34', 4, '2019-04-10 06:33:19', 'Super recipe');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_recipe`
--

CREATE TABLE `tbl_recipe` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `sub_cat_id` int(255) NOT NULL,
  `recipe_type` varchar(255) NOT NULL,
  `recipe_name` varchar(255) NOT NULL,
  `recipe_time` varchar(255) NOT NULL,
  `recipe_ingredients` text NOT NULL,
  `recipe_direction` text NOT NULL,
  `recipe_image` varchar(255) NOT NULL,
  `video_url` varchar(255) NOT NULL,
  `video_id` varchar(255) NOT NULL,
  `recipe_views` int(11) NOT NULL DEFAULT '0',
  `total_rate` int(11) NOT NULL DEFAULT '0',
  `rate_avg` float(11,1) NOT NULL DEFAULT '0.0',
  `featured_recipe` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_recipe`
--

INSERT INTO `tbl_recipe` (`id`, `cat_id`, `user_id`, `sub_cat_id`, `recipe_type`, `recipe_name`, `recipe_time`, `recipe_ingredients`, `recipe_direction`, `recipe_image`, `video_url`, `video_id`, `recipe_views`, `total_rate`, `rate_avg`, `featured_recipe`, `status`) VALUES
(2, 1, 3, 4, 'image', 'Goat Cheese Trio', '5min', '<p>Cut a 12-ounce log of goat, cheese crosswise into 3 mini logs.</p>\r\n', '<p>Roll 1 piece in chopped mixed herbs, another in cracked mixed peppercorns and the last in chopped dried cranberries and cashews. Serve with baguette slices or crackers.</p>\r\n', '8325_Appetizers-Cannellini-Bruschetta.jpeg', '', '', 197, 2, 5.0, 0, 1),
(3, 1, 0, 4, 'video', 'Spiced Olives', '3min', '<p>Stir in 1 cup mixed olives ,a few thyme sprigs.</p>\r\n', '<p>Heat 1/3 cup olive oil with 1 strip each lemon zest and orange zest, 1/4 teaspoon red pepper flakes and 1 smashed garlic clove. Stir in 1 cup mixed olives and a few thyme sprigs.</p>\r\n', '16491_Appetizers-Radish-Anchovy-Canapes.jpeg', 'https://www.youtube.com/watch?v=5nllGSyao3o', '5nllGSyao3o', 137, 1, 5.0, 0, 1),
(4, 2, 0, 1, 'image', 'Jelly cheesecake slice with pavlova topping', '30min', '<p>250g butternut snap, biscuits 80g butter, melted 8 gelatine leaves 250g cream cheese, softened</p>\r\n', '<ul>\r\n	<li>\r\n	<p>Step 1</p>\r\n\r\n	<p>Grease an 18cm x 28cm (base) slice pan. Line base and sides with baking paper, extending paper 2cm above edges on all sides.</p>\r\n	</li>\r\n	<li>\r\n	<p>Step 2</p>\r\n\r\n	<p>Using a food processor, process biscuits until finely chopped. Add butter. Process until well combined. Press mixture evenly over base of prepared pan. Refrigerate.</p>\r\n	</li>\r\n	<li>\r\n	<p>Step 3</p>\r\n\r\n	<p>Place 3 gelatine leaves in a bowl of water. Set aside for 5 minutes to soften.</p>\r\n	</li>\r\n	<li>\r\n	<p>Step 4</p>\r\n\r\n	<p>Meanwhile, using an electric mixer, beat cream cheese, 1/4 cup sugar and vanilla until light and fluffy. Add yoghurt. Beat until just combined.</p>\r\n	</li>\r\n	<li>\r\n	<p>Step 5</p>\r\n\r\n	<p>Squeeze excess water from gelatine leaves and place in a small saucepan over low heat. Cook for 30 seconds or until melted. Gradually beat hot gelatine mixture into cream cheese mixture. Spoon over prepared base. Level with a spatula. Refrigerate for 1 hour or until set.</p>\r\n	</li>\r\n</ul>\r\n', '60351_jelly-cheesecake-slice-pav-topping.jpg', '', '', 67, 1, 5.0, 1, 1),
(5, 5, 0, 10, 'image', 'Lettuce, Tomato and Cucumber Salad with Basil Dressing', '10 Mins', '<p>2 cups iceberg lettuce leaves , torn into small pieces 1 cup ,roughly chopped tomatoes 1 cup roughly chopped ,cucumber 1/2 cup quartered and blanched mushrooms (khumbh) ,1/2 cup capsicum cubes</p>\r\n', '<ul>\r\n	<li>Combine all the ingredients along with the dressing in a bowl and toss well.</li>\r\n	<li>Serve immediately.</li>\r\n</ul>\r\n', '68344_03recipehealth.jpg', '', '', 37, 1, 5.0, 0, 1),
(6, 4, 0, 9, 'image', 'Lahsuni Palak Chawal', '30 mins', '<p>6 cups spinach (palak), chopped and blanched 2 cups ,Steamed Rice 1 tsp ,cumin seeds (jeera) 1 cup onions, finely chopped 15 garlic cloves, finely chopped 1/2 cup ,finely chopped tomatoes 2 tsp ,ginger-green chilli paste salt to taste 1 tsp oil</p>\r\n', '<ul>\r\n	<li>Blend the blanched spinach in a blender to a thick pur&eacute;e. Keep aside.</li>\r\n	<li>Heat the oil in a non-stick pan, add the cumin seeds.</li>\r\n	<li>When they crackle, add the onions and garlic and saut&eacute; till the onions turn translucent.</li>\r\n	<li>Add the tomatoes and ginger-green chilli paste and saut&eacute; for another 4 to 5 minutes.</li>\r\n	<li>Add the pur&eacute;ed spinach and salt and cook for another 5 to 7 minutes.</li>\r\n	<li>Add the rice and cook for another 2 minutes.</li>\r\n	<li>Serve hot.</li>\r\n</ul>\r\n', '89724_LahsuniPalakChawal.jpg', '', '', 45, 1, 5.0, 1, 1),
(7, 4, 0, 6, 'image', 'Lemon and Coriander Soup', '15 Mins', '<ul>\r\n	<li>1 tbsp lemon juice,</li>\r\n	<li>1/4 cup finely chopped coriander (dhania),</li>\r\n	<li>2 tsp oil,</li>\r\n	<li>2 tsp finely chopped garlic (lehsun),</li>\r\n	<li>2 tsp finely chopped green chillies,</li>\r\n	<li>1/4 cup finely chopped onions,</li>\r\n	<li>1/4 cup finely chopped cabbage,</li>\r\n	<li>1/4 cup finely chopped carrots,</li>\r\n	<li>3 cups basic vegetable stock,</li>\r\n	<li>salt to taste,</li>\r\n	<li>2 tsp cornflour dissolved in 2 tbsp water&nbsp;</li>\r\n</ul>\r\n', '<ol>\r\n	<li>Heat the oil in a deep non-stick pan, add the garlic and green chillies and saut&eacute; on a medium flame for a few seconds.</li>\r\n	<li>Add the onions and saut&eacute; on a medium flame for 1 to 2 minutes.</li>\r\n	<li>Add the cabbage and carrots and saut&eacute; on a medium flame for 1 minute.</li>\r\n	<li>Add the basic vegetable stock, lemon juice, salt and cornflour-water mixture, mix well and cook on a medium flame for 2 to 3 minutes, while stirring occasionally. Add the coriander and mix well.</li>\r\n	<li>Serve immediately.<br />\r\n	&nbsp;</li>\r\n</ol>\r\n', '41107_curried-carrot-soup-vert.jpg', '', '', 90, 4, 4.0, 0, 1),
(8, 2, 0, 2, 'image', 'Eggless Chocolate Cake Using Microwave', '15 mins', '<ol>\r\n	<li>1/2 cup plain flour (maida),</li>\r\n	<li>2 tbsp cocoa powder,</li>\r\n	<li>2 tbsp sour curds (khatta dahi),</li>\r\n	<li>1/4 tsp soda bi-carb,</li>\r\n	<li>1/4 cup melted butter,</li>\r\n	<li>1/3 cup powdered sugar,</li>\r\n	<li>1/2 tsp vanilla essence</li>\r\n</ol>\r\n', '<ol>\r\n	<li>Sieve the flour and cocoa powder. Keep aside.</li>\r\n	<li>Mix together the curds and soda bi-carb in a bowl and keep aside.</li>\r\n	<li>Heat &frac14; cup of water by microwaving on high for 1 minute.</li>\r\n	<li>Combine the butter, sugar and &frac14; cup of hot water in another bowl and whisk well.</li>\r\n	<li>Add the curds, flour, and vanilla essence and mix to make a smooth batter of dropping consistency.</li>\r\n	<li>Put the mixture in a 175 mm. (7&quot;) diameter greased shallow glass dish.</li>\r\n	<li>Microwave on high for 4 minutes.</li>\r\n	<li>Remove from the microwave, cool slightly and unmould.</li>\r\n</ol>\r\n', '88507_eggless-blueberry-microwave.jpg', '', '', 42, 2, 5.0, 0, 1),
(9, 1, 0, 4, 'image', 'Cucumber Raita, Low Calorie Healthy Cooking', '6 mins', '<ol>\r\n	<li>3/4 cup grated cucumber,</li>\r\n	<li>1 1/4 cups fresh low-fat curds (dahi),</li>\r\n	<li>1 tsp green chilli paste,</li>\r\n	<li>salt to taste,</li>\r\n	<li>1 tsp oil,</li>\r\n	<li>1/2 tsp cumin seeds (jeera),</li>\r\n	<li>3 curry leaves (kadi patta)</li>\r\n</ol>\r\n', '<ol>\r\n	<li>Combine the curds, green chilli paste and salt in a deep bowl and mix well using a whisk.</li>\r\n	<li>Add the cucumber, mix well and keep aside.</li>\r\n	<li>Heat the oil in a small non-stick pan, add the cumin seeds and curry leaves and saut&eacute; on a medium flame for 30 seconds.</li>\r\n	<li>Add the tempering to the curds-cucumber mixture and mix well.</li>\r\n	<li>Refrigerate for at least 1 hour and serve chilled.</li>\r\n</ol>\r\n', '80511_cucumber-yoghurt.jpg', '', '', 18, 2, 5.0, 0, 1),
(10, 3, 0, 8, 'video', 'Sooji Idli / Suji Idli', '21 mins', '<ol>\r\n	<li>1 cup semolina (rava),</li>\r\n	<li>1/4 cup curds (dahi),</li>\r\n	<li>1 tbsp finely chopped coriander (dhania),</li>\r\n	<li>salt to taste,</li>\r\n	<li>3/4 tsp fruit salt&nbsp;</li>\r\n</ol>\r\n', '<p>Heat the oil in a small non-stick pan, add the mustard seeds, cumin seeds, urad dal , cashewnuts, curry leaves, green chilies and asafoetida and saut&eacute; on a medium flame for 1 minute.</p>\r\n\r\n<ol>\r\n	<li>Add this tempering to the prepared semolina batter and mix well.</li>\r\n	<li>Just before steaming, add the fruit salt and mix gently.</li>\r\n	<li>Pour 2 tbsp of the batter into each greased idli mould and steam in a steamer for 8 to 10 minutes.</li>\r\n	<li>Cool slightly, demould and serve immediately with sambhar and coconut chutney.</li>\r\n</ol>\r\n', '93124_idli.jpg', 'https://www.youtube.com/watch?v=aWCA2F6SNnM', 'aWCA2F6SNnM', 349, 2, 4.0, 0, 1),
(11, 5, 0, 10, 'video', 'Strawberry and Black Grape Raita by Tarla Dalal', '5 mins', '<ol>\r\n	<li>1/2 cup roughly chopped strawberries,</li>\r\n	<li>1/2 cup black grape halves,</li>\r\n	<li>1 cup chilled low-fat curds (dahi),</li>\r\n	<li>1/2 tsp cumin seeds (jeera) powder,</li>\r\n	<li>1/2 tsp black salt (sanchal),</li>\r\n	<li>salt to taste</li>\r\n</ol>\r\n', '<ol>\r\n	<li>Combine the curds, cumin seeds powder, black salt and little salt in a deep bowl and whisk well.</li>\r\n	<li>Add the strawberries and black grapes and mix well.</li>\r\n	<li>Serve immediately.&nbsp;</li>\r\n</ol>\r\n', '96044_Strawberry-and-Black-Grape-Raita.jpg', 'https://www.youtube.com/watch?v=29_EfDeqD-c', '29_EfDeqD-c', 142, 4, 5.0, 0, 1),
(12, 3, 0, 8, 'image', 'Crispy Chocolate Balls', '25 mins', '<ol>\r\n	<li>3/4 cup crushed marie biscuits,</li>\r\n	<li>1 cup puffed rice (kurmura),</li>\r\n	<li>1/3 cup desiccated coconut,</li>\r\n	<li>250 gms chopped milk chocolate,</li>\r\n	<li>1 tbsp oil,</li>\r\n	<li>3 tbsp pineapple jam,</li>\r\n	<li>1/2 cup coloured chocolate&nbsp;</li>\r\n</ol>\r\n', '<ol>\r\n	<li>Combine the biscuit and puffed rice in a broad non-stick pan and cook on a medium flame for 2 to 3 minutes, while stirring continuously.</li>\r\n	<li>Remove from the flame and put into a mixing bowl and make a depression in the centre. Cool completely.</li>\r\n	<li>Heat a small non stick pan and melt the jam on a slow flame for 1 minute. Cool completely.</li>\r\n	<li>Place the milk chocolate in a bowl and place the bowl on top of a double boiler, taking care to see that the base of the bowl is not in contact with the warm water in the double boiler.</li>\r\n	<li>Cook, while stirring continuously, till the chocolate melts completely and resembles a smooth sauce.</li>\r\n	<li>Remove from the double boiler and keep stirring till it cools but is not set. Add the oil and mix well till smooth.</li>\r\n	<li>Pour this melted chocolate and jam in the depression of the puffed rice-biscuit mixture and mix thoroughly.</li>\r\n	<li>Divide the mixture into 30 equal portions and shape them into round balls.</li>\r\n	<li>Roll each ball in chocolate vermicelli till it is evenly coated from all the sides.</li>\r\n	<li>Place into individual paper cups and keep aside to set for at least an hour at room temperature.</li>\r\n	<li>Serve immediately.</li>\r\n</ol>\r\n\r\n<p><img alt=\"\" src=\"https://uprootkitchen.com/wp-content/uploads/2016/03/Crispy-Chocolate-Peanut-Butter-Balls-uprootkitchen.com_.jpg\" style=\"height:250px; width:400px\" /></p>\r\n', '66549_chocolate-truffles_1a.jpg', '', '', 508, 5, 4.0, 1, 1),
(15, 2, 0, 1, 'image', 'Cucumber Raita, Low Calorie Healthy Cooking', '6 mins', '<p>2 cups iceberg lettuce leaves , torn into small pieces 1 cup roughly chopped ,tomatoes 1 cup roughly chopped cucumber ,1/2 cup quartered and blanched mushrooms (khumbh) ,1/2 cup capsicum cubes</p>\r\n', '<ol>\r\n	<li>Add this tempering to the prepared semolina batter and mix well.</li>\r\n	<li>Just before steaming, add the fruit salt and mix gently.</li>\r\n	<li>Pour 2 tbsp of the batter into each greased idli mould and steam in a steamer for 8 to 10 minutes.</li>\r\n	<li>Cool slightly, demould and serve immediately with sambhar and coconut chutney.</li>\r\n</ol>\r\n', '96163_75595_rayatu.jpg', '', '', 144, 3, 3.0, 0, 1),
(17, 1, 0, 4, 'image', 'Cucumber Raita, Low Calorie Healthy Cooking', '6 mins', '<ol>\r\n	<li>1/2 cup roughly chopped strawberries,</li>\r\n	<li>1/2 cup black grape halves,</li>\r\n	<li>1 cup chilled low-fat curds (dahi),</li>\r\n	<li>1/2 tsp cumin seeds (jeera) powder,</li>\r\n	<li>1/2 tsp black salt (sanchal),</li>\r\n	<li>salt to taste,</li>\r\n	<li>1/2 cup roughly chopped strawberries,</li>\r\n	<li>1/2 cup black grape halves,</li>\r\n	<li>1 cup chilled low-fat curds (dahi),</li>\r\n	<li>1/2 tsp cumin seeds (jeera) powder</li>\r\n</ol>\r\n', '<p>* Combine the curds, green chilli paste and salt in a deep bowl and mix well using a whisk.</p>\r\n\r\n<p>*Add the cucumber, mix well and keep aside.</p>\r\n\r\n<ol>\r\n	<li>Heat the oil in a small non-stick pan, add the cumin seeds and curry leaves and saut&eacute; on a medium flame for 30 seconds.</li>\r\n	<li>Add the tempering to the curds-cucumber mixture and mix well.</li>\r\n	<li>Refrigerate for at least 1 hour and serve chilled.</li>\r\n</ol>\r\n', '11679_14682_salad.jpg', '', '', 294, 7, 5.0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` int(11) NOT NULL,
  `envato_buyer_name` varchar(255) NOT NULL,
  `envato_purchase_code` varchar(255) NOT NULL,
  `envato_purchased_status` int(1) NOT NULL DEFAULT '0',
  `package_name` varchar(255) NOT NULL,
  `ios_bundle_identifier` varchar(255) NOT NULL,
  `onesignal_app_id` varchar(500) NOT NULL,
  `onesignal_rest_key` varchar(500) NOT NULL,
  `from_email` varchar(255) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `app_tagline` varchar(255) NOT NULL,
  `app_logo` varchar(255) NOT NULL,
  `app_email` varchar(255) NOT NULL,
  `app_version` varchar(255) NOT NULL,
  `app_author` varchar(255) NOT NULL,
  `app_contact` varchar(255) NOT NULL,
  `app_website` varchar(255) NOT NULL,
  `app_description` text NOT NULL,
  `app_developed_by` varchar(255) NOT NULL,
  `app_privacy_policy` text NOT NULL,
  `api_all_order_by` varchar(255) NOT NULL,
  `api_latest_limit` int(3) NOT NULL,
  `api_cat_order_by` varchar(255) NOT NULL,
  `api_cat_post_order_by` varchar(255) NOT NULL,
  `publisher_id` varchar(500) NOT NULL,
  `interstital_ad` varchar(500) NOT NULL,
  `interstital_ad_id` varchar(500) NOT NULL,
  `interstital_ad_click` varchar(500) NOT NULL,
  `banner_ad` varchar(500) NOT NULL,
  `banner_ad_id` varchar(500) NOT NULL,
  `publisher_id_ios` varchar(500) NOT NULL,
  `app_id_ios` varchar(500) NOT NULL,
  `interstital_ad_ios` varchar(500) NOT NULL,
  `interstital_ad_id_ios` varchar(500) NOT NULL,
  `interstital_ad_click_ios` varchar(500) NOT NULL,
  `banner_ad_ios` varchar(500) NOT NULL,
  `banner_ad_id_ios` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `envato_buyer_name`, `envato_purchase_code`, `envato_purchased_status`, `package_name`, `ios_bundle_identifier`, `onesignal_app_id`, `onesignal_rest_key`, `from_email`, `app_name`, `app_tagline`, `app_logo`, `app_email`, `app_version`, `app_author`, `app_contact`, `app_website`, `app_description`, `app_developed_by`, `app_privacy_policy`, `api_all_order_by`, `api_latest_limit`, `api_cat_order_by`, `api_cat_post_order_by`, `publisher_id`, `interstital_ad`, `interstital_ad_id`, `interstital_ad_click`, `banner_ad`, `banner_ad_id`, `publisher_id_ios`, `app_id_ios`, `interstital_ad_ios`, `interstital_ad_id_ios`, `interstital_ad_click_ios`, `banner_ad_ios`, `banner_ad_id_ios`) VALUES
(1, '', '', 0, '', '', 'ff1221b6-d79d-50bd-aeb9-36cd6fdc2bd5', 'OGI4NTRkZGEtZjgxNi00OTA1LWI4OWUtYjJmNjQ5MzhiOWM0', 'info@viaviweb.in', 'Recipe App', 'Food with integrity', 'Icon100.png', 'info@viaviweb.in', '1.0.0', 'Viavi Webtech', '+91 922 7777 522', 'www.viaviweb.com', '<p>Your Application reflects an identity of your business and it&#39;s time to mark your identity! Viavi Webtech is by your side in your journy towards becoming a proud business owner. now a days there are plenty of brands available in same categories, Viavi Webtech helps you to be unique from the others.</p>\r\n\r\n<p>We value the trust you put in us to develop your Application, and we safeguard that trust by going beyond what is expected; delivering that little bit extra that makes all the difference. Viavi Webtech team is as creative, diverse and colorful as the country it is based in. Team Viavi Webtech has plenty to offer and we would like to branch out to as many countries as we can.</p>\r\n\r\n<p>Give us a call or just WhatsApp on +919227777522<br />\r\nSend us your requirements via email: info@viaviweb.com</p>\r\n\r\n<p>You can buy our other products via below link:&nbsp;</p>\r\n\r\n<p><a href=\"https://codecanyon.net/user/viaviwebtech/portfolio\">https://codecanyon.net/user/viaviwebtech/portfolio</a></p>\r\n', 'Viavi Webtech', '<p><strong>We are committed to protecting your privacy</strong></p>\n\n<p>We collect the minimum amount of information about you that is commensurate with providing you with a satisfactory service. This policy indicates the type of processes that may result in data being collected about you. Your use of this website gives us the right to collect that information.&nbsp;</p>\n\n<p><strong>Information Collected</strong></p>\n\n<p>We may collect any or all of the information that you give us depending on the type of transaction you enter into, including your name, address, telephone number, and email address, together with data about your use of the website. Other information that may be needed from time to time to process a request may also be collected as indicated on the website.</p>\n\n<p><strong>Information Use</strong></p>\n\n<p>We use the information collected primarily to process the task for which you visited the website. Data collected in the UK is held in accordance with the Data Protection Act. All reasonable precautions are taken to prevent unauthorised access to this information. This safeguard may require you to provide additional forms of identity should you wish to obtain information about your account details.</p>\n\n<p><strong>Cookies</strong></p>\n\n<p>Your Internet browser has the in-built facility for storing small files - &quot;cookies&quot; - that hold information which allows a website to recognise your account. Our website takes advantage of this facility to enhance your experience. You have the ability to prevent your computer from accepting cookies but, if you do, certain functionality on the website may be impaired.</p>\n\n<p><strong>Disclosing Information</strong></p>\n\n<p>We do not disclose any personal information obtained about you from this website to third parties unless you permit us to do so by ticking the relevant boxes in registration or competition forms. We may also use the information to keep in contact with you and inform you of developments associated with us. You will be given the opportunity to remove yourself from any mailing list or similar device. If at any time in the future we should wish to disclose information collected on this website to any third party, it would only be with your knowledge and consent.&nbsp;</p>\n\n<p>We may from time to time provide information of a general nature to third parties - for example, the number of individuals visiting our website or completing a registration form, but we will not use any information that could identify those individuals.&nbsp;</p>\n\n<p>In addition Dummy may work with third parties for the purpose of delivering targeted behavioural advertising to the Dummy website. Through the use of cookies, anonymous information about your use of our websites and other websites will be used to provide more relevant adverts about goods and services of interest to you. For more information on online behavioural advertising and about how to turn this feature off, please visit youronlinechoices.com/opt-out.</p>\n\n<p><strong>Changes to this Policy</strong></p>\n\n<p>Any changes to our Privacy Policy will be placed here and will supersede this version of our policy. We will take reasonable steps to draw your attention to any changes in our policy. However, to be on the safe side, we suggest that you read this document each time you use the website to ensure that it still meets with your approval.</p>\n\n<p><strong>Contacting Us</strong></p>\n\n<p>If you have any questions about our Privacy Policy, or if you want to know what information we have collected about you, please email us at hd@dummy.com. You can also correct any factual errors in that information or require us to remove your details form any list under our control.</p>\n', 'ASC', 15, 'category_name', 'DESC', 'pub-8356404931736973', 'true', 'ca-app-pub-3940256099942544/1033173712', '5', 'true', 'ca-app-pub-3940256099942544/6300978111', 'pub-8356404931736973', 'ca-app-pub-8356404931736973~5938963872', 'true', 'ca-app-pub-3940256099942544/1033173712', '5', 'true', 'ca-app-pub-3940256099942544/6300978111');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sub_category`
--

CREATE TABLE `tbl_sub_category` (
  `sid` int(10) NOT NULL,
  `cat_id` int(255) NOT NULL,
  `sub_cat_name` varchar(255) NOT NULL,
  `sub_cat_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sub_category`
--

INSERT INTO `tbl_sub_category` (`sid`, `cat_id`, `sub_cat_name`, `sub_cat_image`) VALUES
(1, 2, 'Pasta', '17881_img_5.jpg'),
(2, 2, 'Pastirs', '45895_img_3.jpg'),
(4, 1, 'Salad', '89871_img_2.jpg'),
(6, 4, 'Fruits', '37684_img_4.jpg'),
(8, 3, 'Meats', '56554_img_1.jpg'),
(9, 4, 'Bread', '9596_img_5.jpg'),
(10, 5, 'Salad types', '34379_14682_salad.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `name`, `email`, `password`, `phone`, `status`) VALUES
(6, 'Viavi Webtech', 'user.viaviweb@gmail.com', '123456', '9227777522', 1),
(13, 'demoapp', 'demoapp@gmail.com', 'demoapp', '1234567890', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_recipe`
--
ALTER TABLE `tbl_recipe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sub_category`
--
ALTER TABLE `tbl_sub_category`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_recipe`
--
ALTER TABLE `tbl_recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_sub_category`
--
ALTER TABLE `tbl_sub_category`
  MODIFY `sid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
