create database ragul;
use ragul;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    city VARCHAR(100),
    segment VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Arun Kumar', 'Male', 28, 'Chennai', 'Retail'),
(2, 'Priya Sharma', 'Female', 35, 'Bangalore', 'Corporate'),
(3, 'Rahul Das', 'Male', 40, 'Hyderabad', 'Retail'),
(4, 'Sneha Iyer', 'Female', 30, 'Chennai', 'Home Office');

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    cost_price DECIMAL(10,2),
    selling_price DECIMAL(10,2)
);

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 'Computers', 40000, 50000),
(102, 'Office Chair', 'Furniture', 'Chairs', 3000, 4500),
(103, 'Mobile Phone', 'Electronics', 'Mobiles', 15000, 20000),
(104, 'Desk Table', 'Furniture', 'Tables', 5000, 7000);

CREATE TABLE regions (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(50),
    state VARCHAR(50)
);

INSERT INTO regions VALUES
(1, 'South', 'Tamil Nadu'),
(2, 'South', 'Karnataka'),
(3, 'South', 'Telangana');

CREATE TABLE dates (
    date_id DATE PRIMARY KEY,
    year INT,
    quarter VARCHAR(10),
    month INT,
    month_name VARCHAR(20)
);

INSERT INTO dates VALUES
('2024-01-01', 2024, 'Q1', 1, 'January'),
('2024-02-01', 2024, 'Q1', 2, 'February'),
('2024-03-01', 2024, 'Q1', 3, 'March');

CREATE TABLE sales_fact (
    sales_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    region_id INT,
    date_id DATE,
    quantity INT,
    total_sales DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (region_id) REFERENCES regions(region_id),
    FOREIGN KEY (date_id) REFERENCES dates(date_id)
);

INSERT INTO sales_fact VALUES
(1, 1, 101, 1, '2024-01-01', 2, 100000),
(2, 2, 102, 2, '2024-02-01', 3, 13500),
(3, 3, 103, 3, '2024-03-01', 1, 20000),
(4, 4, 104, 1, '2024-01-01', 2, 14000);

select * from sales_fact;

SELECT SUM(total_sales) AS total_revenue
FROM sales_fact;

SELECT p.category, SUM(s.total_sales) AS revenue
FROM sales_fact s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category;

SELECT c.customer_name, SUM(s.total_sales) AS total_spent
FROM sales_fact s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;

commit;

SELECT SUM(total_sales) FROM sales_fact;
