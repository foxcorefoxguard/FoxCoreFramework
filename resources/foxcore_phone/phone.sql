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
