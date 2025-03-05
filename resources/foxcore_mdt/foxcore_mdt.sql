-- 📂 Create `mdt_records` Table
CREATE TABLE IF NOT EXISTS mdt_records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    plate VARCHAR(20),
    status VARCHAR(50),
    last_seen TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 📝 Create `mdt_reports` Table
CREATE TABLE IF NOT EXISTS mdt_reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    officer VARCHAR(100),
    report TEXT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 📸 Add Mugshot Column to `mdt_records`
ALTER TABLE mdt_records ADD COLUMN IF NOT EXISTS mugshot VARCHAR(255);

-- 🚨 Create `mdt_bolo` Table
CREATE TABLE IF NOT EXISTS mdt_bolo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT,
    suspect VARCHAR(100),
    vehicle VARCHAR(50),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 📂 Create `mdt_fingerprints` Table
CREATE TABLE IF NOT EXISTS mdt_fingerprints (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(50),
    name VARCHAR(100),
    dob DATE,
    criminal_record TEXT,
    fingerprint VARCHAR(255),
    UNIQUE(identifier)
);

-- ⚖️ Create `mdt_court_cases` Table
CREATE TABLE IF NOT EXISTS mdt_court_cases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    judge VARCHAR(100),
    defendant VARCHAR(100),
    charge TEXT,
    case_status VARCHAR(50) DEFAULT 'Pending',
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ⚖️ Create `mdt_doj_users` Table
CREATE TABLE IF NOT EXISTS mdt_doj_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(50),
    name VARCHAR(100),
    role ENUM('judge', 'lawyer', 'prosecutor')
);

-- 🚨 Create `mdt_warrants` Table
CREATE TABLE IF NOT EXISTS mdt_warrants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    officer VARCHAR(100),
    suspect VARCHAR(100),
    charge TEXT,
    status VARCHAR(50) DEFAULT 'Pending',
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 🖥️ Create `mdt_evidence` Table
CREATE TABLE IF NOT EXISTS mdt_evidence (
    id INT AUTO_INCREMENT PRIMARY KEY,
    officer VARCHAR(100),
    case_id INT,
    description TEXT,
    file_path VARCHAR(255),
    date_uploaded TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 📝 Create `mdt_court_logs` Table
CREATE TABLE IF NOT EXISTS mdt_court_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    case_id INT,
    sender VARCHAR(100),
    message TEXT,
    date_logged TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 📜 Create `mdt_public_records` Table
CREATE TABLE IF NOT EXISTS mdt_public_records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    content TEXT,
    date_published TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
