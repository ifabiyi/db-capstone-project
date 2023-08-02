DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER //

CREATE PROCEDURE CancelBooking (IN booking_id INT)
BEGIN
START TRANSACTION;
IF NOT EXISTS(SELECT BookingID FROM Bookings WHERE BookingID = booking_id)
THEN
SELECT CONCAT("Booking " , booking_id, " does not exist.") AS "BookingStatus";
ROLLBACK;
ELSE
DELETE FROM Bookings WHERE BookingID = booking_id;
SELECT CONCAT("Booking ", booking_id ," cancelled.") AS "BookingStatus"; 

COMMIT;
END IF;
END //


DELIMITER ;

CALL CancelBooking(6);