-- 🛠️ Create Characters Table
CREATE TABLE IF NOT EXISTS `foxcore_characters` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL,
    `firstname` VARCHAR(50) NOT NULL,
    `lastname` VARCHAR(50) NOT NULL,
    `dob` DATE NOT NULL,
    `gender` ENUM('male', 'female') NOT NULL,
    `money` JSON DEFAULT '{"cash": 0, "bank": 0}',
    `job` VARCHAR(50) DEFAULT 'unemployed',
    `job_grade` INT DEFAULT 0,
    `inventory` JSON DEFAULT '{}',
    `position` JSON DEFAULT '{"x": -1045.0, "y": -2750.0, "z": 21.0, "heading": 0.0}',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `last_login` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`identifier`) REFERENCES `foxcore_users`(`identifier`) ON DELETE CASCADE
);

-- 🚔 Sync QBCore Players into FoxCore Multi-Character
INSERT INTO `foxcore_characters` (`identifier`, `firstname`, `lastname`, `dob`, `gender`, `money`, `job`, `job_grade`, `inventory`, `position`)
SELECT 
    `identifier`, 
    JSON_UNQUOTE(JSON_EXTRACT(`charinfo`, '$.firstname')), 
    JSON_UNQUOTE(JSON_EXTRACT(`charinfo`, '$.lastname')), 
    JSON_UNQUOTE(JSON_EXTRACT(`charinfo`, '$.dob')), 
    IF(JSON_UNQUOTE(JSON_EXTRACT(`charinfo`, '$.gender')) = 'M', 'male', 'female'), 
    `money`, 
    `job`, 
    `job_grade`, 
    `inventory`, 
    '{"x": -1045.0, "y": -2750.0, "z": 21.0, "heading": 0.0}'
FROM `players`
ON DUPLICATE KEY UPDATE 
    `job` = VALUES(`job`),
    `job_grade` = VALUES(`job_grade`),
    `money` = VALUES(`money`),
    `inventory` = VALUES(`inventory`),
    `last_login` = NOW();

-- 🌎 Create Character Spawn Locations Table
CREATE TABLE IF NOT EXISTS `foxcore_spawnpoints` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `x` FLOAT NOT NULL,
    `y` FLOAT NOT NULL,
    `z` FLOAT NOT NULL,
    `heading` FLOAT NOT NULL
);

-- 🏠 Default Spawn Locations
INSERT INTO `foxcore_spawnpoints` (`name`, `x`, `y`, `z`, `heading`) VALUES
    ('Airport', -1045.0, -2750.0, 21.0, 0.0),
    ('Legion Square', 215.76, -810.12, 30.72, 180.0),
    ('Paleto Bay', -215.67, 6396.09, 31.49, 90.0),
    ('Sandy Shores', 1693.21, 3586.77, 35.62, 270.0);

-- 🔄 Create Character Deletion Log
CREATE TABLE IF NOT EXISTS `foxcore_deleted_characters` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL,
    `firstname` VARCHAR(50) NOT NULL,
    `lastname` VARCHAR(50) NOT NULL,
    `deleted_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
