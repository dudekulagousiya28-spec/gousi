CREATE DATABASE vehicle_rental_db;

USE vehicle_rental_db;

-- =========================================
-- 1. CUSTOMERS TABLE
-- =========================================

CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(100),
    Driving_License_No VARCHAR(30) UNIQUE
);

INSERT INTO Customers
(Customer_ID, Name, Phone, Email, Address, Driving_License_No)
VALUES
(1, 'Rahul Sharma', '9876543210', 'rahul@gmail.com', 'Bengaluru', 'DL10001'),
(2, 'Priya Patel', '9876543211', 'priya@gmail.com', 'Mysuru', 'DL10002'),
(3, 'Arjun Kumar', '9876543212', 'arjun@gmail.com', 'Chennai', 'DL10003'),
(4, 'Sneha Reddy', '9876543213', 'sneha@gmail.com', 'Hyderabad', 'DL10004'),
(5, 'Vikram Singh', '9876543214', 'vikram@gmail.com', 'Mumbai', 'DL10005'),
(6, 'Ananya Rao', '9876543215', 'ananya@gmail.com', 'Bengaluru', 'DL10006'),
(7, 'Karan Mehta', '9876543216', 'karan@gmail.com', 'Pune', 'DL10007'),
(8, 'Neha Joshi', '9876543217', 'neha@gmail.com', 'Delhi', 'DL10008'),
(9, 'Rohan Das', '9876543218', 'rohan@gmail.com', 'Kolkata', 'DL10009'),
(10, 'Meera Nair', '9876543219', 'meera@gmail.com', 'Kochi', 'DL10010'),
(11, 'Amit Verma', '9876543220', 'amit@gmail.com', 'Jaipur', 'DL10011'),
(12, 'Pooja Shah', '9876543221', 'pooja@gmail.com', 'Ahmedabad', 'DL10012'),
(13, 'Suresh Babu', '9876543222', 'suresh@gmail.com', 'Bengaluru', 'DL10013'),
(14, 'Divya Menon', '9876543223', 'divya@gmail.com', 'Kochi', 'DL10014'),
(15, 'Manish Gupta', '9876543224', 'manish@gmail.com', 'Lucknow', 'DL10015'),
(16, 'Kavya Iyer', '9876543225', 'kavya@gmail.com', 'Chennai', 'DL10016'),
(17, 'Aditya Jain', '9876543226', 'aditya@gmail.com', 'Indore', 'DL10017'),
(18, 'Nisha Kapoor', '9876543227', 'nisha@gmail.com', 'Delhi', 'DL10018'),
(19, 'Naveen Kumar', '9876543228', 'naveen@gmail.com', 'Hyderabad', 'DL10019'),
(20, 'Shreya Roy', '9876543229', 'shreya@gmail.com', 'Kolkata', 'DL10020');

select* from vehicles;
-- =========================================
-- 2. VEHICLES TABLE
-- =========================================

CREATE TABLE Vehicles (
    Vehicle_ID INT PRIMARY KEY,
    Vehicle_Number VARCHAR(20) UNIQUE NOT NULL,
    Vehicle_Type VARCHAR(30),
    Brand VARCHAR(50),
    Model VARCHAR(50),
    Rental_Rate_Per_Day DECIMAL(10,2),
    Availability_Status VARCHAR(20)
);

INSERT INTO Vehicles
(Vehicle_ID, Vehicle_Number, Vehicle_Type, Brand, Model,
Rental_Rate_Per_Day, Availability_Status)
VALUES
(1, 'KA01AB1001', 'Car', 'Maruti', 'Swift', 1800, 'Available'),
(2, 'KA01AB1002', 'Car', 'Hyundai', 'Creta', 2800, 'Rented'),
(3, 'KA01AB1003', 'Car', 'Tata', 'Nexon', 2200, 'Available'),
(4, 'KA01AB1004', 'Car', 'Toyota', 'Innova', 3500, 'Available'),
(5, 'KA01AB1005', 'Car', 'Honda', 'City', 2500, 'Maintenance'),
(6, 'KA01AB1006', 'SUV', 'Mahindra', 'XUV700', 3200, 'Available'),
(7, 'KA01AB1007', 'Car', 'Kia', 'Seltos', 2900, 'Rented'),
(8, 'KA01AB1008', 'Car', 'Maruti', 'Baleno', 1700, 'Available'),
(9, 'KA01AB1009', 'SUV', 'Toyota', 'Fortuner', 5000, 'Available'),
(10, 'KA01AB1010', 'Car', 'Hyundai', 'i20', 1600, 'Rented'),
(11, 'KA01AB1011', 'Car', 'Honda', 'Amaze', 1900, 'Available'),
(12, 'KA01AB1012', 'SUV', 'Tata', 'Harrier', 3000, 'Available'),
(13, 'KA01AB1013', 'Car', 'Renault', 'Kwid', 1400, 'Maintenance'),
(14, 'KA01AB1014', 'Car', 'Volkswagen', 'Virtus', 2700, 'Available'),
(15, 'KA01AB1015', 'SUV', 'MG', 'Hector', 3100, 'Rented'),
(16, 'KA01AB1016', 'Car', 'Skoda', 'Slavia', 2600, 'Available'),
(17, 'KA01AB1017', 'Car', 'Maruti', 'Dzire', 1800, 'Available'),
(18, 'KA01AB1018', 'SUV', 'Hyundai', 'Alcazar', 3300, 'Available'),
(19, 'KA01AB1019', 'Car', 'Tata', 'Altroz', 1750, 'Rented'),
(20, 'KA01AB1020', 'SUV', 'Mahindra', 'Scorpio', 3400, 'Available');

