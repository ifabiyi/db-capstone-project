DROP PROCEDURE IF EXISTS CancelOrder;

DELIMITER //
CREATE PROCEDURE CancelOrder(IN id INT)
BEGIN
IF EXISTS(SELECT OrderID FROM LittleLemonDB.Orders WHERE OrderID = id)
THEN
DELETE FROM LittleLemonDB.OrderDeliveryStatus WHERE OrderID = id; 
DELETE FROM LittleLemonDB.Orders WHERE OrderID = id; 
SELECT CONCAT("Order ", id, " is cancelled.") AS Confirmation;
ELSE
SELECT CONCAT("Order ", id, " does not exist.") AS Response;
END IF;
END //
DELIMITER ;

CALL CancelOrder(1);