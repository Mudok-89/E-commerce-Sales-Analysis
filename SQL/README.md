# SQL Analysis

This folder contains the SQL queries used in the E-commerce Sales Analysis project.

The analysis was performed using the sample SQL database provided through the W3Schools Try-SQL environment.

## Analysis

### 1. Duplicate Product Names

The `Products` table was checked for duplicate `ProductName` values.

**Result:** No duplicate product names were found.

### 2. Total Order Value by Country

Total order value was calculated for each country using:

`Quantity × Product Price`

Only countries with a total order value greater than 100 were included, and the results were ranked from highest to lowest.

### 3. Seafood and Beverages Orders by Shipper

The analysis compares the number of orders containing products from the `Seafood` and `Beverages` categories for each shipper in 1997.

`COUNT(DISTINCT OrderID)` is used because a single order can contain multiple order lines from the same category. Without `DISTINCT`, order lines would be counted instead of unique orders.

### 4. Employee Performance

Employee performance was analyzed using:

- Total Sales
- Order Count
- Average Order Value

The calculation first aggregates sales at the order level and then evaluates employee performance. This ensures that Average Order Value represents the average value of individual orders.

**Result:** Margaret Peacock generated the highest sales in the available 1997 data, while Janet Leverling handled the highest number of orders.

### 5. Product Category Performance

Product categories were compared using:

- Total Sales
- Units Sold
- Order Count

**Result:** Beverages generated the highest sales, while Confections had the highest number of units sold in the available 1997 data.

## Important Data Limitation

The available data for 1997 only covers January to February. Therefore, results described as "1997" represent the available 1997 data rather than a complete calendar year.
