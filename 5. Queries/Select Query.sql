USE BookHub;

-- Retrieve all books' by a specific author with publisher and category
SELECT b.title, b.isbn, b.price, b.published_date, p.publisher_name, c.category_name
FROM books b
INNER JOIN book_authors ba ON b.book_id = ba.book_id
INNER JOIN authors a ON ba.author_id = a.author_id
INNER JOIN publishers p ON b.publisher_id = p.publisher_id
INNER JOIN categories c ON b.category_id = c.category_id
WHERE a.author_name = 'George Orwell';

-- Retrieve all books and their authors
SELECT b.title, a.author_name
FROM books b
INNER JOIN book_authors ba ON b.book_id = ba.book_id
INNER JOIN authors a ON ba.author_id = a.author_id;

-- Retrieve all books and their category
SELECT b.title, c.category_name 
FROM books b
INNER JOIN categories c ON c.category_id = b.category_id;

-- Retrieve most expensive book
SELECT b.title, b.price 
FROM books b
ORDER BY b.price DESC
LIMIT 1;

-- Retrieve less expensive book
SELECT b.title, b.price 
FROM books b
ORDER BY b.price ASC
LIMIT 1;



-- Retrieve all users who ordered a specific book
SELECT DISTINCT o.user_id
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
WHERE oi.book_id = 1;

-- Retrieve all books with a stock quantity below 100
SELECT b.title, b.stock_quantity
FROM books b
WHERE b.stock_quantity < 100;

-- Retrieve the books orderd in a spcecific order
SELECT b.title 
FROM books b
INNER JOIN order_items oi ON b.book_id = oi.book_id
WHERE oi.order_id = 1;



-- Retrieve order history for a specific user
SELECT o.order_id, b.title, o.order_date 
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN books b ON oi.book_id = b.book_id
WHERE o.user_id = '1';

-- Retrieve All Books in a Specific Category
SELECT b.title 
FROM books b
INNER JOIN categories c ON b.category_id = c.category_id
WHERE c.category_name = 'Fantasy';

-- Retrieve all books by a specific publisher
SELECT b.title 
FROM books b
INNER JOIN publishers p ON b.publisher_id = p.publisher_id
WHERE p.publisher_name = 'Bloomsbury';

-- Retrieve all orders and their total price for a specific user
SELECT o.order_id, o.total_amount, o.order_date
FROM orders o
WHERE o.user_id = '1';

-- Retrieve the total number of books sold
SELECT SUM(oi.order_quantity) AS total_books_sold
FROM order_items oi;


-- Retrieve books' IDs, titles, and  the total number of books sold
SELECT oi.book_id, b.title, SUM(oi.order_quantity) AS total_books_sold
FROM order_items oi
JOIN books b ON oi.book_id = b.book_id
GROUP BY oi.book_id, b.title
HAVING SUM(oi.order_quantity) > 10;

-- Get the total revenue from all orders
SELECT SUM(oi.order_quantity * oi.price_per_unit) AS total_revenue
FROM order_items oi;


-- Get the number of orders per user
SELECT o.user_id, COUNT(o.order_id) AS total_orders
FROM orders o
GROUP BY o.user_id;












