-- Sales Performance
SELECT SUM(Revenue) AS TotalRevenue, 
		SUM(Units) AS UnitsSold,
		AVG(UPT) AS UPT,
		AVG(APT) AS APT,
		AVG(Conversion_Rate) AS CR
FROM [dbo].[daily_record]

-- Daily Revenue vs Target
SELECT 
    Date, Revenue, Target_by_Day,
    CASE WHEN Revenue >= Target_by_Day THEN 'Met Target' ELSE 'Below Target' END AS Target_Status
INTO DR 
FROM [dbo].[daily_record];

SELECT 
    Target_Status, 
    COUNT(*) AS Total_Days
FROM DR
GROUP BY Target_Status

SELECT 
    MONTH(Date) AS Month,
    COUNT(CASE WHEN Target_Status = 'Met Target' THEN 1 END) AS Met_Target,
    COUNT(CASE WHEN Target_Status = 'Below Target' THEN 1 END) AS Below_Target,
	COUNT (*) AS Total
FROM DR
GROUP BY MONTH(Date)
ORDER BY Month

-- Top 10 Bestsellers product SKUs
SELECT TOP 10 SKU_1, SUM(Revenue) AS Revenue, SUM(Units) AS UnitSold
FROM [dbo].[transaction_data]
GROUP BY SKU_1
ORDER BY SUM(Revenue) DESC

SELECT TOP 10 SKU_1, SUM(Revenue) AS Revenue, SUM(Units) AS UnitSold
FROM [dbo].[transaction_data]
GROUP BY SKU_1
ORDER BY SUM(Revenue) ASC

-- Revenue and Units Sold per Product Type/ Category
SELECT [Product_Type], SUM(Revenue) AS Revenue, SUM(Units) AS UnitSold,
(SUM(Revenue)/(SELECT SUM(Revenue) FROM [dbo].[transaction_data])*100) AS Percentage_Revenue
FROM [dbo].[transaction_data]
GROUP BY [Product_Type]
ORDER BY SUM(Revenue) DESC

SELECT [Product_Category], SUM(Revenue) AS Revenue, SUM(Units) AS UnitSold,
(SUM(Revenue)/(SELECT SUM(Revenue) FROM [dbo].[transaction_data])*100) AS Percentage_Revenue
FROM [dbo].[transaction_data]
GROUP BY [Product_Category]
ORDER BY SUM(Revenue) DESC

-- Revenue per Type contributed by New customer and Member
SELECT [Product_Type], [Customer_Type], SUM(Revenue) AS Revenue, SUM(Units) AS UnitSold,
(SUM(Revenue)/(SELECT SUM(Revenue) FROM [dbo].[transaction_data])*100) AS Percentage_Revenue
FROM [dbo].[transaction_data]
GROUP BY [Product_Type], [Customer_Type]
ORDER BY SUM(Revenue) DESC

