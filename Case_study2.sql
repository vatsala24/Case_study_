---Case_Study 2
---Simple Queries:

--1. List all the employee details. 

select * from EMPLOYEE

--2. List all the department details.

select * from DEPARTMENT

--3. List all job details.

select * from JOB

--4. List all the locations. 

select * from LOCATION

--5. List out the First Name, Last Name, Salary, Commission for all Employees.

select first_name, last_name, salary, comm from EMPLOYEE

--6. List out the Employee ID, Last Name, Department ID for all employees and alias Employee ID as "ID of the Employee", Last Name as "Name of the
--Employee", Department ID as "Dep_id". 

select employee_id as Id_of_the_employee, last_name as Name_of_the_employee, department_id as Dep_id from EMPLOYEE

--7. List out the annual salary of the employees with their names only. 

select first_name as Name, salary*12 as annual_salary from EMPLOYEE

--WHERE Condition:
--1. List the details about "Smith". 

select * from EMPLOYEE where LAST_NAME like 'Smith'

--2. List out the employees who are working in department 20.

select * from EMPLOYEE where DEPARTMENT_ID = 20

--3. List out the employees who are earning salaries between 3000 and 4500. 

select * from EMPLOYEE where SALARY between 3000 and 4500

--4. List out the employees who are working in department 10 or 20. 

select * from EMPLOYEE where DEPARTMENT_ID = 10 or DEPARTMENT_ID = 20

--5. Find out the employees who are not working in department 10 or 30. 

select * from EMPLOYEE where DEPARTMENT_ID not in (10,30) 

--6. List out the employees whose name starts with 'S'.

select * from employee where last_name like 'S%'

--7. List out the employees whose name starts with 'S' and ends with 'H'.

select * from employee where last_name like 'S%h'

--8. List out the employees whose name length is 4 and start with 'S'. 

select * from employee where first_name like 'J%___'

--9. List out employees who are working in department 10 and draw salaries more than 3500. 

select * from employee where department_id = 10 and salary > 3500

--10. List out the employees who are not receiving commission. 

select * from employee where comm is null

--ORDER BY Clause:

--1. List out the Employee ID and Last Name in ascending order based on the Employee ID.

select employee_id, last_name from employee order by EMPLOYEE_ID asc

--2. List out the Employee ID and Name in descending order based on salary.

select employee_id, last_name from EMPLOYEE order by SALARY desc

--3. List out the employee details according to their Last Name in ascending-order.

select * from EMPLOYEE order by LAST_NAME asc

--4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order. 

select * from EMPLOYEE order by LAST_NAME asc, DEPARTMENT_ID desc

--GROUP BY and HAVING Clause:

--1. How many employees are in different departments in the organization?

select department_id, count(*) as no_of_emp from EMPLOYEE group by DEPARTMENT_ID 

--2. List out the department wise maximum salary, minimum salary and average salary of the employees. 

select department_id,  max(salary) as maximum, min(salary) as minimum, avg(salary) as average from EMPLOYEE group by DEPARTMENT_ID

--3. List out the job wise maximum salary, minimum salary and average salary of the employees.

select JOB_ID,  max(salary) as maximum, min(salary) as minimum, avg(salary) as average from EMPLOYEE group by JOB_ID

--4. List out the number of employees who joined each month in ascending order. 

select count(employee_id) as no_of_emp, month(HIRE_DATE) as month from EMPLOYEE group by month(HIRE_DATE) order by month(HIRE_DATE)  

--5. List out the number of employees for each month and year in ascending order based on the year and month. 

select count(*) as No_of_Emp, year(hire_date) as year, month(hire_date) as month
from EMPLOYEE 
group by year(hire_date), month(hire_date)
order by year(hire_date), month(hire_date)

--6. List out the Department ID having at least four employees. 

select department_id, count(*) as No_of_emp from employee group by department_id having count(*)>=4

--7. How many employees joined in the month of January?

select count(*) as no_of_emp from employee where MONTH(HIRE_DATE) = 1

--8. How many employees joined in the month of January or September?

