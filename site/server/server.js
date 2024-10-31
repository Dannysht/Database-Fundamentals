const express = require('express');
const mysql = require('mysql2');
const app = express();
app.use(express.json());

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '1234',
  database: 'SteppingIntoHistory',
});


db.connect((err) => {
  if (err) {
    console.error('Database connection failed:', err);
    return;
  }
  console.log('Connected to the database.');
});

app.post('/customers', (req, res) => {
  const { first_name, last_name, email, phone_number, address, membership_status, join_date } = req.body;
  const query = `INSERT INTO Customer (first_name, last_name, email, phone_number, address, membership_status, join_date) VALUES (?, ?, ?, ?, ?, ?, ?)`;
  db.query(query, [first_name, last_name, email, phone_number, address, membership_status, join_date], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.status(201).json({ message: 'Customer created', customerId: result.insertId });
  });
});

app.get('/customers', (req, res) => {
  const query = 'SELECT * FROM Customer';
  db.query(query, (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(results);
  });
});

app.put('/customers/:id', (req, res) => {
  const { id } = req.params;
  const { first_name, last_name, email, phone_number, address, membership_status, join_date } = req.body;
  const query = `UPDATE Customer SET first_name = ?, last_name = ?, email = ?, phone_number = ?, address = ?, membership_status = ?, join_date = ? WHERE customer_id = ?`;
  db.query(query, [first_name, last_name, email, phone_number, address, membership_status, join_date, id], (err) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: 'Customer updated' });
  });
});

app.delete('/customers/:id', (req, res) => {
  const { id } = req.params;
  const query = 'DELETE FROM Customer WHERE customer_id = ?';
  db.query(query, [id], (err) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: 'Customer deleted' });
  });
});

app.post('/tours', (req, res) => {
  const { location, tour_date, guide_id, duration, max_capacity, current_bookings } = req.body;
  const query = `INSERT INTO GuidedTours (location, tour_date, guide_id, duration, max_capacity, current_bookings) VALUES (?, ?, ?, ?, ?, ?)`;
  db.query(query, [location, tour_date, guide_id, duration, max_capacity, current_bookings], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.status(201).json({ message: 'Tour created', tourId: result.insertId });
  });
});

app.get('/tours', (req, res) => {
  const query = 'SELECT * FROM GuidedTours';
  db.query(query, (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(results);
  });
});

app.put('/tours/:id', (req, res) => {
  const { id } = req.params;
  const { location, tour_date, guide_id, duration, max_capacity, current_bookings } = req.body;
  const query = `UPDATE GuidedTours SET location = ?, tour_date = ?, guide_id = ?, duration = ?, max_capacity = ?, current_bookings = ? WHERE tour_id = ?`;
  db.query(query, [location, tour_date, guide_id, duration, max_capacity, current_bookings, id], (err) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: 'Tour updated' });
  });
});

app.delete('/tours/:id', (req, res) => {
  const { id } = req.params;
  const query = 'DELETE FROM GuidedTours WHERE tour_id = ?';
  db.query(query, [id], (err) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: 'Tour deleted' });
  });
});

app.post('/historians', (req, res) => {
  const { first_name, last_name, email, phone_number, area_of_expertise, rate_per_lecture } = req.body;
  const query = `INSERT INTO Historians (first_name, last_name, email, phone_number, area_of_expertise, rate_per_lecture) VALUES (?, ?, ?, ?, ?, ?)`;
  db.query(query, [first_name, last_name, email, phone_number, area_of_expertise, rate_per_lecture], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.status(201).json({ message: 'Historian created', historianId: result.insertId });
  });
});

app.get('/historians', (req, res) => {
  const query = 'SELECT * FROM Historians';
  db.query(query, (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(results);
  });
});

app.put('/historians/:id', (req, res) => {
  const { id } = req.params;
  const { first_name, last_name, email, phone_number, area_of_expertise, rate_per_lecture } = req.body;
  const query = `UPDATE Historians SET first_name = ?, last_name = ?, email = ?, phone_number = ?, area_of_expertise = ?, rate_per_lecture = ? WHERE historian_id = ?`;
  db.query(query, [first_name, last_name, email, phone_number, area_of_expertise, rate_per_lecture, id], (err) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: 'Historian updated' });
  });
});

app.delete('/historians/:id', (req, res) => {
  const { id } = req.params;
  const query = 'DELETE FROM Historians WHERE historian_id = ?';
  db.query(query, [id], (err) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: 'Historian deleted' });
  });
});

const PORT = 8080;
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
