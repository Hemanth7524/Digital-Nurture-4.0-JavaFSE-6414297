CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Position VARCHAR2(50),
    Salary NUMBER,
    Department VARCHAR2(50),
    HireDate DATE
); 

desc Employees;

BEGIN
  INSERT ALL
    INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate) VALUES (1, 'Alice Johnson', 'Manager', 70000, 'HR', TO_DATE('2015-06-15', 'YYYY-MM-DD'))
    INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate) VALUES (2, 'Bob Brown', 'Developer', 60000, 'IT', TO_DATE('2017-03-20', 'YYYY-MM-DD'))
    INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate) VALUES (3, 'Carol White', 'Analyst', 55000, 'Finance', TO_DATE('2018-08-10', 'YYYY-MM-DD'))
    INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate) VALUES (4, 'David Smith', 'Developer', 62000, 'IT', TO_DATE('2016-11-05', 'YYYY-MM-DD'))
    INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate) VALUES (5, 'Eva Green', 'HR Specialist', 58000, 'HR', TO_DATE('2019-02-12', 'YYYY-MM-DD'))
    INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate) VALUES (6, 'Frank Black', 'Developer', 61000, 'IT', TO_DATE('2017-07-18', 'YYYY-MM-DD'))
    INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate) VALUES (7, 'Grace Lee', 'Accountant', 54000, 'Finance', TO_DATE('2018-03-22', 'YYYY-MM-DD'))
    INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate) VALUES (8, 'Henry Adams', 'Manager', 72000, 'IT', TO_DATE('2014-10-30', 'YYYY-MM-DD'))
    INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate) VALUES (9, 'Isabella Clark', 'HR Specialist', 57000, 'HR', TO_DATE('2019-06-14', 'YYYY-MM-DD'))
    INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate) VALUES (10, 'Jack Wilson', 'Developer', 63000, 'IT', TO_DATE('2016-01-25', 'YYYY-MM-DD'))
  SELECT * FROM dual;
  COMMIT;
END;
/

SELECT Salary from Employees;

create or replace procedure UpdateEmployeeBonus(
  Bonus IN number,
  p_Department in Employees.Department%type
)
IS
BEGIN 
  update Employees
  set Salary = Salary + (Salary * (Bonus/100))
  where Department = p_Department;

  COMMIT;
END;
/


BEGIN
  UpdateEmployeeBonus(20 , 'HR');
end;
/

SHOW ERRORS PROCEDURE UpdateEmployeeBonus;


SELECT Salary from Employees;