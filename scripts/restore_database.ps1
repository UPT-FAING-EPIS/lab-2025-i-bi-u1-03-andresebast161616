$connectionString = "Server=$env:AZURE_SQL_SERVER;Database=YourDatabase;User Id=$env:AZURE_SQL_ADMIN;Password=$env:AZURE_SQL_PASSWORD;"


$sqlScript = @"
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
    DROP TABLE dbo.Orders;
GO

-- Ahora puedes proceder a restaurar la base de datos o insertar los datos deseados
-- Por ejemplo, crear la tabla y restaurar o insertar datos:

CREATE TABLE dbo.Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATETIME,
    CustomerID INT
    -- otras columnas
);

-- Inserción de datos (si es necesario)
-- INSERT INTO dbo.Orders (OrderID, OrderDate, CustomerID) VALUES (1, '2024-01-01', 101);
GO
"@

Invoke-Sqlcmd -ConnectionString $connectionString -Query $sqlScript
