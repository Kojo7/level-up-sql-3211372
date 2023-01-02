-- Return three books to the library using
-- their bar codes.
-- Return date: July 5, 2022
-- Book 1: 6435968624
-- Book 2: 5677520613
-- Book 3: 8730298424

-- Get all books infor from the books table
SELECT * FROM BOOKS
WHERE Barcode IN (6435968624,5677520613,8730298424);

--Get due books to be returned
SELECT Loans.BookID, Loans.ReturnedDate, Books.Barcode
FROM Loans
JOIN Books ON Loans.BookID = Books.BookID
WHERE Books.Barcode IN (6435968624,5677520613,8730298424) 
AND Loans.ReturnedDate IS NULL

-- Update book loans
UPDATE Loans
SET ReturnedDate = '2022-07-05'
WHERE BookID = (SELECT BookID FROM Books 
                WHERE Barcode IN (8730298424)) 
                AND ReturnedDate IS NULL;


--Sanity Check
SELECT Loans.BookID, Loans.ReturnedDate, Books.Barcode
FROM Loans
JOIN Books ON Loans.BookID = Books.BookID
WHERE Books.Barcode IN (6435968624,5677520613,8730298424)
AND Loans.ReturnedDate = '2022-07-05';