select* from vehicles;
-- =========================================
-- 3. RENTALS TABLE
-- =========================================

CREATE TABLE Rentals (
    Rental_ID INT PRIMARY KEY,
    Customer_ID INT,
    Vehicle_ID INT,
    Rental_Date DATE,
    Return_Date DATE,
    Total_Days INT,
    Rental_Status VARCHAR(20),

    FOREIGN KEY (Customer_ID)
        REFERENCES Customers(Customer_ID),

    FOREIGN KEY (Vehicle_ID)
        REFERENCES Vehicles(Vehicle_ID)
);

INSERT INTO Rentals
(Rental_ID, Customer_ID, Vehicle_ID, Rental_Date,
Return_Date, Total_Days, Rental_Status)
VALUES
(1, 1, 2, '2026-01-05', '2026-01-08', 3, 'Completed'),
(2, 2, 4, '2026-01-10', '2026-01-13', 3, 'Completed'),
(3, 3, 1, '2026-01-15', '2026-01-17', 2, 'Completed'),
(4, 4, 7, '2026-01-20', '2026-01-25', 5, 'Completed'),
(5, 5, 5, '2026-02-01', '2026-02-04', 3, 'Completed'),
(6, 6, 9, '2026-02-05', '2026-02-08', 3, 'Completed'),
(7, 7, 10, '2026-02-10', '2026-02-12', 2, 'Completed'),
(8, 8, 3, '2026-02-15', '2026-02-19', 4, 'Completed'),
(9, 9, 15, '2026-02-20', '2026-02-24', 4, 'Completed'),
(10, 10, 6, '2026-03-01', '2026-03-05', 4, 'Completed'),
(11, 11, 8, '2026-03-05', '2026-03-07', 2, 'Completed'),
(12, 12, 12, '2026-03-10', '2026-03-14', 4, 'Completed'),
(13, 13, 14, '2026-03-15', '2026-03-18', 3, 'Completed'),
(14, 14, 17, '2026-03-20', '2026-03-23', 3, 'Completed'),
(15, 15, 18, '2026-04-01', '2026-04-06', 5, 'Completed'),
(16, 16, 16, '2026-04-10', '2026-04-13', 3, 'Completed'),
(17, 17, 19, '2026-04-15', '2026-04-18', 3, 'Completed'),
(18, 18, 20, '2026-04-20', '2026-04-22', 2, 'Completed'),
(19, 19, 11, '2026-05-01', '2026-05-05', 4, 'Completed'),
(20, 20, 13, '2026-05-10', '2026-05-13', 3, 'Completed');


-- =========================================
-- 4. PAYMENTS TABLE
-- =========================================

CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY,
    Rental_ID INT,
    Payment_Date DATE,
    Amount DECIMAL(10,2),
    Payment_Method VARCHAR(20),
    Payment_Status VARCHAR(20),

    FOREIGN KEY (Rental_ID)
        REFERENCES Rentals(Rental_ID)
);

INSERT INTO Payments
(Payment_ID, Rental_ID, Payment_Date, Amount,
Payment_Method, Payment_Status)
VALUES
(1, 1, '2026-01-05', 8400, 'UPI', 'Paid'),
(2, 2, '2026-01-10', 10500, 'Card', 'Paid'),
(3, 3, '2026-01-15', 3600, 'Cash', 'Paid'),
(4, 4, '2026-01-20', 14500, 'UPI', 'Paid'),
(5, 5, '2026-02-01', 7500, 'Card', 'Paid'),
(6, 6, '2026-02-05', 15000, 'UPI', 'Paid'),
(7, 7, '2026-02-10', 3200, 'Cash', 'Paid'),
(8, 8, '2026-02-15', 8800, 'Card', 'Paid'),
(9, 9, '2026-02-20', 12400, 'UPI', 'Paid'),
(10, 10, '2026-03-01', 12800, 'Card', 'Paid'),
(11, 11, '2026-03-05', 3400, 'Cash', 'Paid'),
(12, 12, '2026-03-10', 12000, 'UPI', 'Paid'),
(13, 13, '2026-03-15', 8100, 'Card', 'Paid'),
(14, 14, '2026-03-20', 5400, 'UPI', 'Paid'),
(15, 15, '2026-04-01', 16500, 'Card', 'Paid'),
(16, 16, '2026-04-10', 7800, 'UPI', 'Paid'),
(17, 17, '2026-04-15', 5250, 'Cash', 'Paid'),
(18, 18, '2026-04-20', 6800, 'Card', 'Paid'),
(19, 19, '2026-05-01', 7600, 'UPI', 'Paid'),
(20, 20, '2026-05-10', 4200, 'Cash', 'Paid');


