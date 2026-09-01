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

An end-to-end relational database analysis project evaluating e-commerce operational data, supply chain logistics, and retail performance metrics using advanced SQL queries

---

## 📊 SQL Data Analysis & Business Queries

- **SQL Script:** [`ecommerce-warehouse-data.sql`](ecommerce-warehouse-data.sql)

## Query Capabilities & Business Logic

* **Multi-Table Joins:** Executed complex multi-level `JOIN` operations across `order_items`, `products`, `categories`, `orders`, `stores`, `payments`, `shipments`, and `employees` tables to synthesize fragmented relational datasets.
* **Advanced Window Functions:** Applied sophisticated window functions including `LAG()` to track historical month-over-month order growth, `DENSE_RANK()` to rank top product sales volumes, and `SUM() OVER()` to calculate percentage revenue contributions.
* **Common Table Expressions (CTEs):** Utilized `WITH` clauses to structure modular, multi-step analytical pipelines, isolating intermediate metrics like category totals and monthly aggregates before final transformations.
* **Conditional Logic & Case Statements:** Implemented dynamic `CASE` statements to segment market performance tiers (e.g., High, Mid, and Growth Value Markets), flag supply chain delivery operational risks, and classify store compensation brackets.
* **Advanced Aggregations & Grouping:** Leveraged core statistical metrics using `SUM()`, `COUNT()`, and `ROUND(AVG())` paired with `GROUP BY`, `ORDER BY`, and `LIMIT` clauses to uncover top revenue drivers and workforce benchmarks.

---

## Analytical Concepts & Implementation Breakdown

### 1. Product Category Revenue & Percentage Contribution
* **Core Concept:** Employs a **Common Table Expression (CTE)** to calculate foundational revenue totals per category, followed by a partitioning window function (`SUM() OVER()`) to evaluate each category's relative weight against total business revenue.
* **Business Value:** Enables stakeholders to instantly distinguish core revenue-generating product lines from underperforming inventory categories.

### 2. Monthly Order Trends & Month-over-Month Growth
* **Core Concept:** Uses date-formatting functions combined with **Window Functions (`LAG()`)** to inspect temporal patterns and compute direct period-over-period delta units.
* **Business Value:** Identifies seasonal demand cycles, peaks, and slumps in order volume to assist in inventory planning and marketing campaign timing.

### 3. Gross Revenue by City Market & Performance Tiers
* **Core Concept:** Merges multi-location store data with financial transaction records through inner joins, classifying performance brackets dynamically using **Conditional Logic (`CASE` statements)**.
* **Business Value:** Highlights top-tier regional markets versus emerging territories, directing regional investment and resource allocation.

### 4. Top Volume Products with Sales Ranking
* **Core Concept:** Aggregates order item quantities grouped by product identifiers, utilizing **Ranking Functions (`DENSE_RANK()`)** to isolate top movement leaders cleanly.
* **Business Value:** Pinpoints high-velocity inventory to prevent stockouts of popular goods and optimize supply chain fulfillment paths.

### 5. Supply Chain Operational Status & Risk Flags
* **Core Concept:** Groups shipment fulfillment metrics by status types and applies conditional evaluation matrices to flag operational bottlenecks.
* **Business Value:** Provides logistics teams with real-time visibility into transit health, highlighting delayed or vulnerable delivery channels.

### 6. Store-Level Employee Compensation Analysis
* **Core Concept:** Computes payroll averages grouped by store IDs using aggregate arithmetic (`ROUND(AVG())`) and segments compensation scales with multi-branch `CASE` logic.
* **Business Value:** Benchmarks labor cost distributions across different geographical locations to support human resources and budgeting strategies.

---

## Technologies Used
* **SQL** (MySQL / SQLite)
* **Relational Database Management Systems (RDBMS)**

---

## How to Use
1. Clone this repository to your local machine
2. Set up your SQL client workspace and initialize your database schema
3. Execute [`ecommerce-warehouse-data.sql`](ecommerce-warehouse-data.sql) to run the queries and inspect the output tables            
