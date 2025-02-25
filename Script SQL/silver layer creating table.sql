	-- table silver layer  CRM
if object_id('silver.crm_cust_info','U') is not null
create table silver.crm_cust_info(
cst_id INT,
cst_key varchar(50) ,
cst_firstname varchar(50),
cst_lastname varchar(50),
cst_marital_status varchar(50),
cst_gndr varchar(50),
cst_create_date date ,
dwh_create_date datetime2 default getdate()

);


if object_id('silver.crm_prd_info','U') is not null
   drop table silver.crm_prd_info;
Create table silver.crm_prd_info(
prd_id int,
cat_id varchar(50),
prd_key varchar(50) ,
prd_nm varchar(50),
prd_cost int ,
prd_line varchar(50),
prd_start_dt date ,
prd_end_dt date ,
dwh_create_date datetime2 default getdate());

if object_id('silver.crm_sales_details','U') is not null
   drop table silver.crm_sales_details;
Create table silver.crm_sales_details(
sls_ord_num nvarchar(50),
sls_prd_key nvarchar(50),
sls_cust_id int,
sls_order_dt date,
sls_ship_dt date,
sls_due_dt date ,
sls_sales int,
sls_quantity int ,
sls_price int,
dwh_create_date datetime2 default getdate());

--- Table silver layer ERP
if object_id('silver.erp_cust_az12','U') is not null
drop table silver.erp_cust_az12;
create table silver.erp_cust_az12(
CID  nvarchar(50),
DOB Date   ,
GEN  varchar(50),
dwh_create_date datetime2 default getdate());

if object_id('silver.erp_loc_a101','U') is not null
drop table silver.erp_loc_a101;
create table silver.erp_loc_a101(
cid nvarchar(50),
cntry nvarchar(50),
dwh_create_date datetime2 default getdate());


if object_id('silver.erp_px_cat','U') is not null
drop table silver.erp_px_cat;
create table silver.erp_px_cat(
id nvarchar(50),
cat nvarchar (50),
subcat nvarchar(50),
maintaenance nvarchar(50),
dwh_create_date datetime2 default getdate());


