create database data_warehouse

create schema bronze 
go
create schema silver
go
create schema gold 
go 


drop schema gold



-- table Bronze layer  CRM
if object_id('bronze.crm_cust_info','U') is not null
   drop table bronze.crm_cust_info;
create table bronze.crm_cust_info(
cst_id INT,
cst_key varchar(50) ,
cst_firstname varchar(50),
cst_lastname varchar(50),
cst_marital_status varchar(50),
cst_gndr varchar(50),
cst_create_date date )


if object_id('bronze.crm_prd_info','U') is not null
   drop table bronze.crm_prd_info;
Create table bronze.crm_prd_info(
prd_id int,
prd_key varchar(50) ,
prd_nm varchar(50),
prd_cost int ,
prd_line varchar(50),
prd_start_dt datetime ,
prd_end_dt datetime )

if object_id('bronze.crm_sales_details','U') is not null
   drop table bronze.crm_sales_details;
Create table bronze.crm_sales_details(
sls_ord_num nvarchar(50),
sls_prd_key nvarchar(50),
sls_cust_id int,
sls_order_dt int,
sls_ship_dt int,
sls_due_dt int ,
sls_sales int,
sls_quantity int ,
sls_price int )

--- Table bronze layer ERP
if object_id('bronze.erp_cust_az12','U') is not null
   drop table bronze.erp_cust_az12;
create table bronze.erp_cust_az12(
CID  nvarchar(50),
DOB Date   ,
GEN  varchar(50))

if object_id('bronze.erp_loc_a101','U') is not null
   drop table bronze.erp_loc_a101;
create table bronze.erp_loc_a101(
cid nvarchar(50),
cntry nvarchar(50))


if object_id('bronze.erp_px_cat','U') is not null
   drop table bronze.erp_px_cat;
create table bronze.erp_px_cat(
id nvarchar(50),
cat nvarchar (50),
subcat nvarchar(50),
maintaenance nvarchar(50))



create or alter procedure bronze.load_bronze as 
begin
print'----------------------------------------------';
print 'loading bronze layer';
print'----------------------------------------------';
---- Bulk Insert 
truncate table bronze.crm_cust_info; 
Bulk insert bronze.crm_cust_info
from 'C:\Users\xyz\Documents\DATA WAREHOUSE PROJECT\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
with ( firstrow = 2,
	fieldterminator = ','
	
)

select * from bronze.crm_cust_info
--

truncate table bronze.crm_prd_info; 
Bulk insert bronze.crm_prd_info
from 'C:\Users\xyz\Documents\DATA WAREHOUSE PROJECT\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
with ( firstrow = 2,
	fieldterminator = ','
	
)
select * from bronze.crm_prd_info

--

truncate table bronze.crm_sales_details; 
Bulk insert bronze.crm_sales_details
from 'C:\Users\xyz\Documents\DATA WAREHOUSE PROJECT\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
with ( firstrow = 2,
	fieldterminator = ','
	
)

print'----------------------------------------------';
print'loading erp--------------------------------';
---

truncate table bronze.erp_cust_az12; 
Bulk insert bronze.erp_cust_az12 
from 'C:\Users\xyz\Documents\DATA WAREHOUSE PROJECT\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
with ( firstrow = 2,
	fieldterminator = ','
	
)



-----


truncate table bronze.erp_loc_a101; 
Bulk insert bronze.erp_loc_a101
from 'C:\Users\xyz\Documents\DATA WAREHOUSE PROJECT\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
with ( firstrow = 2,
	fieldterminator = ','
	
)



---



truncate table bronze.erp_px_cat; 
Bulk insert bronze.erp_px_cat
from 'C:\Users\xyz\Documents\DATA WAREHOUSE PROJECT\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
with ( firstrow = 2,
	fieldterminator = ','
	
)

end


exec  bronze.load_bronze