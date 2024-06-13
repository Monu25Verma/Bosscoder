use superstore;

select * from employees;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    manager_id INT
);

INSERT INTO employees (employee_id, employee_name, manager_id) VALUES
(1, 'Alice', NULL),
(2, 'Bob', 1),
(3, 'Charlie', 1),
(4, 'David', 2),
(5, 'Eve', 2),
(6, 'Frank', 3);

select e1.employee_name AS employee_name, 
e2.employee_name AS manager_name from employees e1 
 join employees e2 on e1.employee_id = e2.manager_id; 
-- Retrieve the list of employees and their corresponding managers

-- lst employee how are not mnager
select e1.employee_name AS employee_name, e2.employee_name AS manager_name
from employees e1
left join employees e2 on e1.employee_id = e2.manager_id
where e2.employee_name is NULL;
 
select e1.employee_name  AS manager_name
from employees e1
join employees e2 on e1.employee_id = e2.manager_id;
-- display the manager

select e1.employee_name AS manger_name from employees e1
inner join employees e2 
on e1.employee_id = e2.manager_id
group by e1.employee_name  				-- or group by 1  				
having count(e1.employee_id) > 1
-- List all managers who manage  to have more than one employee