-- =========================================
-- 5. MAINTENANCE TABLE
-- =========================================

CREATE TABLE Maintenance (
    Maintenance_ID INT PRIMARY KEY,
    Vehicle_ID INT,
    Maintenance_Date DATE,
    Description VARCHAR(150),
    Cost DECIMAL(10,2),
    Maintenance_Status VARCHAR(20),

    FOREIGN KEY (Vehicle_ID)
        REFERENCES Vehicles(Vehicle_ID)
);

INSERT INTO Maintenance
(Maintenance_ID, Vehicle_ID, Maintenance_Date,
Description, Cost, Maintenance_Status)
VALUES
(1, 1, '2026-01-03', 'Engine Oil Change', 2500, 'Completed'),
(2, 2, '2026-01-09', 'Brake Inspection', 4000, 'Completed'),
(3, 3, '2026-01-18', 'Tire Replacement', 12000, 'Completed'),
(4, 4, '2026-01-25', 'General Service', 3500, 'Completed'),
(5, 5, '2026-02-02', 'Engine Repair', 15000, 'Completed'),
(6, 6, '2026-02-10', 'Oil Change', 2800, 'Completed'),
(7, 7, '2026-02-18', 'Brake Repair', 6000, 'Completed'),
(8, 8, '2026-02-25', 'Battery Replacement', 7500, 'Completed'),
(9, 9, '2026-03-02', 'Tire Service', 5000, 'Completed'),
(10, 10, '2026-03-08', 'AC Service', 4500, 'Completed'),
(11, 11, '2026-03-15', 'Oil Change', 2200, 'Completed'),
(12, 12, '2026-03-22', 'General Service', 3800, 'Completed'),
(13, 13, '2026-04-01', 'Engine Repair', 11000, 'Completed'),
(14, 14, '2026-04-08', 'Brake Inspection', 3000, 'Completed'),
(15, 15, '2026-04-15', 'Tire Replacement', 14000, 'Completed'),
(16, 16, '2026-04-22', 'Battery Replacement', 7000, 'Completed'),
(17, 17, '2026-05-01', 'Oil Change', 2300, 'Completed'),
(18, 18, '2026-05-08', 'AC Repair', 6500, 'Completed'),
(19, 19, '2026-05-15', 'General Service', 3600, 'Completed'),
(20, 20, '2026-05-20', 'Brake Repair', 5500, 'Completed');


-- =========================================
-- CHECK THE DATA
-- =========================================

SELECT * FROM Customers;
SELECT * FROM Vehicles;
SELECT * FROM Rentals;
SELECT * FROM Payments;
SELECT * FROM Maintenance;

----- =======================2. SELECT & WHERE=================
-- Display all customers from Bengaluru.
select  name from customers  where  address="bengaluru";
select name,address  from  customers where address ="bengaluru"; 
-- Display all available vehicles.
select vehicle_type,availability_status from vehicles where availability_status="available";
-- Display all vehicles under maintenance.
select vehicle_type, availability_status from vehicles where availability_status="maintenance";
-- Display all SUVs.
 select vehicle_type from vehicles where Vehicle_Type ="suv";
-- Display all Hyundai vehicles.
 select  vehicle_type,  brand from vehicles where brand="hyundai";
-- Display vehicles with rental rate greater than ₹2,500.
select  rental_rate_per_day from vehicles group by Rental_Rate_Per_Day having rental_rate_per_day>2500 ;
-- Display vehicles with rental rate between ₹1,500 and ₹3,000.
select Vehicle_Type, rental_rate_per_day from vehicles  where rental_rate_per_day between 1500  and  3000;
-- Display customers whose names start with A.
select name from customers  where name  like"a%";
-- Display customers whose email contains gmail.
select email from customers where email like "%gmail.com%";
-- Display payments made using UPI.
select payment_method from payments where payment_method ="upi";

