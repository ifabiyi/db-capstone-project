DROP PROCEDURE IF EXISTS AddBooking;
DELIMITER //

CREATE PROCEDURE AddBooking (IN booking_id INT, IN customer_id INT, IN table_number INT, IN booking_date DATETIME)
BEGIN
START TRANSACTION;
IF EXISTS(SELECT BookingID FROM Bookings WHERE (BookingID = booking_id))
THEN
SELECT CONCAT("Booking " , booking_id, " exists. Booking cancelled.") AS "BookingStatus";
ROLLBACK;
ELSEIF EXISTS(SELECT BookingID FROM Bookings WHERE (BookingDate = booking_date AND TableNumber = table_number))
THEN SELECT CONCAT("Table " , table_no, " is booked. Booking cancelled.") AS "BookingStatus";
ROLLBACK;
ELSE
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID)
VALUES (booking_id, booking_date, table_number, customer_id);
SELECT CONCAT("New booking added.") AS "BookingStatus"; 
COMMIT;
END IF; 
END //

DELIMITER ;

CALL AddBooking(1, 1, 2, "2023-07-09 10:00:00");

CALL AddBooking(7, 1, 2, "2023-07-09 15:00:00");