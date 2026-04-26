-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2026 at 05:42 PM
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
(1, 'Following is the description of a scenario. Can you edit this in English properly as a one short para and highlight the points in 3 bullet points -- \"Heavy rainfall has caused significant flooding on the main access road to the warehouse. Logistics teams are rerouting all outbound shipments through the north gate to avoid further delays.\"', 'Heavy rainfall has resulted in substantial flooding on the main access road to the warehouse, prompting logistics teams to reroute all outbound shipments through the north gate to prevent additional delays.\n\n- Significant flooding on the main access road to the warehouse due to heavy rainfall.\n- Logistics teams are implementing rerouting measures.\n- All outbound shipments are now being directed through the north gate to avoid delays.', '2026-04-25 18:35:21'),
(2, 'Following is the description of a scenario. Can you edit this in English properly as a one short para and highlight the points in 3 bullet points -- \"A short English description used to define the operational context and immediate goals for the AI model. It bridges the gap between a generic prompt and a specific real-world scenario.\"', 'Depending on the tone you need, here are three ways to edit this.\n\n### Option 1: Professional & Polished (Best for documentation)\nThis is a concise English description used to define the operational context and immediate objectives for an AI model. It serves as a critical link, bridging the gap between a generic prompt and a specific, real-world application.\n\n*   **Defines Context:** Establishes the operational environment for the AI.\n*   **Sets Goals:** Outlines the immediate objectives to be achieved.\n*   **Bridges Gaps:** Translates general prompts into specific real-world scenarios.\n\n### Option 2: Concise & Direct (Best for a presentation or slide)\nThis description defines the operational context and immediate goals for an AI model, bridging the gap between a generic prompt and a specific real-world scenario.\n\n*   **Operational Context:** Sets the stage for the AI\'s behavior.\n*   **Immediate Goals:** Defines exactly what the model needs to accomplish.\n*   **Practical Application:** Connects abstract prompts to real-world use cases.\n\n### Option 3: Sophisticated (Best for a whitepaper or proposal)\nActing as a strategic bridge between generic prompting and real-world execution, this description establishes the precise operational context and immediate goals required for the AI model to function effectively.\n\n*   **Contextual Framework:** Provides the necessary background for accurate AI output.\n*   **Goal Orientation:** Aligns the model with specific, actionable targets.\n*   **Scenario Integration:** Transforms general instructions into situational reality.', '2026-04-26 14:55:17'),
(3, 'Following is the description of a scenario. Can you edit this in English properly as a one short para and highlight the points in 3 bullet points -- \"Heavy rain flooded the streets, making it difficult for people to reach home\"', 'Here are a few ways to edit this, depending on the tone you want to achieve.\n\n### Option 1: Descriptive & Narrative (Best for storytelling)\nTorrential rains caused widespread flooding across the streets, creating significant obstacles for commuters attempting to return home. The rising waters turned ordinary roads into impassable routes, leaving many stranded.\n\n*   **Heavy rainfall** led to severe street flooding.\n*   **Commuter movement** was significantly hindered.\n*   **Travel difficulty** made reaching destinations nearly impossible.\n\n### Option 2: Formal & Concise (Best for a report or news update)\nHeavy rainfall resulted in flooded streets, causing major disruptions to local transportation and making it difficult for residents to commute home.\n\n*   **Inclement weather:** Intense rain caused flooding.\n*   **Infrastructure impact:** Streets became submerged.\n*   **Commuter impact:** Travel to residential areas was obstructed.\n\n### Option 3: Simple & Direct (Best for general communication)\nThe streets flooded due to heavy rain, making it very hard for people to get home safely.\n\n*   **Heavy rain** caused flooding.\n*   **Flooded streets** blocked the way.\n*   **Commuters** struggled to reach their homes.', '2026-04-26 15:28:18'),
(4, 'Following is the description of a scenario. Can you edit this in English properly as a one short para and highlight the points in 3 bullet points – \"Heavy rain flooded the streets, making it difficult for people to reach home\", No need options only give final result', 'Here’s a revised paragraph incorporating the original points, followed by the bullet points:\n\nHeavy rainfall caused widespread flooding throughout the city, inundating streets and severely hindering residents’ ability to safely reach their homes. The persistent downpour transformed roadways into impassable rivers, creating significant challenges for commuters and pedestrians alike.\n\nHere’s a breakdown of the key points:\n\n*   **Severe Flooding:** Heavy rain resulted in widespread street flooding.\n*   **Accessibility Issues:** The flooding made it difficult for people to travel home.\n*   **Significant Disruption:** The conditions presented considerable challenges for residents.', '2026-04-26 15:30:20'),
(5, 'Following is the description of a scenario. Can you edit this in English properly as a one short para and highlight the points in 3 bullet points – \"Heavy rain flooded the streets, making it difficult for people to reach home\", No need options and explanations before or after data, only give final result', 'Heavy rain flooded the streets, making it difficult for people to reach home.  \n- Streets were inundated with water, disrupting daily travel.  \n- Residents faced challenges in accessing their homes due to the flooding.  \n- The situation highlighted the need for better drainage systems.', '2026-04-26 15:31:11'),
(6, 'Following is the description of a scenario. Can you edit this in English properly as a one short para and highlight the points in 3 bullet points – \"The Phase II rollout is currently delayed by two weeks due to a primary vendor supply shortage. This delay threatens our Q3 launch deadline and requires an immediate adjustment to the marketing timeline.\", No need options and explanations before or after data, only give final result', '**Paragraph:**\nThe Phase II rollout is currently delayed by two weeks due to a primary vendor supply shortage, which threatens our Q3 launch deadline and requires an immediate adjustment to the marketing timeline.\n\n**Key Points:**\n\n- Phase II rollout delayed by two weeks\n- Cause: primary vendor supply shortage\n- Impact: threatens Q3 launch deadline; requires immediate marketing timeline adjustment', '2026-04-26 15:32:07'),
(7, 'Following is the description of a scenario. Can you edit this in English properly as a one short para and highlight the points in 3 bullet points – \"The Phase II rollout is currently delayed by two weeks due to a primary vendor supply shortage. This delay threatens our Q3 launch deadline and requires an immediate adjustment to the marketing timeline.\", No need options and explanations before or after data, only give final result', 'The Phase II rollout is experiencing a two-week delay due to a shortage of supplies from our primary vendor, which puts our planned Q3 launch at risk and necessitates an immediate revision of the marketing timeline.\n\n*   **Rollout Delay:** Phase II is delayed by two weeks.\n*   **Cause:** A shortage of supplies from the primary vendor.\n*   **Impact:** Threatens the Q3 launch and requires marketing timeline adjustments.\n\n\n\n', '2026-04-26 15:35:04');

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
(1, 'Following is the description of a scenario. Can you edit this in English properly as a one short para and highlight the points in 3 bullet points – {{situation}}, No need options and explanations before or after data, only give final result', 1, 1, '2026-04-26 15:31:06');

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
(2, 'admin', 'admin@ad.com', '$2y$10$GTmX8WwwFjzKA7QjdvU2MuS4EgQiZBRvWCMgDt7MuLTi5gK2OQ4eO', 'admin', '2026-04-25 18:10:19', NULL),
(3, 'Joshy George', 'george@gmail.com', '$2y$10$yBCGx9cdZI.O/qCrbRMUWurzsrP4O98Ad186tybh8a4uciPc4Htcy', 'user', '2026-04-26 14:44:52', '\"The Phase II rollout is currently delayed by two weeks due to a primary vendor supply shortage. Thi');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `interview_prompt`
--
ALTER TABLE `interview_prompt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
