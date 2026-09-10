# E-commerce Sales Analysis

Portfolio data analytics project focused on sales performance analysis using SQL and Power BI.

The project is based on the Northwind sample database and was originally created as a Data Analyst case study. It was later refactored based on review feedback with a focus on SQL readability, consistent naming, data validation and clearer business purpose of the Power BI dashboard.

## Project Objectives

The goal of the project is to demonstrate the ability to:

- analyze relational data using SQL,
- understand data relationships and granularity,
- validate analytical results,
- create business-oriented metrics,
- build an interactive Power BI dashboard,
- translate data into clear business insights.

## SQL Analysis

The SQL part includes:

- duplicate ProductName validation,
- total sales analysis by country,
- order analysis by shipper and product category,
- employee sales performance analysis,
- product category performance analysis.

The queries use explicit JOIN conditions, table aliases and consistent English naming to improve readability.

Special attention is paid to data granularity. For example, DISTINCT is used when counting orders from OrderDetails to avoid counting multiple order lines as separate orders.

## Dataset

The project uses the sample SQL database available in the W3Schools Try-SQL environment.

The database is based on the Northwind sample dataset and contains the following tables:

- Customers
- Orders
- OrderDetails
- Products
- Categories
- Employees
- Shippers
- Suppliers

**Data source:** W3Schools Try-SQL Editor   https://www.w3schools.com/sql/trysql.asp?filename=trysql_asc

## Power BI Dashboard

The Power BI report is designed as a one-page **Sales Performance Dashboard** for a Sales / Commercial Manager.

The dashboard answers four main business questions:

- What is the overall sales performance?
- Which countries generate the most sales?
- How are sales developing over time?
- How are individual employees performing?

### Key Metrics

- Total Sales
- Orders
- Average Order Value
- Units Sold

### Visualizations

- Sales by Country
- Monthly Sales Trend
- Employee Performance

The dashboard supports interactive filtering by:

- Date
- Country
- Category

All relevant KPIs and visualizations respond to the selected filter context.

## Data Coverage and Limitations

The available order data covers the period from **July 1996 to February 1997**.

Therefore, 1997 represents only a partial year and should not be interpreted as full-year performance.

Sales are calculated as:

`Quantity × Product Price`

The dataset does not contain the historical product price at the time of each order. Therefore, the analysis assumes that the price stored in the Products table can be used for the sales calculation.

## Tools

- SQL
- Power BI
- DAX
- Power Query
- Excel

## Repository Structure

```text
├── SQL/
│   └── analytical_queries.sql
│
├── dashboard/
│   ├── Sales_Performance_Dashboard.pbix
│   └── Sales_Performance_Dashboard.JPG
│
├── docs/
│   ├── Categories.xlsx
│   ├── Customers.xlsx
│   ├── Employees.xlsx
│   ├── OrderDetails.xlsx
│   ├── Orders.xlsx
│   ├── Products.xlsx
│   ├── Shippers.xlsx
│   ├── Suppliers.xlsx
│   └── readme.md
│
├── Data Analyst Case Study
├── LICENSE
└── README.md
