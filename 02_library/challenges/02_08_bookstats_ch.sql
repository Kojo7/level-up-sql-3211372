-- Create two reports about book statistics.

-- Report 1: Show how many titles were published 
-- in each year.

-- Report 2: Show the five books that have been
-- checked out the most.

SELECT Published, COUNT(DISTINCT(Title)) as PublishedCount, GROUP_CONCAT(DISTINCT(Title)) as Title
FROM BOOKS
GROUP BY Published
ORDER BY PublishedCount DESC;

SELECT COUNT(Loans.LoanID) AS TopFive, Books.Title, Books.Author, Books.Published
FROM Loans
JOIN Books ON Loans.BookID = Books.BookID
GROUP BY Books.Title
ORDER BY TopFive DESC
LIMIT 5;
