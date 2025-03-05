-- 💰 Black Market Transactions Log
CREATE TABLE IF NOT EXISTS blackmarket_sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id VARCHAR(50),
    item_name VARCHAR(100),
    sale_price INT,
    transaction_type ENUM('buy', 'sell'),
    date_sold TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
