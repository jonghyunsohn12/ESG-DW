# 📊 ESG Data Warehouse

## Overview
The **ESG Data Warehouse** is designed to provide structured, high-quality ESG (Environmental, Social, and Governance) data for **buy-side investors** and analysts. It aggregates company-specific sustainability metrics, including **carbon emissions, energy consumption, employee turnover, diversity scores, and governance ratings**. The warehouse enables **data-driven investment decisions** by integrating various ESG datasets into a **MySQL-based data warehouse** with an ETL pipeline.

## Features
### 🔹 Data Management
- **Structured ESG Data**: Collects and stores company ESG metrics in a normalized format.
- **Star Schema Design**: Optimized for **fast analytical queries**.

### 🔹 ETL Pipeline
- **Extract**: Data ingestion from structured (CSV) and semi-structured (JSON) sources.
- **Transform**: Cleanses and normalizes ESG metrics.
- **Load**: Stores transformed data into MySQL for analytical processing.

### 🔹 Analytics & Reporting
- **Track ESG Performance**: Identify trends in environmental, social, and governance factors.
- **Compare Companies**: Evaluate companies' ESG scores across industries and regions.
- **Identify High-Risk Companies**: Detect firms with poor ESG compliance and governance violations.

## 📂 Project Structure
```
/ESG-Data-Warehouse
│── /sql
│   ├── schema.sql        # Database schema
│   ├── seed_data.sql     # Sample data insertion
│   ├── queries.sql       # Example analytical queries
│── /src
│   ├── etl.py           # ETL pipeline script
│   ├── db_connector.py  # Database connection module
│── README.md
```

## 🚀 Installation & Setup
1. **Clone the repository**  
   ```bash
   git clone https://github.com/your-username/ESG-Data-Warehouse.git
   cd ESG-Data-Warehouse
   ```

2. **Setup MySQL database**  
   - Create a new MySQL database:
     ```sql
     CREATE DATABASE ESGDataWarehouse;
     ```
   - Import schema and sample data:
     ```bash
     mysql -u root -p ESGDataWarehouse < sql/schema.sql
     mysql -u root -p ESGDataWarehouse < sql/seed_data.sql
     ```

3. **Run the ETL pipeline**  
   ```bash
   python src/etl.py
   ```

## 📊 Sample Queries
```sql
-- Find average ESG rating per industry per year
SELECT d.Year, i.IndustryName, AVG(f.ESG_Rating) AS Avg_ESG_Rating
FROM Fact_Company_Metrics f
JOIN Dim_Time d ON f.TimeID = d.TimeID
JOIN Dim_Industry i ON f.IndustryID = i.IndustryID
GROUP BY d.Year, i.IndustryName;
```
---

This ESG Data Warehouse is designed to **empower investors with sustainability insights** while ensuring **scalability and high-performance data management**. 🚀
