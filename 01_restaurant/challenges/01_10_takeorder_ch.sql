-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.

SELECT * FROM Customers
WHERE FirstName = 'Loretta' AND Address = '6939 Elka Place';
-- id = 70

-- Get orders description (Id and price)
SELECT * FROM Dishes
WHERE Name = 'House Salad' OR Name = 'Mini Cheeseburgers' OR Name = 'Tropical Blue Smoothie';
-- cheeseburgers = 4, house salad = 7 and smoothie = 20

INSERT INTO Orders (CustomerID, OrderDate)
VALUES ((SELECT CustomerID FROM Customers
WHERE FirstName = 'Loretta' AND Address = '6939 Elka Place'), '2022-09-20 14:00:00');

--get order ID
SELECT * FROM Orders
WHERE CustomerID = 70 
ORDER BY OrderDate DESC;

--insert into Order Dishes
INSERT INTO OrdersDishes (OrderID, DishID)
VALUES ('1001', (SELECT DishID FROM Dishes
WHERE Name = 'House Salad')), ('1001', (SELECT DishID FROM Dishes
WHERE Name = 'Mini Cheeseburgers')), ('1001', (SELECT DishID FROM Dishes
WHERE Name = 'Tropical Blue Smoothie'));

--get recent orders for Loretta
SELECT * FROM OrdersDishes
ORDER BY OrderID DESC;

-- OR
SELECT * FROM Dishes
JOIN OrdersDishes ON Dishes.DishID = OrdersDishes.DishID
WHERE OrdersDishes.OrderID = 1001;

--Get price of Orders
SELECT SUM(Dishes.Price) as TotalPrice
FROM Dishes
JOIN OrdersDishes ON Dishes.DishID = OrdersDishes.DishID
WHERE OrdersDishes.OrderID = 1001;