-- ====================
-- Management wants information to be displayed in a meaningful order for easier analysis.
#--Student Tasks:==
-- Display vehicles from highest rental rate to lowest.
select * from vehicles  order by rental_rate_per_day desc;
select vehicle_type,Rental_Rate_Per_Day from vehicles order by Rental_Rate_Per_Day desc;
-- Display vehicles from lowest rental rate to highest.
select  vehicle_type ,Rental_Rate_Per_Day from vehicles  order by rental_rate_per_day asc;
-- Display customers alphabetically.
select name from customers order by name  asc;
-- Display rentals from newest to oldest.
select  rental_id , rental_date from rentals order by rental_date  asc; 
-- Display maintenance records from highest cost to lowest.
select Maintenance_ID,cost from maintenance order by cost desc;
#--Expected Outcome:
-- ============================4. AGGREGATE FUNCTIONS======================================
-- 4. AGGREGATE FUNCTIONS===========================
-- Client Requirement
-- The finance and management teams require summary information from the database.
-- Student Tasks :
-- ===============Using COUNT(), SUM(), AVG(), MIN() and MAX():==============================
-- Find total number of customers.
select  count(*)as name from customers;
select* from vehicles;  
-- Find total number of vehicles.
select count(*)as vehicle_type  from vehicles ;
-- Find average rental rate.
select avg(rental_rate_per_day)as rental_rate from vehicles ;
-- Find highest rental rate.
select max(rental_rate_per_day)as rental_rate from vehicles;
-- Find lowest rental rate.
select min(rental_rate_per_day)  from vehicles;
-- Find total revenue collected.
select sum(amount)as total_revenue from payments;
-- Find average payment amount.
select avg(amount) from  payments;
-- Find total maintenance cost.
select sum(cost)from maintenance; 
-- Find highest maintenance cost.
select max(cost) from maintenance;
-- Find lowest maintenance cost.
select min(cost) from maintenance;

-- ===================5. GROUP BY & HAVING ===================
-- === Client Requirement
-- Management wants to analyze business information category-wise.
-- Student Tasks===================
-- Find number of customers in each city.
select  address, count(*)as  name from customers  group by address order by Address  asc; 
select address,count(*)as name from customers;
-- Find number of vehicles for each brand.
select brand,count(*)as vehicle_type from vehicles group by brand order by Vehicle_Type;
-- Find number of vehicles for each vehicle type.
select vehicle_type , count(*) as vehicle_type from vehicles group by vehicle_type order by Vehicle_Type ;
-- Find average rental rate for each vehicle type.
-- Find total revenue for each payment method.
select  payment_method, sum(amount) as total_revenue from payments group by  payment_method order by total_revenue;
-- Find number of payments for each payment method.
select  payment_method, count(payment_id)as payment_id  from payments group by Payment_Method order by payment_id;
-- Find total maintenance cost for each vehicle.
select vehicle_id,sum(cost)as cost from maintenance group by vehicle_id ;
-- Find average maintenance cost for each vehicle.
select vehicle_id,avg(cost)as cost from maintenance group by vehicle_id;
-- Display brands having more than one vehicle.
select brand ,count(*)as vehicle_count from vehicles group by brand having  vehicle_count >1;
-- Display payment methods where total revenue exceeds ₹20,000.
select payment_method ,sum(amount)as total_revenue from payments group by  payment_method having  
#-- Expected Outcome
# The company should be able to compare different categories and identify important business trends.
-- ===================
-- The rental company wants to analyze rentals and payments based on dates.
-- Student Tasks
-- Display the rental date.
select rental_date from rentals;
select rental_date ,year(rental_date) as year from rentals;
-- Extract the month from the rental date.
select rental_date,month(rental_date) as month from  rentals;
-- Find the number of rentals made in each month.
select month(rental_date) as month,count(*)rental_date from rentals group by  month ;
select MONTHNAME(rental_date) AS month_name, COUNT(*) AS total_rentals
FROM rentals
GROUP BY month_name, MONTH(rental_date)
ORDER BY MONTH(rental_date);
-- Display payment dates in DD-MM-YYYY format.
select  payment_date, date_format(payment_date,"%d-%m-%y")  from payments;
-- Find rentals made during a particular month.
select rental_date,month( rental_date) as month from rentals;
-- Find rentals made during a particular year.
-- Expected Outcome
-- Management should be able to analyze rental activity over time.

-- =====================================7. CALCULATIONS & OPERATORS ==============================================
-- Client Requirement
-- The company currently calculates rental charges manually. Management wants the database to calculate rental amounts automatically.
-- Rental Rate × Total Days
select  (v.rental_rate_per_day*r.total_days)  as rental_cost from vehicles v
join  rentals r on  v.vehicle_id=r.vehicle_id ;
-- Calculate estimated monthly revenue:
-- Rental Rate × 30
select  rental_rate_per_day,(rental_rate_per_day*30) as monthly_revenue from vehicles;
-- Display rental amount along with customer details.
select c.customer_id,c.name,p.amount from customers c
join payments p on c.customer_id=p.payment_id;
-- Compare expected rental amount with actual payment.
select  (v.rental_rate_per_day*r.total_days) from vehicles v  join rentals r  on r.vehicle_id=v.vehicle_id ;
select 
p.amount as actual_amount,(v.rental_rate_per_day*r.total_days)as expected_rental from  rentals r
join payments p on r.rental_id =p.rental_id
join vehicles v on r.vehicle_id=v.vehicle_id;
SELECT 
    r.rental_id,
    p.amount AS actual_amount,
    (r.total_days * v.rental_rate_per_day) AS expected_rental
