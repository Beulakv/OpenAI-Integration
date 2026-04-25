-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2026 at 08:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `ai_logs`
--

CREATE TABLE `ai_logs` (
  `id` int(11) NOT NULL,
  `prompt` text DEFAULT NULL,
  `ai_response` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ai_logs`
--

INSERT INTO `ai_logs` (`id`, `prompt`, `ai_response`, `created_at`) VALUES
(1, 'Following is the description of a scenario. Can you edit this in English properly as a one short para and highlight the points in 3 bullet points -- \"Heavy rainfall has caused significant flooding on the main access road to the warehouse. Logistics teams are rerouting all outbound shipments through the north gate to avoid further delays.\"', 'Heavy rainfall has resulted in substantial flooding on the main access road to the warehouse, prompting logistics teams to reroute all outbound shipments through the north gate to prevent additional delays.\n\n- Significant flooding on the main access road to the warehouse due to heavy rainfall.\n- Logistics teams are implementing rerouting measures.\n- All outbound shipments are now being directed through the north gate to avoid delays.', '2026-04-25 18:35:21');

-- --------------------------------------------------------

--
-- Table structure for table `interview_prompt`
--

CREATE TABLE `interview_prompt` (
  `id` int(11) NOT NULL,
  `prompt_template` longtext NOT NULL,
  `pr_seq` int(11) NOT NULL,
  `pr_status` tinyint(4) NOT NULL DEFAULT 1,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `interview_prompt`
--

INSERT INTO `interview_prompt` (`id`, `prompt_template`, `pr_seq`, `pr_status`, `updated_at`) VALUES
(1, 'Following is the description of a scenario. Can you edit this in English properly as a one short para and highlight the points in 3 bullet points -- {{situation}}', 1, 1, '2026-04-25 18:31:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_role` varchar(50) NOT NULL DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `domain` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_role`, `created_at`, `domain`) VALUES
(1, 'Beula K Varghese', 'beulavarghese2016@gmail.com', '$2y$10$w2j/Ob.OZnM8wWmFLEuYWet1Mt0yaUqJHF8dxQj5GGMNT1K/rhJxe', 'user', '2026-04-25 09:27:01', '\"Heavy rainfall has caused significant flooding on the main access road to the warehouse. Logistics '),
(2, 'admin', 'admin@ad.com', '$2y$10$GTmX8WwwFjzKA7QjdvU2MuS4EgQiZBRvWCMgDt7MuLTi5gK2OQ4eO', 'admin', '2026-04-25 18:10:19', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ai_logs`
--
ALTER TABLE `ai_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interview_prompt`
--
ALTER TABLE `interview_prompt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ai_logs`
--
ALTER TABLE `ai_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `interview_prompt`
--
ALTER TABLE `interview_prompt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
