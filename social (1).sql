-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 03, 2019 at 02:11 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_body` text NOT NULL,
  `posted_by` varchar(60) NOT NULL,
  `posted_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `removed` varchar(3) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_body`, `posted_by`, `posted_to`, `date_added`, `removed`, `post_id`) VALUES
(1, 'Hello! ', 'nyatoday_official', 'nyatoday_official', '2019-04-03 00:41:06', 'no', 1);

-- --------------------------------------------------------

--
-- Table structure for table `friend_requests`
--

CREATE TABLE `friend_requests` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `date` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `link` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `added_by` varchar(60) NOT NULL,
  `user_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `deleted` varchar(3) NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `likes` int(11) NOT NULL,
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `body`, `added_by`, `user_to`, `date_added`, `deleted`, `user_closed`, `likes`, `image`) VALUES
(1, 'Hey! Welcome to NYAToday\'s new network. NYAToday Social is meant to further engage, excite, and empower youth to raise their voices. We\'ve got several cool features for you to try out during our first iteration:<br /> <br /> â Connect with people across the world by searching for them in the search bar. â Then request to follow them and connect further!<br /> â Upload gifs, images, pngs, and Youtube videos. <br /> â Post your thoughts on important social issues whenever you want and reach people across the world! <br /> â Check out what\'s trending in the What\'s Poppin\' search bar. <br /> â Have one-on-one conversations with our \"Messages\" feature.<br /> â Change up your profile! Make it your own. <br /> â Comment on other people\'s posts and like them! <br /> <br /> Now that we\'ve gone through some basic features, let\'s check out what\'s to come: <br /> <br /> âœ© A feature that allows your posts to ONLY be seen by your friends. <br /> âœ© An editing feature and enhanced post editing features, like changing fonts, adding in lists, and more. <br /> âœ© Engaging others with Hashtag and Tagging features.<br /> âœ© Interacting with followers with awesome functions like our Split widget (which offers enhanced debate tools), our Marketplace widget (if you\'re a youth entrepreneur or specifically selling products to youth, get your start here with our Business tools). <br /> âœ© Workplace tools for creating communities specifically for your workplace. ', 'nyatoday_official', 'none', '2019-04-03 00:39:43', 'no', 'no', 0, 'assets/images/posts/5ca3f2bf0ef96giphy-1.gif'),
(2, 'Hey! This is a post.', 'nyatoday_official', 'none', '2019-04-03 00:54:23', 'yes', 'no', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `trends`
--

CREATE TABLE `trends` (
  `title` varchar(50) NOT NULL,
  `hits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trends`
--

INSERT INTO `trends` (`title`, `hits`) VALUES
('Welcome', 1),
('NYATodays', 1),
('Network', 1),
('NYAToday', 1),
('Social', 2),
('Meant', 1),
('Engage', 1),
('Excite', 1),
('Empower', 1),
('Youth', 3),
('Raise', 1),
('Voices', 1),
('Weve', 2),
('Cool', 1),
('Features', 3),
('Try', 1),
('Iterationbr', 1),
('Connect', 2),
('People', 2),
('World', 2),
('Searching', 1),
('Search', 2),
('Bar', 2),
('Request', 1),
('Follow', 1),
('Furtherbr', 1),
('Upload', 1),
('Gifs', 1),
('Images', 1),
('Pngs', 1),
('Youtube', 1),
('Videos', 1),
('Post', 3),
('Issues', 1),
('Whenever', 1),
('Reach', 1),
('Check', 2),
('Trending', 1),
('Poppin', 1),
('Oneonone', 1),
('Conversations', 1),
('Messages', 1),
('Featurebr', 1),
('Change', 1),
('Profile', 1),
('Own', 1),
('Comment', 1),
('Peoples', 1),
('Posts', 2),
('Gone', 1),
('Basic', 1),
('Feature', 2),
('Allows', 1),
('Seen', 1),
('Friends', 1),
('Editing', 2),
('Enhanced', 2),
('Changing', 1),
('Fonts', 1),
('Adding', 1),
('Lists', 1),
('Engaging', 1),
('Hashtag', 1),
('Tagging', 1),
('Featuresbr', 1),
('Interacting', 1),
('Followers', 1),
('Awesome', 1),
('Functions', 1),
('Split', 1),
('Widget', 2),
('Offers', 1),
('Debate', 1),
('Tools', 3),
('Marketplace', 1),
('Youre', 1),
('Entrepreneur', 1),
('Specifically', 2),
('Selling', 1),
('Products', 1),
('Start', 1),
('Business', 1),
('Workplace', 2),
('Creating', 1),
('Communities', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `signup_date` date NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `num_posts` int(11) NOT NULL,
  `num_likes` int(11) NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `friend_array` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `signup_date`, `profile_pic`, `num_posts`, `num_likes`, `user_closed`, `friend_array`) VALUES
(15, 'Jesse', 'Anderson', 'jesse_anderson', 'Myemail@gmail.com', '70510715ea94eeccb491d36f6aabec4a', '2019-04-01', 'assets/images/profile_pics/defaults/giphy-4.gif', 44, 1, 'no', ',nyatoday_official,nyatoday_official,my_test,'),
(16, 'Nyatoday', 'Official', 'nyatoday_official', 'Janderson@nyatoday.com', '70510715ea94eeccb491d36f6aabec4a', '2019-04-01', 'assets/images/profile_pics/nyatoday_official6177e8f4bb721eb55948d5c2119833f8n.jpeg', 6, 3, 'no', ',jesse_anderson,jesse_anderson,'),
(17, 'My', 'Test', 'my_test', 'Mytestaccount@gmail.com', '70510715ea94eeccb491d36f6aabec4a', '2019-04-02', 'assets/images/profile_pics/defaults/giphy-1.gif', 2, 1, 'no', ',jesse_anderson,');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `friend_requests`
--
ALTER TABLE `friend_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
