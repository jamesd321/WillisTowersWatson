-- vw_Dates
CREATE OR ALTER VIEW vw_Dates AS
    WITH dates AS -- Provides the days between now and some later day
     (
        SELECT CAST(GETDATE() AS DATE) AS Date
        UNION ALL
        SELECT DATEADD(DAY, 1, date)
        FROM dates
        WHERE DATEADD(DAY, 1, date) <= DATEADD(YEAR, 2, GETDATE())
     )

    SELECT D.Date FROM dates D
GO

-- vw_CampsiteAvailability
CREATE OR ALTER VIEW vw_CampsiteAvailability AS

SELECT D.date, C.Name, C.MaxOccupancy
  FROM vw_Dates D
   JOIN AvailableReservation AR ON d.date BETWEEN AR.StartDate AND AR.EndDate -- Restrict to available days
   JOIN Campsite C ON C.CampsiteId = AR.CampsiteId 
   LEFT JOIN Reservation R ON C.CampsiteId = R.CampsiteId AND R.Cancelled = 0
   -- Joining the Reservation table causes multiple date entries per date. CRC eliminates records that aren't actually available
   LEFT JOIN 
   (
		SELECT CampsiteId, Count(*) NumberOfActiveReservations
		FROM Reservation
		GROUP BY CampsiteId
   ) AS CRC ON C.CampsiteId = CRC.CampsiteId 
   WHERE (R.ReservationId IS NULL OR  D.date NOT BETWEEN R.StartDate AND R.EndDate) -- Remove reserved days
   GROUP BY D.date, C.Name, C.MaxOccupancy, CRC.NumberOfActiveReservations
   HAVING COUNT(*) = CRC.NumberOfActiveReservations OR COUNT(CRC.NumberOfActiveReservations) = 0
;
GO