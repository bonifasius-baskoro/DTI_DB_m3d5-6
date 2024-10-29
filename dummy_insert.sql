-- 1. Insert delivery_vendor data
INSERT INTO invoice_test.delivery_vendor (name) VALUES
('JNE'),
('SiCepat'),
('J&T Express'),
('Grab Express');

-- 2. Insert fee_type data
INSERT INTO invoice_test.fee_type (name, rate) VALUES
('Delivery Fee', 0.1),
('Platform Fee', 0.05),
('Insurance Fee', 0.02),
('Tax', 0.11);

-- 3. Insert payment_type data
INSERT INTO invoice_test.payment_type (name) VALUES
('Gopay Coins'),
('Debit Card'),
('Bank Transfer'),
('E-Wallet');

-- 4. Insert seller data
INSERT INTO invoice_test.seller (name) VALUES
('Electronic Store ABC'),
('Fashion Gallery XYZ'),
('Home Appliance Shop'),
('Book Store 123');

-- 5. Insert status_payment data
INSERT INTO invoice_test.status_payment (name) VALUES
('Pending'),
('Paid'),
('Failed'),
('Refunded');

-- 6. Insert user_invoice data
INSERT INTO invoice_test.user_invoice (name) VALUES
('John Doe'),
('Jane Smith'),
('Robert Johnson'),
('Mary Williams');

-- 7. Insert payment data
INSERT INTO invoice_test.payment (payment_type_id, amount, status_id) VALUES
(1, 1500000, 2),
(3, 750000, 2),
(2, 2000000, 1),
(4, 1250000, 2);

-- 8. Insert product data
INSERT INTO invoice_test.product (name, seller_id, price) VALUES
('Samsung Smart TV', 1, 1000000),
('Nike Running Shoes', 2, 500000),
('Refrigerator LG', 3, 1500000),
('Harry Potter Collection', 4, 750000);

-- 9. Insert user_address data
INSERT INTO invoice_test.user_address (user_id, name, street_name) VALUES
(1, 'Home', 'Jl. Sudirman No. 123'),
(1, 'Office', 'Jl. Thamrin No. 45'),
(2, 'Home', 'Jl. Gatot Subroto No. 67'),
(3, 'Home', 'Jl. Asia Afrika No. 89');

-- 10. Insert order_invoice data
INSERT INTO invoice_test.order_invoice (product_id, user_id, delivery_id, payment_id, address_id) VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 3),
(3, 3, 3, 3, 4),
(4, 4, 4, 4, 2);

-- 11. Insert order_price data
INSERT INTO invoice_test.order_price (order_id, fee_type_id, fee_price) VALUES
(1, 1, 50000),
(1, 2, 25000),
(1, 3, 10000),
(2, 1, 35000),
(2, 2, 15000),
(3, 1, 75000),
(3, 2, 30000),
(4, 1, 40000);

-- 12. Insert delivery_data data
INSERT INTO invoice_test.delivery_data (vendor_id, status, order_id) VALUES
(1, 'In Transit', 1),
(2, 'Delivered', 2),
(3, 'Processing', 3),
(4, 'Picked Up', 4);


select oi.id , user1."name"  as name_user,
p.amount  payment_amount,
pt."name"  payment_type,
dv."name" as delivery_vendor_name ,
dd.status as delivery_status from order_invoice oi 
join user_invoice user1 on oi.user_id  = user1.id 
join payment p on oi.payment_id  = p.id 
join payment_type pt  on p.payment_type_id  = pt.id 
join status_payment sp  on p.status_id  = sp.id 
join product pr on pr.id  = oi.product_id 
join seller s on pr.seller_id  = s.id
join delivery_data dd  on dd.id  = oi.id  
join delivery_vendor dv  on dd.vendor_id  =dv.id ;

select * from delivery_data dd;