CREATE TABLE IF NOT EXISTS phone_contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(50) NOT NULL,
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

CREATE TABLE IF NOT EXISTS phone_calls (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(50) NOT NULL,
    number VARCHAR(20) NOT NULL,
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS phone_voicemail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(50) NOT NULL,
    from_number VARCHAR(20) NOT NULL,
    message TEXT NOT NULL,
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS phone_messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender VARCHAR(50) NOT NULL,
    receiver VARCHAR(50) NOT NULL,
    message TEXT NOT NULL,
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS phone_contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    owner VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    number VARCHAR(20) NOT NULL
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
