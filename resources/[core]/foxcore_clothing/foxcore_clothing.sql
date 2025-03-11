-- 🏠 Create Wardrobe Table (Linked to Housing)
CREATE TABLE IF NOT EXISTS `foxcore_wardrobes` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL,
    `house_id` VARCHAR(50) NOT NULL,  -- Links to FoxCore Housing
    `outfit_name` VARCHAR(100) NOT NULL,
    `clothing_data` JSON NOT NULL,
    `saved_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`identifier`) REFERENCES `foxcore_users`(`identifier`) ON DELETE CASCADE
);

-- 👕 Create Clothing Table (For Shop Purchases)
CREATE TABLE IF NOT EXISTS `foxcore_clothing` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL,
    `clothing_data` JSON NOT NULL,
    `last_updated` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`identifier`) REFERENCES `foxcore_users`(`identifier`) ON DELETE CASCADE
);

-- 🎭 Create Tattoos & Piercings Table
CREATE TABLE IF NOT EXISTS `foxcore_tattoos` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL,
    `tattoo_data` JSON NOT NULL,
    `piercing_data` JSON NOT NULL,
    `last_updated` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`identifier`) REFERENCES `foxcore_users`(`identifier`) ON DELETE CASCADE
);

-- 🔄 Sync Existing QBCore Player Data into FoxCore Clothing System
INSERT INTO `foxcore_clothing` (`identifier`, `clothing_data`)
SELECT 
    `citizenid`, 
    JSON_EXTRACT(`metadata`, '$.clothing') 
FROM `players`
ON DUPLICATE KEY UPDATE 
    `clothing_data` = VALUES(`clothing_data`),
    `last_updated` = NOW();

-- 🔄 Sync QBCore Tattoos into FoxCore
INSERT INTO `foxcore_tattoos` (`identifier`, `tattoo_data`, `piercing_data`)
SELECT 
    `citizenid`, 
    JSON_EXTRACT(`metadata`, '$.tattoos'), 
    JSON_EXTRACT(`metadata`, '$.piercings') 
FROM `players`
ON DUPLICATE KEY UPDATE 
    `tattoo_data` = VALUES(`tattoo_data`),
    `piercing_data` = VALUES(`piercing_data`),
    `last_updated` = NOW();
