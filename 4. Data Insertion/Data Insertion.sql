USE BookHub;

-- Insert categories
INSERT INTO categories (category_name) VALUES 
('Dystopian'), ('Fantasy'), ('History'),
('Psychology'),('Romance'),('Classic'),
('Computer Science'),('Programming'),('Technology');

-- Insert authors
INSERT INTO authors (author_name) VALUES 
('George Orwell'), ('J.K. Rowling'), ('Yuval Noah Harari'),
('Daniel Kahneman'),('Jane Austen'),('Harper Lee'),
('Michael Sipser'),('Joshua Bloch'),('Henry Kissinger'),
('Eric Schmidt'),('Craig Mundie');

-- Insert publishers
INSERT INTO publishers (publisher_name) VALUES 
('Secker & Warburg'), ('Bloomsbury'), ('Harper'),
('Farrar, Straus and Giroux'),('T. Egerton'),('J.B. Lippincott & Co.'),
('MIT Press'),('Addison-Wesley"'),('John Murray');

-- Insert books
INSERT INTO books (isbn, title, description, price, stock_quantity, published_date, publisher_id, category_id) VALUES
('9780451524935', '1984', 'A dystopian novel set in a totalitarian society under constant surveillance.', 15, 50, '1949-06-08', 1, 1),
('9780747532743', 'Harry Potter and the Philosopher\'s Stone', 'A young wizard discovers his magical heritage and attends Hogwarts.', 25, 100, '1997-06-26', 2, 2),
('9780062316097', 'Sapiens: A Brief History of Humankind', 'A deep dive into the history and impact of Homo sapiens.', 30, 75, '2011-06-04', 3, 3),
('9780307277671', 'Thinking, Fast and Slow', 'Exploring two systems of thinking: fast, intuitive, and slow, rational.', 22, 50, '2011-10-25', 4, 4),
('9780141439563','Pride and Prejudice','A classic romance novel about the manners and matrimonial machinations of British society.', 12, 100, '1813-01-28', 5, 5),
('9780060850524','To Kill a Mockingbird','A novel dealing with serious issues like racial injustice and moral growth.', 20,120, '1960-07-11', 6, 6),
('9780262033848','Introduction to the Theory of Computation','A comprehensive book on computational theory and automata.', 50, 200, '2006-03-01', 7, 7),
('9780134685991','Effective Java','Best practices for Java programming, covering coding techniques and principles.', 40,100, '2018-01-06', 8, 8),
('9781399819114','Genesis: Artificial Intelligence, Hope, and the Human Spirit','A collaborative exploration of AI\'s potential and its profound implications for humanity.', 28, 250, '2024-11-19', 9, 9);

-- Insert book_authors
INSERT INTO book_authors (book_id, author_id) VALUES
(1, 1),(2, 2),(3, 3),(4, 4),
(5, 5),(6, 6),(7, 7),(8, 8),
(9, 9),(9, 10),(9, 11);

-- Insert users
INSERT INTO users (first_name, last_name, password, email, phone_number, role)
VALUES
('Aung', 'Thu Hein', 'password123', 'aung.thuhein@bookhub.com', '1234567890', 'USER'),
('Natalie', 'Portman', 'natalie@123', 'natalie.p@bookhub.com', '0987654321', 'USER'),
('Monica', 'Bellucci', 'monica@123', 'monica.b@bookhub.com', '1112223333', 'ADMIN'),
('David', 'Backham', 'david@12345', 'd.beckham@bookhub.com', '4445556666', 'USER'),
('David', 'Silva', 'silva123', 'd.silva@bookhub.com', '7778889999', 'USER'),
('Roger', 'Federer', 'roger@123', 'r.federer@bookhub.com', '2223334444', 'USER'),
('Rafael', 'Nadal', 'nadal123', 'r.nadal@bookhub.com', '5556667777', 'USER'),
('Frank', 'Lampard', 'frankpass678', 'frank.moore@bookhub.com', '8889990000', 'USER'),
('Lionel', 'Messi', 'messi123', 'messi@bookhub.com', '6667778888', 'ADMIN'),
('Julia', 'Roberts', 'julia@123', 'j.robert@bookhub.com', '9990001111', 'USER');


-- Insert orders
INSERT INTO orders (user_id, order_date, total_amount, order_status, payment_method, shipping_address) VALUES
(1, '2025-03-22 15:45:00', 120.00, 'shipped', 'Bank Transfer', 
    '{"house_number": "789", "street": "Oak Avenue", "city": "Berlin", "state": "Berlin", "zip": "10115", "country": "Germany"}'),
(2, '2025-03-20 10:15:00', 75.00, 'completed', 'Credit Card', 
    '{"house_number": "123", "street": "Main Street", "city": "Los Angeles", "state": "CA", "zip": "90001", "country": "USA"}'),
(4, '2025-03-21 12:30:00', 50.00, 'pending', 'PayPal', 
    '{"house_number": "456", "street": "Elm Street", "city": "London", "postcode": "E1 6AN", "country": "England"}'),
(8, '2025-03-23 18:00:00', 30.00, 'delivered', 'Credit Card', 
    '{"house_number": "101", "street": "Pine Lane", "city": "Houston", "state": "TX", "zip": "77001", "country": "USA"}'),
(10, '2025-03-24 09:20:00', 90.00, 'completed', 'PayPal', 
    '{"house_number": "202", "street": "Birch Road", "city": "San Francisco", "state": "CA", "zip": "94101", "country": "USA"}');

-- Insert order items for each order
INSERT INTO order_items (order_id, book_id, order_quantity, price_per_unit) VALUES
(1, 1, 2, 15.00),  -- 2 copies of '1984' (Book ID 1)
(1, 3, 1, 30.00),  -- 1 copy of 'Sapiens: A Brief History of Humankind' (Book ID 3)
(2, 2, 2, 25.00),  -- 2 copies of 'Harry Potter and the Philosopher's Stone' (Book ID 2)
(3, 4, 1, 22.00),  -- 1 copy of 'Thinking, Fast and Slow' (Book ID 4)
(3, 5, 3, 12.00),  -- 3 copies of 'Pride and Prejudice' (Book ID 5)
(4, 7, 1, 50.00),  -- 1 copy of 'Introduction to the Theory of Computation' (Book ID 7)
(5, 8, 2, 40.00),  -- 2 copies of 'Effective Java' (Book ID 8)
(5, 9, 1, 28.00);  -- 1 copy of 'Genesis: Artificial Intelligence, Hope, and the Human Spirit' (Book ID 9)






