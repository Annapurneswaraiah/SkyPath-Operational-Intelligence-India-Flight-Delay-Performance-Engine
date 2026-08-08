## Data Dictionary
|Column                    | Description                         | Data Type |
| ------------------------ | ----------------------------------- | --------- |
| `Flight_ID`              | Unique flight identification number | Text      |
| `Airline`                | Airline operating the flight        | Text      |
| `Flight_Date`            | Date of the flight                  | Date      |
| `Origin`                 | Departure airport                   | Text      |
| `Destination`            | Arrival airport                     | Text      |
| `Aircraft_Type`          | Type of aircraft used               | Text      |
| `Terminal`               | Airport terminal                    | Text      |
| `Gate`                   | Assigned gate                       | Text      |
| `Status`                 | Flight status                       | Text      |
| `Passenger_Count`        | Number of passengers                | Integer   |
| `Arrival_Delay_Min`      | Arrival delay in minutes            | Integer   |
| `Departure_Delay_Min`    | Departure delay in minutes          | Integer   |
| `Baggage_Delay_Min`      | Baggage-related delay               | Integer   |
| `Total_Delay_Min`        | Total flight delay                  | Integer   |
| `Turnaround_Time_Min`    | Aircraft turnaround time            | Integer   |
| `Total_Ground_Delay_Min` | Total ground-operation delay        | Integer   |
| `Weather_Condition`      | Weather condition during flight     | Text      |
| `ATC_Delay_Min`          | Air Traffic Control delay           | Integer   |
______________________________________________________________________________
*
## Data Cleaning Summary
- Checked missing values
- Removed duplicate records
- Corrected data types
- Standardized categorical values
- Validated date/time fields
- Checked invalid and unrealistic values
- Reviewed outliers
- Applied business validation rules
- Prepared final cleaned dataset
## KPI Section
- Total Flights
- On-Time Performance
- Average Total Delay
- Total Passenger Count
- Average Turnaround Time
- Total Ground Delay
## Dashboard Section
- Executive Overview
- Delay Trends
- Aircraft & Status Analysis
- Detailed Flight Analysis
## Repository Structure
~~~ text
    SkyPath-Operational-Intelligence/
    │
    ├── Dashboard/
    ├── Data/
    ├── Docs/
    ├── Notebooks/
    ├── SQL/
    ├── Screen shots/
    └── Readme.md
~~~
   
   







   
