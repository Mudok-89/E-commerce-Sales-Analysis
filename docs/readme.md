# Dataset Documentation

This folder contains the source tables used for the SQL analysis and Power BI dashboard.

The data was obtained from the sample SQL database available in the W3Schools Try-SQL environment:

https://www.w3schools.com/sql/trysql.asp?filename=trysql_asc

The tables were exported to Excel files so they could be imported into Power BI.

## Tables

| File | Description |
|---|---|
| `Categories.xlsx` | Product category information |
| `Customers.xlsx` | Customer information, including country |
| `Employees.xlsx` | Employee information |
| `OrderDetails.xlsx` | Order line items connecting orders and products |
| `Orders.xlsx` | Order information, including customer, employee, shipper and order date |
| `Products.xlsx` | Product information, including price, category and supplier |
| `Shippers.xlsx` | Shipping company information |
| `Suppliers.xlsx` | Supplier information |

## Data Relationships

The main relationships used in the analysis are:

- Customers → Orders
- Employees → Orders
- Shippers → Orders
- Orders → OrderDetails
- Products → OrderDetails
- Categories → Products
- Suppliers → Products

These relationships are also represented in the Power BI data model.

## Data Coverage

The available order data covers the period from **July 1996 to February 1997**.

Therefore, data for 1997 represents only a partial year and should not be interpreted as full-year performance.

## Sales Calculation

Sales are calculated as:

`Quantity × Product Price`

The available `OrderDetails` data does not contain a historical unit price for each order line. The analysis therefore uses the product price available in the `Products` table.

This should be considered a limitation when interpreting historical sales values.
