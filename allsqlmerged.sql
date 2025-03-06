-- =============================================
-- CORE USER & CHARACTER SYSTEM
-- =============================================

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

-- 🆕 Player Table (QBCore + FoxCore)
CREATE TABLE IF NOT EXISTS `players` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL UNIQUE,
    `rank` VARCHAR(10) DEFAULT 'user',
    `name` VARCHAR(100),
    `stress` INT DEFAULT 0
);

-- 🆕 Character Table (Supports Multiple Characters)
CREATE TABLE IF NOT EXISTS `characters` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `spawn_location` TEXT DEFAULT '{}',
    `job` VARCHAR(50) DEFAULT 'unemployed'
);

-- 🛠️ Sync QBCore Players into FoxCore
INSERT INTO `foxcore_users` (`identifier`, `name`, `job`, `job_grade`, `money`, `inventory`, `last_seen`)
SELECT 
    `identifier`, 
    `name`, 
    'unemployed' AS job, -- Default job since 'job' column doesn't exist
    0 AS job_grade, -- Default job_grade
    '{}' AS money, -- Default empty JSON for money
    '{}' AS inventory, -- Default empty JSON for inventory
    NOW() AS last_seen
FROM `players`
ON DUPLICATE KEY UPDATE 
    `job` = VALUES(`job`),
    `job_grade` = VALUES(`job_grade`),
    `money` = VALUES(`money`),
    `inventory` = VALUES(`inventory`),
    `last_seen` = NOW();
ALTER TABLE `players` ADD COLUMN IF NOT EXISTS `charinfo` JSON DEFAULT '{}';

-- =============================================
-- INVENTORY SYSTEM
-- =============================================

-- 🆕 Inventory Table (Shared)
CREATE TABLE IF NOT EXISTS `inventory` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL,
    `item` VARCHAR(50) NOT NULL,
    `quantity` INT DEFAULT 1,
    UNIQUE(`identifier`, `item`)
);


-- =============================================
-- JOBS & ECONOMY SYSTEM
-- =============================================

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

-- Banking accounts system
CREATE TABLE IF NOT EXISTS `banking_accounts` (
    `identifier` VARCHAR(50) PRIMARY KEY,
    `checking` INT DEFAULT 0,
    `savings` INT DEFAULT 0,
    `business` INT DEFAULT 0,
    `loan_balance` INT DEFAULT 0,
    `interest_rate` FLOAT DEFAULT 0.02,
    `stress` INT DEFAULT 0
);

-- Banking cards system
CREATE TABLE IF NOT EXISTS `banking_cards` (
    `identifier` VARCHAR(50),
    `card_type` VARCHAR(20) DEFAULT 'default'
);

-- Shared banking accounts
CREATE TABLE IF NOT EXISTS `shared_accounts` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `account_number` VARCHAR(20) UNIQUE,
    `owner` VARCHAR(50),
    `shared_with` VARCHAR(50),
    `balance` INT DEFAULT 0
);

-- 💰 Black Market Transactions Log
CREATE TABLE IF NOT EXISTS `blackmarket_sales` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `player_id` VARCHAR(50),
    `item_name` VARCHAR(100),
    `sale_price` INT,
    `transaction_type` ENUM('buy', 'sell'),
    `date_sold` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- VEHICLE SYSTEM
-- =============================================

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

-- =============================================
-- LICENSE SYSTEM
-- =============================================

-- 📜 Licenses Table
CREATE TABLE IF NOT EXISTS `foxcore_licenses` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL,
    `license_type` VARCHAR(50) NOT NULL,
    `status` BOOLEAN DEFAULT 1,
    FOREIGN KEY (`identifier`) REFERENCES `foxcore_users`(`identifier`) ON DELETE CASCADE
);

