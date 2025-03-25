DELIMITER //

CREATE PROCEDURE AddOrder(
    IN p_user_id INTEGER,
    IN p_payment_method varchar(50),
    IN p_shipping_address JSON,
    IN p_order_items JSON,
    OUT p_new_order_id INT
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE item_count INT;
    DECLARE book_id_value INT;
    DECLARE order_quantity INT;
    DECLARE price_per_unit DECIMAL(10,2);
    DECLARE available_stock INT;
    DECLARE total_amount DECIMAL(10,2) DEFAULT 0;
    DECLARE temp_order_id INT;
    DECLARE success_flag BOOLEAN DEFAULT TRUE;

    -- Start transaction
    START TRANSACTION;

    -- Get the number of items in the JSON array
    SET item_count = JSON_LENGTH(p_order_items);

    -- Loop through order items first (before inserting the order)
    WHILE i < item_count DO
        SET book_id_value = CAST(JSON_UNQUOTE(JSON_EXTRACT(p_order_items, CONCAT('$[', i, '].book_id'))) AS UNSIGNED);
        SET order_quantity = CAST(JSON_UNQUOTE(JSON_EXTRACT(p_order_items, CONCAT('$[', i, '].quantity'))) AS UNSIGNED);

        -- Fetch book price and stock
        SELECT price, stock_quantity INTO price_per_unit, available_stock 
        FROM books WHERE book_id = book_id_value;

        -- Check stock availability
        IF available_stock IS NULL THEN
            SET success_flag = FALSE;
            ROLLBACK;
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Book does not exist';
        ELSEIF available_stock = 0 THEN
            SET success_flag = FALSE;
            ROLLBACK;
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Book is out of stock';
        ELSEIF available_stock < order_quantity THEN
            SET success_flag = FALSE;
            ROLLBACK;
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Not enough stock available';
        ELSE
            -- Add to total amount
            SET total_amount = total_amount + (price_per_unit * order_quantity);
        END IF;

        -- Move to the next order item
        SET i = i + 1;
    END WHILE;

    -- Insert the order only if all order items are valid
    IF success_flag THEN
        -- Insert order with total_amount
        INSERT INTO orders (user_id, total_amount, payment_method, shipping_address)
        VALUES (p_user_id, total_amount, p_payment_method, p_shipping_address);

        -- Get the order ID after the insert
        SET p_new_order_id = LAST_INSERT_ID();

        -- Loop through items again to insert them
        SET i = 0;
        WHILE i < item_count DO
            SET book_id_value = CAST(JSON_UNQUOTE(JSON_EXTRACT(p_order_items, CONCAT('$[', i, '].book_id'))) AS UNSIGNED);
            SET order_quantity = CAST(JSON_UNQUOTE(JSON_EXTRACT(p_order_items, CONCAT('$[', i, '].quantity'))) AS UNSIGNED);

            -- Insert order items
            INSERT INTO order_items (order_id, book_id, order_quantity, price_per_unit)
            VALUES (p_new_order_id, book_id_value, order_quantity, price_per_unit);

            -- Reduce stock
            UPDATE books 
            SET stock_quantity = stock_quantity - order_quantity
            WHERE book_id = book_id_value;

            -- Move to the next order item
            SET i = i + 1;
        END WHILE;

        -- Commit the transaction
        COMMIT;
    ELSE
        -- If there was a failure, set the order ID to 0 and rollback
        SET p_new_order_id = 0;
    END IF;

END//

DELIMITER ;