FROM rentals r
JOIN payments p ON r.rental_id = p.rental_id
JOIN vehicles v ON r.vehicle_id = v.vehicle_id;
-- Find rentals where payment is higher than expected.
select p.amount as payment ,(r.total_days * v.rental_rate_per_day) AS expected_rental from rentals r 
join  vehicles v on r.vehicle_id=v.vehicle_id  
join  payments p on p.rental_id=r.rental_id
where (r.total_days * v.rental_rate_per_day > p.amount) ;

-- Find rentals where payment is lower than expected .
select p.amount as payment,(r.total_days*v.rental_rate_per_day)as expected from payments p
join rentals r on p.rental_id=r.rental_id
join vehicles v on  r.vehicle_id=v.vehicle_id
where p.amount > (r.total_days*v.rental_rate_per_day);
/*Expected Outcome
The database should help the company identify billing differences and calculate rental revenue accurately.*/

/*-- 8. INNER JOIN ==================================
-- Client Requirement
Customer, vehicle and rental information is stored in separate tables. The customer service team needs combined information.
Student Tasks*/
-- 1.Display customer name with rental details.
select c.customer_id,c.name,r.rental_id,r.rental_date,r.total_days, r.rental_status from rentals  r inner join customers c on c.customer_id=r.Customer_ID;
-- Display customer name and vehicle number.
select c.name,v.vehicle_number from  customers c 
inner join  vehicles v on c.customer_id= v.vehicle_id;
-- Display customer name, vehicle brand and model.
select c.name,v.brand,v.model from customers c 
inner join vehicles v on v.vehicle_id=c.customer_id;
-- Display rental date and return date with customer information.
select c.customer_id,c.name,c.address,c.email,r.rental_date,r.return_date from customers c
inner join rentals r on c.customer_id=r.customer_id;
-- Display rental details along with payment information.
select p.payment_id,p.payment_date,p.amount,p.payment_method,p.payment_status,
r.rental_id,r.rental_date,r.return_date,r.rental_status from payments p
inner join  rentals r on r.rental_id=p.rental_id;
 -- Display vehicle details along with maintenance information.
select m.maintenance_id,m.maintenance_date,maintenance_status,m.cost,
v.vehicle_id,v.vehicle_number,v.vehicle_type,v.model,v.brand from maintenance m 
 inner join vehicles v on v.vehicle_id=m.vehicle_id;

/*Expected Outcome
Users should be able to view related information from multiple tables in a single report.*/

-- ===========================  9. MULTI-TABLE JOIN    ========================================
/* Client Requirement
Management wants a complete rental report combining information from all relevant tables.
Student Tasks
Create a report containing:*/
/*--- Customer Name
Phone
Vehicle Number
Brand
Model
Rental Date
Return Date
Total Days
Rental Rate
Payment Amount
Payment Method
Expected Outcome
Management should receive one complete rental transaction report. */-- 
select c.name,c.phone,
v.vehicle_number,v.brand,v.model,
r.rental_date,r.return_date,r.total_days,r.rental_status,
p.amount,p.payment_method from vehicles v
join rentals r on v.vehicle_id=r.Vehicle_ID
join customers c on  c.customer_id=r.customer_id
join payments p on p.rental_id=r.rental_id ; 

-- 10. LEFT JOIN
-- ===============
-- Client Requirement
-- Management wants to identify customers and vehicles that have no related transactions.
-- Student Tasks:
-- 1.Find customers who have never rented a vehicle.
select * from rentals;
select c.name,c.customer_id,r.rental_id from customers c
 left join  rentals r on c.customer_id=r.customer_id
where rental_id is null;
SELECT customer_id,name
FROM customers 
WHERE customer_id NOT IN (SELECT customer_id FROM rentals);
-- 2.Find vehicles that have never been rented.
select v.vehicle_id,v.vehicle_type,r.rental_id from vehicles  v
 inner join  rentals r on v.vehicle_id=r.vehicle_id
 where  rental_id is null;
 SELECT COUNT(*) AS total_vehicles FROM vehicles;
SELECT COUNT(DISTINCT rental_id) AS rented_vehicles FROM rentals;
-- 3.Find vehicles that have never undergone maintenance.
select vehicle_id,maintenance_status from  maintenance where Maintenance_Status="completed";
select* from maintenance
-- Q4. Display all customers along with their rental count, including customers with zero rentals.
select c.customer_id, c.name,count(r.rental_id)as rental_count from customers c 
 left join  rentals r on c.customer_id=r.customer_id
 group by c.customer_id;
/*Expected Outcome
Management can identify inactive customers and unused vehicles.*/