-- 🔄 Sync Existing QBCore Licenses into FoxCore (commented out due to missing columns)
/*
INSERT INTO `foxcore_licenses` (`identifier`, `license_type`, `status`)
SELECT `identifier`, JSON_EXTRACT(`metadata`, '$.licenses'), 1 FROM `players`
ON DUPLICATE KEY UPDATE `status` = VALUES(`status`);
*/

-- =============================================
-- PHONE SYSTEM
-- =============================================

-- Phone contacts (deduplicated)
CREATE TABLE IF NOT EXISTS `phone_contacts` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `owner` VARCHAR(50) NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `number` VARCHAR(20) NOT NULL
);

-- Phone messages (deduplicated)
CREATE TABLE IF NOT EXISTS `phone_messages` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `sender` VARCHAR(50) NOT NULL,
    `receiver` VARCHAR(50) NOT NULL,
    `message` TEXT NOT NULL,
    `time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Phone calls (deduplicated)
CREATE TABLE IF NOT EXISTS `phone_calls` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL,
    `number` VARCHAR(20) NOT NULL,
    `duration` INT DEFAULT 0,
    `time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Phone settings
CREATE TABLE IF NOT EXISTS `phone_settings` (
    `identifier` VARCHAR(50) PRIMARY KEY,
    `background` VARCHAR(50) DEFAULT 'default.jpg',
    `frame` VARCHAR(50) DEFAULT 'default.png'
);

-- Phone users
CREATE TABLE IF NOT EXISTS `phone_users` (
    `identifier` VARCHAR(50) PRIMARY KEY,
    `pin` INT DEFAULT 1234
);

-- Phone voicemail
CREATE TABLE IF NOT EXISTS `phone_voicemail` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL,
    `from_number` VARCHAR(20) NOT NULL,
    `message` TEXT NOT NULL,
    `time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Phone wallet
CREATE TABLE IF NOT EXISTS `phone_wallet` (
    `identifier` VARCHAR(50) PRIMARY KEY,
    `crypto_balance` DECIMAL(10,2) DEFAULT 0
);

-- Phone marketplace
CREATE TABLE IF NOT EXISTS `phone_marketplace` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `seller` VARCHAR(50) NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `price` INT NOT NULL,
    `time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- POLICE SYSTEM
-- =============================================

-- 👮 Officer Duty Status Table
CREATE TABLE IF NOT EXISTS `police_duty` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `officer_id` VARCHAR(50),
    `status` BOOLEAN DEFAULT 0
);

-- 🚨 Evidence System Table
CREATE TABLE IF NOT EXISTS `police_evidence` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `officer_id` VARCHAR(50),
    `description` TEXT,
    `location` VARCHAR(255),
    `date_collected` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 🚔 Warrant System Table
CREATE TABLE IF NOT EXISTS `police_warrants` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `officer_id` VARCHAR(50),
    `suspect` VARCHAR(100),
    `charge` TEXT,
    `status` ENUM('Pending', 'Approved', 'Executed') DEFAULT 'Pending'
);

-- ⚖️ Fine Payment System
CREATE TABLE IF NOT EXISTS `police_fines` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `officer_id` VARCHAR(50),
    `suspect` VARCHAR(100),
    `amount` INT,
    `paid` BOOLEAN DEFAULT 0
);

-- 📸 Police Crime Photos Table
CREATE TABLE IF NOT EXISTS `police_crime_photos` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `officer_id` VARCHAR(50),
    `photo_url` TEXT,
    `location` VARCHAR(255),
    `date_taken` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 🔍 Police Crime Markers Table
CREATE TABLE IF NOT EXISTS `police_crime_markers` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `officer_id` VARCHAR(50),
    `marker_type` VARCHAR(50),
    `location` VARCHAR(255),
    `date_logged` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- MDT (MOBILE DATA TERMINAL) SYSTEM
-- =============================================

-- 📂 MDT Records Table
CREATE TABLE IF NOT EXISTS `mdt_records` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100),
    `plate` VARCHAR(20),
    `status` VARCHAR(50),
    `mugshot` VARCHAR(255),
    `last_seen` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 📝 MDT Reports Table
