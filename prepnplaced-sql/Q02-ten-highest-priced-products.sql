SELECT 
      ProductID, Product, Brand, Sale_Price
FROM products
WHERE Sale_Price IS NOT NULL
ORDER BY Sale_Price DESC, ProductID
LIMIT 10;
