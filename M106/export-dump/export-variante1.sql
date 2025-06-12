SELECT
  customer.customer_id,
  customer.first_name,
  customer.last_name,
  customer.email,
  DATE_FORMAT(customer.create_date, '%d.%m.%Y') AS create_date
INTO OUTFILE 'C:/Schule/BBW-docs/M106/kunden-1.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
FROM customer;
