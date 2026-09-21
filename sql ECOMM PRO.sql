create  database sqldb;
use sqldb;
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'IT', 'Bengaluru'),
(2, 'HR', 'Mumbai'),
(3, 'Sales', 'Delhi'),
(4, 'Finance', 'Chennai'),
(5, 'Marketing', 'Hyderabad');

2. Employees
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    manager_id INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    city VARCHAR(50),
    email VARCHAR(100),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO employees VALUES
(1, 'Rahul', 1, NULL, 90000, '2020-01-15', 'Bengaluru', 'rahul@gmail.com'),
(2, 'Amit', 1, 1, 70000, '2021-03-10', 'Bengaluru', 'amit@gmail.com'),
(3, 'Priya', 1, 1, 70000, '2022-06-20', 'Mysuru', 'priya@gmail.com'),
(4, 'Neha', 1, 1, 50000, '2023-02-12', 'Bengaluru', 'neha@gmail.com'),

(5, 'Vikas', 2, NULL, 80000, '2019-05-01', 'Mumbai', 'vikas@gmail.com'),
(6, 'Sneha', 2, 5, 60000, '2021-07-15', 'Mumbai', 'sneha@gmail.com'),
(7, 'Kiran', 2, 5, 45000, '2023-01-20', 'Pune', 'kiran@gmail.com'),

(8, 'Arjun', 3, NULL, 85000, '2020-08-10', 'Delhi', 'arjun@gmail.com'),
(9, 'Ravi', 3, 8, 65000, '2021-09-25', 'Delhi', 'ravi@gmail.com'),
(10, 'Anjali', 3, 8, 55000, '2022-11-11', 'Noida', 'anjali@gmail.com'),
(11, 'Suresh', 3, 8, 45000, '2024-01-05', 'Delhi', 'suresh@gmail.com'),

(12, 'Manoj', 4, NULL, 95000, '2018-04-18', 'Chennai', 'manoj@gmail.com'),
(13, 'Divya', 4, 12, 75000, '2020-12-01', 'Chennai', 'divya@gmail.com'),
(14, 'Pooja', 4, 12, 55000, '2022-03-15', 'Coimbatore', 'pooja@gmail.com'),

(15, 'Rohit', 5, NULL, 88000, '2019-10-10', 'Hyderabad', 'rohit@gmail.com'),
(16, 'Meena', 5, 15, 65000, '2021-05-22', 'Hyderabad', 'meena@gmail.com'),
(17, 'Varun', 5, 15, 50000, '2023-08-30', 'Secunderabad', 'varun@gmail.com'),

(18, 'Rahul', 1, 1, 60000, '2024-02-14', 'Bengaluru', 'rahul2@gmail.com'),
(19, 'Amit', 2, 5, 60000, '2024-03-12', 'Mumbai', 'amit2@gmail.com'),
(20, 'John', 3, 8, 40000, '2024-04-01', 'Delhi', 'john@gmail.com');

3. Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO customers VALUES
(1, 'Raj', 'Bengaluru', 'raj@gmail.com'),
(2, 'Sneha', 'Mumbai', 'sneha_customer@gmail.com'),
(3, 'Aman', 'Delhi', 'aman@gmail.com'),
(4, 'Pooja', 'Chennai', 'pooja_customer@gmail.com'),
(5, 'Karan', 'Hyderabad', 'karan@gmail.com'),
(6, 'Meena', 'Pune', 'meena_customer@gmail.com'),
(7, 'Vijay', 'Bengaluru', 'vijay@gmail.com'),
(8, 'Anu', 'Delhi', 'anu@gmail.com'),
(9, 'Ravi', 'Mumbai', 'ravi_customer@gmail.com'),
(10, 'Nisha', 'Chennai', 'nisha@gmail.com');

4. Products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 60000),
(2, 'Mobile', 'Electronics', 30000),
(3, 'Keyboard', 'Accessories', 2000),
(4, 'Mouse', 'Accessories', 1000),
(5, 'Monitor', 'Electronics', 15000),
(6, 'Headphones', 'Accessories', 3000),
(7, 'Tablet', 'Electronics', 25000),
(8, 'Printer', 'Electronics', 12000);

5. Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
(101, 1, '2024-01-10', 60000),
(102, 2, '2024-01-15', 30000),
(103, 1, '2024-02-05', 15000),
(104, 3, '2024-02-20', 25000),
(105, 4, '2024-03-10', 60000),
(106, 5, '2024-03-15', 10000),
(107, 1, '2024-04-01', 30000),
(108, 6, '2024-04-18', 5000),
(109, 7, '2024-05-05', 75000),
(110, 2, '2024-05-20', 45000),
(111, 8, '2024-06-10', 12000),
(112, 3, '2024-06-25', 30000),
(113, 9, '2024-07-01', 60000),
(114, 1, '2024-07-15', 25000),
(115, 5, '2024-08-10', 35000),
(116, 10, '2024-08-20', 15000),
(117, 2, '2024-09-05', 70000),
(118, 7, '2024-09-15', 40000),
(119, 3, '2024-10-10', 55000),
(120, 1, '2024-10-25', 20000);

6. Order Items
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items VALUES
(101, 1, 1),
(102, 2, 1),
(103, 5, 1),
(104, 7, 1),
(105, 1, 1),
(106, 4, 5),
(107, 2, 1),
(108, 3, 2),
(109, 1, 1),
(110, 6, 2),
(111, 8, 1),
(112, 2, 1),
(113, 1, 1),
(114, 7, 1),
(115, 5, 2),
(116, 4, 5),
(117, 1, 1),
(118, 6, 3),
(119, 2, 1),
(120, 3, 2);


