-- 🚨 Fraud Detection Rules SQL Script
-- Author: [Your Name]
-- Project: Fraud Detection SQL System
-- Description: Rule-based SQL scripts to identify suspicious activities in user accounts, transactions, and logins.

-- #1: Duplicate Emails
SELECT email, COUNT(user_id) AS num_emails 
FROM users 
GROUP BY email
HAVING num_emails > 1;

-- #2: Same Account, Same Time, Different Locations
SELECT * 
FROM transactions t1
JOIN transactions t2 
  ON t1.account_id = t2.account_id 
 AND t1.transaction_id < t2.transaction_id
WHERE ABS(TIMESTAMPDIFF(MINUTE, t1.timestamp, t2.timestamp)) <= 2 
  AND t1.location != t2.location 
  AND t1.transaction_type = 'withdrawal'
  AND t2.transaction_type = 'withdrawal';

-- #3: Multiple Logins into Same User from Different Countries
SELECT * 
FROM logins l1 
JOIN logins l2 
  ON l1.user_id = l2.user_id 
 AND l1.login_id < l2.login_id
WHERE ABS(TIMESTAMPDIFF(MINUTE, l1.login_time, l2.login_time)) <= 2 
  AND l1.country != l2.country;

-- #4: Rapid Multiple Failed Transactions (3+ within 30 mins)
SELECT t1.account_id, t1.timestamp, COUNT(*) AS failures_in_30_min
FROM transactions t1
JOIN transactions t2 
  ON t1.account_id = t2.account_id
 AND t2.status = 'failed'
 AND ABS(TIMESTAMPDIFF(MINUTE, t1.timestamp, t2.timestamp)) <= 30
WHERE t1.status = 'failed'
GROUP BY t1.account_id, t1.timestamp
HAVING COUNT(*) >= 3;

-- #5: High-Value Transaction Shortly After Account Creation
SELECT * 
FROM accounts a 
JOIN transactions t 
  ON a.account_id = t.account_id
WHERE a.opened_date >= CURDATE() - INTERVAL 7 DAY 
  AND t.amount > 10000;

-- #6: Inactive Account Suddenly Active
SELECT t.account_id, t.timestamp AS suspicious_tx_time, t.amount
FROM transactions t
WHERE t.amount > 10000
  AND t.timestamp >= CURDATE() - INTERVAL 7 DAY
  AND t.account_id IN (
      SELECT account_id
      FROM transactions
      GROUP BY account_id
      HAVING MAX(timestamp) < CURDATE() - INTERVAL 6 MONTH
  );

-- #7: Logins From Blacklisted Countries
SELECT * 
FROM logins
WHERE country IN ('Russia', 'Iran', 'North Korea');

-- #8: Multiple Accounts Linked to Same Device (device_id)
SELECT device_id, COUNT(DISTINCT user_id) AS user_count
FROM devices
GROUP BY device_id
HAVING COUNT(DISTINCT user_id) > 1;

-- #9: Transactions Following High-Risk Login Location
SELECT u.user_id, l.country AS login_country, t.location AS txn_location, t.amount, t.timestamp
FROM logins l
JOIN users u ON l.user_id = u.user_id
JOIN accounts a ON u.user_id = a.user_id
JOIN transactions t ON a.account_id = t.account_id
WHERE l.country IN ('Russia', 'Iran', 'North Korea')
  AND t.amount > 10000
  AND ABS(TIMESTAMPDIFF(MINUTE, l.login_time, t.timestamp)) <= 5;



