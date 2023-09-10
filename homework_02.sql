--Вывести название и стоимость в USD одного самого дорогого проданного товара

SELECT ProductName,
Price AS Price_usd
FROM [Products]
Order by Price DESC
LIMIT 1

--Вывести два самых дорогих товара из категории Beverages из USA

SELECT *
FROM [Products]
Join Categories ON Products.CategoryID=Categories.CategoryID
Join Suppliers ON Products.SupplierID= Suppliers.SupplierID
WHERE CategoryName = 'Beverages'
AND Country= 'USA'
Order by Price DESC
LIMIT 2

-- Удалить товары с ценой менее 5 EUR

DELETE FROM [Products]
WHERE Price > 5
ORDER BY Price 

--  Вывести список стран, которые поставляют морепродукты

SELECT DISTINCT Country FROM [Products]
Join Suppliers On Products.SupplierID = Suppliers.SupplierID
Join Categories ON Products.CategoryID = Categories.CategoryId
WHERE CategoryName = 'Seafood'

--Очистить поле ContactName у всех клиентов не из China

UPDATE [Customers]
SET ContactName =' '
WHERE NOT Country = 'China'