select* from customers;
select* from departments;
select* from employees;
select* from order_items;
select* from orders;
select * from products;

#SQL Complete Practice — 20 Questions Per Topic

#=============Topic 1 — SELECT ==============
#1.Display all employees.
select* from employees;

#2.Display only employee names.
select employee_name from employees;

#3.Display employee names and salaries.
select employee_name,salary from employees;

Q4.Display employee names, departments, and salaries.
select employee_name,department_id,salary from employees;

Q5.Display all customers.
select customer_name from customers;
select* from customers;

Q6.Display customer names and cities.
select customer_name,city from  customers;

Q7.Display all products.
select * from products;

Q8.Display product names and prices.
select product_name,price from products;

Q9.Display employee name with alias Employee_Name.
select employee_name as employee from employees;

Q10.Display salary with alias Employee_Salary.
select salary as employee_salary from employees;

Q11.Display customer name with alias Customer.
select customer_name as  customer from customers;

# =========== Topic 2 — WHERE ===========

Employees with salary > 60,000.
select* from employees where salary>60000;

Employees with salary < 50,000.
select* from employees where salary>50000;

Employees with salary = 70,000.
select* from employees where salary=70000;
Employees from IT.
select* from employees
select* from departments where department_name="it";

Employees from HR.
select * from department where department_name="hr";

Employees from Bengaluru.
select* from departments where location ="bengaluru";

Employees from Mumbai.
select* from departments where location="mumbai";

Employees with salary between 50,000 and 80,000. 
select* from employees where   salary between  50000 and 80000;

Employees with salary >= 70,000.
select * from employees where salary >=70000;

Employees with salary <= 60,000.
select* from employees where salary<=60000;

Employees not from IT.
select* from departments where  department_name!="it";

Employees not from Bengaluru.
select* from departments where location<>"bengaluru";

Orders greater than 50,000.
select * from orders where amount>50000;

Orders less than 20,000.
select* from orders where  amount<20000;

Products costing more than 20,000.
select * from products where price>20000;

Products costing between 5,000 and 30,000.
select * from products where price between 50000 and 30000;

Customers from Delhi.
select* from departments where location="delhi";

Employees hired after 2022-01-01.
select* from employees where  hire_date >2022-01-01;

Employees hired before 2020-01-01.
select* from employees where hire_date>2020-01-01;

Employees from IT earning more than 60,000.
select d.department_name,e.salary from departments d  join employees e on d.department_id=e.department_id
where d.department_name="it"
and e.salary>60000;
SELECT d.department_name, e.salary
FROM departments AS d
JOIN employees AS eON d.department_id = e.department_id
WHERE d.department_name = 'IT'AND e.salary > 60000;
  
Topic 3 — DISTINCT
Unique departments.
select distinct *from departments;

Unique employee cities.
select distinct city from employees;

Unique customer cities.
select distinct city from customers;

Unique product categories.
select distinct product_name from products;

Unique salaries.
select distinct salary from employees;

Unique hire years.
select distinct hire_date from employees;

Unique order customer IDs.
select distinct customer_id from customers;

Unique order dates.
select  distinct order_date from orders;

Unique employee manager IDs.
select distinct manager_id from  employees;

Unique product prices.
select  distinct price from products;

Unique customer emails.
select distinct email from employees;

Unique employee emails.
select  distinct employee_name,email from employees;

Unique department + city combinations.
select distinct department_id,city from employees;

Unique salary + department combinations.
select  distinct salary ,department_id from employees;

Unique product category + price combinations.
select distinct product_name,price from products;

Unique customer city + email combinations.
select distinct city, email from employees; 

Count unique departments.
select count(department_name) from departments;

Count unique employee cities.
select distinct  count(city) from employees;

Count unique customer cities
select distinct city from employees;

Count unique salaries.
select distinct count(salary) from employees;

#========== Topic 4 — ORDER BY=================
Employees by salary ascending.
select * from employees order by salary asc;

Employees by salary descending.
select* from employees order by salary desc;
Employees alphabetically.
select* from employees  order by employee_name asc;
Employees reverse alphabetically 
select* from employees order by  employee_name desc;
Products by price ascending.
select* from products order by price asc;
Products by price descending.
select * from products order by price desc;
Customers alphabetically.
select* from employees order by  employee_name asc;
Orders by amount ascending.
select * from orders order by amount asc;
Orders by amount descending.
select * from orders  order by amount desc;
Employees by hire date oldest first.
select * from employees order by hire_date asc;
Employees by hire date newest first.
select * from employees order by hire_date desc;
Employees by department alphabetically.
select *  from departments order by  department_name asc;
Employees by department and salary descending.
select city,employee_name from employees order by city, salary  desc;
Employees by city and salary descending.
SELECT city, employee_name, salary
FROM employees
ORDER BY city ASC, salary DESC;
select  city from  employees  group by city order by salary desc;
Products by category and price.
select category,price from products order by category ,price  desc;
Customers by city and name.
select city,customer_name from customers order by city desc,customer_name asc;
Orders by date and amount.
 select order_date,amount from orders  order by order_date,amount desc;
Find top 5 salaries.
select salary from employees order by salary  desc limit 5;
Find top 5 orders.
select *from orders order by amount desc limit 5;
Find bottom 5 salaries.
select* from orders  order by amount asc limit 5;

