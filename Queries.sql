USE SteppingIntoHistory;

SELECT first_name, last_name, email
FROM Customer
WHERE membership_status = 'Premium';

SELECT gt.location AS Tour_Location, gt.tour_date, g.first_name AS Guide_FirstName, g.last_name AS Guide_LastName
FROM GuidedTours gt
INNER JOIN Guides g ON gt.guide_id = g.id
WHERE gt.tour_date > CURRENT_DATE;

SELECT c.id, c.first_name, c.last_name, COUNT(b.id) AS Total_Bookings
FROM Customer c
LEFT JOIN Bookings b ON c.id = b.customer_id
GROUP BY c.id, c.first_name, c.last_name;

SELECT l.topic AS Lecture_Topic, h.first_name AS Historian_FirstName, h.last_name AS Historian_LastName, l.date AS Lecture_Date
FROM Lectures l
INNER JOIN Historians h ON l.historian_id = h.id
INNER JOIN Customer c ON c.id = l.historian_id
ORDER BY l.date;

SELECT customer_id, amount
FROM Payment
WHERE amount = (SELECT MAX(amount) FROM Payment);

SELECT email FROM Customer
UNION
SELECT email FROM Historians;

SELECT g.id, g.first_name, g.last_name, COUNT(gt.id) AS Total_Tours
FROM Guides g
INNER JOIN GuidedTours gt ON g.id = gt.guide_id
GROUP BY g.id, g.first_name, g.last_name
HAVING COUNT(gt.id) > 5;

SELECT c.id, c.first_name AS Customer_FirstName, c.last_name AS Customer_LastName, 
       COUNT(ms.id) AS Subscription_Count
FROM Customer c
LEFT JOIN MagazineSubscriptions ms ON c.id = ms.customer_id
GROUP BY c.id, c.first_name, c.last_name;

SELECT h.email 
FROM Historians h
INTERSECT
SELECT c.email 
FROM Customer c
INNER JOIN Bookings b ON c.id = b.customer_id
WHERE b.service_type = 'Lecture';

SELECT id 
FROM Customer
EXCEPT
SELECT DISTINCT customer_id 
FROM Payment;

SELECT i.id, i.first_name, i.last_name
FROM Instructors i
WHERE i.id IN (
    SELECT instructor_id
    FROM Workshops
    WHERE capacity > 10
);

SELECT customer_id, AVG(amount) AS Avg_Payment
FROM Payment
WHERE customer_id IN (
    SELECT customer_id 
    FROM Payment 
    GROUP BY customer_id 
    HAVING COUNT(id) >= 2
)
GROUP BY customer_id;

SELECT c.id, c.first_name, c.last_name
FROM Customer c
LEFT JOIN Bookings b ON c.id = b.customer_id AND b.service_type = 'Tour'
WHERE b.id IS NULL;

SELECT title, price, stock_quantity
FROM HistoricalBookSales
WHERE stock_quantity > 0
ORDER BY price DESC
LIMIT 5;
