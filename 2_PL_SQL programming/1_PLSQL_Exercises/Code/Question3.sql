CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    DOB DATE,
    Balance NUMBER,
    LastModified DATE
);

desc Customers;

begin
  INSERT ALL
    INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (1, 'John Doe', TO_DATE('1960-05-15', 'YYYY-MM-DD'), 1000, SYSDATE)
    INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (2, 'Jane Smith', TO_DATE('1990-07-20', 'YYYY-MM-DD'), 1500, SYSDATE)
    INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (3, 'Michael Johnson', TO_DATE('1982-03-10', 'YYYY-MM-DD'), 1200, SYSDATE)
    INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (4, 'Emily Davis', TO_DATE('1955-12-01', 'YYYY-MM-DD'), 1800, SYSDATE)
    INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (5, 'William Brown', TO_DATE('1962-09-25', 'YYYY-MM-DD'), 900, SYSDATE)
    INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (6, 'Olivia Wilson', TO_DATE('1988-11-15', 'YYYY-MM-DD'), 2000, SYSDATE)
    INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (7, 'James Taylor', TO_DATE('1992-06-30', 'YYYY-MM-DD'), 1100, SYSDATE)
    INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (8, 'Sophia Anderson', TO_DATE('1983-04-22', 'YYYY-MM-DD'), 1700, SYSDATE)
    INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (9, 'Benjamin Thomas', TO_DATE('1963-08-09', 'YYYY-MM-DD'), 1300, SYSDATE)
    INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (10, 'Isabella Martinez', TO_DATE('1987-02-14', 'YYYY-MM-DD'), 1400, SYSDATE)
  SELECT * FROM dual;
end;
/

CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    LoanAmount NUMBER,
    InterestRate NUMBER,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

desc Loans;

BEGIN
  INSERT ALL
    INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate) VALUES (1, 1, 5000, 5, SYSDATE, ADD_MONTHS(SYSDATE,1))
    INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate) VALUES (2, 2, 7000, 4.5, SYSDATE, ADD_MONTHS(SYSDATE, 1))
    INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate) VALUES (3, 3, 10000, 6, SYSDATE, ADD_MONTHS(SYSDATE, 72))
    INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate) VALUES (4, 4, 8000, 5.5, SYSDATE, ADD_MONTHS(SYSDATE, 36))
    INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate) VALUES (5, 5, 6000, 4.8, SYSDATE, ADD_MONTHS(SYSDATE, 60))
    INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate) VALUES (6, 6, 7500, 5.2, SYSDATE, ADD_MONTHS(SYSDATE, 1))
    INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate) VALUES (7, 7, 9000, 5.9, SYSDATE, ADD_MONTHS(SYSDATE, 48))
    INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate) VALUES (8, 8, 6500, 4.7, SYSDATE, ADD_MONTHS(SYSDATE, 1))
    INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate) VALUES (9, 9, 8500, 5.1, SYSDATE, ADD_MONTHS(SYSDATE, 60))
    INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate) VALUES (10, 10, 7000, 4.9, SYSDATE, ADD_MONTHS(SYSDATE, 36))
  SELECT * FROM dual;
  COMMIT;
END;
/

declare

BEGIN
  for c1 in (
    SELECT c.CustomerID, c.name , l.LoanID , l.EndDate  from Customers c join Loans l on c.CustomerID = l.CustomerID where 
    l.EndDate BETWEEN SYSDATE AND SYSDATE + 30
  )LOOP
    DBMS_OUTPUT.PUT_LINE('Reminder: Dear ' || c1.Name || 
                         ', your loan (ID: ' || c1.LoanID || 
                         ') is due on ' || TO_CHAR(c1.EndDate, 'DD-MON-YYYY') || '.');
  END LOOP;
  
end;
/