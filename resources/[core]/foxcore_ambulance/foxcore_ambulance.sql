-- 📌 Drop existing tables to prevent duplicates
DROP TABLE IF EXISTS `ambulance_data`;
DROP TABLE IF EXISTS `medical_records`;
DROP TABLE IF EXISTS `ems_inventory`;

-- 🏥 EMS Player Data Table (Ranks, Certifications, Duty Status)
CREATE TABLE `ambulance_data` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL UNIQUE,
    `rank` VARCHAR(20) DEFAULT 'emt',
    `certifications` TEXT DEFAULT NULL,
    `on_duty` BOOLEAN DEFAULT FALSE
);

-- 📋 Medical Records Table (Tracks Patient History)
CREATE TABLE `medical_records` (
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
CREATE TABLE `ems_inventory` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(50) NOT NULL,
    `item` VARCHAR(50) NOT NULL,
    `quantity` INT DEFAULT 0,
    `location` VARCHAR(50) DEFAULT 'hospital_storage',
    FOREIGN KEY (`identifier`) REFERENCES `players` (`identifier`) ON DELETE CASCADE
);
