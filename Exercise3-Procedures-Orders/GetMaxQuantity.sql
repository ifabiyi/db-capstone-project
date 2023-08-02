DROP PROCEDURE IF EXISTS GetMaxQuantity;

DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
SELECT Quantity as "MAX Quantity" FROM LittleLemonDB.Orders
ORDER BY Quantity DESC
LIMIT 1;
END //
DELIMITER ;

CALL GetMaxQuantity();