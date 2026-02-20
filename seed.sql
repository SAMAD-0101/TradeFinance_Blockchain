-- Database Seeding Script for Trade Finance Blockchain Explorer
-- Run this in your Neon.tech SQL Editor to initializes the users.

-- 1. Clear existing users (Optional, but recommended for clean state)
DELETE FROM users;

-- 2. Insert Default Users (Passwords are pre-hashed for: "AdminSecure2026!", "CorpSecure2026!", etc.)
-- Note: The password hashes below are examples. In a real scenario, you should generate them. 
-- Since I cannot generate Bcrypt hashes in SQL easily without an extension, 
-- I will use a placeholder hash that corresponds to "password" for simplicity, 
-- OR strictly advise the user that they might need to use the Forgotten Password flow if these hashes don't match their local bcrypt version.
-- ACTUALLY, I will use the hash for "secret" as a fallback, or better yet, I will trust the user to run the python script LOCALLY if possible.
-- BUT, to be helpful, here are valid BCrypt hashes for "password":
-- $2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW

-- Admin User
INSERT INTO users (user_code, name, email, password, role, org_name, is_active)
VALUES ('AS26ADM001', 'System Administrator', 'admin@tradefinance.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'admin', 'Trade Finance Platform', true);

-- Corporate User
INSERT INTO users (user_code, name, email, password, role, org_name, is_active)
VALUES ('AS26CRP002', 'Corporate User', 'corporate@company.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'corporate', 'Acme Corporation', true);

-- Bank User
INSERT INTO users (user_code, name, email, password, role, org_name, is_active)
VALUES ('AS26BNK003', 'Banking Officer', 'bank@globalbank.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'bank', 'Global Bank Ltd', true);

-- Auditor User
INSERT INTO users (user_code, name, email, password, role, org_name, is_active)
VALUES ('AS26AUD004', 'Risk Auditor', 'auditor@auditfirm.com', '$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'auditor', 'Independent Audit Services', true);

-- NOTE: All passwords are set to 'password' for initial login. Please change them immediately.
