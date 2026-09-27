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
('Monstera Deliciosa', 'Monstera deliciosa', 'Ornamental', 'Famous for its split leaves. Thrives in bright, indirect sunlight.', 'Mild (Pets)', 'https://images.pexels.com/photos/3097770/pexels-photo-3097770.jpeg?auto=compress&cs=tinysrgb&w=800'),
('Snake Plant', 'Dracaena trifasciata', 'Ornamental', 'Hardy indoor plant that naturally purifies house air toxins.', 'Mildly Toxic', 'https://images.pexels.com/photos/2123482/pexels-photo-2123482.jpeg?auto=compress&cs=tinysrgb&w=800'),
('Peace Lily', 'Spathiphyllum', 'Ornamental', 'Features elegant white flowers and prefers shaded indoor spots.', 'Toxic to Pets', 'https://images.pexels.com/photos/4505171/pexels-photo-4505171.jpeg?auto=compress&cs=tinysrgb&w=800'),
('Aloe Vera', 'Aloe barbadensis', 'Medicinal', 'Popular medicinal succulent with soothing gel in fleshy leaves.', 'Mild (Pets)', 'https://images.pexels.com/photos/1687341/pexels-photo-1687341.jpeg?auto=compress&cs=tinysrgb&w=800'),
('Fiddle Leaf Fig', 'Ficus lyrata', 'Ornamental', 'Stunning indoor tree with large, broad green leaves.', 'Mildly Toxic', 'https://images.pexels.com/photos/7084310/pexels-photo-7084310.jpeg?auto=compress&cs=tinysrgb&w=800'),
('Lavender', 'Lavandula', 'Medicinal', 'Aromatic herb known for its calming scent and stress-relieving properties.', 'None', 'https://images.pexels.com/photos/207518/pexels-photo-207518.jpeg?auto=compress&cs=tinysrgb&w=800'),
('Sweet Basil', 'Ocimum basilicum', 'Edible', 'A flavorful culinary herb widely used in cooking and pesto.', 'None', 'https://images.pexels.com/photos/1087902/pexels-photo-1087902.jpeg?auto=compress&cs=tinysrgb&w=800'),
('Oleander', 'Nerium oleander', 'Toxic', 'Highly toxic. Ingesting any part of this ornamental shrub can be fatal.', 'High Toxicity', 'https://images.pexels.com/photos/6208087/pexels-photo-6208087.jpeg?auto=compress&cs=tinysrgb&w=800'),
('Moth Orchid', 'Phalaenopsis', 'Ornamental', 'A beautiful, long-blooming flower highly prized for indoor decoration.', 'None', 'https://images.pexels.com/photos/1407305/pexels-photo-1407305.jpeg?auto=compress&cs=tinysrgb&w=800'),
('Teak Tree', 'Tectona grandis', 'Commercial', 'A large tropical hardwood species harvested for commercial timber and durable construction.', 'None', 'https://images.unsplash.com/photo-1542273917363-3b1817f69a2d?q=80&w=800'),
('Tomato', 'Solanum lycopersicum', 'Edible', 'A widely cultivated edible fruit. Note that the leaves and stems are slightly toxic.', 'None (Fruit)', 'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?q=80&w=800'),
('Deadly Nightshade', 'Atropa belladonna', 'Toxic', 'A highly poisonous plant. The foliage and berries are extremely toxic, containing tropane alkaloids.', 'Extreme', 'https://images.unsplash.com/photo-1620063231433-2a445d43fbcd?q=80&w=800'),
('Strawberry', 'Fragaria × ananassa', 'Edible', 'A sweet, widely grown hybrid species cultivated worldwide for its fruit.', 'None', 'https://images.unsplash.com/photo-1519999482648-25049ddd37b1?q=80&w=800'),
('Sunflower', 'Helianthus annuus', 'Commercial', 'Grown commercially for cooking oil and seeds, as well as aesthetic landscaping.', 'None', 'https://images.unsplash.com/photo-1597848212624-a19eb35e2651?q=80&w=800'),
('Chamomile', 'Matricaria chamomilla', 'Medicinal', 'A gentle herb commonly used to make herbal infusions for sleep and relaxation.', 'None', 'https://images.unsplash.com/photo-1608198093002-ad4e005484ec?q=80&w=800');
