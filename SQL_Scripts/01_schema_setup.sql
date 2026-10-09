-- Create the database
CREATE DATABASE LibraryManagementSystem;
USE LibraryManagementSystem;

-- 1. Create CATEGORIES table (must be created before BOOKS)
CREATE TABLE CATEGORIES (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    description VARCHAR(255)
);

-- 2. Create BOOKS table
CREATE TABLE BOOKS (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publisher VARCHAR(255),
    category_id INT, -- Implements the "belongs to" relationship
    isbn VARCHAR(20) UNIQUE,
    available_copies INT DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES CATEGORIES(category_id)
);

-- 3. Create BOOK_COPIES table
CREATE TABLE BOOK_COPIES (
    copy_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    barcode VARCHAR(50) UNIQUE NOT NULL,
    status VARCHAR(50) DEFAULT 'Available',
    FOREIGN KEY (book_id) REFERENCES BOOKS(book_id) ON DELETE CASCADE
);

-- 4. Create MEMBERS table
CREATE TABLE MEMBERS (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255),
    join_date DATE NOT NULL
);

-- 5. Create ISSUE_RECORDS table
CREATE TABLE ISSUE_RECORDS (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    copy_id INT,
    member_id INT,
    issue_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    fine DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (copy_id) REFERENCES BOOK_COPIES(copy_id),
    FOREIGN KEY (member_id) REFERENCES MEMBERS(member_id)
);
