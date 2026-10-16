INSERT INTO users VALUES
(1,'Amit Sharma','amit@example.com','Delhi','active','2026-01-05'),
(2,'Neha Verma','neha@example.com','Kanpur','active','2026-01-12'),
(3,'Ravi Kumar','ravi@example.com','Delhi','blocked','2026-02-03'),
(4,'Pooja Singh',NULL,'Agra','active','2026-02-20'),
(5,'Sana Khan','sana@example.com','Lucknow','inactive','2026-03-01'),
(6,'Amit Sharma','amit@example.com','Delhi','active','2026-03-15'),
(7,'Karan Mehta','karan@example','Noida','active','2026-04-02'),
(8,'Divya Rao','divya@example.com','Delhi','active','2026-04-18');
INSERT INTO products VALUES
(1,'USB Cable','Accessories',199.0,120),
(2,'Wireless Mouse','Accessories',599.0,40),
(3,'Keyboard','Accessories',899.0,0),
(4,'Notebook A5','Stationery',60.0,300),
(5,'Pen Pack','Stationery',50.0,500),
(6,'Headphones','Electronics',1499.0,15),
(7,'Power Bank','Electronics',1299.0,-2);
INSERT INTO orders VALUES
(101,1,'2026-05-01','delivered',797.0),
(102,2,'2026-05-03','delivered',1499.0),
(103,1,'2026-05-10','cancelled',599.0),
(104,4,'2026-05-12','shipped',170.0),
(105,8,'2026-05-15','placed',1498.0),
(106,2,'2026-05-20','delivered',1000.0),
(107,99,'2026-05-22','placed',199.0),
(108,3,'2026-05-25','placed',60.0);
INSERT INTO order_items VALUES
(1,101,1,2,199.0),
(2,101,2,1,599.0),
(3,102,6,1,1499.0),
(4,103,2,1,599.0),
(5,104,4,1,60.0),
(6,104,5,2,50.0),
(7,105,2,1,599.0),
(8,105,3,1,899.0),
(9,106,3,1,899.0),
(10,107,1,1,199.0),
(11,108,4,1,60.0);
INSERT INTO defects VALUES
(1,'Login accepts blank password','Login','Critical','Closed','2026-05-01','2026-05-04'),
(2,'Cart total wrong after removing item','Cart','Major','Fixed','2026-05-03',NULL),
(3,'Typo on checkout page','Checkout','Minor','Open','2026-05-05',NULL),
(4,'Order placed twice on double click','Checkout','Critical','In Progress','2026-05-07',NULL),
(5,'Search ignores uppercase','Search','Minor','Closed','2026-05-08','2026-05-12'),
(6,'Profile photo upload crashes','Profile','Major','Open','2026-05-09',NULL),
(7,'Email validation allows "a@b"','Signup','Major','Open','2026-05-11',NULL),
(8,'Logout does not clear session','Login','Critical','Rejected','2026-05-12',NULL);
