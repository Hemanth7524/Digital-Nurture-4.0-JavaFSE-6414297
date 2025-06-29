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
    INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (1, 'John Doe', TO_DATE('1960-05-15', 'YYYY-MM-DD'), 8000, SYSDATE)
    INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (2, 'Jane Smith', TO_DATE('1990-07-20', 'YYYY-MM-DD'), 15000, SYSDATE)
    INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (3, 'Michael Johnson', TO_DATE('1982-03-10', 'YYYY-MM-DD'), 12000, SYSDATE)
    INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (4, 'Emily Davis', TO_DATE('1955-12-01', 'YYYY-MM-DD'), 1800, SYSDATE)
    INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (5, 'William Brown', TO_DATE('1962-09-25', 'YYYY-MM-DD'), 9000, SYSDATE)
    INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (6, 'Olivia Wilson', TO_DATE('1988-11-15', 'YYYY-MM-DD'), 20000, SYSDATE)
    INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (7, 'James Taylor', TO_DATE('1992-06-30', 'YYYY-MM-DD'), 11000, SYSDATE)
    INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (8, 'Sophia Anderson', TO_DATE('1983-04-22', 'YYYY-MM-DD'), 7000, SYSDATE)
    INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (9, 'Benjamin Thomas', TO_DATE('1963-08-09', 'YYYY-MM-DD'), 1300, SYSDATE)
    INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (10, 'Isabella Martinez', TO_DATE('1987-02-14', 'YYYY-MM-DD'), 4000, SYSDATE)
  SELECT * FROM dual;
end;
/


BEGIN
  EXECUTE IMMEDIATE 'ALTER TABLE Customers ADD (isVip VARCHAR2(2))';
END;
/
desc Customers;

declare
    TYPE Customer_type is TABLE of Customers%ROWTYPE;
    v_cust Customer_type;
BEGIN
  
  for c in (
    select CustomerID from Customers where Balance > 10000
  ) LOOP
    update Customers
    set isVip = 'Y'
    where CustomerID = c.CustomerID;
  END LOOP;

  COMMIT;
  
  select * BULK COLLECT into v_cust from Customers;
  
  for i in 1 .. v_cust.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('CustomerID : ' || v_cust(i).CustomerID || ' ' || 'isVip : ' ||  v_cust(i).isVip);
  END LOOP;
  
  
END;
/






