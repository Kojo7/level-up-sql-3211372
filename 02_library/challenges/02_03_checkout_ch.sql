-- Check out two books for Jack Vaan (jvaan@wisdompets.com).
-- Book 1: The Picture of Dorian Gray, 2855934983
-- Book 2: Great Expectations, 4043822646
-- The checkout date is August 25, 2022 and the 
-- due date is September 8, 2022.

-- Get Patron Id
SELECT * FROM Patrons
WHERE LastName LIKE 'Vaan';
--id = 50

-- Get books id by barcode
SELECT * FROM Books
WHERE Barcode = 2855934983 or Barcode = 4043822646;
-- 11 , 93

--Get books info from LOANS 
SELECT * FROM Loans
WHERE BookID = 11 OR BookID = 93

-- Get patrons borrowed books
SELECT Patrons.FirstName, Patrons.LastName, Patrons.Email, Loans.BookID, Loans.PatronID
FROM Patrons
JOIN Loans ON Patrons.PatronID = Loans.PatronID
WHERE Patrons.PatronID = 50;

--Check out books to patron
INSERT INTO Loans (BookID, PatronID, LoanDate, DueDate)
VALUES (11,50,'2022-08-25','2022-09-08'),(93,50,'2022-08-25','2022-09-08');

-- Sanity check to see if books have been checked out to patron
SELECT Loans.BookID, Loans.PatronID, Books.Title, Loans.LoanDate, Loans.DueDate, Loans.ReturnedDate
FROM Loans
JOIN Books ON Loans.BookID = Books.BookID
WHERE Loans.PatronID = 50