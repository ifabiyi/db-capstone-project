DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER //

CREATE PROCEDURE UpdateBooking (IN booking_id INT, IN booking_date DATETIME)
BEGIN
START TRANSACTION;
IF NOT EXISTS(SELECT BookingID FROM Bookings WHERE (BookingID = booking_id))
THEN
SELECT CONCAT("Booking " , booking_id, " does not exist.") AS "BookingStatus";
ROLLBACK;
ELSE
UPDATE Bookings SET BookingDate = booking_date WHERE BookingID = booking_id;
SELECT CONCAT("Booking ", booking_id ," updated.") AS "BookingStatus"; 
COMMIT;
END IF; 
END //


DELIMITER ;

CALL UpdateBooking(1, "2023-10-10 12:00:00");