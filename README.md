# E-Commerce Warehouse Project
A complete end-to-end data analytics and engineering project analyzing a 12-table relational e-commerce warehouse dataset. This repository demonstrates a complete workflow—from raw data ingestion and validation in Python to relational database modeling in SQL, pivot-table analysis in Excel, and interactive dashboarding in Power BI.

# Retail & E-Commerce Data Processing & Database Schema

A Python-powered data pipeline and relational database project managing retail operations across 12 core tables.

## 🐍 Python Data Processing & Cleaning Script

The data inspection, cleaning checks, validation, and merging steps were built and executed in Python. You can view the full Jupyter Notebook directly from this repository: 👉 [**View Python Processing Notebook**](https://github.com/Aliyan-Kahana/Aliyan-Kahana-ecommerce-warehouse-project/blob/main/ecommerce_warehouse_1.ipynb)

### Detailed Cleaning Steps:

01. **Inspect Data Structure:** Checked data structure, non-null counts, and initial data types using `df.info()`.
02. **Check Column Names:** Listed the column names of all 12 tables to confirm consistent naming.
03. **Check Duplicate Rows:** Counted fully duplicated rows in every table (0 found).
04. **Remove Extra Spaces:** Stripped leading and trailing whitespace from string fields.
05. **Standardize Text Columns:** Converted text columns to lowercase for uniform casing.
06. **Check Spelling and Inconsistent Categories:** Listed the unique words in every text column to look for typos and fragmented category entries.
07. **Fix Data Types:** Converted `signup_date` and `order_date` to datetime.
08. **Check Invalid Values:** Checked prices, amounts, quantities, and salaries for negative or zero values, and checked 8 foreign-key relationships for orphaned records (0 found).
09. **Check Missing Values and Outliers:** Counted missing values per column (none found) and checked numeric columns for outliers with the IQR method (none found).
10. **Audit Numeric Ranges:** Calculated the minimum, maximum, mean, and a min-max normalized range for every numeric column.
11. **Create New Useful Columns:** Built an `is_returned` flag and calculated the overall and per-product return rate.
12. **Verify Categories:** Merged products with categories, counted products per category, plotted the distribution, and checked for unassigned products.
13. **Check Final Dataset:** Re-checked all tables, merged them into an order-level and an item-level analysis table, and saved the tables to CSV files and to MySQL.

## 🗄️ Database Schema & Architecture

| Table Name        | Description                           | Key Relationships                                                           |
|:------------------|:--------------------------------------|:----------------------------------------------------------------------------|
| **`categories`**  | Product classification hierarchy      | Links to `products`                                                         |
| **`customers`**   | Customer city and signup date         | Links to `orders`                                                           |
| **`employees`**   | Staff records and store assignments   | Links to `stores`                                                           |
| **`stores`**      | Physical or regional store locations  | Links to `employees`, `orders`                                              |
| **`products`**    | Item pricing, category, and supplier  | Links to `categories`, `suppliers`, `order_items`                           |
| **`suppliers`**   | Supplier and vendor information       | Links to `products`                                                         |
| **`orders`**      | Transaction header tracking purchases | Links to `customers`, `stores`, `promotions`, `order_items`, `payments`, `shipments` |
| **`order_items`** | Line items purchased per order        | Links to `orders`, `products`, `returns`                                    |
| **`payments`**    | Financial transactions for orders     | Links to `orders`                                                           |
| **`promotions`**  | Discounts and coupon campaigns        | Links to `orders`                                                           |
| **`shipments`**   | Delivery status per order             | Links to `orders`                                                           |
| **`returns`**     | Returned items and refund logs        | Links to `order_items`                                                      |

```
Customers ──< Orders >── Stores ──< Employees
               │   │
               │   ├──< Payments
               │   ├──< Shipments
               │   └──> Promotions
               │
               └──< Order_Items >── Products >── Categories
                        │               └─────> Suppliers
                        └──< Returns
```

# E-Commerce Warehouse & Retail Performance Analytics

An end-to-end relational database analysis project evaluating e-commerce operational data, supply chain logistics, and retail performance metrics using SQL queries.

* * *

## 📊 SQL Data Analysis & Business Queries

* **SQL Script:** [`ecommerce-warehouse-data.sql`](https://github.com/Aliyan-Kahana/Aliyan-Kahana-ecommerce-warehouse-project/blob/main/ecommerce-warehouse-data.sql)

## Query Capabilities & Business Logic

* **Multi-Table Joins:** Used `JOIN` operations across `order_items`, `products`, and `categories` to calculate revenue by category, and across `orders`, `stores`, and `payments` to calculate revenue by city.
* **Advanced Aggregations & Grouping:** Used `SUM()`, `COUNT()`, and `ROUND(AVG())` with `GROUP BY`, `ORDER BY`, and `LIMIT` to find monthly order counts (`DATE_FORMAT`), the top 5 products by units sold, shipment counts by delivery status, and average salary by store.

* * *

## Technologies Used

* **SQL** (MySQL)
* **Relational Database Management Systems (RDBMS)**

* * *

## 📊 Power BI Interactive Dashboards & Analytics

* **Dashboard Overview:** Comprehensive multi-page visual analysis tracking executive performance, regional customer segments, store operations, staff compensation, and discount impact metrics across the e-commerce warehouse network.

## Key Power BI Features & Modeling

* **Star Schema Architecture:** Structured tables into an optimized dimensional star schema, connecting centralized fact logs to surrounding lookup dimensions for streamlined relationship filtering.
* **Data Modeling & DAX:** Built custom DAX measures for Gross Sales, Net Revenue, Total Orders, Average Product Price, Return Rate, Total Customers, Revenue by Customer, Store Revenue, Average Employee Salaries, Total Salaries, Total Refunds, and Revenue by Promotion.
* **Interactive Filtering & Slicers:** Enabled dynamic cross-filtering by order dates, cities, product categories, price ranges, signup dates, salary tiers, and promotion IDs.
* **Executive Visualizations:** Designed custom visual layouts highlighting order status breakdowns, category sales distributions, regional revenues, store performance metrics, and promotion efficiency trends.

* * *

## Technologies Used

* **Power BI**
* **Relational Database Management Systems (RDBMS)**

## 📈 Excel Analytics & Market Reporting

* **Excel Files:** [Download Order Level Analysis File](https://docs.google.com/uc?export=download&id=1BpT7pWSH5lEYTxzFBUfWjng3IDX1JaPU) | [Download Regional Sales File](https://docs.google.com/uc?export=download&id=1fKEM0MK2tEr_IfODodM8HU0pPyPtphgX)

## Advanced Formulas, Pivot Tables & Data Analysis

* **Multi-Dimensional Pivot Tables & Grouping:** Structured complex multi-level Pivot Tables to aggregate transactional metrics across key regional hubs (`bangalore`, `delhi`, `mumbai`, and `pune`), tracking over 300,000 total orders and billions in cumulative financial volume.
* **Temporal & Longitudinal Trend Analysis:** Monitored yearly order distribution patterns and transaction velocity from 2020 through 2024, utilizing stacked pivot charts to compare regional market contributions over time.
* **Advanced Formulas & Data Retrieval (`XLOOKUP`):** Applied lookup formulas to retrieve values from the analysis tables without altering source tables.
* **Complex Aggregations & Calculations (`AVERAGEIFS`, `SUMPRODUCT`):** Evaluated category-specific gross sales, unit quantities (across Cat_1 to Cat_30), and average transaction amounts by city.
* **Dynamic KPI Formatting & Interactive Visualizations:** Designed custom pivot charts and conditional formatting rules linked to interactive slicers to highlight top-performing product categories, discount efficiencies, and regional sales performance.

## Dashboard Screenshots

### 1. Executive Overview & Product Performance

![Executive Overview](https://github.com/Aliyan-Kahana/Aliyan-Kahana-ecommerce-warehouse-project/raw/main/images/Screenshot%202026-09-01%20151518.png)

### 2. Customer Segmentation & Regional Insights

![Customer Segmentation](https://github.com/Aliyan-Kahana/Aliyan-Kahana-ecommerce-warehouse-project/raw/main/images/Screenshot%202026-09-01%20151528.png)

### 3. Store Operations & Staff Performance

![Store Operations](https://github.com/Aliyan-Kahana/Aliyan-Kahana-ecommerce-warehouse-project/raw/main/images/Screenshot%202026-09-01%20151537.png)

### 4. Discount Impact & Returns Audit

![Discount Impact](https://github.com/Aliyan-Kahana/Aliyan-Kahana-ecommerce-warehouse-project/raw/main/images/Screenshot%202026-09-01%20151552.png)

### Excel Screenshots

#### 1. Pivot Tables & Summary Layouts (Part 1)

![Pivot Tables 1 Preview](https://github.com/Aliyan-Kahana/Aliyan-Kahana-ecommerce-warehouse-project/raw/main/excel%20images/Screenshot%202026-09-01%20152854.png)

#### 2. Pivot Tables & Summary Layouts (Part 2)

![Pivot Tables 2 Preview](https://github.com/Aliyan-Kahana/Aliyan-Kahana-ecommerce-warehouse-project/raw/main/excel%20images/Screenshot%202026-09-01%20152900.png)

#### 3. Pivot Tables & Summary Layouts (Part 3)

![Pivot Tables 3 Preview](https://github.com/Aliyan-Kahana/Aliyan-Kahana-ecommerce-warehouse-project/raw/main/excel%20images/Screenshot%202026-09-01%20152916.png)

#### 4. Pivot Tables & Summary Layouts (Part 4)

![Pivot Tables 4 Preview](https://github.com/Aliyan-Kahana/Aliyan-Kahana-ecommerce-warehouse-project/raw/main/excel%20images/Screenshot%202026-09-01%20153011.png)

## Key Metrics

* **Source tables:** 12 tables (categories, customers, employees, orders, order_items, payments, products, promotions, returns, shipments, stores, suppliers)
* **Analysis tables:** Two tables were created in Python: an order-level analysis table and an item-level analysis table
* **Total Rows:** order-level analysis (300,000 rows) and item-level analysis (600,000 rows)
* **Total Columns:** order-level analysis (13 columns) and item-level analysis (16 columns)
* **Purpose:** the order-level table gives data about orders, and the item-level table gives data about the items in those orders
