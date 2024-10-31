USE SteppingIntoHistory;

CREATE INDEX idx_customer_id ON Bookings(customer_id);
CREATE INDEX idx_guide_id ON GuidedTours(guide_id);
CREATE INDEX idx_historian_id ON Lectures(historian_id);

CREATE INDEX idx_customer_email ON Customer(email);

CREATE INDEX idx_booking_customer_service ON Bookings(customer_id, service_type);

SELECT c.first_name, c.last_name, b.service_type
FROM Customer c
JOIN Bookings b ON c.id = b.customer_id
WHERE b.service_type = 'Tour';

SELECT h.first_name, h.last_name, l.topic, l.date
FROM Historians h
JOIN Lectures l ON h.id = l.historian_id
WHERE l.date >= '2023-06-01';

SELECT id, first_name, last_name
FROM Customer
WHERE LOWER(email) = 'john.doe@example.com';