select count(*) as no_of_emp from employee where MONTH(HIRE_DATE) = 1 or MONTH(HIRE_DATE) = 9

--9. How many employees joined in 1985?

select count(*) as no_of_emp from employee where year(HIRE_DATE) = 1985

--10. How many employees joined each month in 1985?

SELECT COUNT(*) As No_of_Employees, YEAR(hire_date) as Joining_Year, MONTH(hire_date) as Joining_Month
FROM Employee
GROUP BY YEAR(hire_date), MONTH(hire_date)
HAVING YEAR(hire_date)= 1985

--11. How many employees joined in March 1985?

select count(*) as no_of_emp from employee where year(HIRE_DATE) = 1985 and MONTH(HIRE_DATE) = 3

--12. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?

SELECT Department_id, COUNT(*) As No_of_Employees
FROM Employee
where MONTH(HIRE_DATE) = 4 and YEAR(HIRE_DATE) = 1985
GROUP BY Department_id
HAVING count(*)>=3

--Joins:

--1. List out employees with their department names. 

select employee_id, first_name, name 
from EMPLOYEE e inner join DEPARTMENT d
on e.department_id = d.Department_Id

--2. Display employees with their designations. 

select employee_id, first_name, designation
from EMPLOYEE e inner join JOB j
on e.JOB_ID = j.Job_ID

--3. Display the employees with their department names and regional groups. 

select employee_id, first_name, name as department_name, city as regional_groups
from EMPLOYEE e inner join DEPARTMENT d 
on e.department_id = d.department_id 
inner join LOCATION l
on l.Location_ID = d.Location_Id

--4. How many employees are working in different departments? Display with department names. 

select employee_id, first_name, name 
from EMPLOYEE e inner join DEPARTMENT d
on e.department_id = d.Department_Id

--5. How many employees are working in the sales department?

select count(*) as No_of_emp
from EMPLOYEE e inner join DEPARTMENT d
on e.department_id = d.Department_Id
group by name
having  name='sales'

--6. Which is the department having greater than or equal to 5 employees? Display the department names in ascending order. 

select Name as Department_name
from employee e inner join department d
on e.Department_id=d.Department_id  
group by name 
having count(*) > = 5 
order by name

--7. How many jobs are there in the organization? Display with designations. 

select count(*) job_id, Designation
from employee e inner join job j
on e.job_id=j.job_id 
group by Designation

--8. How many employees are working in "New York"?

SELECT EMPLOYEE_ID, FIRST_NAME, Name, City
from EMPLOYEE e inner join DEPARTMENT d
on e.Department_id = d.Department_id
inner join location l 
on l.location_id = d.location_id
WHERE l.city='new york'

--9. Display the employee details with salary grades. Use conditional statement to create a grade column.

select *, grade = 
case 
when salary > 2500 then 'A'
when salary > 1300 then 'B'
else 'C'
end 
from employee
go

--10. List out the number of employees grade wise. Use conditional statement to create a grade column. 

select *, grade = 
case 
when JOB_ID = 670 then 'Skilled'
when job_id = 671 then 'Highly-Skilled'
else 'Semi-Skilled'
end
from EMPLOYEE
go

--11.Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.

select e.grade, count(grade) as No_of_emp
from (select EMPLOYEE_ID, grade = 
case 
when salary < 2000 then 'B'
when salary between 2000 and 5000 then 'A'
else 'null'
end 
from employee
where SALARY between 2000 and 5000 ) as e
group by e.grade 

--12. Display all employees in sales or operation departments. 

select * from employee e inner join department d  
on e.department_id = d.department_id 
where name = 'sales' or name = 'operations'

--SET Operators:

--1. List out the distinct jobs in sales and accounting departments.

 Select Designation 
 from job 
 where job_id in 
                (
				 Select job_id from employee where department_id = (select department_id from department where name = 'SALES')
				 )
 union 
 Select Designation 
 from job 
 where job_id in 
                (
				 Select job_id from employee where department_id = (select department_id from department where name = 'ACCOUNTING')
				 )

