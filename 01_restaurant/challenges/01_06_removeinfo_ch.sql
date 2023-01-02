-- Remove incorrect information from the database.

-- A customer named Norby has notified us he won't 
-- be able to keep his Friday reservation. 
-- Today is July 24, 2022.

SELECT * FROM Customers
WHERE FirstName LIKE 'Norb%';

SELECT * FROM Reservations
WHERE CustomerID = 64 
AND Date LIKE '2022-07-29%';

DELETE FROM Reservations
WHERE ReservationID = 2000;

SELECT * FROM Reservations
JOIN Customers ON Reservations.CustomerID = Customers.CustomerID
WHERE Customers.FirstName = 'Norby'
AND Reservations.Date > '2022-07-24'