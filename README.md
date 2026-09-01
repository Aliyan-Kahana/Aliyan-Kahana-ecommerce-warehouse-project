# Aliyan-Kahana-project
A complete end-to-end data analytics and engineering project analyzing a 12-table relational e-commerce warehouse dataset. This repository demonstrates a production-grade workflow—from raw data ingestion and cleaning in Python to relational database modeling in SQL, ad-hoc financial modeling in Excel, and interactive dashboarding in Power BI.
# Retail & E-Commerce Data Processing & Database Schema

A Python-powered data pipeline and relational database project managing retail operations across 12 core tables.

## 🧹 Data Cleaning Steps

Data preparation and cleaning were executed using Python (Pandas and NumPy) prior to database insertion:

* **Text Standardization:** Converted string columns to lowercase, stripped leading/trailing whitespace, and standardized categorical labels across product categories and customer names.
* **Missing Value Handling:** Identified null values in critical fields, dropping records with missing primary identifiers (e.g., `customer_id`, `product_id`) and imputing safe defaults for optional fields where appropriate.
* **Data Type Casting:** Corrected numerical columns stored as strings (prices, quantities, payment amounts) to proper float/integer types and formatted date-time fields consistently.
* **Duplicate Removal:** Checked for and eliminated duplicate rows across transactional logs and master reference tables to maintain relational integrity.

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

## 📐 Schema Relationship Flow

```text
[Customers] ──< [Orders] ──> [Order_Items] <── [Product]
                    │              │              │
               [Payments]     [Return]       [Categories]
                    │
               [Shipment]