Topic 5 — Aggregate Functions
Count employees.
select count(employee_name) from employees;
Count customers.
select count(*)  from customers;
Count products.
select count(*) from products;
Count orders.
select count(*) from orders;
Total employee salary.
select sum(salary) from employees;
Average employee salary.
select avg(salary) from employees;
Maximum employee salary.
select max(salary) from  employees;
Minimum employee salary.
select min(salary)  from employees;
Total order amount.
select sum(amount) from  orders;
Average order amount.
select avg(amount) from orders;
Maximum order amount.
select max(amount) from orders;
Minimum order amount.
select min(amount) from orders;
Maximum product price.
select max(price) from products;
Minimum product price.
select min(price) from products;
Average product price.
select avg(price) from products;
Total product price.
select sum(price) from products;
Count distinct departments.
select distinct  count(*)department_name from departments;
Count distinct cities.
select distinct count(*)cities from  employees;
Count distinct salaries.
select distinct count(*) salary from employees;
Count distinct customers who placed orders.
select count( distinct customer_id) from customers;

#==============Topic 6 — GROUP BY ============

Count employees by department.
select count(department_id) from employees;

Count employees by city.
select count(city) from employees;

Average salary by department.
select avg(salary) from departments;

Average salary by city.
select  city,avg(salary) from employees group by city; 

Total salary by department.
select department_id,sum(salary) from employees group by department_id;

Total salary by city.
select  city,sum(salary)   from employees group by city;

Maximum salary by department.
select  department_id,max(salary) from employees group by  department_id;

Minimum salary by department.
select department_id,min(salary) from employees group by department_id;

Maximum salary by city.
select city,max(salary) from employees group by city;
Minimum salary by city.
select city,min(salary) from employees group by city;

Count customers by city.
select count(city) from customers;

Count orders by customer.
select count(customer_id) from orders;

Total order amount by customer.
select customer_id ,sum(amount) from orders group by customer_id;

Average order amount by customer.
select customer_id,avg(amount) from orders group by customer_id ;

Maximum order amount by customer.
select customer_id, max(amount)  from orders group by  customer_id;

Count products by category.
select category, count(product_name) from products  group by category;

Average product price by category.
select category,avg(price) from products group by category;

Maximum product price by category.
select category,max(price) from products group by category;

Total quantity sold by product.
select  product_id,sum(quantity) from order_items group by product_id;

Total revenue by product.
select sum(price) as revenue from products;

#===============Topic 7 — HAVING =============
Departments with more than 3 employees.
select  department_id ,count(employee_name)from employees group by department_id having  count(*)>3;
Departments with at least 4 employees.
select department_id, count(employee_name) from employees group by department_id having count(*)=4;
Departments with average salary > 60,000.
select  department_id,avg(salary) from employees group by department_id having avg(salary) > 60000; 
Departments with average salary < 60,000.
select  department_id,avg(salary) from employees group by department_id having avg(salary) < 60000;
Departments with total salary > 200,000.
select department_id,sum(salary) from employees group by department_id having sum(salary)>200000;
Departments with total salary < 200,000.
select department_id,sum(salary) from employees group by department_id  having sum(salary)<200000;
Cities with more than 2 employees.
select city,count(employee_name) from employees group by city having count(*)>2;
Cities with average salary > 60,000.
select city,avg(salary) from employees group by city having avg(salary)>60000;
Customers with more than 1 order.
select c.customer_name,count(o.order_id)  from  customers c  join orders o on c.customer_id=o.customer_id
group by c.customer_name having count(o.order_id)>1;
Customers with total spending > 50,000.
select c.customer_name,sum(o.amount)from customers c join orders o on c.customer_id=o.customer_id group by c.customer_name
having sum(o.amount)>50000;
Customers with average order > 30,000.
select avg(amount) from orders having avg(amount)>30000; 
Products sold more than 2 units.
select* from products;
select  product_id,count(quantity) from order_items group by product_id having count(quantity)>2;
Products with total revenue > 30,000.
select sum(amount)as total_revenue from orders having sum(amount)>30000;
Categories with average price > 10,000.
select category,avg(price) from products  group by category having avg(price)>10000;
Categories having more than 3 products.
select  category,count(product_name) from  products group by category having  count(product_name)>3;
Departments where maximum salary > 80,000.
select d.department_name,max(e.salary) from departments d  join employees e on d.department_id=e.department_id 
group by d.department_name
having max(e.salary)>80000;
Departments where minimum salary < 50,000.
select department_id,min(salary) from employees group by department_id having min(salary)<50000;
Cities having total salary > 150,000.
Customers whose maximum order > 50,000.
Customers whose minimum order < 20,000.
# ============ Topic 8 — LIKE / Pattern Matching =======
Names starting with R.
select * from employees where employee_name like "r%";

Names starting with A.
select* from employees where employee_name like "a%";

Names ending with a.
select* from employees where employee_name like "%a";

Names ending with n.
select * from employees where employee_name like "%n";

Names containing i.
select * from employees where employee_name like "%i%";

Names containing ra.
select * from employees where employee_name like "%ra%";

Names containing ee.
select * from employees where employee_name like "%ee%";

Names with exactly 5 characters.
select  employee_name from employees where length(employee_name) =5;

Names with exactly 4 characters.
select * from employees where  length(employee_name)=4;

Names whose second character is a
select* from employees where employee_name like "_a%";

Names whose third character is h.
select * from  employees where employee_name like "__h%";

Emails ending in gmail.com.
select* from employees where email like "%gmail.com";

Emails starting with rahul.
select email from employees where email like "rahul%";

Product names containing o.
select employee_name from employees where employee_name like "%o%";

Product names ending with r.
select employee_name from employees where employee_name like "%r";

Cities starting with B.
select * from employees  where employee_name like "b%";

Cities containing a.
select*from employees where employee_name like "%a%";

Customer names starting with P.
select * from employees where employee_name like "%p%";

