# Aliyan-Kahana-project
A complete end-to-end data analytics and engineering project analyzing a 12-table relational e-commerce warehouse dataset. This repository demonstrates a production-grade workflow—from raw data ingestion and cleaning in Python to relational database modeling in SQL, ad-hoc financial modeling in Excel, and interactive dashboarding in Power BI.
# Retail & E-Commerce Database Schema

A relational database structure designed to manage retail operations across 12 core tables.

## 🗄️ Database Architecture & Tables

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
