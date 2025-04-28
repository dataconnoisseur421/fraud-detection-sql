# 🚨 Fraud Detection SQL System

This project is a SQL-driven fraud detection system designed to identify suspicious activities across user accounts, financial transactions, and login behaviors. It uses a rule-based approach to scan for anomalies such as duplicate emails, simultaneous logins from different countries, high-risk transactions, and unusual account behavior.

---

## 📁 Project Structure
- `Fraud_DB/`: Contains the full database schema and sample data.
- `fraud-rules/`: Contains SQL scripts for detecting different types of fraud.
- `procedures/`: (Optional) Stored procedures for automating fraud checks.
- `README.md`: Project overview and instructions.

---

## 🔍 Fraud Rules Implemented
1. **Duplicate Emails**  
   Detect users sharing the same email address across different accounts.

2. **Same Account, Same Time, Different Locations**  
   Flag simultaneous withdrawals from different locations.

3. **Multiple Logins into Same User from Different Countries**  
   Identify logins occurring from different countries within a short time window.

4. **Rapid Multiple Failed Transactions**  
   Detect 3 or more failed transactions within 30 minutes.

5. **High-Value Transaction Shortly After Account Creation**  
   Flag new accounts making large transactions quickly after opening.

6. **Transaction from a New Device**  
   Identify transactions from unknown/unlinked devices.

7. **Inactive Accounts Suddenly Becoming Active**  
   Highlight accounts dormant for over 6 months making large withdrawals.

8. **Logins from Blacklisted Countries**  
   Detect logins originating from high-risk countries.

9. **Multiple Accounts Linked to Same Device**  
   Flag devices being used across multiple accounts.

---

## 🛠️ Technologies Used
- MySQL / SQL
- MySQL Workbench
- Relational Database Design (ERD)
- Window Functions, JOINs, CTEs
- Manual rule-based fraud detection

---

## ⚙️ How to Run
1. Clone this repository.
2. Set up the `Fraud_DB` schema in MySQL Workbench.
3. Insert sample data into the tables provided.
4. Run the SQL scripts under `fraud-rules/` individually to detect different fraud types.
5. (Optional) Create and call stored procedures for automated rule scanning.

---

## 📈 Future Improvements
- Automate rule execution with stored procedures and scheduled events.
- Expand to include machine learning-based anomaly detection.
- Add real-world data integration.
- Visualize fraud detection results using Tableau or Power BI dashboards.

---

## 📄 License
This project is open-source and free to use for learning and portfolio purposes.
