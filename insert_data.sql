INSERT INTO Customers VALUES
(1, 'Rahul Sharma', 'Delhi', '2025-01-10'),
(2, 'Priya Singh', 'Mumbai', '2025-01-15'),
(3, 'Amit Kumar', 'Bangalore', '2025-02-05'),
(4, 'Sneha Patel', 'Ahmedabad', '2025-02-20'),
(5, 'Arjun Mehta', 'Pune', '2025-03-01'),
(6, 'Neha Gupta', 'Delhi', '2025-03-15'),
(7, 'Rohan Verma', 'Mumbai', '2025-04-01'),
(8, 'Ananya Rao', 'Bangalore', '2025-04-10'),
(9, 'Vikram Shah', 'Pune', '2025-05-05'),
(10, 'Kavya Nair', 'Kochi', '2025-05-20');


INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 55000),
(2, 'Smartphone', 'Electronics', 30000),
(3, 'Headphones', 'Electronics', 3000),
(4, 'Office Chair', 'Furniture', 8000),
(5, 'Desk', 'Furniture', 12000),
(6, 'Backpack', 'Accessories', 2000),
(7, 'Keyboard', 'Electronics', 2500),
(8, 'Mouse', 'Electronics', 1200),
(9, 'Monitor', 'Electronics', 15000),
(10, 'Water Bottle', 'Accessories', 800);


INSERT INTO Orders VALUES
(101, 1, '2025-06-01', 'Completed'),
(102, 2, '2025-06-03', 'Completed'),
(103, 3, '2025-06-05', 'Completed'),
(104, 4, '2025-06-08', 'Cancelled'),
(105, 5, '2025-06-10', 'Completed'),
(106, 6, '2025-06-12', 'Completed'),
(107, 7, '2025-06-15', 'Completed'),
(108, 8, '2025-06-18', 'Cancelled'),
(109, 9, '2025-06-20', 'Completed'),
(110, 10, '2025-06-22', 'Completed'),
(111, 1, '2025-07-01', 'Completed'),
(112, 2, '2025-07-05', 'Completed'),
(113, 3, '2025-07-10', 'Completed'),
(114, 5, '2025-07-15', 'Completed'),
(115, 7, '2025-07-20', 'Completed');


INSERT INTO Order_Items VALUES
(101, 1, 1, 5),
(101, 3, 2, 0),

(102, 2, 1, 10),
(102, 8, 1, 0),

(103, 4, 1, 5),
(103, 6, 2, 0),

(104, 5, 1, 0),

(105, 1, 1, 8),
(105, 7, 1, 0),

(106, 6, 3, 5),
(106, 10, 2, 0),

(107, 9, 1, 10),
(107, 3, 1, 0),

(108, 2, 1, 5),

(109, 5, 1, 10),
(109, 4, 1, 0),

(110, 3, 2, 0),
(110, 8, 2, 5),

(111, 1, 1, 5),
(111, 9, 1, 10),

(112, 2, 1, 5),
(112, 7, 2, 0),

(113, 4, 1, 0),
(113, 6, 1, 5),

(114, 5, 1, 10),
(114, 10, 2, 0),

(115, 9, 1, 5),
(115, 8, 1, 0);