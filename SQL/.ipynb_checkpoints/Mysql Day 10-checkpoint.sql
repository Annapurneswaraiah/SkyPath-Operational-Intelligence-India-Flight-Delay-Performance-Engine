use airline_delay_db;
select * from airline_uncleaned;

CREATE VIEW vw_airline_performance AS
SELECT
    Airline,
    COUNT(*) AS Total_Flights,
    ROUND(AVG(Total_Delay_Min),2) AS Avg_Delay
FROM airline_uncleaned
GROUP BY Airline;

Select*from vw_airline_performance;

CREATE VIEW vw_airport_performance AS
SELECT
    Origin,
    COUNT(*) AS Total_Flights,
    SUM(Passenger_Count) AS Total_Passengers
FROM airline_uncleaned
GROUP BY Origin;

SELECT * FROM vw_airport_performance;


CREATE VIEW vw_weather_delay AS
SELECT
    Weather_Condition,
    ROUND(AVG(Total_Delay_Min),2) AS Avg_Delay
FROM airline_uncleaned
GROUP BY Weather_Condition;

select*from vw_weather_delay;

CREATE VIEW vw_monthly_flights AS
SELECT
    Month,
    COUNT(*) AS Total_Flights
FROM airline_uncleaned
GROUP BY Month;

select*from vw_monthly_flights;

SELECT
    Flight_Date,
    COUNT(*) AS Daily_Flights,
    SUM(COUNT(*)) OVER (ORDER BY Flight_Date) AS Running_Total
FROM airline_uncleaned
GROUP BY Flight_Date;


select Airline,
round(avg(Total_delay_Min),2) AS Avg_Delay,
 RANK() OVER (ORDER BY AVG(Total_Delay_Min) DESC) AS Delay_Rank
FROM airline_uncleaned
GROUP BY Airline;

SELECT
    Month,
    COUNT(*) AS Flights,
    LAG(COUNT(*),1) OVER (ORDER BY Month) AS Previous_Month
FROM airline_uncleaned
GROUP BY Month;




