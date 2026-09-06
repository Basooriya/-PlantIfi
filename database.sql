-- Database setup for PlantIfi

CREATE DATABASE IF NOT EXISTS `plantifi`;
USE `plantifi`;

-- Users Table
CREATE TABLE IF NOT EXISTS `users` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(50) NOT NULL UNIQUE,
    `email` VARCHAR(100) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Contact Messages Table
CREATE TABLE IF NOT EXISTS `messages` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `message` TEXT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Plants (Theme-Specific Table)
CREATE TABLE IF NOT EXISTS `plants` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `common_name` VARCHAR(100) NOT NULL,
    `scientific_name` VARCHAR(100) NOT NULL,
    `category` ENUM('Edible', 'Toxic', 'Medicinal', 'Commercial', 'Ornamental') NOT NULL,
    `description` TEXT,
    `image_url` VARCHAR(255) DEFAULT NULL,
    `toxicity_level` VARCHAR(50) DEFAULT 'None'
);

-- Insert sample plant data
INSERT IGNORE INTO `plants` (`common_name`, `scientific_name`, `category`, `description`, `toxicity_level`, `image_url`) VALUES
('Oleander', 'Nerium oleander', 'Toxic', 'An ornamental shrub. All parts of this plant contain cardiac glycosides and are severely toxic to humans and pets.', 'High Toxicity', 'https://images.unsplash.com/photo-1598880940080-ff9a29891b85?q=80&w=800'),
('Teak Tree', 'Tectona grandis', 'Commercial', 'A large tropical hardwood species harvested for commercial timber and durable construction.', 'None', 'https://images.unsplash.com/photo-1542273917363-3b1817f69a2d?q=80&w=800'),
('Aloe Vera', 'Aloe barbadensis', 'Medicinal', 'A succulent plant species often used in herbal medicine for soothing burns and skin conditions.', 'Mild (Pets)', 'https://images.unsplash.com/photo-1596547609652-9fc5d8d428ae?q=80&w=800'),
('Tomato', 'Solanum lycopersicum', 'Edible', 'A widely cultivated edible fruit. Note that the leaves and stems are slightly toxic.', 'None (Fruit)', 'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?q=80&w=800'),
('Snake Plant', 'Dracaena trifasciata', 'Ornamental', 'A popular indoor plant known for improving indoor air quality. Very low maintenance.', 'Mildly Toxic', 'https://images.unsplash.com/photo-1599427303058-f04cbf592288?q=80&w=800'),
('Deadly Nightshade', 'Atropa belladonna', 'Toxic', 'A highly poisonous plant. The foliage and berries are extremely toxic, containing tropane alkaloids.', 'Extreme', 'https://images.unsplash.com/photo-1620063231433-2a445d43fbcd?q=80&w=800');
