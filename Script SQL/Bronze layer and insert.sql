

----- to Check Data quality 
select sls_sales from 
bronze.crm_sales_details
where sls_sales= 0 or sls_sales is null or sls_sales<1 	


select sls_price from 
bronze.crm_sales_details
where sls_price= 0 or sls_price is null or sls_price<1