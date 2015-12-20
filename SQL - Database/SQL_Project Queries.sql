/*Get the list of flights between two airports, including the flights and number of seats given a date and the two airports (you can hardcode these in the submission)*/

select Flight.FlightNumber, FlightDate,ArrivalAirport, DeptAirport,ActualFlight.AirplaneID, Airplane.AirplaneTypeID, NumOfSeats, EconomyPrice
from Flight 
join ActualFlight on Flight.FlightNumber = ActualFlight.FlightNumber
join Airplane on Airplane.AirplaneID = ActualFlight.AirplaneID
join AirplaneType on Airplane.AirplaneTypeID = AirplaneType.AirplaneTypeID
where ArrivalAirport = 'KPHL' and DeptAirport = 'KISP' and FlightDate = '2015-4-16';

/*this is a multiple join, I wanted 8 columns that I wanted to join them 
I used the relationships from 4 tables to join up the 8 different columns to producte the data for this query.
flight number exists in flight and actual flight the join on fliht to acutal flight is required to get the flight date.
but the arrival airprot and departing airprot are in teh flight table, the airplane that flew the actual flgiht is in the actual flight table, therefore th e actual flight is joined with airplane type in order to pick up the number of seats for the airplane that flew the flight.*/


/*Book a flight given the date, class, frequent flyer number (you can hardcode these in the submission)*/

INSERT INTO TicketRes (TicketNumberID,AirplaneID,PassengerFFN,FlightNumber,FlightDate,TypeOfSeat) VALUES ('99999999','N00dle','90218','8','2015-04-16','First');

/*Created an insert statment that booked a flight for a specific date and customer. This as inserted into the ticket reservation table using hard coded values   */

/*Register a customer for the frequent flyer program given the customer information (you can hardcode these in the submission)*/ 

INSERT INTO Address (AddressID,AddressLine1,AddressLine2,City,Email,Region,AddressState,Zip) VALUES (32,'123 Main St.','','Bellmore','abc@123.com','','NY','11710');

INSERT INTO Passenger (PassengerFFN,PassengerName,AddressID,PassengerPhone) VALUES (18976,'Bobby Jones',32,'(917) 613-3956');
/*Created an insert statment that created a new address id for a new customer, then inserted new customer information into the passenger table that used the address id to related back to the address table.   */

/*Get a list of the pilots who are qualified to fly a specific plane given the airplane id (you can hardcode these in the submission)*/

select Airplane.AirplaneID, PilotRate.PilotFAAID
from Airplane
join PilotRate on Airplane.AirplaneTypeID = PilotRate.AirplaneTypeID
where Airplane.AirplaneID = 'N00dle';

/* this is doing a two way join between airplane and pilot rate, in order to get the names of airplanes that a pilot is rated to fly. And names is airplane id  */



/*Find out which plane is flying a specific flight given the date, time, route (you can hardcode these in the submission) */

select Flight.FlightNumber, FlightDate, SchDepTime ,ActualFlight.AirplaneID
from ActualFlight
join Flight on ActualFlight.FlightNumber = Flight.FlightNumber
where FlightDate = '2015-04-16' and SchDepTime = '15:00:00' and ActualFlight.FlightNumber = '3';

/*want to look up flights based on scheduled departure not actual departues, so you had to join flight to actual flight    */

/*Assign a pilot to a flight given the flight information and the pilot id 
(you can hardcode these in the submission)*/

INSERT INTO Flight (FlightNumber,ArrivalAirport,DeptAirport,SchArrivalTime,SchDepTime,EconomyPrice,PremiumPricing,FirstPricing,AirplaneID) VALUES (22,'KDCA','KISP','19:30:00','18:30:00',249,299,700,'N0000');

INSERT INTO ActualFlight (FlightNumber,FlightDate,ActArrivalTime,ActDepTime,ActFlightDur,AriFlightDate,DepFlightDate,AirplaneID,PilotFAAID1,PilotFAAID2) VALUES (22,'2015-04-16','19:30:00','18:30:00',1,'2015-04-16','2015-04-16','N0000','13086596','90181863');

