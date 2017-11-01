DELETE FROM Order_details;
DELETE FROM Orders;
DELETE FROM Products;
DELETE FROM Payment_methods;
DELETE FROM Customers;

DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Payment_methods;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Order_details;

CREATE TABLE `Customers` (
    `customer_id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `customer_first_name` VARCHAR (10) NOT NULL,
    `customer_last_name` VARCHAR (20) NOT NULL,
    `street_address ` VARCHAR (40) NOT NULL,
    `city` VARCHAR (20) NOT NULL,
    `state` VARCHAR (2) NOT NULL,
    `zip` INTEGER (5) NOT NULL,
    `phone_number` INTEGER(10) NOT NULL,
    `customer_acct_date` DATETIME NOT NULL,
    `customer_active` BOOLEAN NOT NULL
);

CREATE TABLE `Payment_methods` (
    `pay_method_id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `payment_type` VARCHAR NOT NULL,
    `account_number` INTEGER(16) NOT NULL
);

CREATE TABLE `Products` (
    `product_id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `customer_id` INTEGER NOT NULL,
    `product_name` VARCHAR (20) NOT NULL,
    `product_price` DECIMAL(7,2) NOT NULL,
    `product_desc` VARCHAR (40) NOT NULL,
    `product_added` DATETIME NOT NULL,
    FOREIGN KEY(`customer_id`) REFERENCES `Customers`(`customer_id`)
);

CREATE TABLE `Orders` (
    `order_id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `customer_id` INTEGER NOT NULL,
    `pay_method_id` INTEGER,
    `order_date` DATETIME NOT NULL,
    FOREIGN KEY(`customer_id`) REFERENCES `Customers`(`customer_id`),
    FOREIGN KEY(`pay_method_id`) REFERENCES `Payment_methods`(`pay_method_id`)
);

CREATE TABLE `Order_details` (
    `order_detail_id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `product_id` INTEGER NOT NULL,
    `order_id` INTEGER NOT NULL,
    FOREIGN KEY(`product_id`) REFERENCES `Products`(`product_id`),
    FOREIGN KEY(`order_id`) REFERENCES `Orders`(`order_id`)
);

INSERT INTO Customers VALUES (null, 'Casper', 'Schlobwaffle', '667 Schlobby Lane', 'Butte', 'MT', 59701, 8889067835, '2012-05-05', 1);
INSERT INTO Customers VALUES (null, 'Joe', 'Schmoe', '56 Hat St.', 'Crown Point', 'IN', 46307, 2196634567, '2013-10-19', 1);
INSERT INTO Customers VALUES (null, 'Bob', 'Boberson', '1234 No Activity Ln.', 'New York', 'NY', 10001, 2121234567, '2017-11-11', 0);
INSERT INTO Customers VALUES (null, 'Dave', 'Daverson', '500 Interstate Drive', 'Nashville', 'TN', 37222, 6152345678, '2017-01-01', 1);
INSERT INTO Customers VALUES (null, 'Mr. Not', 'Active', '000 Not Active St.', 'Nowhere', 'AK', 23145, 1001001000, '2012-05-05', 0);

INSERT INTO Payment_methods VALUES (null, 'Amex', 1234567891234567);
INSERT INTO Payment_methods VALUES (null, 'Mastercard', 3434567891234567);
INSERT INTO Payment_methods VALUES (null, 'Discover', 3434567891234567);
INSERT INTO Payment_methods VALUES (null, 'Visa', 5434567891234567);

INSERT INTO Products VALUES (null, 1, 'Baseball', 12.99, 'Round white orb used for sportsball', '2000-10-10');
INSERT INTO Products VALUES (null, 2, 'Colander', 6.99, 'Keeps your spaghetti dry', '2017-09-09');
INSERT INTO Products VALUES (null, 3, 'Notebook', 3.99, 'Write your lyrics in here', '2016-10-10');
INSERT INTO Products VALUES (null, 4, 'Colander', 6.99, 'Keeps your spaghetti dry', '2017-10-10');

INSERT INTO Orders VALUES (null, 1, null, '2017-10-31');
INSERT INTO Orders VALUES (null, 2, null, '2017-09-09');
INSERT INTO Orders VALUES (null, 4, null, '2017-10-31');

INSERT INTO Order_details VALUES (null, 1, 1);
INSERT INTO Order_details VALUES (null, 2, 1);
INSERT INTO Order_details VALUES (null, 2, 2);
INSERT INTO Order_details VALUES (null, 2, 3);
INSERT INTO Order_details VALUES (null, 3, 3);
INSERT INTO Order_details VALUES (null, 4, 3);
