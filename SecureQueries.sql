USE SteppingIntoHistory;

CREATE USER 'tour_manager'@'localhost' IDENTIFIED BY 'tour_pass';
CREATE USER 'historian'@'localhost' IDENTIFIED BY 'hist_pass';
CREATE USER 'customer_service'@'localhost' IDENTIFIED BY 'cust_service_pass';

GRANT SELECT, INSERT, UPDATE ON SteppingIntoHistory.GuidedTours TO 'tour_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON SteppingIntoHistory.Lectures TO 'historian'@'localhost';
GRANT SELECT ON SteppingIntoHistory.Customer TO 'customer_service'@'localhost';
GRANT SELECT ON SteppingIntoHistory.Bookings TO 'customer_service'@'localhost';

CREATE VIEW CustomerContacts AS
SELECT id, first_name, last_name, email, phone_number
FROM Customer;

CREATE VIEW ActiveBookings AS
SELECT id, customer_id, service_type, booking_date, status
FROM Bookings
WHERE status = 'Booked';

CREATE VIEW UpcomingLectures AS
SELECT id, topic, date, location
FROM Lectures
WHERE date >= CURRENT_DATE;
GRANT SELECT ON SteppingIntoHistory.CustomerContacts TO 'customer_service'@'localhost';
GRANT SELECT ON SteppingIntoHistory.ActiveBookings TO 'customer_service'@'localhost';

GRANT SELECT ON SteppingIntoHistory.UpcomingLectures TO 'historian'@'localhost';
