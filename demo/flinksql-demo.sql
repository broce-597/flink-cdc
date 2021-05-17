CREATE TABLE mysql_order (
  customer_id STRING,
  order_pay_account STRING,
  order_sn STRING,
  fee DECIMAL(20,2),
  order_from STRING
) WITH (
  'connector' = 'mysql-cdc',
  'hostname' = 'localhost',
  'port' = '3306',
  'username' = 'root',
  'password' = '123456',
  'database-name' = 'brocedb',
  'table-name' = 'order'
);

CREATE TABLE mysql_customer (
  id STRING,
  username STRING,
  phone STRING,
  sex INT,
  city STRING
) WITH (
  'connector' = 'mysql-cdc',
  'hostname' = 'localhost',
  'port' = '3306',
  'username' = 'root',
  'password' = '123456',
  'database-name' = brocedb',
  'table-name' = 'customer_account'
);

CREATE TABLE mysql_customer_account (
  customer_id STRING,
  available_amount DECIMAL(20,2)
) WITH (
  'connector' = 'mysql-cdc',
  'hostname' = 'localhost',
  'port' = '3306',
  'username' = 'root',
  'password' = '123456',
  'database-name' = 'brocedb',
  'table-name' = 'customer_account'
);

CREATE TABLE customer_order_detail (
  customerId STRING,
  accountId STRING,
  orderSn STRING,
  fee DECIMAL(20,2),
  orderFrom STRING,
  userName STRING,
  phone STRING,
  sex INT,
  city STRING,
  availableAmount DECIMAL(20,2),
  PRIMARY KEY (orderSn) NOT ENFORCED
) WITH (
    'connector' = 'elasticsearch-7',
    'hosts' = 'http://localhost:9200',
    'index' = 'customer_order_detail'
);

INSERT INTO customer_order_detail
SELECT
order.customer_id AS customerId,
order.recharge_account AS accountId ,
order.order_sn AS orderSn,
order.fee AS fee,
order.order_from AS orderFrom,
customer.username AS userName,
customer.phone AS phone,
customer.sex,
customer.city,
account.available_amount AS availableAmount
FROM mysql_order AS order
LEFT JOIN mysql_customer as customer on order.customer_id=customer.id
LEFT JOIN mysql_customer_account as account on account.customer_id=order.customer_id