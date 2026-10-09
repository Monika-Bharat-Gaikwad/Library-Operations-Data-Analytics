-- Insert Categories
INSERT INTO CATEGORIES (category_name, description) VALUES 
('Fiction', 'Literature and stories'),
('Science', 'Physics, Chemistry, and Biology'),
('Technology', 'Computers and Engineering');

-- Insert Books
INSERT INTO BOOKS (title, author, publisher, category_id, isbn, available_copies) VALUES 
('The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 1, '9780743273565', 2),
('Introduction to Algorithms', 'Thomas H. Cormen', 'MIT Press', 3, '9780262033848', 1),
('A Brief History of Time', 'Stephen Hawking', 'Bantam', 2, '9780553380163', 1);

-- Insert Book Copies
INSERT INTO BOOK_COPIES (book_id, barcode, status) VALUES 
(1, 'BC001', 'Available'),
(1, 'BC002', 'Issued'),
(2, 'BC003', 'Issued'),
(3, 'BC004', 'Available');

-- Insert Members
INSERT INTO MEMBERS (name, email, phone, address, join_date) VALUES 
('John Doe', 'john@example.com', '1234567890', '123 Elm St', '2025-01-15'),
('Jane Smith', 'jane@example.com', '0987654321', '456 Oak St', '2025-02-20');

-- Insert Issue Records
INSERT INTO ISSUE_RECORDS (copy_id, member_id, issue_date, due_date, return_date, fine) VALUES 
(2, 1, '2026-09-01', '2026-09-15', '2026-09-14', 0.00),
(3, 1, '2026-09-10', '2026-09-24', NULL, 0.00);


