# Business Intelligence, Uber Data Warehouse & Integration

## Architecture Overview:
- Engineered end-to-end on-premises Uber data warehouse architecture, transforming raw Parquet files into insightful visual reports.
- Established an operational database with relational model design, normalization, and raw data loading.
- Designed and implemented a snowflake schema data warehouse with a fact table and 7 dimension tables in Postgres.

![Image Description](https://github.com/Johnlee19990908/BIE_Uber_data_warehouse/blob/main/readme_image/1.png)

## Data Sources and Resources:
- **Data Source:** [Uber NYC For-Hire Vehicles Trip Data 2021](https://www.kaggle.com/datasets/shuhengmo/uber-nyc-forhire-vehicles-trip-data-2021)
- **Sample Data:** `trip_master_final.sql` (10000 rows) for sample data.
- **Database Schema Creation:** Use `2_operaional_normal_db.sql` for database schema creation and `3_insert into table.sql` to insert raw sample data into the operational database.
- **Data Warehouse Schema:** Refer to `dw_schema.sql` for the data warehouse snowflake schema.

![Image Description](https://github.com/Johnlee19990908/BIE_Uber_data_warehouse/blob/main/readme_image/2.png)

- **Talend ETL Implementation:** Import `talend_ETL.zip` into Talend to implement the ETL from the operational database to the data warehouse.

## ETL Implementation Details:
- Orchestrated Talend Studio ETL pipeline for 8 tables, facilitating data transfer from operational database to data warehouse.
- Developed dynamic Tableau dashboards for Uber KPI analysis.

![Image Description](https://github.com/Johnlee19990908/BIE_Uber_data_warehouse/blob/main/readme_image/3.png)
![Image Description](https://github.com/Johnlee19990908/BIE_Uber_data_warehouse/blob/main/readme_image/4.png)

## OLAP Operations and Tableau Dashboard:
- Traditional OLAP operations in Tableau for analyzing stored historical data.
- Tableau Dashboard includes Uber market shares in New York, trip duration analysis, and traffic congestion analysis.
- Refer to `Tableau_Workbook.twb` for the detailed dashboard.
![Image Description](https://github.com/Johnlee19990908/BIE_Uber_data_warehouse/blob/main/readme_image/5.png)
![Image Description](https://github.com/Johnlee19990908/BIE_Uber_data_warehouse/blob/main/readme_image/6.png)
![Image Description](https://github.com/Johnlee19990908/BIE_Uber_data_warehouse/blob/main/readme_image/7.png)
