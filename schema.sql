-- ESG Data Warehouse Schema

CREATE DATABASE ESGDataWarehouse;
USE ESGDataWarehouse;

-- Dimension Tables
CREATE TABLE Dim_Company (
    CompanyID INT PRIMARY KEY AUTO_INCREMENT,
    CompanyName VARCHAR(255) NOT NULL,
    Industry VARCHAR(100),
    Region VARCHAR(100),
    Headquarters VARCHAR(255)
);

CREATE TABLE Dim_Industry (
    IndustryID INT PRIMARY KEY AUTO_INCREMENT,
    IndustryName VARCHAR(100) NOT NULL
);

CREATE TABLE Dim_Region (
    RegionID INT PRIMARY KEY AUTO_INCREMENT,
    RegionName VARCHAR(100) NOT NULL
);

CREATE TABLE Dim_Time (
    TimeID INT PRIMARY KEY AUTO_INCREMENT,
    Year INT NOT NULL
);

-- Fact Table
CREATE TABLE Fact_Company_Metrics (
    MetricID INT PRIMARY KEY AUTO_INCREMENT,
    CompanyID INT,
    IndustryID INT,
    RegionID INT,
    TimeID INT,
    ESG_Rating DECIMAL(5,2),
    Carbon_Emissions DECIMAL(10,2),
    Energy_Consumption DECIMAL(10,2),
    Employee_Turnover DECIMAL(5,2),
    Diversity_Score DECIMAL(5,2),
    Governance_Score DECIMAL(5,2),
    FOREIGN KEY (CompanyID) REFERENCES Dim_Company(CompanyID),
    FOREIGN KEY (IndustryID) REFERENCES Dim_Industry(IndustryID),
    FOREIGN KEY (RegionID) REFERENCES Dim_Region(RegionID),
    FOREIGN KEY (TimeID) REFERENCES Dim_Time(TimeID)
);
