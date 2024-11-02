# Prolog-notes

```prolog
% Relational Database "Representation" in Prolog

% Define tables as facts
% Table: employees(employee_id, name, department_id)
employee(1, john, 101).
employee(2, mary, 102).
employee(3, tom, 101).
employee(4, susan, 103).

% Table: departments(department_id, department_name)
department(101, sales).
department(102, hr).
department(103, it).

% Foreign key relationship: employees.department_id -> departments.department_id

% Rule to join employees and departments (SQL equivalent: SELECT * FROM employees JOIN departments)
employee_department(EmployeeName, DepartmentName) :-
    employee(_, EmployeeName, DepartmentID),
    department(DepartmentID, DepartmentName).

% Queries:
% Who works in the Sales department?
% ?- employee_department(EmployeeName, sales).

% Which department does Tom work in?
% ?- employee_department(tom, DepartmentName).

```
