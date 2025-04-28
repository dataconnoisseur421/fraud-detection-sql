-- Create the database
CREATE DATABASE IF NOT EXISTS Fraud_DB;
USE Fraud_DB;

-- Create users table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    date_joined DATE,
    country VARCHAR(50)
);

-- Create accounts table
CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    account_type VARCHAR(50),
    opened_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Create transactions table
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    amount DECIMAL(12, 2),
    transaction_type VARCHAR(50),
    timestamp DATETIME,
    status VARCHAR(20),
    location VARCHAR(50),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

-- Create logins table
CREATE TABLE logins (
    login_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    login_time DATETIME,
    ip_address VARCHAR(45),
    country VARCHAR(50),
    device VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Create devices table
CREATE TABLE devices (
    device_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    device_name VARCHAR(100),
    device_type VARCHAR(50),
    first_seen DATETIME,
    last_seen DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
