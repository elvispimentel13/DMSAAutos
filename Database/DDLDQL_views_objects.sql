USE de_db_american_autos
GO
CREATE VIEW Vehicles.vw_Inventory
WITH ENCRYPTION
AS
SELECT  Inventory.InventoryID,
        Dealers.DealerID, 
        Dealers.DealerName, 
        Makes.MakeID, 
        Makes.MakeName,
        Inventory.ModelID, 
        Models.ModelName, 
        Inventory.ColorID, 
        Colors.Color,
        Inventory.AvailabilityID, 
        [Availability].AvailabilityDescription,
        COALESCE(Inventory.DisplayName, CONCAT(MakeName, ' ', ModelName, ' ', VehicleYear, ' (', Color, ')')) as DisplayName,
        Inventory.TransmissionType,
        Inventory.FuelType,
        Inventory.PassengerCapatity,
        Inventory.VIN,
        Inventory.Price,
        Inventory.Odometer,
        Inventory.OdometerUnit,
        Inventory.VehicleYear,
        Inventory.Condition,
        Inventory.[Description],
        Inventory.InventoryDate
FROM    Vehicles.Inventory
        INNER JOIN Branch.Dealers
        ON Inventory.DealerID = Dealers.DealerID
        INNER JOIN Vehicles.Models
        ON Inventory.ModelID = Models.ModelID
        INNER JOIN Vehicles.Makes
        ON Models.MakeID = Makes.MakeID
        INNER JOIN Vehicles.Colors
        ON Colors.ColorID = Inventory.ColorID
        INNER JOIN Vehicles.Availability
        ON [Availability].AvailabilityID = Inventory.AvailabilityID
WHERE   Inventory.InventoryStatus = 1
GO
CREATE VIEW Vehicles.vw_Sales
WITH ENCRYPTION
AS
SELECT  Sales.SaleID,
        Sales.InventoryID,
        Sales.SaleDate,
        Inventory.DealerID,
        Inventory.DealerName,
        Sales.AgentID,
        CONCAT(Agents.FirstName, ' ', Agents.Lastname) AgentFullName,
        Agents.Email AgentEmail,
        Agents.InternalCode AgentCode,
        Sales.CustomerID,
        CONCAT(Customers.FirstName, ' ', Customers.Lastname) CustomerFullName,
        Customers.Email CustomerEmail,
        Inventory.DisplayName InventoryDescription,
        Inventory.VIN,
        Inventory.Price
FROM    Vehicles.Sales
        INNER JOIN Vehicles.vw_Inventory as Inventory
        ON Sales.InventoryID = Inventory.InventoryID
        INNER JOIN Entity.Agents 
        ON Sales.AgentID = Agents.AgentID
        INNER JOIN Entity.Customers
        ON Sales.CustomerID = Customers.CustomerID
WHERE   Sales.SaleStatus = 1        
