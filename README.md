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
## 🚀 Project Requirements
Building the Data Warehouse (Data Engineering)
### Goal:
Create a modern data warehouse using SQL Server to gather and consolidate sales data, enabling effective reporting and data-driven decision-making.

### Details:
Data Sources: Import data from two separate systems: ERP and CRM, both provided as CSV files.
Data Quality: Cleanse the data to resolve any issues (e.g., missing values, inconsistencies) before performing analysis.
Data Integration: Combine the data from both sources into a single, easy-to-use data model optimized for analysis and reporting.
Scope: Work only with the most recent dataset; there's no need to track historical data.
Documentation: Provide clear documentation for the data model to assist both business stakeholders and analytics teams in understanding and using the data effectively.

____

## 📊 Data Warehouse Architecture (Bronze-Silver-Gold)
This project follows a structured Bronze-Silver-Gold data architecture, ensuring efficient data processing, transformation, and consumption.

### 🟤 Bronze Layer:
Stores raw data as received from source systems (CRM, ERP) without modifications. Data is ingested from CSV files into the SQL Server Database for initial storage.

### ⚪ Silver Layer: 
Performs data cleansing, standardization, and normalization to enhance data quality and prepare it for analysis. This ensures consistency and usability across different datasets.

### 🟡 Gold Layer: 
Contains business-ready data, structured using a star schema for efficient reporting and analytics. Optimized views and aggregate tables enable seamless BI, reporting, and machine learning applications. 🚀

![Data Architecture](https://github.com/Shalokbhatia/SQL-data-warehouse-project/blob/main/docs/data_archi.png)
____

## Data Modeling -  Star Schema Design 🌟

A Star Schema is a type of database schema where the Fact Table is at the center and is connected to multiple Dimension Tables. This structure is designed to simplify complex queries and make data analysis efficient.The key idea of the star schema is to have a central fact table linked to multiple dimension tables, creating a "star-like" structure. 🌟 This schema design makes it easy to understand the relationships between the data, and it optimizes queries for reporting and analysis.

![Data Modeling](https://github.com/Shalokbhatia/SQL-data-warehouse-project/blob/main/docs/Gold%20layer%20datat%20model.drawio.png)

Process:
### Fact Tables 📊: 
These tables store quantitative data or metrics like sales revenue, quantity sold, etc. They typically contain the key performance indicators (KPIs) that analysts want to measure.

### Dimension Tables 🏷️: 
These tables store descriptive data that provides context for the facts, such as customer information, time periods, or product categories. They help categorize or filter the facts for meaningful insights.