Customer emails containing customer.
select * from employees where email like "%email%";

Employee names containing a and salary > 50,000.
select * from employees where  employee_name like "%a%"
and salary >50000;


#==============Topic 9 — CASE ===========**
Q1.Categorize salaries High/Medium/Low.**
select employee_name , salary, case when salary>80000 then "high"
                                     when salary >50000 then "medium"
                                     when salary>30000 then "low" 
                                     else "very low"  end as salary_cat from employees;
Q2.Categorize products by price.
select product_name,price,case when price>50000 then "brand"
								when price  >30000 then "medium"
                                else "cheap" end as catgorize
								from products;
Q3.Categorize orders by amount.
select order_id,amount ,case when amount>=50000 then "high"
                            when amount>=40000 then "medium"
                            else  "low"end as categorize from orders;
Q4.Give salary bonus percentage.
select  salary,case when salary>80000 then "10%"
					when salary>50000 then "8%"
                    when salary>=40000 then "5%"
                    else "2%" end as bonus from employees;
Q5.Mark employees as Senior/Junior based on hire date.
select * from employees;
select employee_name, hire_date,case when hire_date >='2022-01-01' then "seniur"
                                     when hire_date<='2021-01-01' then "junior"
                                     else "fresher" end as category from employees;
								
Q6.Mark employees as Manager/Employee based on manager ID.
select * from employees;
select  manager_id, case when manager_id >=5 then "manager"
						else "employee" end as mark_emp  from employees;
Q7.Categorize departments as technical/non-technical.
select* from departments;
select  department_name, case when department_name in("it" ,"hr") then 'technical'
                             else "non teccnical"  end as categorize from departments;
Q8.Categorize products as expensive/cheap.
select  product_name,price, case when price >=10000 then 'expensive'
                            else 'cheap' end as catagorize from products;
Q9.Categorize customers based on spending.
select c.customer_name,o.customer_id,o.amount from customers c
 join  orders o onc.customer_id=o.customer_id;
Q10.Count employees by salary category.
select salary,count(employee_name) from employees group by salary ;
Q11.Count orders by amount category.
select amount,count(order_id) from orders group by amount;
select  amount,case when
				   amount >=60000 then 'high'
				   when amount>=30000 then 'medium'
			       else 'low' end as catgorize from orders  ;
Q12.Calculate bonus amount.
select  order_id,amount* case when amount >=60000 then '10%'
                              when amount >= 30000 then '5%'
                              else '2'  end as  bonus_amount from orders;
Q13.Calculate salary after bonus.
select employee_name,salary * case when salary >=80000 then '20%'
                                   when salary >=50000 then '10%'
								   when salary >=3000 then '5%'
                                   else '2%' end as salary_after_bonus from employees;

Q14.Categorize cities as Metro/Non-Metro.
select * from employees;
select  city,case when city in('bengaluru','delhi','mumbai')then 'metro'
             else 'non_metro'  end as categorize_cities from employees;
Q15.Create a salary grade A/B/C.
select salary,case when salary >=80000 then 'a'
                   when salary>=50000 then 'b'
                   else 'c' end as   salary_grade from employees;
Q16.Create order grades.
select  order_id,amount, case when  amount >=90000 then 'a'
							  when amount >=60000 then 'b'
                              else 'c' end as grades from orders;
Q17.Find employees with salary > 70K using CASE.
select  employee_name,salary , case when  salary >=70000 then 'eligible'
                                    else  'not eligible'end as employee from employees ;
Q18.Find customers with spending > 100K using CASE.
select customer_id,amount, case when  amount>=100000 then 'higher spender'
						   else 'regular spendar' end as spendig from orders;
Q19.Display readable department names.
select  department_name,case when department_name in('it','hr') then 'redable'
                        else 'low readable'end as redable_dep from departments;
#==========Topic 10 — String Functions =============
Q1.Employee names in uppercase.
select upper(employee_name) from employees;
Q2.Employee names in lowercase.
select lower(employee_name) from employees;
Q3.Customer names in uppercase.
select upper(customer_name) from customers;

Q4.Length of employee names.
select length(employee_name) from employees;
Q5.Length of customer names.
select length(customer_name) from customers;
Q6.First 3 characters of employee names.
select substring(customer_name, 1,3) from customers;
Q7.Last 3 characters of employee names.
select substring(employee_name,1,3) from employees;
Q8.First 2 characters of emails.
select substring(email,1,2) from employees;
Q9.Combine employee name and city.
select concat(employee_name,city) from  employees;

Q10.Combine customer name and city.
select concat(customer_name,'-',city) from customers;

Q11.Replace Bengaluru with Bangalore.
select REPLACE(city,'Bengaluru','Bengalore')as city from employees;

Q12.Replace gmail.com with another domain.
SELECT REPLACE(email,'gmail.com','domain')as email from employees;


Q13.Remove spaces using TRIM.
select TRIM(customer_name) from customers;

Q14.Find names longer than 5 characters.
Q15.Find names shorter than 5 characters.
Q16.Extract domain from email.
Q17.Extract first name from a full name.
Q18.Concatenate name and salary.
Q19.Create employee display text.
Q20.Create product display text containing name + price.

#===========Topic 11 — Date Functions =======

Q1.Employees hired after 2022.
select  employee_name,hire_date from employees where hire_date >'2022-01-01';

Q2.Employees hired before 2020.
select employee_name,hire_date from employees where hire_date <'2020-01-01';

Q3.Employees hired in 2024.
select employee_name,hire_date from employees where hire_date ='2024-02-03';
Q4.Employees hired in 2023.
select employee_name,hire_date from employees where hire_date='2023-01-01';

