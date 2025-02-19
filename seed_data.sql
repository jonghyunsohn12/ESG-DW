-- Insert sample data into Dim_Company
INSERT INTO Dim_Company (CompanyName, Industry, Region, Headquarters)
VALUES 
    ('GreenTech Ltd', 'Renewable Energy', 'Europe', 'Berlin, Germany'),
    ('EcoSolutions Inc.', 'Sustainable Manufacturing', 'North America', 'New York, USA'),
    ('SolarFuture Co.', 'Renewable Energy', 'Asia', 'Tokyo, Japan');

-- Insert sample data into Dim_Industry
INSERT INTO Dim_Industry (IndustryName)
VALUES 
    ('Renewable Energy'),
    ('Sustainable Manufacturing');

-- Insert sample data into Dim_Region
INSERT INTO Dim_Region (RegionName)
VALUES 
    ('Europe'),
    ('North America'),
    ('Asia');

-- Insert sample data into Dim_Time
INSERT INTO Dim_Time (Year)
VALUES 
    (2022),
    (2023);

-- Insert sample data into Fact_Company_Metrics
INSERT INTO Fact_Company_Metrics (CompanyID, IndustryID, RegionID, TimeID, ESG_Rating, Carbon_Emissions, Energy_Consumption, Employee_Turnover, Diversity_Score, Governance_Score)
VALUES 
    (1, 1, 1, 1, 85.5, 200.0, 500.0, 5.0, 78.0, 80.0),
    (2, 2, 2, 1, 78.3, 250.0, 600.0, 7.5, 80.0, 85.0),
    (3, 1, 3, 2, 82.0, 180.0, 550.0, 6.0, 79.0, 82.0);
