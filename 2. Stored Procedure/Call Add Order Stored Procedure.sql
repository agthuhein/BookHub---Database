SET @new_order_id = 0;

CALL AddOrder(
    5, 
    'Credit Card',
    '{"street": "123 Main St", "city": "Berlin", "country": "Germany"}',
    '[{"book_id": 5, "quantity": 2}, {"book_id": 3, "quantity": 1}]', 
    @new_order_id
);


