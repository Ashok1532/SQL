SELECT CustomerName FROM customers;

SELECT ProductName , Price FROM products 
WHERE Price < 15 ;

SELECT FirstName,LastName FROM employees ;

SELECT * FROM orders 
WHERE year(OrderDate) = 1997;

SELECT ProductName,Price FROM products
WHERE Price > 50;

SELECT customers.CustomerName, employees.FirstName, employees.LastName FROM Orders
JOIN customers ON orders.CustomerID = customers.CustomerID
JOIN employees ON orders.EmployeeID = employees.EmployeeID;

SELECT Country, COUNT(*) AS CustomerCount from Customers 
group by Country;

SELECT categories.CategoryName, avg(Price) AS AvgPrice FROM Products
JOIN categories ON products.ProductID = categories.CategoryID
group by categories.CategoryName;

SELECT EmployeeID, count(*) AS OrderCount FROM Orders
group by EmployeeID;

SELECT ProductName FROM products
JOIN suppliers ON products.SupplierID = suppliers.SupplierID
WHERE suppliers.SupplierName like 'Exotic Liquids';

SELECT ProductID, SUM(Quantity) AS TotalOrdered FROM orderdetails
group by ProductID
order by TotalOrdered DESC LIMIT 3;

SELECT customers.CustomerName, SUM(products.Price * orderdetails.Quantity) AS TotalSpent
FROM orders
JOIN customers on orders.CustomerID = customers.CustomerID
JOIN orderdetails on orders.OrderID = orderdetails.OrderID
JOIN products on  orderdetails.ProductID = products.ProductID
group by customers.CustomerName Having TotalSpent > 10000;

SELECT Orders.OrderID, sum( products.price * orderdetails.Quantity) AS OrderValue 
FROM Orders
JOIN orderdetails ON orders.OrderID = orderdetails.OrderID
JOIN products ON orderdetails.ProductID = products.ProductID
GROUP BY orders.OrderID HAVING OrderValue > 2000;

SELECT  products.ProductName FROM products
WHERE products.ProductID NOT IN ( SELECT distinct orderdetails.ProductID FROM orderdetails);