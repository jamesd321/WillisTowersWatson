CREATE OR ALTER FUNCTION fn_GetMostPopularDayToVisit ()
RETURNS DATE
AS
BEGIN
	-- Declare the return variable here
	DECLARE @date DATE

	SELECT TOP 1 @date = D.date
	FROM Visitor V 
	JOIN vw_Dates D ON D.date BETWEEN V.StartDate AND V.EndDate
	GROUP BY D.date
	ORDER BY SUM(V.Occupants) DESC
	OPTION (MAXRECURSION 0)

	RETURN @date

END
GO