CREATE TABLE IF NOT EXISTS `mdt_reports` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `officer` VARCHAR(100),
    `report` TEXT,
    `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 🚨 MDT BOLO Table
CREATE TABLE IF NOT EXISTS `mdt_bolo` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `description` TEXT,
    `suspect` VARCHAR(100),
    `vehicle` VARCHAR(50),
    `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 📂 MDT Fingerprints Table
CREATE TABLE IF NOT EXISTS `mdt_fingerprints` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50),
    `name` VARCHAR(100),
    `dob` DATE,
    `criminal_record` TEXT,
    `fingerprint` VARCHAR(255),
    UNIQUE(`identifier`)
);

-- ⚖️ MDT Court Cases Table
CREATE TABLE IF NOT EXISTS `mdt_court_cases` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `judge` VARCHAR(100),
    `defendant` VARCHAR(100),
    `charge` TEXT,
    `case_status` VARCHAR(50) DEFAULT 'Pending',
    `date_created` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ⚖️ MDT DOJ Users Table
CREATE TABLE IF NOT EXISTS `mdt_doj_users` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50),
    `name` VARCHAR(100),
    `role` ENUM('judge', 'lawyer', 'prosecutor')
);

-- 🚨 MDT Warrants Table
CREATE TABLE IF NOT EXISTS `mdt_warrants` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `officer` VARCHAR(100),
    `suspect` VARCHAR(100),
    `charge` TEXT,
    `status` VARCHAR(50) DEFAULT 'Pending',
    `date_created` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 🖥️ MDT Evidence Table
CREATE TABLE IF NOT EXISTS `mdt_evidence` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `officer` VARCHAR(100),
    `case_id` INT,
    `description` TEXT,
    `file_path` VARCHAR(255),
    `date_uploaded` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 📝 MDT Court Logs Table
CREATE TABLE IF NOT EXISTS `mdt_court_logs` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `case_id` INT,
    `sender` VARCHAR(100),
    `message` TEXT,
    `date_logged` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 📜 MDT Public Records Table
CREATE TABLE IF NOT EXISTS `mdt_public_records` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255),
    `content` TEXT,
    `date_published` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- AMBULANCE/EMS SYSTEM
-- =============================================

-- 🏥 EMS Player Data Table (Ranks, Certifications, Duty Status)
CREATE TABLE IF NOT EXISTS `ambulance_data` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL UNIQUE,
    `rank` VARCHAR(20) DEFAULT 'emt',
    `certifications` TEXT DEFAULT NULL,
    `on_duty` BOOLEAN DEFAULT FALSE
);

-- 📋 Medical Records Table (Tracks Patient History)
CREATE TABLE IF NOT EXISTS `medical_records` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `patient_id` VARCHAR(50) NOT NULL,
    `doctor_id` VARCHAR(50) NOT NULL,
    `diagnosis` TEXT NOT NULL,
    `treatment` TEXT NOT NULL,
    `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`patient_id`) REFERENCES `players` (`identifier`) ON DELETE CASCADE,
    FOREIGN KEY (`doctor_id`) REFERENCES `players` (`identifier`) ON DELETE CASCADE
);

-- 🚑 EMS Inventory Table (Tracks Ambulance Storage & Supplies)
CREATE TABLE IF NOT EXISTS `ems_inventory` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL,
    `item` VARCHAR(50) NOT NULL,
    `quantity` INT DEFAULT 0,
    `location` VARCHAR(50) DEFAULT 'hospital_storage',
    FOREIGN KEY (`identifier`) REFERENCES `players` (`identifier`) ON DELETE CASCADE
);

-- =============================================
-- ENSURE DEFAULT VALUES FOR EXISTING PLAYERS
-- =============================================

-- 🚀 Ensure Default Values for Existing Players
UPDATE banking_accounts SET stress = 0 WHERE stress IS NULL;
