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
