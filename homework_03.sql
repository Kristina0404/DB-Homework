-- Вывести ко-во заказов, которое компания Speedy Express
-- доставила в Brazil

SELECT count(*) FROM [OrderDetails]
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
JOIN Orders ON OrderDetails.OrderID= Orders.OrderID
WHERE Shippers.ShipperName= 'Speedy Express'
AND Customers.Country = 'Brazil'

--Вывести ко-во поставщиков не из UK и не из China

SELECT count(*) FROM [Suppliers]
AS total_not_uk_china
where not Country in ('UK','China')

--Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5

SELECT AVG(Price)
AS avg_price,
MAX(Price)
As max_price,
MIN(Price)
As min_price,
count(*)
AS total_products
FROM [Products]
where CategoryID in (3,5)

-- Вывести общую сумму проданных товаров

SELECT sum(Products.Price * OrderDetails.Quantity)
AS total_order_cost
FROM [OrderDetails]
join Products on OrderDetails.ProductID = Products.ProductID

--Вывести ко-во стран, которые поставляют напитки

SELECT count(Distinct Country)
As count_country FROM [Products]
join Suppliers on Products.SupplierID = Suppliers.SupplierID
join Categories on Products.CategoryID= Categories.CategoryID
where CategoryName = 'Beverages'

--Вывести сумму, на которую было отправлено товаров клиентам в Germany

SELECT sum(Price * OrderDetails.Quantity)
As total_sum
FROM [OrderDetails]
join Products on OrderDetails.ProductID = Products.ProductID
join Orders on OrderDetails.OrderID = Orders.OrderID
join Categories on OrderDetails.CategoryID = Categories.CategoryID
//join Suppliers on Products.SupplierID= Suppliers.SupplierID
where Country='Germany'
