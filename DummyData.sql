USE SteppingIntoHistory;

INSERT INTO Customer (first_name, last_name, email, phone_number, address, membership_status, join_date)
VALUES 
('John', 'Doe', 'john.doe@example.com', '555-1234', '123 History Ln, Cityville', 'Standard', '2023-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Past Dr, Townsville', 'Premium', '2023-02-20'),
('Emily', 'Brown', 'emily.brown@example.com', '555-8765', '789 Ancient Rd, Villageton', 'VIP', '2023-03-10');

INSERT INTO Guides (first_name, last_name, email, phone_number, specialty, years_of_experience)
VALUES
('Alex', 'Johnson', 'alex.johnson@example.com', '555-2345', 'Medieval History', 10),
('Chris', 'Taylor', 'chris.taylor@example.com', '555-3456', 'World Wars', 8),
('Pat', 'Williams', 'pat.williams@example.com', '555-4567', 'Ancient Civilizations', 15);

INSERT INTO GuidedTours (location, tour_date, guide_id, duration, max_capacity, current_bookings)
VALUES
('Colosseum, Rome', '2023-05-01', 1, 120, 20, 15),
('Normandy Beaches, France', '2023-06-10', 2, 180, 25, 20),
('Great Wall, China', '2023-07-15', 3, 150, 30, 28);

INSERT INTO Historians (first_name, last_name, email, phone_number, area_of_expertise, rate_per_lecture)
VALUES
('Sarah', 'Adams', 'sarah.adams@example.com', '555-5678', 'Ancient History', 500.00),
('Michael', 'Lee', 'michael.lee@example.com', '555-6789', 'Medieval History', 600.00);

INSERT INTO Lectures (topic, historian_id, location, date, duration)
VALUES
('The Rise and Fall of the Roman Empire', 1, 'Online', '2023-06-01', 90),
('Life in Medieval Europe', 2, 'Library Hall', '2023-07-20', 120);

INSERT INTO Researchers (first_name, last_name, email, phone_number, area_of_expertise)
VALUES
('Nancy', 'Harris', 'nancy.harris@example.com', '555-7890', 'Genealogy'),
('Robert', 'Martin', 'robert.martin@example.com', '555-8901', 'Historical Documents');

INSERT INTO GenealogicalResearchServices (customer_id, request_date, research_type, status, assigned_researcher_id)
VALUES
(1, '2023-04-15', 'Family Tree Research', 'In Progress', 1),
(2, '2023-04-20', 'Ancestral Record Search', 'Pending', 2);

INSERT INTO HistoricalDocuments (title, author, document_type, location, availability_status)
VALUES
('Declaration of Independence', 'Thomas Jefferson', 'Government Document', 'US Archives', 'Available'),
('Magna Carta', 'Unknown', 'Charter', 'British Library', 'Reserved');

INSERT INTO HistoricalBookSales (title, author, genre, price, stock_quantity, publication_year)
VALUES
('History of Ancient Rome', 'Jill Turner', 'Ancient History', 20.99, 10, 2020),
('World War II Chronicles', 'Alan King', 'Modern History', 15.99, 5, 2018);

INSERT INTO MagazineSubscriptions (customer_id, start_date, end_date, subscription_type)
VALUES
(1, '2023-01-01', '2023-12-31', 'Hardcopy'),
(2, '2023-02-01', '2023-12-31', 'E-copy');

INSERT INTO Instructors (first_name, last_name, email, phone_number, specialty)
VALUES
('Helen', 'Green', 'helen.green@example.com', '555-9012', 'Archaeology'),
('Tom', 'White', 'tom.white@example.com', '555-1234', 'Historical Conservation');

INSERT INTO Workshops (title, location, date, duration, capacity, instructor_id)
VALUES
('Ancient Pottery Making', 'History Museum', '2023-08-01', 180, 15, 1),
('Introduction to Archaeological Digging', 'Heritage Site', '2023-09-05', 240, 20, 2);

INSERT INTO Bookings (customer_id, service_type, service_id, booking_date, status)
VALUES
(1, 'Tour', 1, '2023-05-01', 'Booked'),
(2, 'Lecture', 1, '2023-06-01', 'Completed'),
(3, 'Workshop', 1, '2023-08-01', 'Booked');

INSERT INTO Payment (customer_id, amount, payment_date, payment_method, service_type, service_id)
VALUES
(1, 100.00, '2023-05-01', 'Credit Card', 'Tour', 1),
(2, 150.00, '2023-06-01', 'PayPal', 'Lecture', 1),
(3, 75.00, '2023-08-01', 'Bank Transfer', 'Workshop', 1);
