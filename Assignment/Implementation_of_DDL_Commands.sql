-- Step 1: Create a Database
-- Create a new database named ProductDB.

create database ProductDB;

-- Step 2: Create a Table
-- Use the ProductDB database.
-- Create a table named Products with the following columns:
-- ProductID
-- ProductName
-- Category
-- Price
-- StockQuantity
-- ManufactureDate
-- ExpiryDate
-- SupplierName

use ProductDB;

create table Products (
    ProductID int unique primary key,
    ProductName varchar(100) not null,
    Category varchar(50) not null,
    Price decimal(10,2) not null,
	StockQuantity int not null ,
	ManufactureDate date not null,
    ExpiryDate date not null,
    SupplierName varchar(100) not null
);
describe Products;

-- Task 2: Modifying the Table with ALTER Command
-- Step 1: Add a Column
-- Add a column named Description to the Products table.

alter table Products
add column Description int;

describe Products;

-- Step 2: Modify the Data Type of a Column

alter table Products
modify column Description varchar(50);


-- Step 3: Drop a Column
-- Change the data type of the Category column. 

alter table Products
modify column Category int;

-- Remove the ExpiryDate column from the Products table.
alter table products
drop column ExpiryDate;
describe products;

-- Step 4: Add a Constraint
-- Add a unique constraint to the ProductName column.

alter table products
add constraint ProductName unique (ProductName);

-- Step 5: Drop a Constraint
-- Remove the unique constraint from the ProductName column.
alter table products
drop index ProductName ;



-- Step 6: Change the Column Name
-- Rename the Price column to ProductPrice.

alter table Products
rename column Price to ProductPrice;

-- Step 7:
-- Insert 10 rows in table using all forms
insert into products
(productid, productname, category, productprice, stockquantity, manufacturedate, description, suppliername)
values
(1, 'laptop', 101, 55000.00, 20, '2024-01-10', 'electronics', 'dell supplier');

insert into products
(productid, productname, category, productprice, stockquantity, manufacturedate, description, suppliername)
values
(2, 'mobile', 101, 25000.00, 50, '2024-02-15', 'smartphone', 'samsung supplier'),
(3, 'headphones', 102, 1500.00, 100, '2024-03-01', 'audio', 'boat supplier'),
(4, 'keyboard', 102, 700.00, 80, '2024-03-20', 'computer', 'logitech supplier');

insert into products
(productid, productname, category, productprice, stockquantity, manufacturedate, description, suppliername)
values
(5, 'mobile', 101, 25000.00, 50, '2024-02-15', 'smartphone', 'samsung supplier'),
(6, 'headphones', 102, 1500.00, 100, '2024-03-01', 'audio', 'boat supplier'),
(7, 'keyboard', 102, 700.00, 80, '2024-03-20', 'computer', 'logitech supplier'),
(8, 'mobile', 101, 25000.00, 50, '2024-02-15', 'smartphone', 'samsung supplier'),
(9, 'headphones', 102, 1500.00, 100, '2024-03-01', 'audio', 'boat supplier'),
(10, 'keyboard', 102, 700.00, 80, '2024-03-20', 'computer', 'logitech supplier');

-- Use update command

update products
set ProductName = "laptop" 
where Category=101;

-- Use Delete command


delete from products where Category = 102;

select * from products;


