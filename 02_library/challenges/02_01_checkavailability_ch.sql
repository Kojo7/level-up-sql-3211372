-- Determine how many copies of the book 'Dracula'
-- are available for library patrons to borrow.

-- Get all current dracula books
SELECT COUNT(*) FROM Books
WHERE TITLE = 'Dracula';
-- 12, 60, 73 = 3

-- Get all dracula books that has not been returned
SELECT COUNT(Books.Title)
FROM Books
JOIN Loans on Books.BookID = Loans.BookID
WHERE Books.Title = 'Dracula' 
AND Loans.ReturnedDate IS NULL

-- Get Total borrows available to borrow
SELECT
  (SELECT COUNT(*) FROM Books
    WHERE TITLE = 'Dracula') -
  (SELECT COUNT(Books.Title)
    FROM Books
    JOIN Loans on Books.BookID = Loans.BookID
    WHERE Books.Title = 'Dracula' 
    AND Loans.ReturnedDate IS NULL)
  AS AvailableCopies;
  