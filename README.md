# Aliyan-Kahana-project
A complete end-to-end data analytics and engineering project analyzing a 12-table relational e-commerce warehouse dataset. This repository demonstrates a production-grade workflow—from raw data ingestion and cleaning in Python to relational database modeling in SQL, ad-hoc financial modeling in Excel, and interactive dashboarding in Power BI.
# Retail & E-Commerce Data Processing & Database Schema

A Python-powered data pipeline and relational database project managing retail operations across 12 core tables.

## 🐍 Python Data Processing & Cleaning Script

The complete data cleaning, feature engineering, and validation pipeline was built and executed in Python. You can view the full Jupyter Notebook directly from this repository:
👉 **[View Python Processing Notebook](ecommerce_warehouse_1.ipynb)**

### Detailed Cleaning Steps:
1. **Inspect Data Structure:** Checked data structure, non-null counts, and initial data types using `df.info()`.
2. **Fix Column Names:** Standardized header naming conventions for consistency.
3. **Remove Duplicate Rows:** Filtered out redundant records to prevent data skew.
4. **Remove Extra Spaces:** Stripped leading and trailing whitespace from string fields.
5. **Standardize Text and Numeric Columns:** Ensured uniform casing and formatting for text and numerical attributes.
6. **Fix Spelling Errors and Inconsistent Categories:** Corrected typos and unified fragmented category entries.
7. **Fix Data Types:** Converted columns to their appropriate types (e.g., strings, floats, datetimes).
8. **Handle Invalid Values:** Identified and corrected out-of-range or logically impossible entries.
9. **Handle Missing Values and Outliers:** Managed null entries and statistical anomalies.
10. **Drop Unnecessary Columns:** Removed redundant or uninformative fields from the dataset.
11. **Create New Useful Columns:** Executed feature engineering to generate derived metrics and attributes.
12. **Verify Categories:** Audited categorical distributions to ensure clean data integrity.
13. **Check Final Dataset:** Conducted final validation checks before database storage and querying.

## 🗄️ Database Schema & Architecture

| Table Name | Description | Key Relationships |
| :--- | :--- | :--- |
| **`categories`** | Product classification hierarchy | Links to `product` |
| **`customers`** | Customer contact and profile data | Links to `orders` |
| **`employees`** | Staff records and store assignments | Links to `store`, `orders` |
| **`store`** | Physical or regional store locations | Links to `employees`, `orders` |
| **`product`** | Item inventory, pricing, and details | Links to `categories`, `order_items`, `supplies` |
| **`supplies`** | Supplier and vendor information | Links to `product` |
| **`orders`** | Transaction header tracking purchases | Links to `customers`, `employees`, `store`, `promotion` |
| **`order_items`** | Line items purchased per order | Links to `orders`, `product` |
| **`payments`** | Financial transactions for orders | Links to `orders` |
| **`promotion`** | Discounts and coupon campaigns | Links to `orders` |
| **`shipment`** | Delivery and carrier tracking status | Links to `orders` |
| **`return`** | Returned items and refund logs | Links to `order_items` |


[Customers] ──< [Orders] ──> [Order_Items] <── [Product]
                    │              │              │
               [Payments]     [Return]       [Categories]
                    │
               [Shipment]
               

# E-Commerce Warehouse & Retail Performance Analytics

An end-to-end relational database analysis project evaluating e-commerce operational data, supply chain logistics, and retail performance metrics using advanced SQL queries.

---

## 📊 SQL Data Analysis & Business Queries

- **SQL Script:** [`ecommerce-warehouse-data.sql`](ecommerce-warehouse-data.sql)

## Query Capabilities & Business Logic

* **Multi-Table Joins:** Executed complex multi-level `JOIN` operations across `order_items`, `products`, `categories`, `orders`, `stores`, `payments`, `shipments`, and `employees` tables.
* **Advanced Window Functions:** Applied `LAG()`, `DENSE_RANK()`, and `SUM() OVER()` to track historical growth, rank sales volumes, and calculate revenue percentages.
* **Common Table Expressions (CTEs):** Utilized `WITH` clauses to structure modular, multi-step analytical pipelines before final transformations.
* **Conditional Logic & Case Statements:** Implemented dynamic `CASE` statements to segment market performance tiers, flag delivery risks, and classify compensation brackets.
* **Advanced Aggregations & Grouping:** Leveraged core statistical metrics using `SUM()`, `COUNT()`, and `ROUND(AVG())` with `GROUP BY`, `ORDER BY`, and `LIMIT` clauses.

---

## Technologies Used
* **SQL** (MySQL / SQLite)
* **Relational Database Management Systems (RDBMS)**
* # E-Commerce Warehouse & Retail Performance Analytics

