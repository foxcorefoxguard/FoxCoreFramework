-- 🛠️ FoxCore Users Table (Supports QBCore Players)
CREATE TABLE IF NOT EXISTS `foxcore_users` (
    `identifier` VARCHAR(50) NOT NULL PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `job` VARCHAR(50) DEFAULT 'unemployed',
    `job_grade` INT DEFAULT 0,
    `money` JSON DEFAULT '{}',
    `inventory` JSON DEFAULT '{}',
    `last_seen` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 🛠️ Sync QBCore Players into FoxCore
INSERT INTO `foxcore_users` (`identifier`, `name`, `job`, `job_grade`, `money`, `inventory`, `last_seen`)
SELECT `citizenid`, CONCAT(`charinfo`->>'$.firstname', ' ', `charinfo`->>'$.lastname'), `job`, `job_grade`, `money`, `inventory`, NOW()
FROM `players`
ON DUPLICATE KEY UPDATE 
    `job` = VALUES(`job`),
    `job_grade` = VALUES(`job_grade`),
    `money` = VALUES(`money`),
    `inventory` = VALUES(`inventory`),
    `last_seen` = NOW();

-- 🚔 Jobs Table (Shared by QBCore & FoxCore)
CREATE TABLE IF NOT EXISTS `foxcore_jobs` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL UNIQUE,
    `label` VARCHAR(100) NOT NULL,
    `salary` INT DEFAULT 100
);

-- 💰 Banking Table (Shared)
CREATE TABLE IF NOT EXISTS `foxcore_banking` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL,
    `account` VARCHAR(50) NOT NULL,
    `balance` INT DEFAULT 0,
    FOREIGN KEY (`identifier`) REFERENCES `foxcore_users`(`identifier`) ON DELETE CASCADE
);

-- 🚗 Vehicles Table (Supports QBCore & FoxCore)
CREATE TABLE IF NOT EXISTS `foxcore_vehicles` (
    `plate` VARCHAR(10) PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL,
    `model` VARCHAR(50) NOT NULL,
    `garage` VARCHAR(50) DEFAULT 'default',
    `modifications` JSON DEFAULT '{}',
    `fuel` INT DEFAULT 100,
    FOREIGN KEY (`identifier`) REFERENCES `foxcore_users`(`identifier`) ON DELETE CASCADE
);

-- 📜 Licenses Table
CREATE TABLE IF NOT EXISTS `foxcore_licenses` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL,
    `license_type` VARCHAR(50) NOT NULL,
    `status` BOOLEAN DEFAULT 1,
    FOREIGN KEY (`identifier`) REFERENCES `foxcore_users`(`identifier`) ON DELETE CASCADE
);

-- 🔄 Sync Existing QBCore Licenses into FoxCore
INSERT INTO `foxcore_licenses` (`identifier`, `license_type`, `status`)
SELECT `citizenid`, `metadata`->>'$.licenses', 1 FROM `players`
ON DUPLICATE KEY UPDATE `status` = VALUES(`status`);

-- 🆕 Player Table (QBCore + FoxCore)
CREATE TABLE IF NOT EXISTS `players` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL UNIQUE,
    `rank` VARCHAR(10) DEFAULT 'user'
);

-- 🆕 Character Table (Supports Multiple Characters)
CREATE TABLE IF NOT EXISTS `characters` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `spawn_location` TEXT DEFAULT '{}',
    `job` VARCHAR(50) DEFAULT 'unemployed'
);

-- 🆕 Inventory Table (Shared)
CREATE TABLE IF NOT EXISTS `inventory` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL,
    `item` VARCHAR(50) NOT NULL,
    `quantity` INT DEFAULT 1,
    UNIQUE(`identifier`, `item`)
);

ALTER TABLE characters ADD COLUMN job VARCHAR(50) DEFAULT 'unemployed';
