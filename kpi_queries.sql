/* Inventry Turnover */
SELECT ProductID,
       SUM(UnitsSold) / AVG(InventoryLevel) AS TurnoverRatio
FROM Inventory
GROUP BY ProductID;

/* Top Stockouts */
SELECT ProductID, COUNT(*) AS StockoutDays
FROM Inventory
WHERE InventoryLevel < UnitsSold
GROUP BY ProductID
ORDER BY StockoutDays DESC
LIMIT 10;

/* Inventory age */
SELECT ProductID,
       MIN(Date) AS FirstSeen,
       MAX(Date) AS LastSeen,
       JULIANDAY(MAX(Date)) - JULIANDAY(MIN(Date)) AS InventoryAgeDays
FROM Inventory
GROUP BY ProductID;
