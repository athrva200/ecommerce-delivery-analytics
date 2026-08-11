# E-Commerce Delivery Analytics Dashboard
<img width="859" height="478" alt="image" src="https://github.com/user-attachments/assets/fcdb3d00-d7e9-4a43-9c89-2b2f7f2418fe" />

An end-to-end data analytics project analyzing e-commerce delivery data using SQL and Power BI.

## Project Overview

This project analyzes 100K+ e-commerce orders across multiple delivery platforms to understand revenue performance, customer purchasing behavior, product-category performance, delivery metrics, and refund patterns.

The analysis was performed using SQL, followed by the development of an interactive Power BI dashboard.

## Business Objective

The objective of this project is to identify key patterns in e-commerce operations and provide business insights that can help evaluate platform performance, customer spending, product categories, and delivery efficiency.

## Key Business Questions

- Which platform generates the highest revenue?
- Which product categories generate the most revenue?
- Which categories have the highest average order value?
- Which customers have the highest total spending?
- What is the average order value across platforms?
- What percentage of orders are refunded?
- What percentage of orders are delayed?
- How do platforms compare in terms of revenue, orders, delivery time, and service ratings?

## Tools & Technologies

- SQL
- Power BI
- DAX
- Excel

## SQL Analysis

SQL was used to perform:

- Aggregation and grouping
- Revenue and order analysis
- Customer spending analysis
- Platform comparison
- Product-category analysis
- CASE statements
- Conditional calculations
- Percentage calculations
- HAVING and ORDER BY analysis

## Power BI Dashboard

The Power BI dashboard provides an interactive view of:

- Total Revenue
- Total Orders
- Unique Customers
- Average Order Value
- Average Delivery Time
- Average Service Rating
- Refund Rate
- Revenue by Platform
- Revenue by Product Category
- Average Order Value by Product Category

## Key Insights

- Swiggy Instamart generated the highest total revenue among the platforms.
- Platform revenue and operational performance were relatively similar across the three platforms.
- Personal Care generated the highest revenue among product categories.
- Personal Care also had the highest average order value at approximately ₹1,052.
- Snacks had the lowest average order value at approximately ₹273.
- Product categories had relatively similar order volumes despite significant differences in revenue.
- Refund rates were approximately 46% across all three platforms, with limited variation.

## Project Files

- `ecommerce_delivery_analytics.csv` - Dataset used for analysis
- `ecommerce_analysis.sql` - SQL queries used for analysis
- `E-Commerce Delivery Analytics Dashboard.pbix` - Power BI dashboard
- `README.md` - Project documentation

## Conclusion

The analysis shows that product-category mix has a stronger impact on revenue and order value than differences between delivery platforms. Personal Care emerged as the strongest category in terms of revenue and average order value, while platform-level performance remained relatively balanced.

