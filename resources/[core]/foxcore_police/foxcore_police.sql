-- 👮 Officer Duty Status Table
CREATE TABLE IF NOT EXISTS police_duty (
    id INT AUTO_INCREMENT PRIMARY KEY,
    officer_id VARCHAR(50),
    status BOOLEAN DEFAULT 0
);

-- 🚨 Evidence System Table
CREATE TABLE IF NOT EXISTS police_evidence (
    id INT AUTO_INCREMENT PRIMARY KEY,
    officer_id VARCHAR(50),
    description TEXT,
    location VARCHAR(255),
    date_collected TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 🚔 Warrant System Table
CREATE TABLE IF NOT EXISTS police_warrants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    officer_id VARCHAR(50),
    suspect VARCHAR(100),
    charge TEXT,
    status ENUM('Pending', 'Approved', 'Executed') DEFAULT 'Pending'
);

-- ⚖️ Fine Payment System
CREATE TABLE IF NOT EXISTS police_fines (
    id INT AUTO_INCREMENT PRIMARY KEY,
    officer_id VARCHAR(50),
    suspect VARCHAR(100),
    amount INT,
    paid BOOLEAN DEFAULT 0
);

-- 📸 Create `police_crime_photos` Table
CREATE TABLE IF NOT EXISTS police_crime_photos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    officer_id VARCHAR(50),
    photo_url TEXT,
    location VARCHAR(255),
    date_taken TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 🔍 Create `police_crime_markers` Table
CREATE TABLE IF NOT EXISTS police_crime_markers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    officer_id VARCHAR(50),
    marker_type VARCHAR(50),
    location VARCHAR(255),
    date_logged TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
