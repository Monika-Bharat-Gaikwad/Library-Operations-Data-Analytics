SELECT * FROM BOOKS;

SELECT * FROM BOOKS 
WHERE author = 'Stephen Hawking';

SELECT * FROM MEMBERS;

SELECT ir.issue_id, b.title, m.name AS member_name, ir.issue_date, ir.due_date 
FROM ISSUE_RECORDS ir
    JOIN BOOK_COPIES bc
        ON ir.copy_id = bc.copy_id
    JOIN BOOKS b 
        ON bc.book_id = b.book_id
    JOIN MEMBERS m 
        ON ir.member_id = m.member_id;


SELECT DISTINCT b.title, b.author 
FROM BOOKS b
    JOIN BOOK_COPIES bc ON b.book_id = bc.book_id
WHERE bc.status = 'Available';


SELECT b.title, bc.barcode, ir.issue_date 
FROM ISSUE_RECORDS ir
    JOIN BOOK_COPIES bc 
        ON ir.copy_id = bc.copy_id
    JOIN BOOKS b 
        ON bc.book_id = b.book_id
WHERE ir.return_date IS NULL;


SELECT c.category_name, COUNT(b.book_id) AS total_books
FROM CATEGORIES c
    LEFT JOIN BOOKS b  
        ON c.category_id = b.category_id
GROUP BY c.category_id, c.category_name;


SELECT m.member_id, m.name, COUNT(ir.issue_id) AS books_issued
FROM MEMBERS m
    JOIN ISSUE_RECORDS ir 
        ON m.member_id = ir.member_id
GROUP BY m.member_id, m.name
HAVING COUNT(ir.issue_id) > 2;


SELECT b.title, m.name AS member_name, ir.due_date
FROM ISSUE_RECORDS ir
    JOIN BOOK_COPIES bc 
        ON ir.copy_id = bc.copy_id
    JOIN BOOKS b 
        ON bc.book_id = b.book_id
    JOIN MEMBERS m 
        ON ir.member_id = m.member_id
WHERE ir.return_date IS NULL AND ir.due_date < CURDATE();


SELECT b.title, COUNT(ir.issue_id) AS times_issued
FROM ISSUE_RECORDS ir
    JOIN BOOK_COPIES bc 
        ON ir.copy_id = bc.copy_id
    JOIN BOOKS b 
        ON bc.book_id = b.book_id
GROUP BY b.book_id, b.title
ORDER BY times_issued DESC;
