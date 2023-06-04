
## Business Rules 
 - Accounts have a password, first name, last name, email, and mobile number. 
 -  Accounts can be specified as Driver, Client, or Admin. 
 -  Drivers have driver license, total rides, driver average rating, and license plate along with a user ID connecting them with the rest of their data from table Accounts. 
 -  Each Driver has one car identified by its license plate. 
 -  Each Car has one driver identified by its Drivers.User_ID. 
 -  Cars have a license plate, car model, color, and service type (e.g: motorbike or car). 
 -  Clients have client average rating and card ID along with a user ID connecting them with the rest of their data from table Accounts. 
 -  Clients.Card_ID is an optional input by the Client in case they choose to pay with a card whilst requesting a trip. 
 -  Cards have card number, security number, and expiry date. The card is attached with its owner through the card number. 
 - Trip has a driver ID, client ID, pickup location, drop-off location, and payment method specified by the client whilst requesting the trip. 
 -  Each trip has one driver and one client. 
 -  Each driver and client have many trips. 
 -  After each trip, the client is asked to rate the driver. 
 -  After each trip, the driver is asked to rate the client. 
 -  Average rating for both client and driver is calculated by the equation newAvg = (oldAvg * (noOfRides - 1) + newTripRating) / noOfRides 
 -  Promocodes have code, uses, max uses, discount amount, start date, expiry date, and creator, where creator carries the Admin.User_ID of the admin whom created the promocode. 
 -  Admins have Salary and Branch along with a user ID connecting them with the rest of their data from table Accounts.
## ERD
## Brief
- Within the UBER-like application we have designed, we ensured to include most essential features that would help make the application functional on a next step. 
The main three tables are indeed Clients, Drivers, and Trips, but a few more tables are needed to complete the project, such as tables Cars, Accounts, Cards, Promocodes, and Admins. 
- The Accounts table covers common data that a Client or a Driver would have, therefore they inherit its attributes which are User_ID (PK), Email, First_Name, Last_Name, Password, and Mobile_No. The Clients table covers most data needed to register a new client to the system, which are User_ID (PK and FK linked to that of table Accounts), Card_ID (FK linked to that of table Cards), and Client_Rating. 
- The Drivers table covers most data needed to register a new driver to the system, which are User_ID (PK and FK linked to that of table Accounts), Total_Rides (an incrementing counter of how many trips the driver has accomplished), Drivers_License, License_Plate (FK to his car stored in table Cars), and Driver_Rating. 
- In both tables Clients and Drivers, the Client_Rating and Driver_Rating are calculated by the following equation: newAvg = (oldAvg ∗ (noOfRides − 1) + newTripRating)/𝑛𝑜𝑂𝑓𝑅𝑖𝑑𝑒𝑠 
- The Trips table covers most data needed to register a new trip, which are Trip_ID (PK), Driver_ID (FK to table Drivers), Client_ID (FK to table Clients), Pickup_Location, Dropoff_Location, and Payment_Method. 
- The value of the Payment_Method attribute in table Trips is chosen by the Client whilst ordering the trip. The options currently are either Cash or Card. 
- The Cards table can optionally register a card for a Client, which opens the option for the Client to pay with a card in future trips ordered. Therefore the Cards table is a weak entity set. The table carries the necessary data for a Mastercard/Visa such as Card_Number (PK), Security_Number, and Expiry_Date. 
- The Cars table carries the data of the Driver’s car; therefore, it has the attributes License_Plate (PK and is present in table Drivers as FK), Service_Type (which can be Car or Motorbike), Car_Model, and Colour.  
- The Promocodes table stores all the promocodes added by the Admins, each promocode has a Code (PK), Uses (number of times used), Max_Uses (the max number of times this promocode can be used before deactivated), Discount_Amount (how much money will be deducted from the trip cost, Creator (FK to Admins.User_ID), Starts_at (date), and Expires_at (date). 
- The Admins table includes the necessary data needed to register a new Admin staff member. Admins have the right to create Promocodes, view a list of Drivers, Clients, Trips, and see all their data through the interface that will be made. The Admins can also see the Ratings of the Drivers and Clients, and start calling the ones with poor ratings to encourage them to do better, or apply bonus commissions to the Drivers which prove good ratings. The Admins table includes the attributes of User_ID (PK and is used as FK in table Promocodes to identify the creator of each promocode, Salary, and Branch (the name of the company’s branch that this staff member is working from).
## Relational Mapping
## Relational Schema
 - **Accounts**(User_ID(**PK**), First_Name, Last_Name, Password, Mobile_No, Email, Occupation)
 - **Drivers**(User_ID(**PK**), License_Plate(FK), Driver_Rating, Drivers_License, Total_Rides)
 - **Clients**(User_ID(**PK**), Client_Rating)
- **Cars**(License_Plate(**PK**), DUser_ID(**FK**), Service_Type, Car_Model, Colour) 
- **Trips**(Trip_ID(**PK**), DUser_ID(**FK**), CUser_ID(**FK**), Pickup_Location, Dropoff_Location, Payment_Method) 
- **Promocodes**(Code(**PK**), AUser_ID(**FK**), Starts_at, Expires_at, Uses, Max_Uses, Discount_Amount) 
- **Admins**(User_ID(**PK**), Salary, Branch) 
- **Cards**(Card_Number(**PK**), CUser_ID(**FK**), Security_Number, Expiry_Date)
