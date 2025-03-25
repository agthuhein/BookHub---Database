DELIMITER //

CREATE TRIGGER update_book_quantity_after_order_cancel
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
    IF OLD.order_status != 'cancelled' AND NEW.order_status = 'cancelled' THEN
        UPDATE books b
        JOIN (
            SELECT book_id, SUM(order_quantity) AS total_quantity
            FROM order_items
            WHERE order_id = OLD.order_id
            GROUP BY book_id
        ) oi ON b.book_id = oi.book_id
        SET b.stock_quantity = b.stock_quantity + oi.total_quantity;
    END IF;
END //

DELIMITER ;