Q5.Find oldest employee.
select  employee_name ,hire_date from  employees order by hire_date asc;
  
Q6.Find newest employee.
select employee_name,hire_date from employees order by hire_date desc;

Q7.Extract year from hire date.
select year(hire_date) from employees 

Q8.Extract month from hire date.
select month(hire_date) form employees;

Q9.Extract day from hire date.
select day(hire_date)from employees;

Q10.Count employees by hire year.
select  year(hire_date)as year, count(employee_name) from employees group by year ;
Q11.Count employees by hire month.
select  count(employee_name) ,month(hire_date) as month from employees;
Q12.Orders placed in January.
select* from employees;
select  hire_date,month(hire_date) as month from employees where month(hire_date) ='01';
Q13.Orders placed in March.
select hire_date,month(hire_date)as month from employees where month(hire_date) ='03';
Q14.Orders placed in 2024.
select employee_name, year(hire_date) as year from employees where year(hire_date) ='2024';
Q15.Total sales by year.
select year(hire_date),sum(salary) from employees  group by year(hire_date);
Q16.Total sales by month.
select month(hire_date),sum(salary) from  employees group by month(hire_date);
Q17.Average order amount by month.
select  month(order_date),avg(amount) from orders group by month(order_date) ;
Q18.Find earliest order.
select order_id,order_date from orders group by order_id  order by order_date asc;
Q19.Find latest order.
select order_id,order_date from orders group by order_id order by order_date desc;
Q20.Find employees hired between 2020 and 2022.
  select * from employees where hire_date between '2020-01-01'and '2023-01-01';
select *from employees where hire_date >='2020-01-01' and hire_date < '2022-01-01'; 

# ========== Topic 12 — INNER JOIN ===============

Employee + department name.
select  e.employee_name,e.department_id, d.department_id,d.department_name from employees e inner join departments d
on e.department_id=d.department_id;

Employee + department location.
select e.employee_name,d.department_id,d.department_name from  employees e inner join  departments d
on e.department_id=d.department_id;

Employee + department name + salary.
select e.employee_name,e.salary,d.department_name from employees e  inner join  
departments d on e.department_id=d.department_id;

 Q.Find IT employees using JOIN.
select e.employee_name,d.department_name from  employees  e join departments d on e.department_id =d.department_id;

Q.Find HR employees using JOIN.
select e.employee_name,d.department_name from employees e   join    departments d on  e.department_id=d.department_id
 where d.department_name="hr";
Count employees per department.
select d.department_name ,count(e.employee_name) from employees e  join departments d  on  e.department_id=d.department_id
group by d.department_name;
Average salary per department.
select  d.department_name,avg(e.salary) from departments d join employees e on  d.department_id=e.department_id
group by d.department_name;
Maximum salary per department.
select d.department_name,max(e.salary) from departments d join employees e on d.department_id=e.department_id 
group by d.department_name;
Minimum salary per department.
select d.department_name,min(e.salary) from departments d join employees e on d.department_id=e.department_id
group by d.department_name;
Total salary per department.
select d.department_name,sum(e.salary) from departments d join employees e on d.department_id=e.department_id
group by d.department_name;
Customer + order amount.
select c.customer_name,o.amount from customers c join orders o on c.customer_id=o.customer_id; 
Customer + order date.
select  c.customer_name,o.order_date from customers c join orders o on c.customer_id=o.customer_id;
Customer + order ID.
select c.customer_name,o.order_id from customers c join orders o on c.customer_id=o.customer_id;
Customer + order amount + city.
select c.customer_name,c.city,o.amount from customers c join orders o on c.customer_id=o.customer_id;  
Order + product.
select o.order_id,p.product_name from  order_items o join products p on o.product_id=p.product_id;
Order + product + quantity.
select o.order_id,o.quantity,p.product_name from order_items o join products p on
o.product_id=p.product_id;
 
Product + order quantity.
select o.quantity, p.product_name from order_items o join  products p on o.product_id=p.product_id;

Product + order revenue.
Customer + product purchased.
select c.customer_name,p.product_name from customers c join  products p  on c.customer_id=p.product_id;

Customer + product + quantity + amount.
select c.customer_name,o.amount,p.product_name,oi.quantity from customers c
join  orders o  on c.customer_id =o.customer_id
join order_items oi on o.order_id = oi.order_id
join  products p  on p.product_id = oi.product_id;


# ========= Topic 13 — LEFT JOIN =========
All departments with employees.
select e.employee_name,d.department_name from employees e left join  departments d  on  e.department_id=d.department_id
Departments without employees.
select d. department_name,e.employee_name from departments d left join employees e on d.department_id=e.department_id
where e.employee_name is null;

All customers with orders.
select o.order_id,c.customer_name from orders o left join customers c on o.customer_id=c.customer_id;

Customers without orders.
All products with order items.
select p.product_name,oi.order_id from products p left join order_items oi on p.product_id=oi.product_id;

Products never ordered.
select o.order_id,p.product_name from orders o left join products p on o.order_id=p.product_id
where o.order_id is  null ;

All employees with departments.
select e.employee_name,d.department_name from employees e  left join departments d on e.department_id=d.department_id;

Employees without departments.
select e.employee_name,d.department_name from employees e left join departments d on e.department_id=d.department_id where e.employee_name is null;

Count employees per department.
select count(e.employee_name),d.department_name from employees e left join departments d on e.department_id=d.department_id
group by d.department_name;

Count orders per customer.
select c.customer_name,count( o.order_id) from customers c left join orders o on c.customer_id=o.customer_id
group by c.customer_name;

