-- ESG Data Analysis Queries

-- 1. Average ESG Rating per Year for Each Industry
SELECT d.Year, i.IndustryName, AVG(f.ESG_Rating) AS Avg_ESG_Rating
FROM Fact_Company_Metrics f
JOIN Dim_Time d ON f.TimeID = d.TimeID
JOIN Dim_Industry i ON f.IndustryID = i.IndustryID
GROUP BY d.Year, i.IndustryName;

-- 2. Total Carbon Emissions Per Year Per Company
SELECT d.Year, c.CompanyName, SUM(f.Carbon_Emissions) AS Total_Carbon_Emissions
FROM Fact_Company_Metrics f
JOIN Dim_Time d ON f.TimeID = d.TimeID
JOIN Dim_Company c ON f.CompanyID = c.CompanyID
GROUP BY d.Year, c.CompanyName;

-- 3. Companies with Highest Governance Score
SELECT c.CompanyName, f.Governance_Score
FROM Fact_Company_Metrics f
JOIN Dim_Company c ON f.CompanyID = c.CompanyID
ORDER BY f.Governance_Score DESC
LIMIT 5;
