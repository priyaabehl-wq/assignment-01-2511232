-- =========================
-- Dimension Tables
-- =========================

CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    year INT
);

CREATE TABLE dim_store (
    store_key INT PRIMARY KEY,
    store_name VARCHAR(100),
    store_city VARCHAR(100)
);

CREATE TABLE dim_product (
    product_key INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- =========================
-- Fact Table
-- =========================

CREATE TABLE fact_sales (
    sales_key INT PRIMARY KEY,
    transaction_id VARCHAR(20),

    date_key INT,
    store_key INT,
    product_key INT,

    units_sold INT,
    unit_price DECIMAL(10,2),
    sales_amount DECIMAL(12,2),

    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (store_key) REFERENCES dim_store(store_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key)
);

-- =========================
-- Insert Data into Dimensions
-- =========================

INSERT INTO dim_date VALUES
(20230829,'2023-08-29',29,8,2023),
(20231212,'2023-12-12',12,12,2023),
(20230205,'2023-02-05',5,2,2023),
(20230220,'2023-02-20',20,2,2023),
(20230115,'2023-01-15',15,1,2023),
(20230815,'2023-08-15',15,8,2023);

INSERT INTO dim_store VALUES
(1,'Chennai Anna','Chennai'),
(2,'Delhi South','Delhi'),
(3,'Bangalore MG','Bangalore'),
(4,'Pune FC Road','Pune'),
(5,'Mumbai Central','Mumbai');

INSERT INTO dim_product VALUES
(1,'Speaker','Electronics'),
(2,'Tablet','Electronics'),
(3,'Phone','Electronics'),
(4,'Smartwatch','Electronics'),
(5,'Laptop','Electronics'),
(6,'Biscuits','Grocery'),
(7,'Jeans','Clothing'),
(8,'Jacket','Clothing');

-- =========================
-- Insert Data into Fact Table
-- =========================

INSERT INTO fact_sales VALUES
(1,'TXN5000',20230829,1,1,3,49262.78,147788.34),
(2,'TXN5001',20231212,1,2,11,23226.12,255487.32),
(3,'TXN5002',20230205,1,3,20,48703.39,974067.80),
(4,'TXN5003',20230220,2,3,14,23226.12,325165.68),
(5,'TXN5004',20230115,1,4,10,58851.01,588510.10),
(6,'TXN5005',20230115,3,5,12,52464.00,629568.00),
(7,'TXN5006',20230205,4,4,6,58851.01,353106.06),
(8,'TXN5007',20230220,5,6,16,2317.47,37079.52),
(9,'TXN5008',20230815,4,7,9,27469.99,247229.91),
(10,'TXN5009',20230815,2,8,3,58851.01,176553.03);