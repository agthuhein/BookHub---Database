USE BookHub;

-- Delete books
DELETE FROM books
WHERE book_id = 6;

-- Delete user
DELETE FROM users
WHERE user_id = 2;

-- Delete author
DELETE FROM authors
WHERE author_id = 4;

-- Delete publisher
DELETE FROM publishers
WHERE publisher_id = 8;

-- Delete category
DELETE FROM categories
WHERE category_id = 3;