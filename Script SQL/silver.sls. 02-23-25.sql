-----TRF DATA FROM BRONZE TO SILVER 
-----clean data in silver.crm_cust_info 

select
* from bronze.crm_cust_info


Truncate table silver.crm_cust_info;
insert into silver.crm_cust_info(cst_id,cst_key,cst_firstname,cst_lastname,cst_marital_status,cst_gndr,cst_create_date)

select 
cst_id , 
cst_key, 
trim(cst_firstname) as first_name , 
trim(cst_lastname) as last_name , 
case when upper(trim(cst_marital_status))='S' then 'single'
     when upper(trim(cst_marital_status))='M' then'married'
	 ELSE 'n/a'
	 end cst_marital_status ,
case when upper(trim(cst_gndr))='M' then 'male'
     when upper(trim(cst_gndr))='F' then'female'
	 ELSE 'n/a'
	 end cst_gndr, 
cst_create_date from(
select * ,
	ROW_NUMBER() over (partition by cst_id order by cst_create_date  desc)  as flag_last 
	from bronze.crm_cust_info 
	where cst_id is not null ) t 
	where flag_last=1

--select* from silver.crm_cust_info



--PRODUCT  table to silver layer 

----select * from silver.crm_prd_info

Truncate table silver.crm_prd_info;
insert into silver.crm_prd_info(
prd_id,
cat_id,
prd_key,
prd_nm,
prd_cost,
prd_line,
prd_start_dt,
prd_end_dt
)
select 
prd_id,  
replace (substring(prd_key, 1,5 ), '-','_') as cat_id,
SUBSTRING(prd_key,7,len(prd_key)) as prd_key ,
prd_nm, 
isnull(prd_cost,0) as prd_cost, 
case upper(trim(prd_line)) 
	when 'R' then 'road'
	when 'M' then 'mountain'
	when 'S' then 'other sales'
	when 'T' then 'touring'
	else 'n/a'
End as prd_line,
cast (prd_start_dt as date )as pr_start_dt,
cast(lead (prd_start_dt )over (partition by prd_nm order by prd_start_dt)-1 as date )as prd_end_dt
from bronze.crm_prd_info 

------ insert data into silver sales table 
truncate table silver.crm_sales_details;
insert into silver.crm_sales_details(
sls_ord_num ,
sls_prd_key ,
sls_cust_id ,
sls_order_dt ,
sls_ship_dt ,
sls_due_dt  ,
sls_sales ,
sls_quantity,
sls_price 
)		
		SELECT 
			sls_ord_num,
			sls_prd_key,
			sls_cust_id,
			CASE 
				WHEN sls_order_dt = 0 OR LEN(sls_order_dt) != 8 THEN NULL
				ELSE CAST(CAST(sls_order_dt AS VARCHAR) AS DATE)
			END AS sls_order_dt,
			CASE 
				WHEN sls_ship_dt = 0 OR LEN(sls_ship_dt) != 8 THEN NULL
				ELSE CAST(CAST(sls_ship_dt AS VARCHAR) AS DATE)
			END AS sls_ship_dt,
			CASE 
				WHEN sls_due_dt = 0 OR LEN(sls_due_dt) != 8 THEN NULL
				ELSE CAST(CAST(sls_due_dt AS VARCHAR) AS DATE)
			END AS sls_due_dt,
			CASE 
				WHEN sls_sales IS NULL OR sls_sales <= 0 OR sls_sales != sls_quantity * ABS(sls_price) 
					THEN sls_quantity * ABS(sls_price)
				ELSE sls_sales
			END AS sls_sales, -- Recalculate sales if original value is missing or incorrect
			sls_quantity,
			CASE 
				WHEN sls_price IS NULL OR sls_price <= 0 
					THEN sls_sales / NULLIF(sls_quantity, 0)
				ELSE sls_price  -- Derive price if original value is invalid
			END AS sls_price
		FROM bronze.crm_sales_details;


----SILVER CUST TABLE  

--select* from bronze.erp_cust_az12
truncate table silver.erp_cust_az12;
INSERT INTO silver.erp_cust_az12(
CID,
DOB,
GEN)
SELECT
			CASE
				WHEN CID LIKE 'NAS%' THEN SUBSTRING(cid, 4, LEN(cid)) -- Remove 'NAS' prefix if present
				ELSE CID
			END AS cid, 
			CASE
				WHEN DOB > GETDATE() THEN NULL
				ELSE DOB
			END AS bdate, -- Set future birthdates to NULL
			CASE
				WHEN UPPER(TRIM(GEN)) IN ('F', 'FEMALE') THEN 'Female'
				WHEN UPPER(TRIM(GEN)) IN ('M', 'MALE') THEN 'Male'
				ELSE 'n/a'
			END AS gen -- Normalize gender values and handle unknown cases
FROM bronze.erp_cust_az12


---- SILVER LOCATION 
truncate table silver.erp_loc_a101;
INSERT INTO silver.erp_loc_a101 (
			cid,
			cntry
		)
		SELECT
			REPLACE(cid, '-', '') AS cid, 
			CASE
				WHEN TRIM(cntry) = 'DE' THEN 'Germany'
				WHEN TRIM(cntry) IN ('US', 'USA') THEN 'United States'
				WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
				ELSE TRIM(cntry)
			END AS cntry -- Normalize and Handle missing or blank country codes
		FROM bronze.erp_loc_a101

--select * from silver.erp_loc_a101

----SILVER TABLE PRODUCT SUB CATEGORY  
truncate table silver.erp_px_cat
INSERT INTO silver.erp_px_cat (
			id,
			cat,
			subcat,
			maintaenance
		)
		SELECT
			id,
			cat,
			subcat,
			maintaenance
		FROM bronze.erp_px_cat;

--SELECT * FROM silver.erp_px_cat