UPDATE Pilot Set TotalFlyHours = (select ActFlightDur from ActualFlight where FlightNumber = 22 and FlightDate = '2015-04-16') where PilotFAAID = 13086596;

/*Inserted new flight into flight table, then inserted that new flight into actual flight. Then assigned two pilots to that flight through the actual flight table. Finally updated the pilot total fly hours using actual flight data from flown flight.   */



/*Create flights for a new day (create all the necessary entries--you may hardcode the day)*/

INSERT INTO ActualFlight (FlightNumber,FlightDate,AirplaneID) VALUES (1,'2015-04-17','Notfun');
INSERT INTO  ActualFlight (FlightNumber,FlightDate,AirplaneID) VALUES (2,'2015-04-17','Notfun');
INSERT INTO  ActualFlight (FlightNumber,FlightDate,AirplaneID) VALUES (3,'2015-04-17','Notfun');
INSERT INTO  ActualFlight (FlightNumber,FlightDate,AirplaneID) VALUES (4,'2015-04-17','Notfun');
INSERT INTO  ActualFlight (FlightNumber,FlightDate,AirplaneID) VALUES (5,'2015-04-17','Nearly');
INSERT INTO  ActualFlight (FlightNumber,FlightDate,AirplaneID) VALUES (6,'2015-04-17','N00dle');
INSERT INTO  ActualFlight (FlightNumber,FlightDate,AirplaneID) VALUES (7,'2015-04-17','Nearly');
INSERT INTO  ActualFlight (FlightNumber,FlightDate,AirplaneID) VALUES (8,'2015-04-17','N00dle');
INSERT INTO  ActualFlight (FlightNumber,FlightDate,AirplaneID) VALUES (9,'2015-04-17','Nearly');
INSERT INTO  ActualFlight (FlightNumber,FlightDate,AirplaneID) VALUES (10,'2015-04-17','N00dle');
INSERT INTO  ActualFlight (FlightNumber,FlightDate,AirplaneID) VALUES (11,'2015-04-17','Nearly');
INSERT INTO  ActualFlight (FlightNumber,FlightDate,AirplaneID) VALUES (12,'2015-04-17','N00dle');
INSERT INTO  ActualFlight (FlightNumber,FlightDate,AirplaneID) VALUES (13,'2015-04-17','N0tgrt');
INSERT INTO  ActualFlight (FlightNumber,FlightDate,AirplaneID) VALUES (14,'2015-04-17','N0tbad');
INSERT INTO  ActualFlight (FlightNumber,FlightDate,AirplaneID) VALUES (15,'2015-04-17','Ntg00d');
INSERT INTO  ActualFlight (FlightNumber,FlightDate,AirplaneID) VALUES (16,'2015-04-17','N0000');
INSERT INTO  ActualFlight (FlightNumber,FlightDate,AirplaneID) VALUES (17,'2015-04-17','N0tgrt');
INSERT INTO  ActualFlight (FlightNumber,FlightDate,AirplaneID) VALUES (18,'2015-04-17','N0tbad');
INSERT INTO  ActualFlight (FlightNumber,FlightDate,AirplaneID) VALUES (19,'2015-04-17','Ntg00d');
INSERT INTO  ActualFlight (FlightNumber,FlightDate,AirplaneID) VALUES (20,'2015-04-17','N0000');

/*Inserted new day of flights into Actual flight table.    */

/*Print the manifest (list of passengers) on a specific flight*/

select *
from TicketRes, Passenger, Address
where TicketRes.PassengerFFN = Passenger.PassengerFFN and Address.AddressID = Passenger. AddressID and FlightNumber = '1' and FlightDate = '2015-04-16';
/* printing the manifest from flight number 1 on 4-16-15.*/


/*Get the personal information for a passenger from their ID*/

select PassengerName,PassengerPhone,AddressLine1,AddressLine2,City,AddressState,Zip,Email
from Passenger
join Address on Passenger.AddressID = Address.AddressID
where PassengerFFN = 12476;
/*Selected personal information from passenger and address tables and joined them into a table where the passenger FFN was hardcoded.*/