-- ======================================11. SUBQUERIES  =========================================================
/*Client Requirement
Management wants advanced analysis based on calculated values.*/
-- Student Tasks:
-- q1. Find vehicles whose rental rate is above the average rental rate.
select  * from vehicles where rental_rate_per_day > (select avg(Rental_Rate_Per_Day) from vehicles) ;
-- q2.Find the vehicle with the highest rental rate.
select  max( rental_rate_per_day ) from vehicles;
-- q3.Find the customer with the highest payment.
select c.customer_id,c.name,sum(p.amount)as payments from customers c
join payments p on c.customer_id=p.rental_id
group by c.customer_id,c.name
order by payments desc limit 1;
select max(amount)as highest_payment  from payments; 
-- Q4.Find vehicles whose maintenance cost is above average.
select  * from maintenance 
where cost > (select avg(cost)from  vehicles); 
-- Q5.Find customers who have rented at least once.
select *from customers
where customer_id in (select distinct customer_id from rentals);
-- Q6.Find vehicles that have never been rented.
select * from vehicles 
where vehicle_id in(select distinct vehicle_id from rentals);
-- Q7.Find rentals where payment is above average.
select * from rentals
where cost>(select avg(cost) from maintenance); 
/*Expected Outcome
The company should be able to perform advanced comparisons using dynamically calculated values.*/

--  =======================================12. WINDOW FUNCTIONS =====================================================================================
-- Client Requirement
-- The management team wants to perform advanced analysis on rental, payment, and vehicle data without losing individual records.
-- Student Tasks
-- Use MySQL Window Functions such as ROW_NUMBER(), RANK(), DENSE_RANK(), LAG(), LEAD(), SUM() OVER() and AVG() OVER().
-- Q1.Rank vehicles based on rental rate from highest to lowest.
select vehicle_type, rental_rate_per_day, rank() over(order by rental_rate_per_day desc)as rk from vehicles;
-- Q2. Rank customers based on their total spending.
select  c.customer_id,c.name,sum(r.total_days*v.rental_rate_per_day)as total_spending ,
rank() over(order by sum(r.total_days*v.rental_rate_per_day) desc)as rk from  customers c
join  rentals r on c.customer_id=r.customer_id
join vehicles v on r.vehicle_id=v.vehicle_id
group by c.name,Customer_ID
order by rk;
-- Q3. Assign a unique row number to each rental based on rental date.
select  rental_date, row_number() over( partition by rental_date) as rn from rentals;
-- Q4. Find the top 3 highest-priced vehicles using RANK() or DENSE_RANK().
select vehicle_type,Rental_Rate_Per_Day ,dense_rank() over(partition by Vehicle_Type) as dk from vehicles
order by  rental_rate_per_day desc limit 3;
-- Q5. Display each vehicle's rental rate along with the average rental rate of all vehicles.
select vehicle_type,rental_rate_per_day,avg(rental_rate_per_day) over()as average_rate from vehicles ;
-- Q6 Display each customer's total spending along with the overall average customer spending.
select c.customer_id,c.name,sum(p.amount) as total_spending ,
avg(sum(p.amount)) over() as avg_amount from customers c
join rentals r  on c.customer_id=r.customer_id
join  payments p  on p.Rental_ID=r.Rental_ID group by c.name,c.customer_id; 
-- Q7 Calculate cumulative rental revenue based on rental date.
select r.rental_date,sum(r.total_days*v.rental_rate_per_day)as  rental_revenue from rentals r 
join vehicles v on r.vehicle_id=v.vehicle_id
group by r.Rental_Date;  
-- Q8. Calculate cumulative payment amount for each customer based on payment date.
select  c.name,p.amount,p.payment_date  from payments p
join customers c on p.Payment_ID=c.Customer_ID;
-- Q9. Compare each rental payment with the previous rental payment using LAG().
select payment_date, lag(amount)   over(order by payment_date)as ps_year from  payments;
-- Q10. Display the next rental date for each customer using LEAD().
select customer_id,rental_date,lead(rental_date) over(order by customer_id)as  last_date from rentals;
-- Q11. Rank vehicles separately within each vehicle type based on rental rate.
select  vehicle_id,rental_date,rank() over(order by  vehicle_id desc)as  rk from  rentals;
-- Q12. Rank customers separately based on their city and total spending.
select  c.customer_id,c.name,p.amount as total_spending, rank() over(order  by c.address) from  customers c
join payments p on c.customer_id=p.payment_id ;
-- Q13.Find the highest-revenue vehicle in each vehicle type.
select  vehicle_id,sum(cost) as revenue from  maintenance  group by vehicle_id  order by revenue  desc ;
-- Q14. Find the second-highest rental-rate vehicle in each vehicle category
select* from payments;
SELECT * FROM (
SELECT vehicle_type,vehicle_id,rental_rate_per_day,
DENSE_RANK() OVER(PARTITION BY vehicle_type ORDER BY rental_rate_per_day DESC) AS rk
  FROM vehicles) AS ranked
WHERE rk = 2;
select rental_status, rental_id ,avg(total_days)as rental_rate from rentals group by rental_status order by rental_rate desc;
 -- Q15. Display each vehicle's rental rate and the difference between its rate and the average rate of its vehicle type.
