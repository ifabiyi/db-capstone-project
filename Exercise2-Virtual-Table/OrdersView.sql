CREATE VIEW LittleLemonDB.OrdersView AS 
SELECT OrderID, Quantity, TotalCost FROM 
LittleLemonDB.Orders WHERE Quantity > 2;

SELECT * FROM LittleLemonDB.OrdersView;