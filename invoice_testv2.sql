-- invoice_test.delivery_vendor definition

-- Drop table

-- DROP TABLE invoice_test.delivery_vendor;

CREATE TABLE invoice_test.delivery_vendor (
	id serial4 NOT NULL,
	"name" varchar(100) NULL,
	CONSTRAINT delivery_vendor_pkey PRIMARY KEY (id)
);


-- invoice_test.fee_type definition

-- Drop table

-- DROP TABLE invoice_test.fee_type;

CREATE TABLE invoice_test.fee_type (
	id serial4 NOT NULL,
	"name" varchar(100) NULL,
	rate float8 NULL,
	CONSTRAINT fee_type_pkey PRIMARY KEY (id)
);


-- invoice_test.payment_type definition

-- Drop table

-- DROP TABLE invoice_test.payment_type;

CREATE TABLE invoice_test.payment_type (
	id serial4 NOT NULL,
	"name" varchar NULL,
	CONSTRAINT payment_type_pkey PRIMARY KEY (id)
);


-- invoice_test.seller definition

-- Drop table

-- DROP TABLE invoice_test.seller;

CREATE TABLE invoice_test.seller (
	id serial4 NOT NULL,
	"name" varchar(1000) NULL,
	CONSTRAINT seller_pkey PRIMARY KEY (id)
);


-- invoice_test.status_payment definition

-- Drop table

-- DROP TABLE invoice_test.status_payment;

CREATE TABLE invoice_test.status_payment (
	id serial4 NOT NULL,
	"name" varchar(100) NULL,
	CONSTRAINT status_payment_pkey PRIMARY KEY (id)
);


-- invoice_test.user_invoice definition

-- Drop table

-- DROP TABLE invoice_test.user_invoice;

CREATE TABLE invoice_test.user_invoice (
	id serial4 NOT NULL,
	"name" varchar(100) NULL,
	CONSTRAINT user_invoice_pkey PRIMARY KEY (id)
);


-- invoice_test.payment definition

-- Drop table

-- DROP TABLE invoice_test.payment;

CREATE TABLE invoice_test.payment (
	id serial4 NOT NULL,
	payment_type_id int4 NULL,
	amount int4 NULL,
	status_id int4 NULL,
	CONSTRAINT payment_pkey PRIMARY KEY (id),
	CONSTRAINT payment_payment_type_id_fkey FOREIGN KEY (payment_type_id) REFERENCES invoice_test.payment_type(id),
	CONSTRAINT payment_status_id_fkey FOREIGN KEY (status_id) REFERENCES invoice_test.status_payment(id)
);


-- invoice_test.product definition

-- Drop table

-- DROP TABLE invoice_test.product;

CREATE TABLE invoice_test.product (
	id serial4 NOT NULL,
	"name" varchar(100) NULL,
	seller_id int4 NULL,
	price int4 NULL,
	CONSTRAINT product_pkey PRIMARY KEY (id),
	CONSTRAINT product_seller_fk FOREIGN KEY (seller_id) REFERENCES invoice_test.seller(id)
);


-- invoice_test.user_address definition

-- Drop table

-- DROP TABLE invoice_test.user_address;

CREATE TABLE invoice_test.user_address (
	id serial4 NOT NULL,
	user_id int4 NULL,
	"name" varchar(100) NULL,
	street_name varchar(1000) NULL,
	CONSTRAINT user_address_pkey PRIMARY KEY (id),
	CONSTRAINT user_address_user_id_fkey FOREIGN KEY (user_id) REFERENCES invoice_test.user_invoice(id)
);


-- invoice_test.order_invoice definition

-- Drop table

-- DROP TABLE invoice_test.order_invoice;

CREATE TABLE invoice_test.order_invoice (
	id serial4 NOT NULL,
	product_id int4 NULL,
	user_id int4 NULL,
	delivery_id int4 NULL,
	payment_id int4 NULL,
	address_id int4 NULL,
	CONSTRAINT order_invoice_pkey PRIMARY KEY (id),
	CONSTRAINT order_invoice_product_id_fkey FOREIGN KEY (product_id) REFERENCES invoice_test.product(id),
	CONSTRAINT order_invoice_user_id_fkey FOREIGN KEY (user_id) REFERENCES invoice_test.user_invoice(id),
	CONSTRAINT payment_order_fk FOREIGN KEY (payment_id) REFERENCES invoice_test.payment(id)
);


-- invoice_test.order_price definition

-- Drop table

-- DROP TABLE invoice_test.order_price;

CREATE TABLE invoice_test.order_price (
	id serial4 NOT NULL,
	order_id int4 NULL,
	fee_type_id int4 NULL,
	fee_price int4 NULL,
	CONSTRAINT order_price_pkey PRIMARY KEY (id),
	CONSTRAINT order_price_fee_type_id_fkey FOREIGN KEY (fee_type_id) REFERENCES invoice_test.fee_type(id),
	CONSTRAINT order_price_order_id_fkey FOREIGN KEY (order_id) REFERENCES invoice_test.order_invoice(id)
);


-- invoice_test.delivery_data definition

-- Drop table

-- DROP TABLE invoice_test.delivery_data;

CREATE TABLE invoice_test.delivery_data (
	id serial4 NOT NULL,
	vendor_id int4 NULL,
	status varchar NULL,
	order_id int4 NULL,
	CONSTRAINT delivery_data_pkey PRIMARY KEY (id),
	CONSTRAINT delivery_data_order_id_fkey FOREIGN KEY (order_id) REFERENCES invoice_test.order_invoice(id),
	CONSTRAINT delivery_data_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES invoice_test.delivery_vendor(id)
);