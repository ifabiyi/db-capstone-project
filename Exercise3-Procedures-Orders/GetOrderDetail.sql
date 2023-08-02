PREPARE GetOrderDetail FROM 
'SELECT OrderID, Quantity, TotalCost FROM LittleLemonDB.Orders
WHERE OrderID = ?;';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;