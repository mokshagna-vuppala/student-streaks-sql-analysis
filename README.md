# 📈 Student Streaks SQL Analysis

## 🎯 Overview
In any learning platform or digital application, consistent user engagement is a key metric for success. This project, **Student Streaks SQL Analysis**, dives into user activity data to identify our "power users"—specifically, students who have maintained an unbroken active streak for 30 consecutive days or more. 

## 🧠 The Technical Approach: Gaps and Islands
While it is possible to solve this problem using older, row-by-row procedural logic (like user-defined variables), this project takes a more modern, highly optimized approach using the **Gaps and Islands** problem-solving technique in SQL.

By leveraging **Window Functions**, we can cleanly partition the data chronologically and isolate unbroken sequences of activity without relying on clunky iterative loops. 

**Key SQL Concepts Showcased:**
* **Common Table Expressions (CTEs):** Used to stage and logically group the sequential data for better readability.
* **Window Functions (`ROW_NUMBER()`):** Utilized to assign chronological row numbers, allowing us to mathematically group consecutive days of `streak_active = 1`.
* **Aggregation & Filtering (`HAVING`):** Used to extract only the top-tier users hitting the specific 30+ day threshold.

## 📂 Repository Contents
This repository contains everything needed to recreate the database, understand the logic, and view the final analytics:

* 🛠️ `user_streaks_database.sql`: The complete schema and data dump to initialize the local environment.
* 💻 `longest_streaks_optimized.sql`: The main analytical query utilizing the CTE and Window Function approach.
* 📊 `results.csv`: The full data export containing every user ID that successfully met the 30+ day streak criteria.
* 🖼️ `db_setup.png` & `table_overview.png`: Visual documentation proving successful local database initialization and structure.

## 🏆 Top Performers (Data Sneak Peek)
Because the final output contains many highly engaged users, the complete dataset has been exported to `results.csv`. Below is a quick preview of the top 5 students with the longest active streaks:

| User ID | Max Streak Length |
| :--- | :--- |
| **244135** | 32 Days |
| **293843** | 32 Days |
| **181776** | 32 Days |
| **242014** | 32 Days |
| **427200** | 32 Days |

*(Please refer to the `results.csv` file for the comprehensive list of all qualifying users.)*

---