An end-to-end relational database analysis project evaluating e-commerce operational data, supply chain logistics, and retail performance metrics using advanced SQL queries.

---

## 📊 Power BI Interactive Dashboards & Analytics

- **Dashboard Overview:** Comprehensive multi-page visual analysis tracking executive performance, regional customer segments, store operations, staff compensation, and discount impact metrics across the e-commerce warehouse network.

## Key Power BI Features & Modeling
* **Star Schema Architecture:** Structured tables into an optimized dimensional star schema, connecting centralized fact logs to surrounding lookup dimensions for streamlined relationship filtering.

* **Data Modeling & DAX:** Built custom DAX measures for Gross Sales, Net Revenue, Total Orders, Average Product Price, Return Rate, Total Customers, Revenue per Customer, Store Revenue, Average Employee Salaries, Total Salaries, Total Refunds, and Revenue by Promotion.
* **Interactive Filtering & Slicers:** Enabled dynamic cross-filtering by order dates, cities, product categories, price ranges, signup dates, salary tiers, and discount percentages.
* **Executive Visualizations:** Designed custom visual layouts highlighting order status breakdowns, category sales distributions, regional revenues, store performance metrics, and promotion efficiency trends.

---

## Technologies Used
* **Power BI**
* **Relational Database Management Systems (RDBMS)**
* ## 📈 Excel Analytics & Market Reporting
- **Excel Files:** [Download Order Level Analysis File](https://docs.google.com/uc?export=download&id=1BpT7pWSH5lEYTxzFBUfWjng3IDX1JaPU) | [Download Regional Sales File](https://docs.google.com/uc?export=download&id=1fKEM0MK2tEr_IfODodM8HU0pPyPtphgX)
## Advanced Formulas, Pivot Tables & Data Analysis

* **Multi-Dimensional Pivot Tables & Grouping:** Structured complex multi-level Pivot Tables to aggregate transactional metrics across key regional hubs (`bangalore`, `delhi`, `mumbai`, and `pune`), tracking over 300,000 total orders and billions in cumulative financial volume.
* **Temporal & Longitudinal Trend Analysis:** Monitored yearly order distribution patterns and transaction velocity from 2020 through 2024, utilizing stacked pivot charts to compare regional market contributions over time.
* **Advanced Formulas & Data Retrieval (`XLOOKUP`, `COALESCE`):** Applied advanced lookup and conditional functions to dynamically merge warehouse inventory records, customer attributes, and pricing specifications without altering source tables.
* **Complex Aggregations & Calculations (`AVERAGEIFS`, `SUMPRODUCT`):** Leveraged robust mathematical and logical formulas to evaluate category-specific gross sales, unit quantities (e.g., across Cat_1 to Cat_30), and average transaction amounts across diverse operational brackets.
* **Dynamic KPI Formatting & Interactive Visualizations:** Designed custom pivot charts and conditional formatting rules linked to interactive slicers to highlight top-performing product categories, discount efficiencies, and regional sales performance.
* ### Excel Pivot Tables & Visualizations Analysis

Here are the markdown image embeds and code snippets formatted so you can easily copy and paste them directly into your GitHub repository's `README.md` file.

#### 1. City-Wise Financial Summary & Order Trends
```markdown
![City-Wise Financial and Order Count Summary](path/to/images/Screenshot%202026-09-01%20152854.png)
![Yearly Breakdown and Stacked Order Distribution by City](path/to/images/Screenshot%202026-09-01%20152900.png)
![Granular Row Labels and Dual-Metric Analysis](path/to/images/Screenshot%202026-09-01%20152916.png)
![Category-Wise Quantity and Gross Sales Summary](path/to/images/Screenshot%202026-09-01%20153011.png)
### 1. Executive Overview & Product Performance
![Executive Overview](https://github.com/Aliyan-Kahana/Aliyan-Kahana-project/blob/main/images/Screenshot%202026-09-01%20151518.png)

### 2. Customer Segmentation & Regional Insights
![Customer Segmentation](https://github.com/Aliyan-Kahana/Aliyan-Kahana-project/blob/main/images/Screenshot%202026-09-01%20151528.png)

### 3. Store Operations & Staff Performance
![Store Operations](https://github.com/Aliyan-Kahana/Aliyan-Kahana-project/blob/main/images/Screenshot%202026-09-01%20151537.png)

### 4. Discount Impact & Returns Audit
![Discount Impact](https://github.com/Aliyan-Kahana/Aliyan-Kahana-project/blob/main/images/Screenshot%202026-09-01%20151552.png)
