CREATE TABLE IF NOT EXISTS banking_accounts (
    identifier VARCHAR(50) PRIMARY KEY,
    checking INT DEFAULT 0,
    savings INT DEFAULT 0,
    business INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS banking_cards (
    identifier VARCHAR(50),
    card_type VARCHAR(20) DEFAULT 'default'
);

ALTER TABLE banking_accounts ADD COLUMN loan_balance INT DEFAULT 0;
ALTER TABLE banking_accounts ADD COLUMN interest_rate FLOAT DEFAULT 0.02;

CREATE TABLE IF NOT EXISTS shared_accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account_number VARCHAR(20) UNIQUE,
    owner VARCHAR(50),
    shared_with VARCHAR(50),
    balance INT DEFAULT 0
);
