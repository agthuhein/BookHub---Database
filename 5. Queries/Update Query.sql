USE BookHub;

-- Books
-- Update book price
UPDATE books 
SET price = 18.00
WHERE book_id = 1;

-- Update stock quantity
UPDATE books
SET stock_quantity = stock_quantity + 5
WHERE book_id = 1;


-- Users
-- Update user's email
UPDATE users
SET email = 'agthuhein.bm@bookhub.com'
WHERE user_id = 1;

-- updaet user's phone number
UPDATE users
SET phone_number = '9880 4670'
WHERE user_id = 1;

-- Publishers
-- Update publisher's name
UPDATE publishers
SET publisher_name = 'Macmillan Publishers'
WHERE publisher_id = 1;

-- Authors
-- Update author's name
UPDATE authors
SET author_name = 'Wikie Collins'
WHERE author_id = 6;

-- Categories
-- Update category's name
UPDATE categories
SET category_name = 'Fantasy & Adventure'
WHERE category_id = 2;

-- Orders
-- Update order status
UPDATE orders
SET order_status = 'confirmed'
WHERE order_id = 3;

-- Update shipping address
UPDATE orders
SET shipping_address = '{"zip": "10115",
						"city": "Berlin",
						"state": "Berlin", 
						"street": "Oak Avenue",
                        "country": "Germany",
                        "house_number": "789"}'
WHERE order_id = 1;