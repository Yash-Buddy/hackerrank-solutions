– LeetCode 1607: Sellers With No Sales

SELECT seller_name
FROM Seller
WHERE NOT EXISTS (
SELECT 1
FROM Orders
WHERE Orders.seller_id = Seller.seller_id
AND sale_date >= ‘2020-01-01’
AND sale_date < ‘2021-01-01’
)
ORDER BY seller_name ASC;
