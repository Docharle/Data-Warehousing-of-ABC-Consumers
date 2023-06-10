--Query to get stock orders sent Weekly
Select WeekNumberYYYY, ProductName, Sum(QuantityOrdered) TotalQuantityOrdered, Sum(QuantityReceived) TotalQuantityReceived
from ReceivedPurOrderFact AS RPO,
 DateDim AS DD,
 ProductDim AS PD
WHERE RPO.DateKey = DD.DateKey
And RPO.ProductKey = PD.ProductKey
GROUP BY WeekNumberYYYY, ProductName

--Query to get stock orders sent daily
SELECT FullDate, ProductName, QuantityOrdered
FROM SentPurOrderFact SPO,
 DateDim DD,
 ProductDim PD
WHERE SPO.DateKey = DD.DateKey
AND SPO.ProductKey = PD.ProductKey

--Query to get stock orders received daily.
SELECT FullDate, ProductName, QuantityOrdered, QuantityReceived
FROM ReceivedPurOrderFact AS FR,
 DateDim AS DD,
 ProductDim AS PD
WHERE FR.DateKey = DD.DateKey
AND FR.ProductKey = PD.ProductKey

--Query to get received stock orders by the week
SELECT WeekNumberYYYY, ProductName, Sum(QuantityOrdered) TotalQuantityOrdered, sum(QuantityReceived) TotalQuantityReceived
from ReceivedPurOrderFact AS RPO,
 DateDim AS DD,
 ProductDim AS PD
Where RPO.DateKey = DD.DateKey
And RPO.ProductKey = PD.ProductKey
group by WeekNumberYYYY, ProductName

--Query to get stock level analyzed by brand
SELECT ProductName, Brand, CurrentStockLevel
FROM StockLevelFact AS SL,
 DateDim AS DD,
 ProductDim AS PD
WHERE SL.DateKey = DD.DateKey
AND SL.ProductKey = PD.ProductKey

--Query to get received stock orders analyzed by supplier and month
Select MonthsName, Years, ProductName, SupplierName,
Sum(QuantityOrdered) TotalQuantityOrdered, sum(QuantityReceived) TotalQuantityReceived
from ReceivedPurOrderFact AS RPO,
 DateDim AS DD,
 ProductDim AS PD,
 SupplierDim AS SD
Where RPO.DateKey = DD.DateKey
And RPO.ProductKey = PD.ProductKey
And RPO.SupplierKey = SD.SupplierKey
group by MonthsName, Years, ProductName, SupplierName