SELECT vehicle_id,vehicle_type,
rental_rate_per_day,
AVG(rental_rate_per_day) OVER(PARTITION BY vehicle_type) AS type_avg_rate,
rental_rate_per_day - AVG(rental_rate_per_day) OVER(PARTITION BY vehicle_type) AS diff_avg
FROM vehicles;

-- Expected Outcome
-- Management should be able to identify:
-- Q1.Top-performing vehicles
select* from top_performing_vehicles;
-- Q2.Highest-spending customers
select c.name  ,sum(r.total_days*v.rental_rate_per_day)as customer_spending from customers c
join rentals r on c.customer_id=r.Customer_ID
join vehicles v on r.vehicle_id=v.Vehicle_ID
group by c.name ,c.customer_id
order by customer_spending desc limit 1;
-- Q3.Vehicle rankings
select vehicle_type , rank() over(order by Vehicle_Type)as rk from vehicles;
-- Q4.Customer rankings
select name ,rank() over(order by name)as rk from customers;
-- Q5.Revenue trends
select rental_date,lead(rental_date) over(order by rental_date) from rentals; 
-- Q5.Previous and next transactions
select amount,lag(amount)over(order by Payment_Method) as previous_amt from payments;

-- Cumulative revenue
select  r.Customer_ID,sum(r.total_days*v.Rental_Rate_Per_Day) as total_revenue from  rentals r
join vehicles v on r.Vehicle_ID =v.Vehicle_ID
group by r.customer_id;
-- Category-wise performance
-- ========================13. VIEWS ============================================
-- Client Requirement
-- The customer service team frequently needs the same reports. Instead of writing the same query repeatedly, management wants reusable database views.
-- Student Tasks
-- Create:
-- Q1.Available_Vehicles
select * from vehicles where availability_status="available";
-- Q2.Customer_Rental_Report
select customer_id, rental_id,rental_date,rental_status from rentals;
-- Q3.Vehicle_Maintenance_Report
select v.vehicle_id,v.vehicle_type,m.maintenance_id,m.maintenance_date,m.cost,m.maintenance_status from vehicles v
join maintenance m on v.Vehicle_ID=m.Vehicle_ID;
-- Q4.Customer_Spending_Report
select c.name,c.customer_id,sum(r.total_days*v.rental_rate_per_day)as customer_spending from customers c 
join rentals r on c.customer_id=r.customer_id
join vehicles v on r.Vehicle_ID=v.vehicle_id  group by c.Customer_ID 
order by customer_spending desc;
-- Expected Outcome
-- Frequently used reports should be accessible through simple SELECT statements.

-- 14. UPDATE
-- Client Requirement
-- Vehicle and customer information changes regularly. The database must support modifications.
-- Student Tasks
-- Q1.Update a customer's phone number.
Update a customer's email.
Update a vehicle's rental rate.
Change vehicle status from Available to Rented.
Change vehicle status from Rented to Available.
Update payment status.
Update maintenance status.
Expected Outcome
The database should always contain the latest business information.

15. DELETE
===========
Client Requirement
-- The company wants to remove incorrect or unnecessary records while protecting related business data.
Student Tasks
Delete a customer who has no rental history.
Attempt to delete a customer who has rental records.
Delete an incorrect maintenance record.
Explain the impact of Foreign Key constraints during deletion.
Expected Outcome
Students should understand safe deletion and referential integrity.

16. CONSTRAINTS
================
Client Requirement
The company wants to prevent invalid data from entering the database.
Student Tasks
Implement and demonstrate:
PRIMARY KEY
FOREIGN KEY
NOT NULL
UNIQUE
DEFAULT
CHECK
Business Rules
Customer ID must be unique.
Vehicle ID must be unique.
Vehicle number must be unique.
Payment amount cannot be negative.
Rental rate cannot be negative.
Maintenance cost cannot be negative.
Customer ID in Rentals must exist in Customers.
Vehicle ID in Rentals must exist in Vehicles.

17. REAL-TIME BUSINESS SCENARIOS
==================================
Scenario 1 — Vehicle Booking
A customer wants a vehicle costing less than ₹2,500 per day.
vehicles
select v.vehicle_type, c.name,c.customer_id,m.cost, from vehicles v
join maintainance m on v.vehicle_id=m.vehicle_id
join  rentals r on c.customer_id=r.customer_id;
-- Requirement:
 -- Find available vehicles within the customer's budget.

-- Scenario 2 — Customer History
-- Q.A customer contacts support with their Customer ID.
-- Requirement:
-- Q. Display their complete rental and payment history.
-- =========================Scenario 3 — Highest Revenue Vehicle: =====================
-- Management wants to know which vehicle generates the most revenue.
-- Requirement:
 -- Q.Calculate vehicle-wise revenue and identify the top-performing vehicle.
select v.vehicle_type, sum(r.Total_Days*v.rental_rate_per_day)as total_revenue from vehicles v
join rentals r on v.vehicle_id=r.vehicle_id
group by v.vehicle_type
order by total_revenue desc;
Scenario 4 — High Maintenance Vehicles
Management wants to identify vehicles that are expensive to maintain.
Requirement:
 Find vehicles whose total maintenance cost exceeds ₹10,000.
