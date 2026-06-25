-- ================================================
-- Online Retail Store - DBMS Project
-- Author : Ramya Sri B (24241A05JS)
-- College : GRIET, Hyderabad
-- ================================================

CREATE DATABASE OnlineRetailStore;
USE OnlineRetailStore;

-- ------------------------------------------------
-- Table: Customers
-- ------------------------------------------------
CREATE TABLE Customers (
    CustID   INT PRIMARY KEY,
    CustName VARCHAR(50),
    Email    VARCHAR(50),
    Phone    VARCHAR(15),
    Address  VARCHAR(100)
);

-- ------------------------------------------------
-- Table: Products
-- ------------------------------------------------
CREATE TABLE Products (
    ProdID   INT PRIMARY KEY,
    ProdName VARCHAR(50),
    Category VARCHAR(30),
    Price    DECIMAL(10,2),
    Stock    INT
);

-- ------------------------------------------------
-- Table: Orders
-- ------------------------------------------------
CREATE TABLE Orders (
    OrderID   INT PRIMARY KEY,
    CustID    INT,
    OrderDate DATE,
    FOREIGN KEY (CustID) REFERENCES Customers(CustID)
);

-- ------------------------------------------------
-- Table: OrderDetails
-- ------------------------------------------------
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID       INT,
    ProdID        INT,
    Quantity      INT,
    TotalAmount   DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProdID)  REFERENCES Products(ProdID)
);

-- ------------------------------------------------
-- Sample Data
-- ------------------------------------------------
INSERT INTO Customers VALUES (1, 'Ramya', 'ramya@gmail.com', '9876543210', 'Hyderabad');

INSERT INTO Products VALUES (1, 'Mobile', 'Electronics', 15000.00, 10);

INSERT INTO Orders VALUES (101, 1, '2025-11-06');

INSERT INTO OrderDetails VALUES (501, 101, 1, 2, 30000.00);

-- ------------------------------------------------
-- Sample Query: Customer Order Summary
-- ------------------------------------------------
SELECT
    c.CustName,
    p.ProdName,
    o.OrderDate,
    od.Quantity,
    od.TotalAmount
FROM Customers c
JOIN Orders      o  ON c.CustID  = o.CustID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products    p  ON od.ProdID  = p.ProdID;

-- Expected Output:
-- +----------+----------+------------+----------+-------------+
-- | CustName | ProdName | OrderDate  | Quantity | TotalAmount |
-- +----------+----------+------------+----------+-------------+
-- | Ramya    | Mobile   | 2025-11-06 |        2 |    30000.00 |
-- +----------+----------+------------+----------+-------------+
