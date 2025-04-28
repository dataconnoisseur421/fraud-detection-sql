

-- Insert into users
INSERT INTO users (full_name, email, date_joined, country) VALUES
('Alice Tan', 'alice.tan@example.com', '2022-01-15', 'Singapore'),
('John Smith', 'john.smith@example.com', '2021-11-02', 'USA'),
('Mei Ling', 'mei.ling@example.com', '2023-03-10', 'Malaysia'),
('Carlos Ruiz', 'carlos.ruiz@example.com', '2023-07-22', 'Spain'),
('Fake Alice', 'alice.tan@example.com', '2025-04-25', 'Singapore'), -- duplicate email
('Fake John', 'john.smith@example.com', '2025-04-25', 'USA');         -- duplicate email

-- Insert into accounts
INSERT INTO accounts (user_id, account_type, opened_date, status) VALUES
(1, 'checking', '2022-01-16', 'active'),
(1, 'savings', '2022-01-16', 'active'),
(2, 'checking', '2021-11-02', 'active'),
(3, 'credit', '2023-03-10', 'active'),
(4, 'checking', '2023-07-22', 'active'),
(1, 'checking', '2025-04-22', 'active'), -- suspicious duplicate checking account
(2, 'checking', '2025-04-22', 'active'); -- suspicious duplicate checking account

-- Insert into transactions
INSERT INTO transactions (account_id, amount, transaction_type, timestamp, status, location) VALUES
(1, 15000.00, 'withdrawal', '2025-04-23 10:20:00', 'success', 'Singapore'),
(1, 13000.00, 'withdrawal', '2025-04-23 10:22:00', 'success', 'Russia'), -- suspicious different location
(2, 500.00, 'withdrawal', '2025-04-22 15:00:00', 'success', 'New York'),
(2, 300.00, 'withdrawal', '2025-04-22 15:10:00', 'failed', 'New York'),
(2, 400.00, 'withdrawal', '2025-04-22 15:20:00', 'failed', 'New York'),
(2, 700.00, 'withdrawal', '2025-04-22 15:35:00', 'failed', 'New York'), -- multiple fails
(3, 8000.00, 'transfer', '2025-04-21 09:00:00', 'success', 'Kuala Lumpur'),
(4, 25000.00, 'withdrawal', '2025-04-24 10:00:00', 'success', 'Spain'); -- high-value from new account

-- Insert into logins
INSERT INTO logins (user_id, login_time, ip_address, country, device) VALUES
(1, '2025-04-23 09:58:00', '101.22.33.45', 'Singapore', 'iPhone 14'),
(1, '2025-04-23 10:00:00', '75.22.44.88', 'Russia', 'Android Tablet'), -- different country within 2 mins
(2, '2025-04-22 14:50:00', '123.45.67.89', 'USA', 'MacBook Pro'),
(3, '2025-04-21 08:55:00', '222.22.33.44', 'Malaysia', 'Samsung Galaxy'),
(4, '2025-04-24 09:45:00', '92.44.22.11', 'Spain', 'iPhone 13');

-- Insert into devices
INSERT INTO devices (user_id, device_name, device_type, first_seen, last_seen) VALUES
(1, 'iPhone 14', 'mobile', '2023-01-10 08:00:00', '2025-04-23 10:20:00'),
(2, 'MacBook Pro', 'laptop', '2021-12-01 10:00:00', '2025-04-22 14:50:00'),
(3, 'Samsung Galaxy', 'mobile', '2023-03-10 09:00:00', '2025-04-21 09:00:00'),
(4, 'iPhone 13', 'mobile', '2023-07-22 09:00:00', '2025-04-24 09:45:00');
