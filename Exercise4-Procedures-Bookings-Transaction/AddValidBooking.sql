DROP PROCEDURE IF EXISTS AddValidBooking;
DELIMITER //

CREATE PROCEDURE AddValidBooking(IN booking_date DATETIME, IN table_number INT, IN customer_id INT)
BEGIN
START TRANSACTION;
SELECT BookingID INTO @id FROM Bookings ORDER BY BookingID DESC LIMIT 1;
SET @id = @id + 1;
IF EXISTS(SELECT BookingID FROM Bookings WHERE (BookingDate = booking_date AND TableNumber = table_number))
THEN
SELECT CONCAT("Table " , table_number, " is booked. Booking is cancelled.") AS "BookingStatus"; 
ROLLBACK;
ELSE
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID)
VALUES (@id, booking_date, table_number, customer_id);
COMMIT;
SELECT CONCAT("Booking for table " , table_number, " is successful.") AS "BookingStatus"; 
END IF;
END //

DELIMITER ;

CALL AddValidBooking("2023-07-09 10:00:00", 2, 1);