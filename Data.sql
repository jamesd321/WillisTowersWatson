INSERT INTO Campsite
(Name, MaxOccupancy)
VALUES
('Church Fork', 100),
('South Box Elder', 25),
('Upper Box Elder', 75),
('Terrace', 250),
('Big Water Yurt', 8)

INSERT INTO AvailableReservation
(CampsiteId, StartDate, EndDate)
SELECT CampsiteId, '2021-05-03', '2021-12-01'
FROM Campsite

INSERT INTO Reservation
(CampsiteId, Name, StartDate, EndDate, Occupants)
SELECT CampsiteId, 'Doe Family Party', '2021-08-01', '2021-08-15', 60
FROM Campsite 
WHERE Name = 'Church Fork'

INSERT INTO Reservation
(CampsiteId, Name, StartDate, EndDate, Occupants, Cancelled)
SELECT CampsiteId, 'Smith Two Day Stay', '2021-08-20', '2021-08-21', 60, 1
FROM Campsite 
WHERE Name = 'Church Fork'

INSERT INTO Visitor 
(CampsiteId, ReservationId, StartDate, EndDate, Occupants)
SELECT CampsiteId, ReservationId, '2021-08-01', '2021-08-15', 5
FROM Reservation 
WHERE Name = 'Doe Family Party'

INSERT INTO Visitor 
(CampsiteId, ReservationId, StartDate, EndDate, Occupants)
SELECT CampsiteId, ReservationId, '2021-08-07', '2021-08-15', 2
FROM Reservation 
WHERE Name = 'Doe Family Party'

INSERT INTO Visitor 
(CampsiteId, ReservationId, StartDate, EndDate, Occupants)
SELECT CampsiteId, ReservationId, '2021-08-07', '2021-08-15', 2
FROM Reservation 
WHERE Name = 'Doe Family Party'

INSERT INTO Visitor 
(CampsiteId, ReservationId, StartDate, EndDate, Occupants)
SELECT CampsiteId, ReservationId, '2021-08-07', '2021-08-15', 2
FROM Reservation 
WHERE Name = 'Doe Family Party'

INSERT INTO Visitor 
(CampsiteId, ReservationId, StartDate, EndDate, Occupants)
SELECT CampsiteId, ReservationId, '2021-08-07', '2021-08-15', 10
FROM Reservation 
WHERE Name = 'Doe Family Party'

INSERT INTO Visitor 
(CampsiteId, ReservationId, StartDate, EndDate, Occupants)
SELECT CampsiteId, ReservationId, '2021-08-01', '2021-08-05', 4
FROM Reservation 
WHERE Name = 'Doe Family Party'

INSERT INTO Visitor 
(CampsiteId, ReservationId, StartDate, EndDate, Occupants)
SELECT CampsiteId, ReservationId, '2021-08-10', '2021-08-15', 4
FROM Reservation 
WHERE Name = 'Doe Family Party'

INSERT INTO Visitor 
(CampsiteId, ReservationId, StartDate, EndDate, Occupants)
SELECT CampsiteId, ReservationId, '2021-08-07', '2021-08-12', 8
FROM Reservation 
WHERE Name = 'Doe Family Party'