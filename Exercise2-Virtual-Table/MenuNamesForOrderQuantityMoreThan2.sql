SELECT m.MenuName from LittleLemonDB.Menus AS m
JOIN LittleLemonDB.Orders AS o ON o.MenuID = m.MenuID
WHERE o.OrderID = ANY (Select OrderID from LittleLemonDB.Orders Where Quantity > 2 );