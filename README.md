**RETAIL SALES ANALYSIS (SQL PROJECT)**

**PROJECT OVERVIEW**

This project focuses on analyzing retail sales data using **SQL**. The goal is to clean the dataset, explore key insights, and answer critical business questions such as customer behavior, sales trends, best-selling categories & products, and seasonal and time-based patterns.

**DATASET**

The project assumes a table named **`retail_sales`** with the following columns:
- `transaction_id`
- `sale_date`
- `sale_time`
- `customer_id`
- `gender`
- `age`
- `category`
- `quantiy` *(typo in script; should be `quantity`)*
- `price_per_unit`
- `cogs`
- `total_sale`
  
**STEPS PERFORMED**

**1. DATA CLEANING**
- Checked for missing values (`NULL`) in key fields.
- Removed rows with incomplete data.
  
**2. EXPLORATORY DATA ANALYSIS**
- Total number of sales
- Unique customers
- Distinct product categories
  
**3. BUSINESS & DATA ANALYSIS**
SQL queries were written to solve business problems, including:
1. Sales made on a specific date (`2022-11-05`).
2. Transactions of **Clothing** items with quantity ≥ 4 in Nov-2022.
3. Total sales and number of orders for each category.
4. Average age of customers in the **Beauty** category.
5. Transactions with `total_sale > 1000`.
6. Number of transactions by **gender and category**.
7. Average monthly sales and best-selling month per year.
8. Top 5 customers by sales.
9. Unique customers per category.
10. Sales by **shift (Morning, Afternoon, Evening)**.
11. Peak sale times each day.
12. Common best-selling days across 2022 and 2023.

**INSIGHTS YOU CAN DERIVE**
- Which category contributes most to sales.
- Which customers are most valuable.
- Time of day when sales peak.
- Seasonal trends and recurring best-selling days.
  
**HOW TO USE (SQL)**
1. Import your dataset into a database (e.g., PostgreSQL, MySQL).
2. Run the SQL scripts in `RETAIL_sales_analysis.sql`.
3. Modify queries as needed for your database engine (some syntax may vary).

**NOTES (SQL)**
- Replace **`quantiy`** with **`quantity`** if your dataset uses the correct spelling.
- The script is optimized for PostgreSQL functions (`TO_CHAR`, `EXTRACT`), but can be adapted to MySQL or other SQL engines.

---

**RETAIL SALES ANALYSIS DASHBOARD (POWER BI)**

**OVERVIEW**
This dashboard was developed in **Power BI** to visually represent the insights gained from the SQL retail sales analysis. It transforms raw data into an interactive interface that highlights trends, patterns, and key business metrics.

**FEATURES**
- **Sales Overview**: Displays total sales, total orders, and revenue trends.
- **Category Performance**: Identifies best-performing product categories and their share in total revenue.
- **Customer Insights**: Showcases top customers, unique buyers, and demographic breakdowns.
- **Time-Based Analysis**: Reveals sales distribution across days, months, years, and shifts (morning, afternoon, evening).
- **Peak Sales Trends**: Highlights recurring best-selling days across years.

**PURPOSE**
The dashboard complements the SQL analysis by providing a **visual and interactive layer**. It is designed for business users to quickly explore:
- Which categories and customers drive growth
- When sales are at their highest
- Where opportunities exist for improvement

**HOW TO USE (POWER BI)**
1. Open the `RETAILSALE_VISUALS.pbix` file in Power BI Desktop.
2. Connect the dashboard to your retail sales dataset if needed.
3. Interact with the visuals by filtering and drilling down for deeper insights.

**NOTES (POWER BI)**
- The dashboard is based on the same dataset as the SQL project.
- It is meant for demonstration and learning purposes, but can be adapted to real business use cases.
