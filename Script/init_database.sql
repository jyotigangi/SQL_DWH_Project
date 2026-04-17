/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DWH' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

USE master;
GO
=============================================================
-- Drop and recreate the 'DataWarehouse' database
-----Checks whether the query inside returns any rows, looks in the system view sys.databases, which contains all databases on the SQL Server instance.SELECT 1 is just a simple way to test existence
-----ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
--Changes the database to single-user mode, meaning only one connection is allowed.
 --WITH ROLLBACK IMMEDIATE immediately disconnects all other users and rolls back any active transactions.
---This is often necessary because a database cannot be dropped while other users are connected to it.
--DROP DATABASE DataWarehouse; Permanently deletes the DataWarehouse database and all of its data.
--So overall, the script means:
--Check if DataWarehouse exists.
--Force everyone out of it.
--Delete it safely.
==========================================================================
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
