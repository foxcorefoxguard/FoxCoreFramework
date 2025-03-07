-- 📂 Create `players` Table (If Not Already Exists)
CREATE TABLE IF NOT EXISTS players (
    identifier VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    stress INT DEFAULT 0
);

-- 🏦 Add `stress` Column to `banking_accounts` (If Not Exists)
ALTER TABLE banking_accounts ADD COLUMN IF NOT EXISTS stress INT DEFAULT 0;

-- 🚀 Ensure Default Values for Existing Players
UPDATE banking_accounts SET stress = 0 WHERE stress IS NULL;
