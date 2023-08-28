
--Приведите десять типовых бизнес-процессов 
--для предметной области ВИДЕО-ХОСТИНГ (Youtube), 
--а также их соответствие по CRUD.

--1. поиск видео -> read
--2. регистрация пользователя -> create
--3. авторизация -> read
--4. смена аккаунта -> update
--5. добавление платных подписок --> create
--6. оплата -->update
--7. удаление после оплаты --> delete
--8. сортиовка видео по темам --> update
--9. cкачивание видео  -->  ???? (может create)
--10. выложить видео --> create

-- Вывести название и стоимость товаров от 20 EUR.

SELECT ProductName,Price 
FROM [Products]
WHERE Price >= 20

--Вывести страны поставщиков.

SELECT DISTINCT Country 
FROM [Suppliers]

--В упорядоченном по стоимости виде вывести название
-- и стоимость товаров от всех поставщиков, кроме поставщика 1.

SELECT ProductName,
		Price
        FROM [Products]
        WHERE NOT SupplierID = 1
        ORDER BY Price ASC


--Вывести контактные имена клиентов, кроме тех, что из France и USA.

SELECT ContactName FROM [Customers]
WHERE NOT Country IN ('France','USA')