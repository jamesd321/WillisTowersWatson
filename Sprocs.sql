CREATE OR ALTER PROCEDURE sp_ReserveSite 
	@campsiteId bigint, 
	@name varchar(255),
	@startDate datetime,
	@endDate datetime,
	@occupants int
AS
BEGIN
	INSERT INTO Reservation
	(CampsiteId, Name, StartDate, EndDate, Occupants)
	VALUES
	(@campsiteId, @name, @startDate, @endDate, @occupants)
END

GO

CREATE OR ALTER PROCEDURE sp_CancelReservation 
	@reservationId bigint
AS
BEGIN
	UPDATE Reservation 
	SET Cancelled = 1, LastModified = GETDATE()
	WHERE ReservationId = @reservationId
END
GO