-- Create a list of books to feature in an exhibit.

-- Make a pick list of books published from 1890-1899 
-- which are not currently checked out.

SELECT DISTINCT Books.Title, Books.Author, Books.Published, Books.Barcode, Loans.BookID
FROM Books
JOIN Loans ON Books.BookID = Loans.BookID
WHERE Books.Published BETWEEN '1890' AND '1899'
AND Loans.ReturnedDate IS NOT NULL
ORDER BY Books.Title ASC;

-- OR 

SELECT Title, Barcode
FROM Books
WHERE Published BETWEEN '1890' AND '1899'
AND (BookID NOT IN (
      SELECT BookID FROM Loans
      WHERE ReturnedDate IS NULL
      )
)
ORDER BY Title;

