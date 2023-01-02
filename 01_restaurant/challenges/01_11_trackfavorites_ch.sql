-- Update information in the database.

-- Set Cleo Goldwater's favorite dish to
-- the Quinoa Salmon Salad.

SELECT * FROM Customers
WHERE FirstName LIKE 'Cleo%';
-- fav. dish ID = 14 and customerId is 42

--get fav. dish with ID
SELECT * FROM Dishes
WHERE DishID = 14;
-- current fav. dish is Fiest Family Platter

-- Get Quinoa Salmon salad dish Id
SELECT * FROM Dishes
WHERE NAME LIKE 'Quinoa%';
-- Dish id for Quinoa salad is 9

-- update Cleo favourite dish
UPDATE Customers
SET
  FavoriteDish = 9
WHERE 
  CustomerID = 42;

-- sanity check if fav. dish is changed
SELECT * FROM Customers
WHERE CustomerID = 42;

-- OR
SELECT Customers.FirstName, Customers.LastName, Customers.FavoriteDish, Dishes.Name
FROM Customers 
JOIN Dishes ON Customers.FavoriteDish = Dishes.DishID
ORDER BY Customers.FirstName;
