# E-Learning Platform Purchase Analysis Using MySQL

## 1. Project Overview

This project analyzes purchase data from an online learning platform using MySQL. The database stores learner information, course details, and purchase transactions to help management understand learner spending, popular courses, and course category performance.

## 2. Objectives

- Design and create a relational database using MySQL.
- Create tables with primary keys and foreign key relationships.
- Insert sample learner, course, and purchase data.
- Explore data using INNER JOIN, LEFT JOIN, and RIGHT JOIN.
- Analyze learner spending and course sales using SQL queries.
- Identify popular course categories and learner purchasing behavior.

## 3. Technologies Used

- **Database:** MySQL
- **SQL Environment:** MySQL Workbench
- **Language:** Structured Query Language (SQL)

## 4. Database Structure

The project contains three tables:

### learners
Stores learner information.

- `learner_id` – Primary key
- `full_name` – Learner's full name
- `country` – Learner's country

### courses
Stores course information.

- `course_id` – Primary key
- `course_name` – Course name
- `category` – Course category
- `unit_price` – Price per unit

### purchases
Stores course purchase transactions.

- `purchase_id` – Primary key
- `learner_id` – Foreign key referencing learners
- `course_id` – Foreign key referencing courses
- `quantity` – Number of units purchased
- `purchase_date` – Date of purchase

## 5. Sample Dataset

The database contains:

- 5 learners
- 5 courses across multiple categories
- 8 purchase records

The dataset is illustrative and is used for practicing SQL queries and data analysis.

## 6. SQL Analysis Performed

### Data Exploration Using JOINs
- INNER JOIN: Retrieves matching learner, course, and purchase records.
- LEFT JOIN: Displays all learners, including those without purchases.
- RIGHT JOIN: Displays all courses, including those without purchases.

### Analytical Queries
- **Q1:** Calculate each learner's total spending and country.
- **Q2:** Identify the top three courses by total quantity sold.
- **Q3:** Calculate category-wise revenue and the number of unique learners.
- **Q4:** Identify learners who purchased courses from more than one category.
- **Q5:** Find courses that have never been purchased.

## 7. How to Run the Project

1. Install and open MySQL Workbench.
2. Connect to your MySQL server.
3. Open the `elearning_assignment.sql` file.
4. Review the SQL statements.
5. Execute the database creation and table creation statements.
6. Insert the sample data into the three tables.
7. Execute the JOIN queries and analytical queries Q1–Q5.
8. Review the results in the MySQL Workbench Result Grid.

**Note:** If the sample data has already been inserted, do not execute the INSERT statements again without first handling the existing records, as duplicate primary-key errors may occur.

## 8. Key Insights

- The highest-spending learner in the sample is Maria Garcia.
- AI and ML is the highest-revenue course category.
- Machine Learning and Python Programming have the highest quantities sold.
- Four learners purchased courses from more than one category.
- All five courses have at least one purchase in the current sample dataset.

These insights are based only on the sample records and should not be treated as conclusions about a real e-learning platform.

## 9. Recommendations

- Promote high-revenue categories such as AI and ML.
- Use targeted recommendations to encourage learners to explore multiple categories.
- Monitor course sales to identify courses that may need additional promotion.
- Analyze larger datasets over longer periods to obtain more reliable business insights.

## 10. Project Deliverables

The project folder contains:

- `elearning_assignment.sql` – Database schema, sample data, JOIN queries, and analytical queries.
- `E_Learning_Summary_Report.docx` – Summary of key findings, recommendations, and conclusions.
- `README.md` – Project documentation and execution instructions.

## 11. Conclusion

This project demonstrates relational database design, data insertion, SQL JOINs, aggregation, filtering, sorting, and derived calculations. The analysis provides a basic understanding of learner spending, course popularity, and category-wise revenue using MySQL.

