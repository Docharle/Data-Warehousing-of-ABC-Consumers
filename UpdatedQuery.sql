--Query to create Date Dimension
CREATE TABLE dbo.DateDim(
 DateKey int Not NULL IDENTITY(1,1),
 FullDate date NOT NULL,
 DayOfWeek int Not NULL,
 DaysName  varchar(10) NOT NULL,
 DayOfYear int NOT NULL,
 WeekNumberYYYY int Not NULL,
 MonthsName Char(3) Not NULL,
 MonthsNumber int Not NULL,
 Quarters int Not NULL,
 Years int Not NULL
 CONSTRAINT PK_DateDim PRIMARY KEY (DateKey)
) ON [PRIMARY];

CREATE TABLE dbo.ProductDim(
 ProductKey int Not NULL IDENTITY(1,1),
 SKU varchar(10) Not NULL,
 ProductName varchar(60) Not NULL,
 Descriptions varchar(60) Not NULL,
 Condition varchar(10) Not NULL,
 ProductType varchar(10) Not NULL,
 Tags varchar(10) Not NULL,
 CostPrice float Not NULL,
 RetailPrice float Not NULL,
 DateCreatedAt date Not NULL,
 DateDiscontinuedAt date Not NULL,
 IsActive int Not NULL
 CONSTRAINT PK_ProductDim PRIMARY KEY (ProductKey)
) ON [PRIMARY];

ALTER TABLE dbo.ProductDim ADD
CONSTRAINT UC_SKU UNIQUE(SKU)

CREATE TABLE dbo.SupplierDim(
 SupplierKey int Not NULL IDENTITY(1,1),
 SupplierName varchar(60) Not NULL,
 Descriptions varchar(60) Not NULL,
 Phone varchar(50) Not NULL,
 Email varchar(50) Not NULL,
 Fax varchar(50) Not NULL,
 CONSTRAINT PK_SupplierDim PRIMARY KEY (SupplierKey)
) ON [PRIMARY];

CREATE TABLE dbo.LocationDim(
 LocationKey int Not NULL IDENTITY(1,1),
 FirstLineAddress varchar(60) Not NULL,
 PostCode varchar(10) Not NULL,
 City varchar(50) Not NULL,
 States varchar(50) Not NULL,
 CountryID varchar(50) Not NULL
 CONSTRAINT PK_LocationDim PRIMARY KEY (LocationKey)
) ON [PRIMARY];

--Query to create Sent Purchase order table
CREATE TABLE dbo.SentPurOrderFact(
 DateKey int NOT NULL, 
 ProductKey int NOT NULL,
 SupplierKey  int NOT NULL,
 LocationKey  int NOT NULL,
 QuantityOrdered Bigint NOT NULL
);
--Query to create the Foreign Keys
ALTER TABLE dbo.SentPurOrderFact ADD
CONSTRAINT FK_DateKey FOREIGN KEY (DateKey) REFERENCES
dbo.DateDim (DateKey),
CONSTRAINT FK_ProductKey FOREIGN KEY (ProductKey) REFERENCES
dbo.ProductDim (ProductKey),
CONSTRAINT FK_SupplierKey FOREIGN KEY (SupplierKey) REFERENCES
dbo.SupplierDim (SupplierKey),
CONSTRAINT FK_LocationKey FOREIGN KEY (LocationKey) REFERENCES
dbo.LocationDim (LocationKey);
GO

CREATE TABLE dbo.ReceivedPurOrderFact(
 PurchaseOrderCode Varchar(30) Not NULL,
 DateKey int NOT NULL, 
 ProductKey int NOT NULL,
 SupplierKey  int NOT NULL,
 LocationKey  int NOT NULL,
 DestinationOutlet   Varchar(30) NOT NULL,
 QuantityOrdered Bigint NOT NULL,
 QuantityReceived Bigint NOT NULL
 CONSTRAINT PK_ReceivedPurOrder PRIMARY KEY (PurchaseOrderCode)
) ON [PRIMARY];

ALTER TABLE dbo.ReceivedPurOrderFact ADD
CONSTRAINT FK_DateKeyRec FOREIGN KEY (DateKey) REFERENCES
dbo.DateDim (DateKey),
CONSTRAINT FK_ProductKeyRec FOREIGN KEY (ProductKey) REFERENCES
dbo.ProductDim (ProductKey),
CONSTRAINT FK_SupplierKeyRec FOREIGN KEY (SupplierKey) REFERENCES
dbo.SupplierDim (SupplierKey),
CONSTRAINT FK_LocationKeyRec FOREIGN KEY (LocationKey) REFERENCES
dbo.LocationDim (LocationKey);
GO

CREATE TABLE dbo.StockLevelFact(
 DateKey int NOT NULL, 
 ProductKey int NOT NULL,
 SupplierKey  int NOT NULL,
 LocationKey  int NOT NULL,
 CurrentStockLevel Bigint NOT NULL
 CONSTRAINT FK_DateKeyLevel FOREIGN KEY (DateKey) REFERENCES
dbo.DateDim (DateKey),
CONSTRAINT FK_ProductKeyLevel FOREIGN KEY (ProductKey) REFERENCES
dbo.ProductDim (ProductKey),
CONSTRAINT FK_SupplierKeyLevel FOREIGN KEY (SupplierKey) REFERENCES
dbo.SupplierDim (SupplierKey),
CONSTRAINT FK_LocationKeyLevel FOREIGN KEY (LocationKey) REFERENCES
dbo.LocationDim (LocationKey)
) ON [PRIMARY];


--Query to alter the Product Dimension table
ALTER TABLE ProductDim
 ALTER COLUMN Tags varchar(40) Not NULL
GO

ALTER TABLE[dbo].[DateDim]
DROP COLUMN WeekNumberMM

DELETE FROM[dbo].[LocationDim]
 



