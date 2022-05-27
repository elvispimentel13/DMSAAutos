/*  --SINCE IS AN AZURE DB, THERE IS NO CREATION, BUT YOU CAN CREATE DB WITH:
    USE master;
    GO
    CREATE DATABASE de_db_american_autos
    COLLATE SQL_Latin1_General_CP1_CI_AS                                --DEFAUL COLLATION
    WITH TRUSTWORTHY OFF, DB_CHAINING OFF;                              --NO IMPERSONATION ALLOWANCE TO ACCESS MODULES IN THIS DB AND NO CROSS DB ALLOWANCE
    GO
*/

USE de_db_american_autos;                                               --ENSURE OBJECTS ARE CREATED ON DESIRED DB
GO
CREATE SCHEMA Branch
GO
/*
DATA:      DealerName+Address+others.
USE CASES: To store data related to dealers. Branch schema holds data depending on business needs, could store dealers, work shops, etc.
*/
CREATE TABLE Branch.Dealers
(
    DealerID int IDENTITY(1,1) NOT NULL,
    DealerName varchar(50) NOT NULL
        CONSTRAINT AK_Branch_Dealers_DealerName UNIQUE (DealerName),
    DealerAddress varchar(50) NULL,
    DealerDescription varchar(150) NULL,
    DealerStatus bit NOT NULL
        CONSTRAINT DF_Branch_Dealers_DealerStatus DEFAULT(1),                   
    ModifiedDate datetime NULL,                                         
    CreatedDate datetime NOT NULL
        CONSTRAINT DF_Branch_Dealers_CreatedDate DEFAULT (GETDATE()),  
    CONSTRAINT PK_Branch_Dealers_DealerID
               PRIMARY KEY CLUSTERED (DealerID)
               WITH (IGNORE_DUP_KEY = ON)                               
)
ON [PRIMARY];
GO
CREATE SCHEMA Vehicles;                                                 --LETS CREATE A SCHEMA FOR VEHICLES DATA
GO
/*
DATA:      Makes general catalog, Tesla, Honda, Toyota, Hyundai, Kia, etc.
RELATIONS: Vehicles.Models to match each model with vehicle maker.
USE CASES: Relateions to store matching data with sales, inventory, general lists, etc.
*/
CREATE TABLE Vehicles.Makes
(
    MakeID int IDENTITY(1,1) NOT NULL,
    MakeName varchar(75) NOT NULL
        CONSTRAINT AK_Vehicles_Makes_MakeName UNIQUE (MakeName),        --SET TO UNIQUE, CANNOT EXIST MULTIPLE VEHICLE MAKERS WITH SAME NAME
    MakeStatus bit NOT NULL
        CONSTRAINT DF_Vehicles_Makes_MakeStatus DEFAULT(1),             --STATUS BY DEFAULT IS ACTIVE
    ModifiedDate datetime NULL,                                         --IN CASE IS MODIFIED, NEED TO SET DATE OF MODIFICATION
    CreatedDate datetime NOT NULL
        CONSTRAINT DF_Vehicles_Makes_CreatedDate DEFAULT (GETDATE()),  --DEFAULT CREATION DATE, NOT NEED TO SET IN DML
    CONSTRAINT PK_Vehicles_Makes_MakesID
               PRIMARY KEY CLUSTERED (MakeID)                           --PRIMARY KEY CLUSTERED IS BY DEFAULT
               WITH (IGNORE_DUP_KEY = ON)                               --TO IGNORE DUPLICATES IN MIGRATION 
)
ON [PRIMARY];                                                           --SET TO PRIMARY FILE GROUP (DEFAULT)
GO
/*
DATA:      Models for each vehicle maker, Accord [Honda], Model 2 [Tesla], K5 [Kia], Elantra [Hyundai], etc.
RELATIONS: Vehicles.Makes, Vehicles.Inventory.
USE CASES: To match a vehicle description and other values, if you want to list a new item, you would need to match Make+Model correctly.
*/
CREATE TABLE Vehicles.Models
(
    ModelID int IDENTITY(1,1) NOT NULL,
    MakeID int NOT NULL
        CONSTRAINT FK_Vehicles_Models_Vehicles_Makes_MakeID REFERENCES Vehicles.Makes(MakeID),            
    ModelName varchar(120) NOT NULL
        CONSTRAINT AK_Vehicles_Models_ModelIDModelName UNIQUE (ModelID, ModelName),
    ModelStatus bit NOT NULL
        CONSTRAINT DF_Vehicles_Models_ModelStatus DEFAULT(1),                   
    ModifiedDate datetime NULL,                                         
    CreatedDate datetime NOT NULL
        CONSTRAINT DF_Vehicles_Models_CreatedDate DEFAULT (GETDATE()),  
    CONSTRAINT PK_Vehicles_Models_ModelID
               PRIMARY KEY CLUSTERED (ModelID)                          
               WITH (IGNORE_DUP_KEY = ON)                               
)
ON [PRIMARY];
GO
/*
DATA:      Store default colors as literal with ID reference, example: Black, White, Blue, etc.
RELATIONS: Related to Vehicle.Inventory to match an inventory car item with its color.
USE CASES: Make+Model+Year+Color and so on. Its use is inferred by its name and stored data.
*/
CREATE TABLE Vehicles.Colors
(
    ColorID int IDENTITY(1,1) NOT NULL,
    Color varchar(50) NOT NULL
        CONSTRAINT AK_Vehicles_Colors_Color UNIQUE (Color),
    ColorStatus bit NOT NULL
        CONSTRAINT DF_Vehicles_Colors_ColorStatus DEFAULT(1),                   
    ModifiedDate datetime NULL,                                         
    CreatedDate datetime NOT NULL
        CONSTRAINT DF_Vehicles_Colors_CreatedDate DEFAULT (GETDATE()),  
    CONSTRAINT PK_Vehicles_Colors_ColorID
               PRIMARY KEY CLUSTERED (ColorID)                          
               WITH (IGNORE_DUP_KEY = ON)                               
)
ON [PRIMARY];
GO
/*
DATA:      Status of an item in inventory, for example: Available, Sold, Maintenance, Auction, 
RELATIONS: Vehicles.Inventory
USE CASES: When a vehicle is sold, needs to be changed on inventory with its related value from this table.
*/
CREATE TABLE Vehicles.Availability
(
    AvailabilityID int IDENTITY(1,1) NOT NULL,
    AvailabilityDescription varchar(50) NOT NULL
        CONSTRAINT AK_Vehicles_Availability_AvailabilityDescription UNIQUE (AvailabilityDescription),
    AvailabilityStatus bit NOT NULL
        CONSTRAINT DF_Vehicles_Availability_AvailabilityStatus DEFAULT(1),                   
    ModifiedDate datetime NULL,                                         
    CreatedDate datetime NOT NULL
        CONSTRAINT DF_Vehicles_Availability_CreatedDate DEFAULT (GETDATE()), 
    CONSTRAINT PK_Vehicles_Availability_AvailabilityID 
               PRIMARY KEY CLUSTERED (AvailabilityID)
               WITH (IGNORE_DUP_KEY = ON)
)
ON [PRIMARY];
GO
/*
DATA:      Can hold inventory items with specific data: Make+Model+Color+Year+Odometer+FuelType+Transmission+Capacity+VIN+Price + [Availability, condition: DEFAULT 'NEW'], others.
RELATIONS: Vehicles.Sales, when you sold a vehicle, needs to be marked in inventory as sold and create a new sale in related table.
USE CASES: To store all new vehicles added to inventory, match the status of Availability table. 
           If status is maintenance, available, auction or another business rule, cant or can be showed, sold or another action desired.
COMMENTS:  VIN max size is 20 letting 3 free spaces for future use, a VIN number consist of 16 or 17 characters.
           FuelType, TransmissionType: can be references from other configuration tables, for faster delivery on this assignment, could be null.
           OdometerUnit is set to 'Miles' be default, condition is se to 'New' (can be referenced from configuration table too).

*/
CREATE TABLE Vehicles.Inventory
(
    InventoryID int IDENTITY(1,1) NOT NULL,
    DealerID int NOT NULL 
        CONSTRAINT FK_Branch_Dealers_DealerID REFERENCES Branch.Dealers(DealerID),
    ModelID int NOT NULL
        CONSTRAINT FK_Vehicles_Inventory_Vehicles_Models_ModelID REFERENCES Vehicles.Models(ModelID),            
    ColorID int NOT NULL
        CONSTRAINT FK_Vehicles_Inventory_Vehicles_Colors_ColorID REFERENCES Vehicles.Colors(ColorID),
    AvailabilityID int NOT NULL
        CONSTRAINT FK_Vehicles_Inventory_Vehicles_Availability_AvailabilityID REFERENCES Vehicles.Availability(AvailabilityID),
    DisplayName varchar(75) NULL,
    TransmissionType varchar(25) NULL,
    FuelType varchar(50) NULL,
    PassengerCapatity int NULL,
    VIN varchar(20) NULL,
    Price decimal(10,2) NOT NULL,
    Odometer int NOT NULL, 
    OdometerUnit varchar(15) NOT NULL
        CONSTRAINT DF_Vehicles_Inventory_OdometerUnit DEFAULT('Miles'),
    VehicleYear int NOT NULL,
    Condition varchar(25) NOT NULL
        CONSTRAINT DF_Vehicles_Inventory_Condition DEFAULT('New'),
    [Description] varchar(150) NULL,
    InventoryDate datetime NOT NULL 
        CONSTRAINT DF_Vehicles_Inventory_InventoryDate DEFAULT (GETDATE()),  
    InventoryStatus bit NOT NULL
        CONSTRAINT DF_Vehicles_Inventory_InventoryStatus DEFAULT(1),                   
    ModifiedDate datetime NULL,                                         
    CreatedDate datetime NOT NULL
        CONSTRAINT DF_Vehicles_Inventory_CreatedDate DEFAULT (GETDATE()),  
    CONSTRAINT PK_Vehicles_Inventory_InventoryID
               PRIMARY KEY CLUSTERED (InventoryID)
               WITH (IGNORE_DUP_KEY = ON)                               
)
ON [PRIMARY];
GO
CREATE SCHEMA Entity;
GO
/*
DATA:      FirstName+Lastname+ID+Phone?+Mail+InternalCode(Generated)
RELATIONS: Vehicles.Sales
USE CASES: Used to store an agent.
COMMENTS:  Basic table just to feed agents info, in a most normalized db, you would need much more tables related to accomplish an agents data objects.
*/
CREATE TABLE Entity.Agents
(
    AgentID int NOT NULL IDENTITY(1,1),
    FirstName varchar(50) NOT NULL,
    Lastname varchar(50) NOT NULL,
    Phone char(10) NULL, 
    Email varchar(50) NULL,
    InternalCode char(20) NOT NULL
        CONSTRAINT AK_Entity_Agents_InternalCode UNIQUE (InternalCode),
    AgentStatus bit NOT NULL
        CONSTRAINT DF_Entity_Agents_AgentStatus DEFAULT(1),                   
    ModifiedDate datetime NULL,                                         
    CreatedDate datetime NOT NULL
        CONSTRAINT DF_Entity_Agents_CreatedDate DEFAULT (GETDATE()),  
    CONSTRAINT PK_Entity_Agents_AgentID
                PRIMARY KEY CLUSTERED(AgentID)
                WITH (IGNORE_DUP_KEY = ON)    
)
ON [PRIMARY];
GO
/*
DATA:      FirstName+Lastname+ID+Phone?+Mail+InternalCode(Generated)
RELATIONS: Vehicles.Sales
USE CASES: Used to store a Customer.
COMMENTS:  Basic table just to feed Customers info, in a most normalized db, you would need much more tables related to accomplish an customers data objects.
*/
CREATE TABLE Entity.Customers
(
    CustomerID int NOT NULL IDENTITY(1,1),
    FirstName varchar(50) NOT NULL,
    Lastname varchar(50) NOT NULL,
    Phone char(10) NULL, 
    Email varchar(50) NULL,
    CustomerCode char(20) NOT NULL
        CONSTRAINT AK_Entity_Customers_CustomerCode UNIQUE (CustomerCode),
    CustomerStatus bit NOT NULL
        CONSTRAINT DF_Entity_Customers_CustomerStatus DEFAULT(1),                   
    ModifiedDate datetime NULL,                                         
    CreatedDate datetime NOT NULL
        CONSTRAINT DF_Entity_Customers_CreatedDate DEFAULT (GETDATE()),  
    CONSTRAINT PK_Entity_Customers_CustomerID
                PRIMARY KEY CLUSTERED(CustomerID)
                WITH (IGNORE_DUP_KEY = ON)    
)
ON [PRIMARY];
GO
/*
DATA:      Sales by Inventory+Agent+Customer+SaleStatus
RELATIONS: Vehicles.Inventory, Entity.Customers, Entity.Agents
USE CASES: In case a sale is executed, need to mark the inventory listing as a sale and hold the registry in this table to populate another view in our app.
*/
CREATE TABLE Vehicles.Sales
(
    SaleID int IDENTITY(1,1) NOT NULL,
    InventoryID int NOT NULL
        CONSTRAINT FK_Vehicles_Sales_Vehicles_Inventory_InventoryID REFERENCES Vehicles.Inventory(InventoryID),
    AgentID int NOT NULL
        CONSTRAINT FK_Vehicle_Sales_Entity_Agents_AgentID REFERENCES Entity.Agents(AgentID),
    CustomerID int NOT NULL
        CONSTRAINT FK_Vehicles_Sales_CustomerID REFERENCES Entity.Customers(CustomerID),
    SaleDate datetime NOT NULL,
    SaleStatus bit NOT NULL
        CONSTRAINT DF_Vehicles_Sales_SaleStatus DEFAULT(1),                   
    ModifiedDate datetime NULL,                                         
    CreatedDate datetime NOT NULL
        CONSTRAINT DF_Vehicles_Sales_CreatedDate DEFAULT (GETDATE()),  
    CONSTRAINT PK_Vehicles_Sales_SaleID_InventoryID
               PRIMARY KEY CLUSTERED (SaleID, InventoryID)
               WITH (IGNORE_DUP_KEY = ON)                               
)
ON [PRIMARY];
GO

