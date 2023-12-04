-- Query 1
SELECT e.*, t.TicketType, t.Price, t.AvailableTickets
FROM Events e
JOIN TicketTypes t ON e.EventID = t.EventID
WHERE e.EventTitle = 'Exeter Food Festival 2023' AND (t.TicketType = 'Adult' OR t.TicketType = 'Child');

-- Query 2
SELECT EventTitle, StartTime, EndTime, Description
FROM Events
WHERE Venue = 'Exeter' AND StartTime BETWEEN '2023-07-01' AND '2023-07-10';

-- Query 3
SELECT TicketType, AvailableTickets, Price
FROM TicketTypes
WHERE EventID = 2 AND TicketType = 'Bronze';

-- Query 4
SELECT c.FirstName, c.LastName, bd.Quantity
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
JOIN BookingDetails bd ON b.BookingID = bd.BookingID
JOIN TicketTypes t ON bd.TicketTypeID = t.TicketTypeID
WHERE t.TicketType = 'Gold' AND t.EventID = 2;

-- Query 5
SELECT e.EventTitle, COUNT(bd.Quantity) AS SoldOutTickets
FROM Events e
JOIN TicketTypes t ON e.EventID = t.EventID
LEFT JOIN BookingDetails bd ON t.TicketTypeID = bd.TicketTypeID
GROUP BY e.EventTitle
ORDER BY SoldOutTickets DESC;

-- Query 6
SELECT b.BookingID, c.FirstName, c.LastName, b.BookingTime, e.EventTitle, b.DeliveryOption, t.TicketType, bd.Quantity, (t.Price * bd.Quantity) AS TotalPayment
FROM Bookings b
JOIN Customers c ON b.CustomerID = c.CustomerID
JOIN Events e ON b.EventID = e.EventID
JOIN BookingDetails bd ON b.BookingID = bd.BookingID
JOIN TicketTypes t ON bd.TicketTypeID = t.TicketTypeID;

-- Query 7
SELECT e.EventTitle, SUM(p.AmountPaid) AS TotalIncome
FROM Events e
JOIN Bookings b ON e.EventID = b.EventID
JOIN Payments p ON b.BookingID = p.BookingID
GROUP BY e.EventTitle
ORDER BY TotalIncome DESC;
