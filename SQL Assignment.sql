use pratice;
show tables;
select * from sales_data order by product_id;
select product_category, sum(sales) , avg(discount) from sales_data group by product_category; #to 
#find the sum and average of the sales and avg

create table product_details (
    product_id int primary key,
    product_name varchar(255),
    product_description varchar(255)
    );
insert into product_details values (1,'Laptop','Electronics'),(2,'TV','Electronics'),(3,'Mobile','Electronics'),
(4,'Tablet','Electronics'),(5,'Table','Furniture'),(6,'Tablet','Electronics'),(7,'Earphones','Electronics'),
(8,'Books','Stationary'),(9,'Monitor','Electronics'),(10,'Pendrive','Electronics');

select * from product_details;

create table sales_product_details as
select s.*, pd.product_name, pd.product_description
from sales_data s
join product_details pd on s.product_id = pd.product_id;

select * from sales_product_details;


select product_id , customer_id, sum(sales) as total_sales from sales_product_details 
group by product_id, customer_id
order by total_sales desc
limit 10;

select * from sales_product_details where sales>(select AVG(sales) from sales_product_details);

