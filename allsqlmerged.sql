-- FoxCore Combined Database Schema

-- Players Table (Merged from multiple sources)
CREATE TABLE IF NOT EXISTS players (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(50) NOT NULL UNIQUE,
    rank VARCHAR(10) DEFAULT 'user',
    name VARCHAR(100),
    stress INT DEFAULT 0
);

-- Characters Table
CREATE TABLE IF NOT EXISTS characters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    spawn_location TEXT DEFAULT '{}',
    job VARCHAR(50) DEFAULT 'unemployed'
);

-- Inventory Table
CREATE TABLE IF NOT EXISTS inventory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(50) NOT NULL,
    item VARCHAR(50) NOT NULL,
    quantity INT DEFAULT 1,
    UNIQUE(identifier, item)
);

-- Banking Tables
CREATE TABLE IF NOT EXISTS banking_accounts (
    identifier VARCHAR(50) PRIMARY KEY,
    checking INT DEFAULT 0,
    savings INT DEFAULT 0,
    business INT DEFAULT 0,
    loan_balance INT DEFAULT 0,
    interest_rate FLOAT DEFAULT 0.02,
    stress INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS banking_cards (
    identifier VARCHAR(50),
    card_type VARCHAR(20) DEFAULT 'default'
);

CREATE TABLE IF NOT EXISTS shared_accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account_number VARCHAR(20) UNIQUE,
    owner VARCHAR(50),
    shared_with VARCHAR(50),
    balance INT DEFAULT 0
);

-- Police Duty Status Table
CREATE TABLE IF NOT EXISTS police_duty (
    id INT AUTO_INCREMENT PRIMARY KEY,
    officer_id VARCHAR(50),
    status BOOLEAN DEFAULT 0
);

-- Police Evidence Table
CREATE TABLE IF NOT EXISTS police_evidence (
    id INT AUTO_INCREMENT PRIMARY KEY,
    officer_id VARCHAR(50),
    description TEXT,
    location VARCHAR(255),
    date_collected TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Police Warrants Table
CREATE TABLE IF NOT EXISTS police_warrants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    officer_id VARCHAR(50),
    suspect VARCHAR(100),
    charge TEXT,
    status ENUM('Pending', 'Approved', 'Executed') DEFAULT 'Pending'
);

-- Police Fines Table
CREATE TABLE IF NOT EXISTS police_fines (
    id INT AUTO_INCREMENT PRIMARY KEY,
    officer_id VARCHAR(50),
    suspect VARCHAR(100),
    amount INT,
    paid BOOLEAN DEFAULT 0
);

-- Police Crime Photos Table
CREATE TABLE IF NOT EXISTS police_crime_photos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    officer_id VARCHAR(50),
    photo_url TEXT,
    location VARCHAR(255),
    date_taken TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Police Crime Markers Table
CREATE TABLE IF NOT EXISTS police_crime_markers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    officer_id VARCHAR(50),
    marker_type VARCHAR(50),
    location VARCHAR(255),
    date_logged TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Mobile Devices Phone Tables
CREATE TABLE IF NOT EXISTS phone_contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    owner VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    number VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS phone_messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender VARCHAR(50) NOT NULL,
    receiver VARCHAR(50) NOT NULL,
    message TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS phone_calls (
    id INT AUTO_INCREMENT PRIMARY KEY,
    caller VARCHAR(50) NOT NULL,
    receiver VARCHAR(50) NOT NULL,
    duration INT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS phone_settings (
    identifier VARCHAR(50) PRIMARY KEY,
    background VARCHAR(50) DEFAULT 'default.jpg',
    frame VARCHAR(50) DEFAULT 'default.png'
);

CREATE TABLE IF NOT EXISTS phone_users (
    identifier VARCHAR(50) PRIMARY KEY,
    pin INT DEFAULT 1234
);

CREATE TABLE IF NOT EXISTS phone_voicemail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(50) NOT NULL,
    from_number VARCHAR(20) NOT NULL,
    message TEXT NOT NULL,
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS phone_wallet (
    identifier VARCHAR(50) PRIMARY KEY,
    crypto_balance DECIMAL(10,2) DEFAULT 0
);

CREATE TABLE IF NOT EXISTS phone_marketplace (
    id INT AUTO_INCREMENT PRIMARY KEY,
    seller VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Mobile Devices Phone Items
INSERT INTO items (name, label, type, weight) VALUES
('jerrycan', 'Jerrycan', 'usable', 5),
('syphoningkit', 'Siphoning Kit', 'usable', 3);

-- MDT (Mobile Digital Terminal) Tables
CREATE TABLE IF NOT EXISTS mdt_records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    plate VARCHAR(20),
    status VARCHAR(50),
    last_seen TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    mugshot VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS mdt_reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    officer VARCHAR(100),
    report TEXT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS mdt_bolo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT,
    suspect VARCHAR(100),
    vehicle VARCHAR(50),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS mdt_fingerprints (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(50),
    name VARCHAR(100),
    dob DATE,
    criminal_record TEXT,
    fingerprint VARCHAR(255),
    UNIQUE(identifier)
);

CREATE TABLE IF NOT EXISTS mdt_court_cases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    judge VARCHAR(100),
    defendant VARCHAR(100),
    charge TEXT,
    case_status VARCHAR(50) DEFAULT 'Pending',
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS mdt_doj_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(50),
    name VARCHAR(100),
    role ENUM('judge', 'lawyer', 'prosecutor')
);

CREATE TABLE IF NOT EXISTS mdt_warrants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    officer VARCHAR(100),
    suspect VARCHAR(100),
    charge TEXT,
    status VARCHAR(50) DEFAULT 'Pending',
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS mdt_evidence (
    id INT AUTO_INCREMENT PRIMARY KEY,
    officer VARCHAR(100),
    case_id INT,
    description TEXT,
    file_path VARCHAR(255),
    date_uploaded TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS mdt_court_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    case_id INT,
    sender VARCHAR(100),
    message TEXT,
    date_logged TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS mdt_public_records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    content TEXT,
    date_published TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Black Market Transactions
CREATE TABLE IF NOT EXISTS blackmarket_sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id VARCHAR(50),
    item_name VARCHAR(100),
    sale_price INT,
    transaction_type ENUM('buy', 'sell'),
    date_sold TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Ambulance/EMS Tables
CREATE TABLE IF NOT EXISTS ambulance_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(50) NOT NULL UNIQUE,
    rank VARCHAR(20) DEFAULT 'emt',
    certifications TEXT DEFAULT NULL,
    on_duty BOOLEAN DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS medical_records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(50) NOT NULL,
    doctor_id VARCHAR(50) NOT NULL,
    diagnosis TEXT NOT NULL,
    treatment TEXT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES players (identifier) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES players (identifier) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS ems_inventory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(50) NOT NULL,
    item VARCHAR(50) NOT NULL,
    quantity INT DEFAULT 0,
    location VARCHAR(50) DEFAULT 'hospital_storage',
    FOREIGN KEY (identifier) REFERENCES players (identifier) ON DELETE CASCADE
);
