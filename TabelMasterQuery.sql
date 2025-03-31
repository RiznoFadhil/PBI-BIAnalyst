WITH master_table AS (
  SELECT
  O.Date AS order_date,
  PC.CategoryName AS category_name,
  P.ProdName AS product_name,
  P.Price AS product_price,
  O.Quantity AS order_qty,
  (P.Price * O.Quantity) AS total_sales,
  C.CustomerEmail AS cust_email,
  C.CustomerCity AS cust_city
  FROM
  `pbi-bi-analyst.PBI_BIA.Customers` AS C
  RIGHT JOIN
  `pbi-bi-analyst.PBI_BIA.Orders` AS O
  ON
  C.CustomerID = O.CustomerID
  LEFT JOIN
  `pbi-bi-analyst.PBI_BIA.Products` AS P
  ON
  O.ProdNumber = P.ProdNumber
  RIGHT JOIN
  `pbi-bi-analyst.PBI_BIA.ProductCategory` AS PC
  ON
  P.Category = PC.CategoryID
)

SELECT * FROM master_table
ORDER BY master_table.order_date;

