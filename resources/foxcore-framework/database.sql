CREATE TABLE IF NOT EXISTS players (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(50) NOT NULL UNIQUE,
    rank VARCHAR(10) DEFAULT 'user'
);

CREATE TABLE IF NOT EXISTS characters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    spawn_location TEXT DEFAULT '{}'
);

CREATE TABLE IF NOT EXISTS inventory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(50) NOT NULL,
    item VARCHAR(50) NOT NULL,
    quantity INT DEFAULT 1,
    UNIQUE(identifier, item)
);

ALTER TABLE characters ADD COLUMN job VARCHAR(50) DEFAULT 'unemployed';
