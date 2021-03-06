
-- Selection From Different Tables

SELECT * FROM tbl_Continents
SELECT * FROM tbl_Countries
SELECT * FROM tbl_ProductList
SELECT * FROM tbl_PHInv
SELECT * FROM tbl_ProductionLog
SELECT * FROM tbl_GDTransactionLog
SELECT * FROM tbl_Warehouses
SELECT * FROM tbl_Zones


-- Example Procedure For Stocking of Items

ALTER PROCEDURE [dbo].[pcd_PHStockItm1]
AS  
declare @productID int
declare @productName varchar(30)
declare @whcounter int

set @whcounter = 1
set @productID = 1
set @productName = (SELECT ProductName from tbl_ProductList where productCode = @productID)


	WHILE (@whcounter <= (SELECT COUNT(whID) from tbl_Warehouses))
	BEGIN
		WHILE ((SELECT COUNT(ProductName) FROM tbl_PHInv WHERE ProductName = @productName AND whID = @whcounter) < 50)
		BEGIN
			   INSERT INTO tbl_PHInv 
	           VALUES     ( @productName,  
	                        @whcounter)
		END
	set @whcounter += 1
	END

  --Example Procedure For Running Multiple Stock Runs

CREATE PROCEDURE pcd_RefillPHStock
AS  

EXEC pcd_PHStockItm1
EXEC pcd_PHStockItm2
EXEC pcd_PHStockItm3
EXEC pcd_PHStockItm4
EXEC pcd_PHStockItm5
EXEC pcd_PHStockItm6
EXEC pcd_PHStockItm7
EXEC pcd_PHStockItm8
EXEC pcd_PHStockItm9
EXEC pcd_PHStockItm10

  -- Procedure for Increasing Stock of Apple TVs when Stock < 150 In a Given Warehouse

EXEC pcd_PHStockItm1

  


  -- Trigger for Transaction Logging

create trigger trg_CustomerTrsLogger
on tbl_CustomerInv
after insert as
    declare @sNo bigint
    declare @customerID bigint
    declare @price money
	declare @country int
    declare @itemId varchar(30)
	declare @warehouse int
	declare @gdID int

    set @sNo = (SELECT TOP 1 sNo FROM tbl_CustomerInv ORDER BY sNo DESC)
    set @itemId = (SELECT TOP 1 ProductName FROM tbl_CustomerInv ORDER BY sNo DESC)
    set @customerID = (SELECT TOP 1 customerID FROM tbl_CustomerInv ORDER BY sNo DESC)

	set @warehouse = (select whID from tbl_GDistributors where gdID = @gdID)
	set @country = (select countryID from tbl_Warehouses where whID = @warehouse)
    set @price = ((select trsPrice from tbl_StoreTransactionLog where sNo = @sNo) + ((select trsPrice from tbl_StoreTransactionLog where sNo = @sNo)*0.8))


    insert into tbl_CustomerTransactionLog values(@sNo, @customerID, @price, getdate());




  -- Trigger For Inventory Deletion

create trigger trg_GDInvClear
on tbl_SDInv
after insert as
    declare @sNo bigint

    set @sNo = (SELECT TOP 1 sNo FROM tbl_SDInv ORDER BY sNo DESC)

	delete from tbl_GDInv where sNo = @sNo


  --Views Examples
SELECT * FROM FullTransactionLog
SELECT * FROM GDTransactionLog
SELECT * FROM CustomerTransactionLog


 --Inserting A New Transaction And Logging With Triggers

 select * from tbl_StoreInv where storeID =1

 insert into tbl_CustomerInv values (1034906, 'Apple TV 4k', 1000006)

 select * from tbl_CustomerTransactionLog where customerID = 1000006



  -- Sample Join Statement

select * from tbl_Stores
JOIN tbl_Zones ON tbl_Stores.zoneID = tbl_Zones.zoneID
JOIN tbl_CPartners ON tbl_Zones.cpID = tbl_CPartners.cpID
JOIN tbl_SDistributors ON tbl_CPartners.sdID = tbl_SDistributors.sdID
JOIN tbl_GDistributors ON tbl_SDistributors.gdID = tbl_GDistributors.gdID
JOIN tbl_Warehouses ON tbl_GDistributors.whID = tbl_Warehouses.whID