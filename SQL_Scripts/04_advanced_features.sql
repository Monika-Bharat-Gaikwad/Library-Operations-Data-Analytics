-- Create an abstraction View for stakeholders
CREATE VIEW View_Issued_Book_Details AS
SELECT b.title AS book_title, m.name AS member_name, ir.issue_date, ir.due_date, ir.return_date
FROM ISSUE_RECORDS ir
    JOIN BOOK_COPIES bc ON ir.copy_id = bc.copy_id
    JOIN BOOKS b ON bc.book_id = b.book_id
    JOIN MEMBERS m ON ir.member_id = m.member_id;

-- Optimize search speeds on frequently filtered keys
CREATE INDEX idx_member_id ON ISSUE_RECORDS(member_id);

-- Programmatic Stored Procedure for dynamic queries
DELIMITER //

CREATE PROCEDURE GetBooksIssuedByMember(IN p_member_id INT)
BEGIN
    SELECT b.title, ir.issue_date, ir.due_date, ir.return_date
    FROM ISSUE_RECORDS ir
        JOIN BOOK_COPIES bc ON ir.copy_id = bc.copy_id
        JOIN BOOKS b ON bc.book_id = b.book_id
    WHERE ir.member_id = p_member_id;
END //

DELIMITER ;
