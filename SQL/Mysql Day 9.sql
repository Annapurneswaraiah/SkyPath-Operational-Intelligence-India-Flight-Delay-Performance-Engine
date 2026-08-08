USE airline_delay_db;
SELECT * FROM airline_uncleaned;
SHOW TABLES;
DESC airline_uncleaned;
SHOW COLUMNS FROM airline_uncleaned;

SELECT
    a.Flight_ID,
    a.Airline,
    a.Origin,
    a.Destination,
    b.Status,
    b.Total_Delay_Min
FROM airline_uncleaned a
INNER JOIN Airline b
ON a.Flight_ID = b.Flight_ID;

SELECT
    a.Flight_ID,
    a.Airline,
    b.Delay_Reason,
    b.Total_Delay_Min
FROM airline_uncleaned a
INNER JOIN Airline b
ON a.Flight_ID = b.Flight_ID;

SELECT COUNT(*) AS Total_Flights FROM airline_uncleaned;
SELECT SUM(Passenger_Count) AS Total_Passengers FROM airline_uncleaned;
SELECT ROUND(AVG(Total_Delay_Min), 2) AS Average_Delay FROM airline_uncleaned;
SELECT MAX(Total_Delay_Min) AS Maximum_Delay FROM airline_uncleaned;

SELECT COUNT(*) AS Delayed_Flights FROM airline_uncleaned WHERE Status='Delayed';
SELECT COUNT(*) AS On_Time_Flights FROM airline_uncleaned WHERE Status='On Time';

SELECT
ROUND(
    COUNT(CASE WHEN Status='Delayed' THEN 1 END) * 100.0 / COUNT(*), 2
) AS Delay_Percentage
FROM airline_uncleaned;


SELECT ROUND(AVG(Turnaround_Time_Min), 2) AS Average_Turnaround_Time FROM airline_uncleaned;
SELECT ROUND(AVG(Gate_Occupancy_Min), 2) AS Average_Gate_Occupancy FROM airline_uncleaned;
SELECT ROUND(AVG(Ground_Staff_Count), 2) AS Average_Ground_Staff FROM airline_uncleaned;


SELECT Aircraft_Type, AVG(Baggage_Delay_Min) AS Avg_Baggage_Delay FROM airline_uncleaned GROUP BY Aircraft_Type;
SELECT Aircraft_Type, SUM(Baggage_Delay_Min) AS Total_Baggage_Delay FROM airline_uncleaned GROUP BY Aircraft_Type;
SELECT Aircraft_Type, AVG(Total_Delay_Min) AS Avg_Total_Delay FROM airline_uncleaned GROUP BY Aircraft_Type;
SELECT Aircraft_Type, MAX(Total_Delay_Min) AS Max_Total_Delay FROM airline_uncleaned GROUP BY Aircraft_Type;
SELECT Aircraft_Type, SUM(Passenger_Count) AS Total_Passengers FROM airline_uncleaned GROUP BY Aircraft_Type;

SELECT
    Status,
    AVG(Baggage_Delay_Min) AS Avg_Baggage_Delay,
    AVG(Total_Delay_Min) AS Avg_Total_Delay,
    SUM(Passenger_Count) AS Total_Passengers
FROM airline_uncleaned
GROUP BY Status;

SELECT
    Aircraft_Type,
    Status,
    AVG(Baggage_Delay_Min) AS Avg_Baggage_Delay,
    AVG(Total_Delay_Min) AS Avg_Total_Delay,
    SUM(Passenger_Count) AS Total_Passengers
FROM airline_uncleaned
GROUP BY Aircraft_Type, Status
ORDER BY Aircraft_Type, Status;

-- Top 10 Longest Delays
SELECT Flight_ID, Airline, Origin, Destination, Total_Delay_Min
FROM airline_uncleaned
ORDER BY Total_Delay_Min DESC
LIMIT 10;

-- Root Cause Frequency
SELECT Delay_Reason, COUNT(*) AS Total_Flights
FROM airline_uncleaned
GROUP BY Delay_Reason
ORDER BY Total_Flights DESC;

-- Volume by Airline
SELECT Airline, COUNT(*) AS Total_Flights
FROM airline_uncleaned
GROUP BY Airline
ORDER BY Total_Flights DESC;

-- Delay Impact by Aircraft Type
SELECT Aircraft_Type, ROUND(AVG(Total_Delay_Min), 2) AS Average_Delay
FROM airline_uncleaned
GROUP BY Aircraft_Type
ORDER BY Average_Delay DESC;

-- Flight Status Counts
SELECT Status, COUNT(*) AS Total_Flights
FROM airline_uncleaned
GROUP BY Status;

-- Passenger Volume by Departure Airport
SELECT Origin, SUM(Passenger_Count) AS Total_Passengers
FROM airline_uncleaned
GROUP BY Origin
ORDER BY Total_Passengers DESC;

-- Delay Impact by Weather Condition
SELECT Weather_Condition, ROUND(AVG(Total_Delay_Min), 2) AS Average_Delay
FROM airline_uncleaned
GROUP BY Weather_Condition
ORDER BY Average_Delay DESC;

-- Seasonal/Monthly Distribution
SELECT Month, COUNT(*) AS Total_Flights
FROM airline_uncleaned
GROUP BY Month
ORDER BY Month;

-- Terminal & Gate Bottlenecks
SELECT Terminal, COUNT(*) AS Total_Flights
FROM airline_uncleaned
GROUP BY Terminal
ORDER BY Total_Flights DESC;

SELECT Gate, COUNT(*) AS Total_Flights
FROM airline_uncleaned
GROUP BY Gate
ORDER BY Total_Flights DESC;