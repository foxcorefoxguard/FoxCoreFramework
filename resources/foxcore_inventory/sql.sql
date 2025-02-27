CREATE TABLE IF NOT EXISTS inventory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(50) NOT NULL,
    item VARCHAR(50) NOT NULL,
    quantity INT DEFAULT 1,
    UNIQUE(identifier, item)
);
