CREATE TABLE dbo.DateKeyLookUp(
FullDate date NOT NULL PRIMARY KEY,
DateKey int NOT NULL )

--Query to create the LocationKey Lookup table
CREATE TABLE dbo.LocationKeyLookUp(
FirstLineAddress varchar(60) NOT NULL PRIMARY KEY,
LocationKey int NOT NULL
)

--Query to create the ProductKey Lookup table
CREATE TABLE dbo.ProductKeyLookUp(
SKU varchar(10) NOT NULL PRIMARY KEY,
ProductName varchar(60) NOT NULL,
ProductKey int NOT NULL
)

CREATE TABLE dbo.SupplierKeyLookUp(
SupplierName varchar(60) NOT NULL PRIMARY KEY,
SupplierKey int NOT NULL
)