--2. List out all the jobs in sales and accounting departments. 

 Select Designation 
 from job 
 where job_id in 
                (
				 Select job_id from employee where department_id = (select department_id from department where name = 'SALES')
				 )
 union all 
 Select Designation 
 from job 
 where job_id in 
                (
				 Select job_id from employee where department_id = (select department_id from department where name = 'ACCOUNTING')
				 )

--3. List out the common jobs in research and accounting departments in ascending order.
 Select Designation 
 from job 
 where job_id in 
                (
				 Select job_id from employee where department_id = (select department_id from department where name = 'RESEARCH')
				 )
 intersect 
 Select Designation 
 from job 
 where job_id in 
                (
				 Select job_id from employee where department_id = (select department_id from department where name = 'ACCOUNTING')
				 )
 order by Designation

--Subqueries:

--1. Display the employees list who got the maximum salary.
select * from EMPLOYEE 
where SALARY = 
             (
			  select max(SALARY) from EMPLOYEE
			  )

--2. Display the employees who are working in the sales department.

select * from EMPLOYEE 
where DEPARTMENT_ID = 
                     (
					  select DEPARTMENT_ID 
					  from DEPARTMENT 
					  where Name = 'Sales'
					  )

--3. Display the employees who are working as 'Clerk'.

select * from employee
where job_id = 
              (
			   select JOB_ID from JOB
			   where Designation = 'Clerk'
			   )

--4. Display the list of employees who are living in "New York". 

select * from EMPLOYEE
where DEPARTMENT_ID = 
                     (
					  select Department_Id
					  from DEPARTMENT
					  where Location_Id = 
					                     (
										  select Location_Id from LOCATION
										  where City = 'New york'
										  )
					  )

--5. Find out the number of employees working in the sales department.

select count(EMPLOYEE_ID) as NO_of_emp from EMPLOYEE
where DEPARTMENT_ID = 
                     (
					  select DEPARTMENT_ID 
					  from DEPARTMENT
					  where Name = 'Sales'
					  )

--6. Update the salaries of employees who are working as clerks on the basis of 10%. 

update EMPLOYEE
set SALARY = (SALARY + SALARY * 10 / 100)
where JOB_ID = 
              (select JOB_ID
			  from JOB
			  where Designation = 'clerk'
			  )

select * from EMPLOYEE 

--7. Delete the employees who are working in the accounting department.

delete from EMPLOYEE
where DEPARTMENT_ID = 
                     ( select DEPARTMENT_ID 
					 from DEPARTMENT
					 where Name = 'Accounting'
                      )

select * from EMPLOYEE 

--8. Display the second highest salary drawing employee details.

select * from EMPLOYEE
where SALARY = 
              (
			  select max(SALARY) 
			  from EMPLOYEE 
			  where SALARY < (
			                  select max(SALARY) 
							  from EMPLOYEE
							  )
			  )

--9. Display the nth highest salary drawing employee details.

SELECT * FROM (
  SELECT *, DENSE_RANK() OVER (ORDER BY salary DESC) AS r
  FROM EMPLOYEE
) AS subquery
WHERE r = 4  

--10. List out the employees who earn more than every employee in department 30. 

select * from EMPLOYEE
where SALARY in (
                 select max(SALARY) from EMPLOYEE
				) 
and DEPARTMENT_ID = 30
					
--11. List out the employees who earn more than the lowest salary in department.Find out whose department has no employees. 

select * from EMPLOYEE
where SALARY > (
                 select min(SALARY) from EMPLOYEE
				) 

select name from DEPARTMENT d
where not exists (
                  select employee_id from EMPLOYEE e
				  where d.Department_Id = e.department_id 
				  )

--12. Find out which department has no employees. 

select name from DEPARTMENT d
where not exists (
                  select employee_id from EMPLOYEE e
				  where d.Department_Id = e.department_id 
				  )

--13. Find out the employees who earn greater than the average salary for their department
select * from EMPLOYEE e
where SALARY > (
                select avg(SALARY)
				from EMPLOYEE
				where DEPARTMENT_ID = e.DEPARTMENT_ID
				)


----------------------------------------------------------------------------------------------------------------------------------------------------------------