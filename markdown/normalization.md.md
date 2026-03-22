## Anomaly Analysis

### Insert Anomaly
An insert anomaly occurs when we cannot insert data about one entity without inserting unrelated data.

Example from the dataset:

The table stores orders, customers, products, and sales reps all in one table.
Because of this, a product cannot be added unless an order exists.

For example, product information is stored in columns:

product_id

product_name

category

unit_price

But every row also requires:

order_id

customer_id

quantity

order_date

Therefore, we cannot insert a new product (e.g., a new product P009) without creating a fake order.

Affected Columns

product_id, product_name, category, unit_price

Reason

A product should be stored independently, but the table structure forces it to be inserted only when an order exists.

### Update Anomaly
An update anomaly occurs when the same data appears in multiple rows and must be updated in several places.

Example from the dataset

Customer C002 – Priya Sharma appears in multiple rows.

Example rows:

order_id	customer_id	customer_name	customer_email	customer_city
ORD1027	C002	Priya Sharma	priya@gmail.com
	Delhi
ORD1002	C002	Priya Sharma	priya@gmail.com
	Delhi

Columns involved

customer_id, customer_name, customer_email, customer_city

Problem

If Priya changes her email to priya123@gmail.com, every row containing C002 must be updated.
If one row is missed, the database becomes inconsistent.

### Delete Anomaly
A delete anomaly occurs when deleting a row unintentionally removes important data.

Example from the dataset

Row:

order_id	product_id	product_name	category
ORD1185	P008	Webcam	Electronics

In this dataset, product P008 appears only once.

If this order is deleted:

order_id = ORD1185
product_id = P008
product_name = Webcam

Then all information about the product "Webcam" is lost from the database, even though the product itself should still exist.

Columns involved

product_id, product_name, category.


## Normalization Justification

Keeping all information in a single table may appear simpler at first, but it creates significant problems related to redundancy, data inconsistency, and maintenance. In the provided dataset, customer information, product details, sales representative data, and order information are all stored in the same table. This design causes multiple anomalies.

For example, customer information such as customer_name, customer_email, and customer_city appears repeatedly whenever the same customer places multiple orders. In the dataset, customer C002 (Priya Sharma) appears in several rows including orders ORD1027, ORD1002, and ORD1037. If Priya changes her email address, every row containing her information must be updated. Missing even one update would result in inconsistent data.

Similarly, product details such as product_name, category, and unit_price are duplicated across many rows whenever the same product is ordered. If the price of a product changes, multiple rows must be updated manually, increasing the risk of errors.

The dataset also demonstrates a delete anomaly. Product P008 (Webcam) appears only once in order ORD1185. If that order record is deleted, all information about the product would be lost, even though the product should still exist in the system.

Normalizing the database to Third Normal Form (3NF) separates data into logical tables such as customers, products, sales representatives, orders, and order items. Each table stores information about a single entity, while relationships are maintained using foreign keys. This structure eliminates redundancy, prevents anomalies, improves data integrity, and makes the database easier to maintain and scale.

