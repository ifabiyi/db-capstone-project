SELECT c.CustomerID, c.FullName, o.OrderID, o.TotalCost, m.MenuName, mi.Course, mi.Starter
FROM LittleLemonDB.CustomerDetails AS c 
JOIN LittleLemonDB.Orders AS o ON c.CustomerID = o.CustomerID
JOIN LittleLemonDB.Menus AS m ON o.MenuID = m.MenuID
JOIN LittleLemonDB.MenuItems as mi On mi.MenuItemID = m.MenuItemID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost ASC;