CREATE DATABASE tfq


create table products
(
	id				    int primary key,
	name			    varchar(100),
	price			    float,
	release_date 	   date
);

DROP TABLE PRODUCTS 
insert into products 
values(1,'iPhone 15', 800, '2023-08-22');
insert into products 
values(2,'Macbook Pro', 2100, '2022-10-12');
insert into products 
values(3,'Apple Watch 9', 550, '2022-04-09')
)
insert into products 
values(5,'ipad', 400, '2024-03-30');

SELECT * FROM PRODUCTS


DROP TABLE products


create table customers
(
    id         int primary key,
    name       varchar(100),
    email      varchar(30)
);

insert into customers values(101,'Meghan Harley', 'mharley@demo.com');
insert into customers values(102,'Rosa Chan', 'rchan@demo.com');
insert into customers values(103,'Logan Short', 'lshort@demo.com');
insert into customers values(104,'Zaria Duke', 'zduke@demo.com');

DROP TABLE customers

create table employees
(
    id         int primary key,
    name       varchar(100)
);

insert into employees values(1001,'Nina Kumari');
insert into employees values(1002,'Abrar Khan');
insert into employees values(1003,'Irene Costa');



create table sales_order (
	order_id		  int primary key,
	order_date	  date,
	quantity		  int,
	prod_id			  int ,
	status			  varchar(20),
	customer_id		int ,
	emp_id			  int,
	constraint fk_so_emp foreign key (emp_id) references employees(id),
	constraint fk_prod_id foreign key (prod_id) references products(id),
	constraint fk_cst_id foreign key (customer_id) references customers(id),
);


insert into sales_order 
values(11,'2024-01-01',2,1,'Completed',101,1001);
insert into sales_order 
values(12,'2024-01-01',3,1,'Pending',102,1002);
insert into sales_order 
values(13,'2024-01-03',3,2,'Completed',103,1002);
insert into sales_order 
values(14,'2024-01-03',3,3,'Completed',103,1002);
insert into sales_order 
values(15,'2024-01-04',1,1,'Completed',103,1002);
insert into sales_order 
values(16,'2024-01-04',1,3,'completed',102,1001);
insert into sales_order 
values(17,'2024-04-01',1,2,'On Hold',102,1001);
insert into sales_order 
values(18,'2024-01-05',4,2,'Rejected',101,1002);
insert into sales_order 
values(19,'2024-01-06',5,5,'Completed',101,1002);
insert into sales_order 
values(20,'2024-01-06',1,1,'Cancelled',101,1001);


SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;


---Fetch all the orders which were neither completed/pending or were handled by the employee Abrar. Display employee name and all details of order.

sel

select employees.name as employee  ,  so .* from sales_order as so
join employees on employees.id = so.emp_id
where upper(status) not in  ('COMPLETED' , 'PENDING' ) or
lower(employees.name) = 'Abrar Khan'


SELECT* FROM employees
WHERE lower(employees.name) like '%abrar%'

select * from sales_order as so
where upper(status) not in  ('COMPLETED' , 'PENDING' )

select * from sales_order as so
where upper(status) not in  ('COMPLETED' , 'PENDING' )


---Fetch the orders which cost more than 2000 but did not include the MacBook Pro. Print the total sale amount as well.

SELECT  p.price, so.quantity,order_id ,p.name, (p.price*so.quantity) as total_sales  from sales_order so
join  products as p on p.id = so.prod_id
where lower(p.name) not like ('%macbook pro%') and
(p.price*so.quantity) > 2000





-- 13. Identify the customers who have not purchased any product yet.

select c.id, c.name from customers as c 
left join sales_order so on  so.customer_id = c.id
where so.order_id is null

select so.customer_id,c.name from sales_order so 
left join  customers c on  c.id=so.customer_id

---- 14. Write a query to identify the total products purchased by each customer. Return all customers irrespective of whether they have made a purchase or not. Sort the result with the highest no of orders at the top.
select (c.name), count(so.order_id)as total_order  from sales_order  so
join customers c on c.id =so.customer_id
group by c.name
order by total_order

select (c.name), count(so.prod_id)as total_prod  from sales_order  so
right join customers c on c.id =so.customer_id
group by c.name
order by total_prod


select c.name, so.order_id from customers c
left join sales_order so on c.id=so.order_id
group by c.name

-- 15. Corresponding to each employee, display the total sales they made of all the completed orders. Display total sales as 0 if an employee made no sales yet.
select * from sales_order
select * from products 


select e.name, so.order_id,so.emp_id from employees e 
left join sales_order so on so.emp_id=e.id
group by so.emp_id

select so.emp_id, count(e.name) as total_sales_empl from sales_order so 
left join employees e  on so.emp_id=e.id
group by so.emp_id

select e.name,coalesce( sum(p.price*so.quantity),0) as sale_by_employee from sales_order so
join products p on p.id=so.prod_id
right join employees e  on so.emp_id=e.id and lower(so.status)= 'completed'
group by e.name










