This python script find the order that we have to enter the data to the tables. 

The following table numbers are assinged to the each table in the database 
01) Prices
02) Airport
03) Location
04) Route
05) Airplane 
06) Trip
07) Reference_log
08) Booking
09) seat
10) Booking_log
11) Passenger
12) Status 
13) Registered_User
14) Assingnation
15) staff
16) Role
17) Type

input.txt file contains the relationship as two integers in one line.
first integer represent the primery key table and the second one represents the forign key table.

The tableSequence python script generate the filling order of the tables and write that sequence to the tableSequence.txt file
This generated table sequence is one of the possible sequences, there can be more sequences possible.