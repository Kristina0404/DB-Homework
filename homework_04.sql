--1. Найти мин/стоимость товаров для каждой категории

SELECT CategoryID,
MIN(price) 
As min_price FROM [Products]
Group by CategoryID

--2. Вывести ТОП-3 стран по количеству доставленных заказов

SELECT
Customers.Country,
COUNT(*) AS total_orders
FROM [Orders]
JOIN Customers on Orders.CustomerID = Customers.CustomerID
Group By Customers.CustomerID
ORDER BY total_orders DESC
LIMIT 3

--3. Вывести названия категорий, в которых более 10 товаров

SELECT CategoryName,
count(*) AS total_products
 FROM [Products]
 join Categories on Products.CategoryID= Categories.CategoryID
 Group by Categories.CategoryID
 Having total_products >10

 --4. Очистить тел/номер поставщикам из USA

Update Suppliers
SET
Phone = ' '
Where Country = 'USA'

--5. Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15

SELECT FirstName,LastName,
count(*)
AS total_orders
FROM [Orders]
join Employees on Orders.EmployeeID = Employees.EmployeeID
Group by Employees.EmployeeID
Having total_orders <15
Order by total_orders DESC

--6. Вывести товар, который находится на втором месте по ко-ву заказов

SELECT Products.ProductName,
SUM(OrderDetails.Quantity)
AS sold_count
From OrderDetails
join Products on OrderDetails.ProductID = Products.ProductID
GROUP BY OrderDetails.ProductID
ORDER BY sold_count DESC
Limit 1
OFF SET 1