Total spending per customer.
select c.customer_name,sum(o.amount)from customers c left join orders o on c.customer_id=o.customer_id
group by customer_name;

Total quantity per product.
select p.product_name,sum(oi.quantity) from products p left join order_items oi on p.product_id=oi .product_id
group by p.product_name;

Total revenue per product.
select p.product_name,sum(o.amount) as total_revenue from products p left join orders o on  p.product_id=o.customer_id
group by p.product_name;

Average order per customer.
select c.customer_name,avg(order_id)  from  customers c left join orders o on c.customer_id=o.customer_id
group by c.customer_name;

Customers with zero orders.
select c.customer_name,o.order_id from customers c left join orders o on c.customer_id=o.customer_id  where c.customer_name is not null ;
Products with zero sales.
select p.product_name,o.order_id from  products p left join orders o on p.product_id=o.order_id
where p.product_name is null;

Departments with zero employees.
select d.department_name,e.employee_name from departments d  left  join employees e on
d.department_id=e.department_id where e.employee_name is  null;

Employees with missing department.
select e.employee_name,d.department_name from employees e left join departments d on e.department_id=d.department_id 
where d.department_name is null;

Products and their latest order.
select p.product_name ,max(o.order_date) as latest_orders from products p left join orders o on 
p.product_id=o.customer_id  group by p.product_name;

Customers and their latest order.
select c.customer_name, max(o.order_date) as latest_orders from customers c left join orders o on
c.customer_id=o.customer_id group by c.customer_name;

#======= Topic 14 — Multiple JOINs ======

 Q1.Customer → Orders.
select c.customer_name,o.order_id from customers c join  orders o on c.customer_id=o.customer_id;

Q2.Orders → Order Items.
select o.order_id,oi.product_id,oi.quantity from orders o join  order_items oi on o.order_id=oi.order_id;

Q3.Order Items → Products.
select p.product_name,oi.order_id from products p join order_items oi on p.product_id=oi.product_id;

Q4.Customer + Order + Product.
select c.customer_name,o.order_id,p.product_name from customers c
join  orders o on c.customer_id=o.customer_id
join products p on o.customer_id=p.product_id;

Q5.Customer + Product + Quantity.
select p.product_name,oi.order_id, c.customer_name from  products p
join order_items  oi on p.product_id=oi.product_id
join  orders o on oi.order_id=o.order_id
join customers c on o.customer_id=c.customer_id;

Q6.Customer + Product + Revenue.
select c.customer_name,o.amount as revenue,p.product_name  from customers c
 join orders o on c.customer_id=o .customer_id
 join products p on o.customer_id=p.product_id;
 
Q7.Total customer spending.
select c.customer_name,p.price as spending from customers c join products p on
c.customer_id=p.product_id;

Q8.Total product revenue.
select p.product_name,sum(o.amount) as total_revenue from products p 
join orders o  on p.product_id=o.customer_id
group by p.product_name;

Q9.Total product quantity.
select p.product_name,sum(oi.quantity)as quantity from products p join
order_items oi on p.product_id=oi.product_id
group by p.product_name;
Q10.Top customer.
select c.customer_name,max(o.amount)as amount from customers c join orders o on c.customer_id=o.customer_id
group by c.customer_name order by amount desc;

Q11.Top product.
select product_name,max(price) from products  group by product_name order by max(price) desc;

Q12.Top 3 customers.
select* from customers;
select c.customer_name,max(p.price) from customers c join products p on c.customer_id=p.product_id group by c.customer_name 
order by max(p.price) desc limit 3;

Q13.Top 3 products.
select product_name,max(price) from products group by product_name order by max(price) desc limit 3;

Q14.Average spending per customer.
select c.customer_name ,avg(o.amount)as avg_spending_cust from customers c  join orders o on  c.customer_id=o.customer_id group by c.customer_name ;

Q15.Average quantity per product.
select p.product_name,avg(oi.quantity)as avg_quantity from products p join order_items oi on p.product_id=oi.product_id group by p.product_name;

Q16.Most purchased product.
select p.product_name,sum(oi.quantity) from products p join order_items oi on p.product_id=oi.product_id group by p.product_name
order by sum(oi.quantity) desc limit 1;

Q17.Customers most expensive order.
select c.customer_name,max(p.price)as most_expensive from customers c  join products p 
on c.customer_id=p.product_id group by  c.customer_name  order by max(p.price) limit 1;

Q18.Product generating highest revenue.
select p.product_name,max(o.amount) from products p join orders o on
p.product_id=o.customer_id group by p.product_name order by max(o.amount) desc limit 1;

Q19.Customer who bought a Laptop.
select c.customer_name ,p.product_name from customers c join products p on 
c.customer_id=p.product_id  where p.product_name='laptop';

Q20.Customers who bought Electronics products.
select* from products;
select c.customer_name,p.product_name from customers c join products p on
c.customer_id=p.product_id where p.product_name='electronics';

# ========== Topic 15 — Subqueries ==========
Q1.Employees above average salary.
select employee_name, avg(salary) from employees group by  employee_name ; 

Q2.Employees below average salary.
select  employee_name, avg(salary) from employees group by employee_name;

Q3.Highest salary.
select max(salary) from employees;

Q4.Lowest salary.
select min(salary) from employees;

Q5.Second-highest salary
select  employee_name,max(salary) from employees   group by employee_name order by max(salary) limit 1 offset 1;

Q6.Third-highest salary.
select max(salary) from employees where 
                               salary<(select max(salary) from employees where salary<(select max(salary) from employees));

Q7.Employees earning highest salary.
select employee_name,max(salary) from employees group by employee_name  order by max(salary) desc limit 1;

