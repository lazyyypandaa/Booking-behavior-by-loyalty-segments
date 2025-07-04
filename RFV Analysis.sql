Create table bookings (
			CustomerID	VARCHAR(20),
			BookingDate	Date,
			Product	VARCHAR(50),
			Country	VARCHAR(50),
			TravelDate	Date
);

Select * From bookings;

-- RFV Analysis (Recency, Frequency and Value)
______________________________________________

-- Active Loyal: Guests with 3 and more bookings with at least 1 booking in the last 3 years.
_________________________________________________________________________________________________


With customers_booking (customerid, booking_count, recent_booking_date) AS
			(SELECT customerid,
					Count(*) as booking_count,
					Max(bookingdate) as recent_booking_date
			FROM bookings
			GROUP BY customerid) --- Guests who recently placed the bookings
	SELECT customerid,
			booking_count,
			recent_booking_date
	FROM customers_booking
	WHERE recent_booking_date >= current_date - INTERVAL '3 years' -- Bookings in last 3 years
	AND booking_count >= 3; -------- Guests with 3 or more bookings

_________________________________________________________________________________________________

-- Lapsed Loyal: Guests with 3 and more bookings with last booking over 3 years ago.
_________________________________________________________________________________________________

SELECT customerid,
		Count(*) as booking_count,
		MAX(bookingdate) as recent_bookings
FROM bookings
GROUP BY customerid
HAVING Count(*) >= 3
AND MAX(bookingdate) < current_date - INTERVAL '3 years'; 

____________________________________________________________________________________________________________

---- Active Repeaters: Guests with 1 or 2 bookings with at least 1 booking in the last 3 years.
___________________________________________________________________________________________________________

SELECT customerid,
		Count(*) as booking_count,
		MAX(bookingdate) as recent_booking
FROM bookings
GROUP BY customerid
HAVING Count(*) <= 2
AND MAX(bookingdate) >= current_date - interval '3 years';
__________________________________________________________________________________________________________

----Lapsing: Guests with 1 or 2 bookings with the last booking in 3 - 5 years.
___________________________________________________________________________________________________________

SELECT customerid,
		Count(*) as booking_count,
		MAX(bookingdate) as last_booking_between_3to5_years
FROM bookings
GROUP BY customerid
HAVING Count(*) BETWEEN 1 AND 2
AND MAX(bookingdate) <= current_date - interval '3 years' 
AND MAX(bookingdate) >= current_date - interval '5 years'; 

___________________________________________________________________________________________________________

--- Lapsed: Guests with 1 or 2 bookings with the last booking over 5 years ago.	
___________________________________________________________________________________________________________

SELECT customerid,
		Count(*) as bookingcount,
		Max(bookingdate) as last_booking_over_5years
FROM bookings
Group By customerid
HAVING max(bookingdate) < current_date - interval '5years'
		AND count(*) BETWEEN 1 and 2;

___________________________________________________________________________________________________________

--- What percentage of customers travel within 30 days of booking?
___________________________________________________________________________________________________________

WITH booking_diff AS (
  SELECT
    customerid,
    bookingdate,
    traveldate,
    traveldate - bookingdate AS days_between
  FROM bookings
),
customers_travel_within_30days AS (
  SELECT
    COUNT(*) AS total_bookings,
    COUNT(*) FILTER (WHERE traveldate - bookingdate <= 30) AS bookings_within_30_days
  FROM bookings
)
SELECT
  Round(100.0 * bookings_within_30_days/ total_bookings,2) AS percent_bookings_within_30_days
FROM customers_travel_within_30days;

___________________________________________________________________________________________________________

----Create a days between booking dates column for each customer
___________________________________________________________________________________________________________

WITH OrderedBookings AS (
    SELECT 
        CustomerID,
        BookingDate,
        LAG(BookingDate) OVER (PARTITION BY CustomerID ORDER BY BookingDate) AS PreviousBookingDate
    FROM Bookings
)
SELECT 
    CustomerID,
    BookingDate,
    PreviousBookingDate,
    (BookingDate - PreviousBookingDate) AS DaysBetweenBookings
FROM OrderedBookings
ORDER BY CustomerID, BookingDate;