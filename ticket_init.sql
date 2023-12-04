-- Create Events table
CREATE TABLE Events (
    EventID INT PRIMARY KEY,
    EventTitle VARCHAR(255),
    Venue VARCHAR(255),
    StartTime DATETIME,
    EndTime DATETIME,
    Description TEXT
);

-- Create TicketTypes table
CREATE TABLE TicketTypes (
    TicketTypeID INT PRIMARY KEY,
    EventID INT,
    TicketType VARCHAR(50),
    Price DECIMAL(10, 2),
    AvailableTickets INT,
    PRIMARY KEY (EventID, TicketType),
    FOREIGN KEY (EventID) REFERENCES Events(EventID)
);

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- Create Bookings table
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    CustomerID INT,
    EventID INT,
    BookingTime DATETIME,
    TotalPayment DECIMAL(10, 2),
    DeliveryOption VARCHAR(20),
    PRIMARY KEY (CustomerID, EventID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID)
);

-- Create BookingDetails table
CREATE TABLE BookingDetails (
    BookingID INT,
    TicketTypeID INT,
    Quantity INT,
    PRIMARY KEY (BookingID, TicketTypeID),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    FOREIGN KEY (TicketTypeID) REFERENCES TicketTypes(TicketTypeID)
);

-- Create VoucherCodes table
CREATE TABLE VoucherCodes (
    VoucherCodeID INT PRIMARY KEY,
    EventID INT,
    Code VARCHAR(20),
    Discount DECIMAL(5, 2),
    PRIMARY KEY (EventID, Code),
    FOREIGN KEY (EventID) REFERENCES Events(EventID)
);

-- Create Payments table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    CardType VARCHAR(20),
    CardNumber VARCHAR(20),
    SecurityCode VARCHAR(10),
    ExpiryDate DATE,
    AmountPaid DECIMAL(10, 2),
    PRIMARY KEY (BookingID),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

-- Insert sample data

-- Events
INSERT INTO Events VALUES (1, 'Exeter Food Festival 2023', 'Exeter Venue', '2023-07-01 12:00:00', '2023-07-05 22:00:00', 'Food festival description');
INSERT INTO Events VALUES (2, 'Exmouth Music Festival 2023', 'Exmouth Venue', '2023-07-10 15:00:00', '2023-07-15 23:00:00', 'Music festival description');

-- TicketTypes
INSERT INTO TicketTypes VALUES (1, 1, 'Adult', 50.00, 500);
INSERT INTO TicketTypes VALUES (2, 1, 'Child', 25.00, 200);
INSERT INTO TicketTypes VALUES (3, 2, 'Gold', 75.00, 300);
INSERT INTO TicketTypes VALUES (4, 2, 'Silver', 50.00, 400);
INSERT INTO TicketTypes VALUES (5, 2, 'Bronze', 30.00, 600);

-- Customers
INSERT INTO Customers VALUES (1, 'Ian', 'Cooper', 'ian.cooper@example.com', '1234567890');
INSERT INTO Customers VALUES (2, 'Joe', 'Smith', 'joe.smith@example.com', '9876543210');

-- VoucherCodes
INSERT INTO VoucherCodes VALUES (1, 1, 'FOOD10', 10.00);
INSERT INTO VoucherCodes VALUES (2, 2, 'SUMMER20', 20.00);

-- Commit the changes
COMMIT;