Q8.Employees earning more than IT average.
        select e.employee_name,e.salary,d.department_name from employees e join depatments d  on 
		e.department_id=d.department_id,(select avg(esalary) from employees e;
        select employee_name,salary from employees 
        where department_id=(select department_id from departments 
        where department_name='it');
        
Q9.Employees earning more than HR average.
		Employees earning more than Sales average.
		select employee_name,salary from employees where salary<(select avg(salary) from employees);
        
Department with highest average salary.
select d.department_name,avg(e.salary) from  departments d join employees e on
e.department_id=d.department_id group by department_name
order by avg(salary)  desc limit 1;

Department with lowest average salary.
select d.department_name,avg(e.salary)  from departments d join employees e  on 
e.department_id=d.department_id group by d.department_name order by   avg(e.salary) asc ; 

Employees earning more than every HR employee.
select e.employee_name, e.salary,d.department_name from employees e join departments d on e.department_id=d.department_id
 where  d.department_name="hr";
 
Employees earning more than at least one HR employee.
select e.employee_name,o.order_date from employees e join orders o on e.employee_id= o.customer_id order by  order_date desc;

Customer with highest spending.
select c.customer_name,max(o.amount) from customers c join orders o on c.customer_id=o.customer_id  group by c.customer_name 
order by  max(o.amount) desc limit 1;

Product with highest price.
select product_name, max(price)as highest_price from products group by product_name;

Product with highest revenue.
select product_name ,max(price)as high_revenue from products group by product_name;

Employees whose salary is greater than company average.
select* from employees where salary > (select avg(salary) from employees);

Topic 16 — Self JOIN
Employee + manager.
select* from employees;
select e.employee_name as employee,m.manager_id as manager from employees e 
join employees m on m.manager_id=e.employee_id;

Employees without managers.
select e.employee_name as employees,m.employee_name as manager from employees e join employees m
on e.manager_id=m.manager_id where m.manager_id is null;

Employees with managers.
select e.employee_name as employee,e.employee_name as manager  from employees e join  employees m on 
e.manager_id=m.manager_id;

Highest-paid employee under each manager.
select 
e.employee_name as employee,
m.employee_name as manager,
e.salary  from employees e join  employees m on
e.manager_id=m.manager_id where e.salary=(select max(e.salary) from employees);

Lowest-paid employee under each manager.
select e.employee_name as employees,
e.employee_name as manager,max(e.salary) from employees e  join employees m on e.employee_id=m.employee_id group by  e.employee_name;

Employees under Rahul.
select *from employees where  employee_name="rahul";

Employees under Vikas.
select * from employees where emeployee_name="vikas";

Employees under Arjun.
select *from employees where employee_name='arjun';

Employees under Manoj.
select * from employees where employee_name='manoj';

Employees under Rohit.
select  employee_name, salary from employees where employee_name='rohit';

Manager with highest team salary.
select m.employee_name as manager, max(e.salary)as highest_salary from employees m join employees e on
m.manager_id=e.employee_id group by manager order by max(e.salary) desc limit 1 ;

#========== Topic 17 — CTE ============
CTE for all employees.
CTE for employees > average salary.
select*from employees where salary >(select avg(salary) from employees);

Employees above department average.
select employee_name,department_id,salary from employees where salary >( select avg(salary) from employees);

CTE for department totals.
select d.department_id,d.department_name,d.location,e.salary,e.hire_date,e.email from departments d join 
employees e on d.department_id=e.department_id ;

Highest department total.
CTE for customer spending.
Top 3 customers
select c.customer_name,e.salary from customers c  join  employees e on c.customer_id=employee_id 
 limit 3;
 
CTE for product revenue.
Top 3 products.
select product_name,max(price) from products group by product_name order by max(price) limit 3;

CTE for salary ranking.
Second-highest salary.
select employee_name ,max(salary) from employees  group by employee_name order by max(salary)  desc  limit 1 offset 1;

CTE for employee count.
select count(employee_name) from employees;


#============ Topic 18 — Window Functions ===========

ROW_NUMBER() for employees.
select employee_name,employee_id,salary,row_number() over( order by salary desc )as rn from employees; 

RANK() by salary.
select employee_name,salary,
                 rank() over(order by salary desc) as rk from employees; 

DENSE_RANK() by salary.
select employee_name,salary, 
                 dense_rank() over(order  by salary desc) as dr from employees;

Rank salary within department.
select employee_id,department_id, employee_name,salary,
                        rank() over(partition by department_id order by salary desc) as rk from employees;

Row number within department.
select department_id,salary, 
                          row_number() over(partition by department_id order by salary desc) as rn from employees;

Highest employee per department.
select * from( select employee_name,department_id,salary, 
rank() over(partition by employee_name order by salary desc) as rk from employees)
as t where rk =1;

Second-highest per department.
select * from (select *,
 rank() over(partition by department_id order by salary desc) as rk from employees)
as t where  rk=2;

Third-highest per department.
select* from(select department_id,salary,
rank() over(partition by department_id order by salary desc) as rk from employees)
as t where  rk =3;

Top 2 per department.
select * from(select*,rank() over(partition by department_id order by salary desc) as rk from employees)
as t where rk=2;
Top 3 per department.
 select*from( select d.department_name,e.salary ,
rank() over(partition by d.department_name order by salary desc) as rk from employees e join  departments d on e.department_id=d.department_id)
as t where  rk=3;

Employees tied for highest salary.
select employee_name,max(salary)from employees group by employee_name order by max(salary)desc limit 1 ;
select * from(select employee_name,salary,
 rank() over( order by salary desc)as rk from employees)  as t where rk =1 ;

Employees tied for second salary.
select* from( select *, 
rank() over(order by salary desc) as rk from employees ) as t where rk=2;

Running salary total.
select  sum(salary) from employees;

Running order total.
select sum(amount) from orders;

Department average using window function.
select employee_name, department_id,salary,avg(salary) over (partition by department_id ) as dep_avg from employees ;

Salary difference from previous employee.
select employee_name,salary,lag(salary) over( order by salary desc) as pre_sales,
salary -lag(salary) over(order by salary desc) as salary_diff from employees;

Highest salary rank.
select* from(select *, rank() over(order by salary desc) as rk from employees)as t where rk=1; 

Lowest salary rank.
select* from(select *,rank() over(order by salary asc) as rk from employees) as t where rk=1
#=========== Topic 19 — LAG / LEAD ============
Previous employee salary.
select employee_name,salary, lag(salary) over(order by salary desc) as previous_salary from employees;

Next employee salary.
select employee_name,salary,lead(salary) over(order by  salary desc)as next_salary from employees;

Difference from previous salary.
select salary,lag(salary) over(order by salary desc) as pre_salary,
salary- lag(salary )over(order by salary desc)as diff_salary from employees ;

Difference from next salary.
select salary, lead(salary) over(order by salary  desc)as next_salary,
							salary-lead(salary) over(order by salary desc)as diff_salary from employees;  

Previous order amount.
select *, lag(amount) over(order by amount  desc)as pre_order_amt   from orders ;
Next order amount.
select* ,lead(amount) over(order by amount desc)as next_order_amt from orders;

Previous hire date.
select*, lag(hire_date) over( order by hire_date desc ) as pre_hire_date  from employees;

Next hire date.
select *,lead(hire_date) over(order by hire_date desc) as next_hire_date from employees;

Days between employee hires.
select day(hire_date)as day from employees 
Previous customer order.
select c.customer_name,o.order_date, lag(o.order_date) over(partition by c.customer_name  order by order_date desc)as pre_hire_date from customers c 
 join orders o on c.customer_id= o.customer_id;

Next customer order.
Compare current order with previous order.
Compare current order with next order.
Find largest increase in order amount.
#========  Topic 20 — Advanced Interview Problems 🔥==========

Second-highest salary.
select * from employees order by salary desc limit 1 offset 1;
select max(salary) from employees  order by salary desc limit 1;

Third-highest salary.
select * from employees   order by salary desc limit 1 offset 2;

Nth-highest salary.
Second-highest salary per department.
select d.department_name,max(e.salary) from departments  d join employees e on 
d.department_id=e.department_id group by d.department_name order by max(e.salary)  desc limit 1;

Top 3 salaries per department.
select d.department_name,max(e.salary) from departments d join employees e  on 
d.department_id =e.department_id group by d.department_name order by max(e.salary)  desc limit 3;

Highest-paid employee per department.
select d.department_name,e.employee_name,max(e.salary) from departments d join  employees e on
d.department_id=e.department_id  group by d.department_name order by max(e.salary) desc  limit 1;

select d.department_name, e.employee_name,max(e.salary) from departments d 
join employees e on d.department_id=e.department_id  group by d.department_name order by max(e.salary)  desc limit 1;

Employees above department average.
select* from  employees  where salary >(select avg(salary) from employees);

Employees earning more than manager.
Managers with largest teams.
Customers with no orders.
select  c.customer_name,o.order_id from customers c join orders o on
c.customer_id=o.customer_id where  order_id is null;

Top 3 customers by spending.
select c.customer_name,max(o.amount) from customers c join orders o on
 c.customer_id=o.customer_id group by c.customer_name order by max(o.amount) desc limit 3;
 
Top 3 products by revenue. 
Product with highest sales
select  product_name,max(price) from products group by product_name  order by max(price) desc limit 3;

Customer s first order.
select* from orders;
select  customer_id,min(order_date) as first_order from orders 
                                            group by customer_id order by min(order_date) desc limit 1;
Customers latest order.
select customer_id,max(order_date) from orders 
                          group by customer_id  order by max(order_date) desc limit 1;

Month with highest sales.
select month(order_date) as month ,max(amount) from orders group by month order by max(amount) desc limit 1;

Duplicate employee names.
select distinct employee_name from employees;

Employees with duplicate salaries.
select distinct  employee_name,salary from employees;

Department with highest average salary.
select d.department_name,max(e.salary) from departments d 
select d.department_name,avg(e.salary) from departments d join employees e on
d.department_id=e.department_id group by d.department_name order by avg(salary) desc limit 1;

Department with highest total salary.
select d.department_name,max(e.salary) from departments d join employees e on 
d.department_id=e.department_id group by d.department_name order by max(salary) desc limit 1;

🎯 Total Practice
You now have:

20 questions × 20 topics = 400 SQL questions.

And they cover:

#1.SELECT
#2.WHERE
#3.DISTINCT
#4.ORDER BY
#5.LIMIT
#6.LIKE
#7.NULL
#8.Aggregate Functions
#9.GROUP BY
#10.HAVING
#11.CASE
#12.String Functions
#13.Date Functions
#14.INNER JOIN
#15.LEFT JOIN
#16.Multiple JOINs
#17.Subqueries
#18.Self JOIN
#19.CTE
#20.Window Functions
#21.LAG / LEAD
Advanced Interview Problems

Recommended interview path
Don't try to memorize solutions. Do them in this order:

1 → 10: Basic SQL
11 → 15: JOINs + Subqueries
16 → 19: Advanced SQL
20: Interview problems