select  v.vehicle_type,sum(m.cost) as maintenance_cost from vehicles v
join maintenance m on v.vehicle_id=m.vehicle_id
group by v.vehicle_type
having sum(m.cost)>1000
order by maintenance_cost desc;

-- ============Scenario 5 — Repeat Customers
-- Management wants to reward loyal customers.
-- Requirement:
 -- Q.Find customers who have completed more than one rental.
 select c.name,count(r.rental_id)as com_rentals from  customers c
 join rentals r on c.customer_id=r.customer_id
 where   r.rental_status="completed"
 group by c.name
 having count(r.rental_id)>1 
 order by com_rentals desc;

-- Scenario 6 — Payment Analysis
-- The finance department wants to understand payment preferences.
-- Requirement:
 -- Calculate total revenue received through Cash, UPI and Card.
 select  
  sum (case when payment_method ="upi" then amount else 0 end)as upi_payments,
  sum (case when payment_method ="cash" then amount else 0 end)as cash_payments,
  sum (case when payment_method ="card" then amount else 0 end)as card_payments,
 sum(amount)as total_revenue
 from payments;
 
 

-- ============================18. FINAL MANAGEMENT REPORT ================================
-- Client Requirement
-- The management team wants a single report summarizing the overall performance of the rental business.
-- Required Information
-- Q1.Total Customers
select count(*)name from customers;
-- Q2.Total Vehicles
select count(*)vehicle_type from vehicles;
-- Q3.Available Vehicles
select* from vehicles where Availability_Status="available";
-- Q4.Rented Vehicles
select* from rentals;
select v.vehicle_type,r.rental_id from  vehicles v
join rentals r on v.vehicle_id=r.vehicle_id
where  rental_status="completed";
-- Q5.Vehicles Under Maintenance
select v.vehicle_id,v.vehicle_type,m.maintenance_id,m.cost from vehicles v 
join maintenance m on v.vehicle_id=m.vehicle_id
-- Q6.Total Revenue
select sum(r.total_days*v.rental_rate_per_day)as total_revenue  from rentals r
join vehicles v on r.vehicle_id=v.vehicle_id;
-- Q7. Average Rental Amount
select avg(r.total_days*v.rental_rate_per_day)as avg_rental_amt from rentals r
join vehicles v on r.vehicle_id=v.vehicle_id ;
-- Q8. Total Maintenance Cost
 select sum(r.total_days*v.rental_rate_per_day)as maintainance_cost from rentals r
 join vehicles v on r.vehicle_id=v.vehicle_id;
-- Q9.Highest Spending Customer
select c.name,sum(r.total_days*v.rental_rate_per_day)as total_spending from customers c
join rentals r on c.customer_id=r.customer_id
join vehicles v on r.vehicle_id=v.vehicle_id
group by c.name
order by total_spending desc limit 1;
-- Q10. Most Rented Vehicle
select v.model,v.vehicle_type,v.vehicle_id,count(r.rental_id)as rent_count from vehicles v
join rentals r on  v.vehicle_id=r.vehicle_id
group by v.model,v.vehicle_id
order by rent_count desc;

-- Q11.Most Popular Brand
select brand,count(brand)as brand from vehicles
group by brand
order by brand desc limit 5;
-- Q12.Vehicle with Highest Maintenance Cost
select v.vehicle_type,sum(m.cost)as maintenance_cost from vehicles v
join maintenance m on v.vehicle_id=m.vehicle_id
group by v.vehicle_type
order by maintenance_cost desc limit 1;
-- Expected Outcome
-- The final report should help management make decisions about:
Customers
Vehicle utilization
Pricing
Revenue
Maintenance
Vehicle replacement
Business growth

19. TECHNICAL ROUND
====================
SQL & Database Questions
Why did you create separate tables for Customers, Vehicles, Rentals, Payments and Maintenance?
Explain the relationship between Customers and Rentals.
Explain the relationship between Vehicles and Rentals.
Why is Customer_ID a Foreign Key in Rentals?
Why is Vehicle_ID a Foreign Key in Rentals?
What is the difference between WHERE and HAVING?
What is the difference between DELETE, TRUNCATE and DROP?
What is the difference between INNER JOIN and LEFT JOIN?
How would you find customers who never rented a vehicle?
How would you find the second-highest rental rate?
How would you find the most rented vehicle?
How would you find the highest-spending customer?
What is a subquery?
What is a Window Function?
What is the difference between RANK(), DENSE_RANK() and ROW_NUMBER()?
What is the difference between an aggregate function and a window function?
What is LAG() and where would you use it?
What is LEAD() and where would you use it?
What is a View?
What is an Index?
How would you optimize a slow query?
What is a transaction?
Explain COMMIT and ROLLBACK
# ==============================================================================================================

