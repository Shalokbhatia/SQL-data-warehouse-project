# SQL-Data-Warehouse-Project
## Building a modern data warehouse project including ETL, data modeling, and analytics 
----
Welcome to the Data Warehouse and Analytics Project Repository! 📊✨

This project showcases a complete data warehousing and analytics solution, covering everything from data integration to insightful reporting. Built as a portfolio project, it follows industry best practices in data engineering and analytics to deliver meaningful business insights.
_______
## Required Tools & Resources  

### 📊 Dataset  
Access the project dataset in CSV format for analysis and processing.  

### 🛠 SQL Server Express  
A lightweight, free edition of SQL Server for hosting and managing databases locally.  

### 🔍 SQL Server Management Studio (SSMS)  
A graphical interface for interacting with and managing SQL databases efficiently.  

### 🌐 Git Repository  
Set up a GitHub repository to manage version control, collaborate, and track code changes.  

### 📌 Draw.io  
Use Draw.io to design data architecture, entity-relationship models, workflows, and diagrams.  

### 📝 Notion  
An all-in-one workspace for organizing project tasks, documentation, and collaboration.  

### 🚀 Project Workflow in Notion  
Access structured project phases, tasks, and milestones for streamlined execution.  
______

## 📊 Data Warehouse Architecture (Bronze-Silver-Gold)
This project follows a structured Bronze-Silver-Gold data architecture, ensuring efficient data processing, transformation, and consumption.

### 🟤 Bronze Layer:
Stores raw data as received from source systems (CRM, ERP) without modifications. Data is ingested from CSV files into the SQL Server Database for initial storage.

### ⚪ Silver Layer: 
Performs data cleansing, standardization, and normalization to enhance data quality and prepare it for analysis. This ensures consistency and usability across different datasets.

### 🟡 Gold Layer: 
Contains business-ready data, structured using a star schema for efficient reporting and analytics. Optimized views and aggregate tables enable seamless BI, reporting, and machine learning applications. 🚀

![Data Architecture](https://github.com/Shalokbhatia/SQL-data-warehouse-project/blob/main/docs/data_archi.png)

## Data Modeling 
### Star Schema Design 🌟
![Data Modeling](
Description:
A Star Schema is a type of database schema where the Fact Table is at the center and is connected to multiple Dimension Tables. This structure is designed to simplify complex queries and make data analysis efficient.

Process:

Fact Tables 📊: These tables store quantitative data or metrics like sales revenue, quantity sold, etc. They typically contain the key performance indicators (KPIs) that analysts want to measure.
Dimension Tables 🏷️: These tables store descriptive data that provides context for the facts, such as customer information, time periods, or product categories. They help categorize or filter the facts for meaningful insights.
The key idea of the star schema is to have a central fact table linked to multiple dimension tables, creating a "star-like" structure. 🌟 This schema design makes it easy to understand the relationships between the data, and it optimizes queries for reporting and analysis.

3.2 Defining Primary and Foreign Keys 🔑
Description:
In a relational database, primary keys uniquely identify each record in a table, while foreign keys establish relationships between tables, helping us connect related data.

Process:

Primary Keys 🔑: In a Customer Dimension Table, the Customer_ID might be the primary key that uniquely identifies each customer.
Foreign Keys 🔗: In a Sales Fact Table, you might have a Customer_ID as a foreign key, linking it to the Customer Dimension Table to pull customer-specific information (like name, location, etc.).

