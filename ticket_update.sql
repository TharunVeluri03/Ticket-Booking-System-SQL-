-- Update 1
UPDATE TicketTypes
SET AvailableTickets = AvailableTickets + 100
WHERE EventID = 1 AND TicketType = 'Adult';

-- Update 2
-- Assuming Ian Cooper is CustomerID 1, Exeter Food Festival is EventID 1, and TicketTypes are already populated.
-- Also, assuming there is a trigger or stored procedure to handle the voucher code discount and payment.
INSERT INTO Bookings (CustomerID, EventID, BookingTime, TotalPayment, DeliveryOption)
VALUES (1, 1, CURRENT_TIMESTAMP, 120.00, 'Email');

INSERT INTO BookingDetails VALUES (LAST_INSERT_ID(), 1, 2); -- 2 Adult tickets
INSERT INTO BookingDetails VALUES (LAST_INSERT_ID(), 2, 1); -- 1 Child ticket

-- Assuming voucher code validation and discount application logic is handled elsewhere

-- Update 3
-- Assuming Joe Smith's booking is stored in the database with BookingID 123
-- Assuming there is a trigger or stored procedure for cancellation
DELETE FROM Bookings WHERE BookingID = 123;

-- Update 4
INSERT INTO VoucherCodes (EventID, Code, Discount) VALUES (2, 'SUMMER20', 20.00);

-- Commit the changes
COMMIT;
