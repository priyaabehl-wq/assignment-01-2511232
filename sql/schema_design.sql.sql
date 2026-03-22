CUSTOMERS TABLE
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);
Sales Representatives
CREATE TABLE sales_reps (
    rep_id VARCHAR(10) PRIMARY KEY,
    rep_name VARCHAR(100) NOT NULL
);
Products
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);
Orders
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    rep_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (rep_id) REFERENCES sales_reps(rep_id)
);
Order Items
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
Sample Data (Minimum 5 rows each)
customers
INSERT INTO customers VALUES
('C001','Rohan Mehta','rohan@gmail.com','Mumbai'),
('C002','Priya Sharma','priya@gmail.com','Delhi'),
('C003','Amit Verma','amit@gmail.com','Bangalore'),
('C004','Sneha Iyer','sneha@gmail.com','Chennai'),
('C005','Vikram Singh','vikram@gmail.com','Mumbai'),

sales_reps
INSERT INTO sales_reps VALUES
('SR02','Anita Desai','anita@corp.com','Delhi Office, Connaught Place, New Delhi - 110001'),
('SR01','Deepak Joshi','deepak@corp.com','Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR03','Ravi Kumar','ravi@corp.com','South Zone, MG Road, Bangalore - 560001');

Products
INSERT INTO products VALUES
('P004','Notebook','Stationery',120),
('P007','Pen Set','Stationery',250),
('P005','Headphones','Electronics',3200),
('P003','Desk Chair','Furniture',8500),
('P006','Standing Desk','Furniture',22000),

Orders
INSERT INTO orders VALUES
('ORD1027','C002','SR02','2023-11-02'),
('ORD1114','C001','SR01','2023-08-06'),
('ORD1153','C006','SR01','2023-02-14'),
('ORD1002','C002','SR02','2023-01-17'),
('ORD1118','C006','SR02','2023-11-10');

Order Items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
('ORD1027','P004',3),
('ORD1114','P007',2),
('ORD1153','P005',1),
('ORD1002','P003',4),
('ORD1118','P006',1);

