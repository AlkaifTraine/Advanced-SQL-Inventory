/*Fast vs slow mover */
SELECT ProductID,
       AVG(UnitsSold) AS AvgDailySales,
       CASE
           WHEN AVG(UnitsSold) > 80 THEN 'Fast Mover'
           WHEN AVG(UnitsSold) < 20 THEN 'Slow Mover'
           ELSE 'Moderate'
       END AS MovementType
FROM Inventory
GROUP BY ProductID
ORDER BY AvgDailySales DESC;

/* Reorder point estimation */
SELECT StoreID, ProductID,
       ROUND(AVG(UnitsSold) * 3, 2) AS SuggestedReorderPoint
FROM Inventory
GROUP BY StoreID, ProductID;

/* Promotion effect */
SELECT ProductID,
       AVG(CASE WHEN HolidayPromotion = 1 THEN UnitsSold ELSE NULL END) AS PromoSales,
       AVG(CASE WHEN HolidayPromotion = 0 THEN UnitsSold ELSE NULL END) AS RegularSales
FROM Inventory
GROUP BY ProductID;

