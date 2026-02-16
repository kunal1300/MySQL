create database  E_Commerce_Data;

use E_Commerce_Data;

CREATE TABLE IF NOT EXISTS CUSTOMERS (
    CUSTOMER_ID TINYINT AUTO_INCREMENT PRIMARY KEY,
    FIRST_NAME VARCHAR(20),
    LAST_NAME VARCHAR(20),
    EMAIL VARCHAR(50)
);
select * from CUSTOMERS;

CREATE TABLE PRODUCTS (
    PRODUCT_ID TINYINT AUTO_INCREMENT PRIMARY KEY,
    PRODUCT_NAME VARCHAR(20),
    PRICE FLOAT
);
select * from PRODUCTS;
CREATE TABLE ORDERS (
    ORDER_ID TINYINT AUTO_INCREMENT PRIMARY KEY,
    ORDER_DATE DATE,
    CUSTOMER_ID TINYINT,

    CONSTRAINT FK_ORDERS_CUSTOMERS
        FOREIGN KEY (CUSTOMER_ID)
        REFERENCES CUSTOMERS (CUSTOMER_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
select * from ORDERS;
CREATE TABLE ORDER_ITEMS (
    ORDER_ID TINYINT,
    PRODUCT_ID TINYINT,
    QUANTITY TINYINT,

    PRIMARY KEY (ORDER_ID, PRODUCT_ID),

    CONSTRAINT FK_ORDER_ITEMS_ORDERS
        FOREIGN KEY (ORDER_ID)
        REFERENCES ORDERS (ORDER_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT FK_ORDER_ITEMS_PRODUCTS
        FOREIGN KEY (PRODUCT_ID)
        REFERENCES PRODUCTS (PRODUCT_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


-- 1 Which product has the highest price?

SELECT PRODUCT_NAME,PRICE FROM PRODUCTS WHERE PRICE 
= (SELECT MAX(PRICE) FROM PRODUCTS);

-- 2 Which customer has made the most orders?

select * from customers,orders;

SELECT
    c.CUSTOMER_ID,
    c.FIRST_NAME AS NAME,c.LAST_NAME as Surname,
    COUNT(o.ORDER_ID) AS ORDERS
FROM CUSTOMERS c
INNER JOIN ORDERS o
    ON c.CUSTOMER_ID = o.CUSTOMER_ID
GROUP BY
    c.CUSTOMER_ID,
    c.FIRST_NAME
ORDER BY
    ORDERS DESC;


-- 3 Which product has the highest total revenue?





select * from products,order_items ;

select PRODUCT_NAME,sum(PRICE * QUANTITY) as Total from products p inner join order_items o 
on p.PRODUCT_ID=o.PRODUCT_ID group by PRODUCT_NAME order by 2 desc ;

-- 4 Find the top customer who have ordered the most distinct products
select concat(FIRST_NAME," ",LAST_NAME) AS Name, count(PRODUCT_NAME) as "Product" from customers c 
inner join orders o on c.CUSTOMER_ID=o.CUSTOMER_ID
inner join order_items oi on o.order_id = oi.order_id
inner join products p on p.product_id = oi.product_id 
group by 1 order by 2 desc; 

-- 5 Find the first order (by date) for  customer "John Doe".
select * from customers c 
inner join orders o on c.CUSTOMER_ID=o.CUSTOMER_ID
inner join order_items oi on o.order_id = oi.order_id
inner join products p on p.product_id = oi.product_id where FIRST_NAME = "John"  and LAST_NAME = "Doe" order by ORDER_DATE desc; 




C:\Users\kunal\Desktop\SQL Project\Database Management for E-Commerce Data.sql
