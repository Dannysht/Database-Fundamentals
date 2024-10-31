USE SteppingIntoHistory;

CREATE TABLE Customer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    address TEXT,
    membership_status ENUM('Standard', 'Premium', 'VIP') DEFAULT 'Standard',
    join_date DATE NOT NULL														
);

CREATE TABLE Guides (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    specialty VARCHAR(100),
    years_of_experience INT
);

CREATE TABLE GuidedTours (
    id INT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(100) NOT NULL,
    tour_date DATE NOT NULL,
    guide_id INT,
    duration INT,
    max_capacity INT,
    current_bookings INT DEFAULT 0,
    FOREIGN KEY (guide_id) REFERENCES Guides(id) ON DELETE SET NULL
);

CREATE TABLE Historians (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    area_of_expertise VARCHAR(100),
    rate_per_lecture DECIMAL(10, 2)
);

CREATE TABLE Lectures (
    id INT PRIMARY KEY AUTO_INCREMENT,
    topic VARCHAR(150) NOT NULL,
    historian_id INT,
    location VARCHAR(100),
    date DATE NOT NULL,
    duration INT,
    FOREIGN KEY (historian_id) REFERENCES Historians(id) ON DELETE SET NULL
);

CREATE TABLE Researchers (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    area_of_expertise VARCHAR(100)
);

CREATE TABLE GenealogicalResearchServices (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    request_date DATE NOT NULL,
    research_type VARCHAR(100),
    status ENUM('Pending', 'In Progress', 'Completed') DEFAULT 'Pending',
    assigned_researcher_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(id) ON DELETE CASCADE,
    FOREIGN KEY (assigned_researcher_id) REFERENCES Researchers(id) ON DELETE SET NULL
);

CREATE TABLE HistoricalDocuments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100),
    document_type VARCHAR(50),
    location VARCHAR(100),
    availability_status ENUM('Available', 'Checked Out', 'Reserved') DEFAULT 'Available'
);

CREATE TABLE HistoricalBookSales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100),
    genre VARCHAR(50),
    price DECIMAL(8, 2),
    stock_quantity INT DEFAULT 0,
    publication_year YEAR
);

CREATE TABLE MagazineSubscriptions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    start_date DATE NOT NULL,
    end_date DATE,
    subscription_type ENUM('Hardcopy', 'E-copy', 'Both') DEFAULT 'E-copy',
    FOREIGN KEY (customer_id) REFERENCES Customer(id) ON DELETE CASCADE
);

CREATE TABLE Instructors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    specialty VARCHAR(100)
);

CREATE TABLE Workshops (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    date DATE NOT NULL,
    duration INT,
    capacity INT,
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(id) ON DELETE SET NULL
);

CREATE TABLE Bookings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    service_type ENUM('Tour', 'Lecture', 'Workshop') NOT NULL,
    service_id INT NOT NULL,
    booking_date DATE NOT NULL,
    status ENUM('Booked', 'Completed', 'Cancelled') DEFAULT 'Booked',
    FOREIGN KEY (customer_id) REFERENCES Customer(id) ON DELETE CASCADE
);

CREATE TABLE Payment (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method ENUM('Credit Card', 'PayPal', 'Bank Transfer') NOT NULL,
    service_type ENUM('Tour', 'Lecture', 'Workshop', 'Research', 'Subscription') NOT NULL,
    service_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(id) ON DELETE CASCADE
);
