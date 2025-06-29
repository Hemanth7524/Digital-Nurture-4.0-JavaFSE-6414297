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


CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    AccountType VARCHAR2(20),
    Balance NUMBER,
    LastModified DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

desc Accounts;

BEGIN
  INSERT ALL
    INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified) VALUES (1, 1, 'Savings', 1000, SYSDATE)
    INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified) VALUES (2, 2, 'Checking', 1500, SYSDATE)
    INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified) VALUES (3, 3, 'Savings', 2000, SYSDATE)
    INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified) VALUES (4, 4, 'Checking', 1200, SYSDATE)
    INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified) VALUES (5, 5, 'Savings', 1800, SYSDATE)
    INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified) VALUES (6, 6, 'Checking', 1600, SYSDATE)
    INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified) VALUES (7, 7, 'Savings', 1400, SYSDATE)
    INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified) VALUES (8, 8, 'Checking', 1700, SYSDATE)
    INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified) VALUES (9, 9, 'Savings', 1900, SYSDATE)
    INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified) VALUES (10, 10, 'Checking', 1300, SYSDATE)
  SELECT * FROM dual;

  COMMIT;
END;
/

SELECT Balance from Accounts;

create or replace procedure TransferFunds(
  fromAcc IN NUMBER,
  toAcc in NUMBER,
  amount in NUMBER 
)
IS
--declare
  v_tempbalance NUMBER;
  insufficient_Balance EXCEPTION;
BEGIN
  SELECT Balance into v_tempbalance from Accounts WHERE AccountID = fromAcc;
  
  if v_tempbalance < amount THEN
    raise insufficient_Balance;
  end if;
  
  update Accounts 
  set Balance = Balance - amount ,
    LastModified = SYSDATE
  where AccountID = fromAcc;
  
  update Accounts 
  set Balance = Balance + amount ,
    LastModified = SYSDATE
  where AccountID = toAcc;
  
  EXCEPTION
   when insufficient_Balance then
      DBMS_OUTPUT.PUT_LINE('Balance is too low!');

END;
/

show errors procedure TransferFunds;

begin 
  TransferFunds(1,2,100);
  
end;
/

select Balance from Accounts;