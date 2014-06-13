USE [HotelManage]
GO
/****** Object:  StoredProcedure [dbo].[pro_search]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc   [dbo].[pro_search]
@typename  varchar(20)
as
declare  @typeid int
select  @typeid=typeid  from roomtype
where  typename=@typename
select   * from  room 
where  typeid=@typeid and  state='空闲'

if(@@rowcount>0)
   print  '有，空房间'
else
   print  '没有空房间'


GO
/****** Object:  StoredProcedure [dbo].[pro_search1]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc   [dbo].[pro_search1]
@typename  varchar(20),
@state  varchar(8)
as
declare  @typeid int
select  @typeid=typeid  from roomtype
where  typename=@typename
select   * from  room 
where  typeid=@typeid and  state=@state

if(@@rowcount>0)
   print  '有，空房间'
else
   print  '没有空房间'


GO
/****** Object:  StoredProcedure [dbo].[proc_XXX]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc  [dbo].[proc_XXX]
@typeName  varchar(20)

as
select  *  from roomtype  where  typename=@typename

GO
/****** Object:  StoredProcedure [dbo].[usp_AddCustomer]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--region [dbo].[usp_InsertCustomer]

CREATE PROCEDURE [dbo].[usp_AddCustomer]
	@RoomId nvarchar(50),
	@Name nvarchar(50),
	@Sex nvarchar(50),
	@IdentifyNumber nvarchar(50),
	@Phone nvarchar(50),
	@Charge int,
	@CheckinDate DateTime,
	@CheckoutDate datetime,
	@UserNum int,
	@isAddBed nvarchar(50),
	@isPayOff nvarchar(50)
AS



INSERT  [dbo].[Customer] (
	[RoomId],
	[Name],
	[Sex],
	[IdentifyNumber],
	[Phone],
	[Charge],
	[CheckinDate],
	[CheckoutDate],
	[UserNum],
	[isAddBed],
	[isPayOff]

) VALUES (
	@RoomId,
	@Name,
	@Sex,
	@IdentifyNumber,
	@Phone,
	@Charge,
	@CheckinDate,
	@CheckoutDate,
	@UserNum,
	@isAddBed,
	@isPayOff
)


--endregion




GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteRoom]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteRoom]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   haifeng.zhang using CodeSmith 3.2.6.887
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteRoom]
-- Date Generated: 2007年9月15日
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteRoom]
	@RoomID int
AS

SET NOCOUNT ON

DELETE FROM [dbo].[Room]
WHERE
	[RoomID] = @RoomID

--endregion


GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteRoomType]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--region [dbo].[usp_DeleteRoomType]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   haifeng.zhang using CodeSmith 3.2.6.887
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_DeleteRoomType]
-- Date Generated: 2007年9月15日
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteRoomType]
	@TypeID int
AS

SET NOCOUNT ON

DELETE FROM [dbo].[RoomType]
WHERE
	[TypeID] = @TypeID

--endregion


GO
/****** Object:  StoredProcedure [dbo].[usp_DeletRoom]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_DeletRoom]
@Number varchar(20)
as
delete from room where number=@Number

GO
/****** Object:  StoredProcedure [dbo].[usp_DeletRoomType]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_DeletRoomType]
@TypeName nvarchar(20)
as
delete  from RoomType where TypeName=@TypeName

GO
/****** Object:  StoredProcedure [dbo].[usp_InsertRoom]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--region [dbo].[usp_InsertRoom]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   haifeng.zhang using CodeSmith 3.2.6.887
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertRoom]
-- Date Generated: 2007年9月15日
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertRoom]
	@Number nvarchar(50),
	@TypeID int,
	@BedNumber int,
	@Description nvarchar(50),
	@State nvarchar(50),
	@GuestNumber int
AS

SET NOCOUNT ON

INSERT INTO [dbo].[Room] (
	[Number],
	[TypeID],
	[BedNumber],
	[Description],
	[State],
	[GuestNumber]
) VALUES (
	@Number,
	@TypeID,
	@BedNumber,
	@Description,
	@State,
	@GuestNumber
)

Select @@IDENTITY

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertRoomType]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--region [dbo].[usp_InsertRoomType]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   haifeng.zhang using CodeSmith 3.2.6.887
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_InsertRoomType]
-- Date Generated: 2007年9月15日
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertRoomType]
	@TypeName nvarchar(50),
	@TypePrice money,
	@AddBedPrice money,
	@IsAddBed nchar(10),
	@Remark nvarchar(50)
AS

SET NOCOUNT ON

INSERT INTO [dbo].[RoomType] (
	[TypeName],
	[TypePrice],
	[AddBedPrice],
	[IsAddBed],
	[Remark]
) VALUES (
	@TypeName,
	@TypePrice,
	@AddBedPrice,
	@IsAddBed,
	@Remark
)

SELECT  @@IDENTITY

--endregion




GO
/****** Object:  StoredProcedure [dbo].[usp_InsetRoom]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_InsetRoom]
@Number varchar(20),@TypeID int,@BedNumber int,@Description varchar(200),@State varchar(20),@GuestNumber int
as
insert room values(@Number,@TypeID,@BedNumber,@Description,@State,@GuestNumber)

GO
/****** Object:  StoredProcedure [dbo].[usp_InsetRoomType]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_InsetRoomType]
@TypeName nvarchar(20),@TypePrice money,@AddBedPrice money,@IsAddBed nvarchar(2),@Remark nvarchar(200)
as
insert RoomType values (@TypeName,@TypePrice,@AddBedPrice,@IsAddBed,@Remark)

GO
/****** Object:  StoredProcedure [dbo].[usp_SelectInfoByTypeName]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[usp_SelectInfoByTypeName]
@TypeName varchar(20)
as
select * from roomType where typeName like '%'+@TypeName+'%'

GO
/****** Object:  StoredProcedure [dbo].[usp_SelectRoom]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--region [dbo].[usp_SelectRoom]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   haifeng.zhang using CodeSmith 3.2.6.887
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectRoom]
-- Date Generated: 2007年9月15日
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectRoom]
	@RoomID int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[RoomID],
	[Number],
	[TypeID],
	[BedNumber],
	[Description],
	[State],
	[GuestNumber]
FROM
	[dbo].[Room]
WHERE
	[RoomID] = @RoomID

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectRoomByRoomNumber]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_SelectRoomByRoomNumber]
@RoomNumber varchar(20)
as
select * from room where number like  '%'+@RoomNumber+'%'

GO
/****** Object:  StoredProcedure [dbo].[usp_SelectRoomIDByNumber]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--region [dbo].[usp_SelectRoom]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   haifeng.zhang using CodeSmith 3.2.6.887
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectRoom]
-- Date Generated: 2007年9月15日
------------------------------------------------------------------------------------------------------------------------

create PROCEDURE [dbo].[usp_SelectRoomIDByNumber]
	@Number nvarchar(50)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[RoomID]
FROM
	[dbo].[Room]
WHERE
	[Number] = @Number

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectRoomsAll]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--region [dbo].[usp_SelectRoomsAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   haifeng.zhang using CodeSmith 3.2.6.887
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectRoomsAll]
-- Date Generated: 2007年9月15日
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectRoomsAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[RoomID],
	[Number],
	[TypeID],
	[BedNumber],
	[Description],
	[State],
	[GuestNumber]
FROM
	[dbo].[Room]

--endregion




GO
/****** Object:  StoredProcedure [dbo].[usp_SelectRoomsByRoomNumber]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




--region [dbo].[usp_SelectRoomsAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   haifeng.zhang using CodeSmith 3.2.6.887
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectRoomsAll]
-- Date Generated: 2007年9月15日
------------------------------------------------------------------------------------------------------------------------

create PROCEDURE [dbo].[usp_SelectRoomsByRoomNumber]
	@Number nvarchar(50)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[RoomID],
	[Number],
	[TypeID],
	[BedNumber],
	[Description],
	[State],
	[GuestNumber]
FROM
	[dbo].[Room]
WHERE 
    [Number]=@Number;

--endregion





GO
/****** Object:  StoredProcedure [dbo].[usp_SelectRoomType]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--region [dbo].[usp_SelectRoomType]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   haifeng.zhang using CodeSmith 3.2.6.887
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectRoomType]
-- Date Generated: 2007年9月15日
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectRoomType]
	@TypeID int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[TypeID],
	[TypeName],
	[TypePrice],
	[AddBedPrice],
	[IsAddBed],
	[Remark]
FROM
	[dbo].[RoomType]
WHERE
	[TypeID] = @TypeID

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectRoomTypeIDByTypeName]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--region [dbo].[usp_SelectRoomType]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   haifeng.zhang using CodeSmith 3.2.6.887
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectRoomType]
-- Date Generated: 2007年9月15日
------------------------------------------------------------------------------------------------------------------------

create PROCEDURE [dbo].[usp_SelectRoomTypeIDByTypeName]
	@TypeName nvarchar(50)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[TypeID]
FROM
	[dbo].[RoomType]
WHERE
	[TypeName] = @TypeName

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectRoomTypeListByTypeName]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--region [dbo].[usp_SelectRoomType]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   haifeng.zhang using CodeSmith 3.2.6.887
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectRoomType]
-- Date Generated: 2007年9月15日
------------------------------------------------------------------------------------------------------------------------

Create PROCEDURE [dbo].[usp_SelectRoomTypeListByTypeName]
	@TypeName nvarchar(50)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[TypeID],
	[TypeName],
	[TypePrice],
	[AddBedPrice],
	[IsAddBed],
	[Remark]
FROM
	[dbo].[RoomType]
WHERE
	[TypeName] = @TypeName

--endregion




GO
/****** Object:  StoredProcedure [dbo].[usp_SelectRoomTypes]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_SelectRoomTypes]
as
select * from roomtype

GO
/****** Object:  StoredProcedure [dbo].[usp_SelectRoomTypesAll]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--region [dbo].[usp_SelectRoomTypesAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   haifeng.zhang using CodeSmith 3.2.6.887
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectRoomTypesAll]
-- Date Generated: 2007年9月15日
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectRoomTypesAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[TypeID],
	[TypeName],
	[TypePrice],
	[AddBedPrice],
	[IsAddBed],
    [Remark]
FROM
	[dbo].[RoomType]

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectTypeIDByTypeName]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_SelectTypeIDByTypeName]
@TypeName nvarchar(20)
as
select TypeID from RoomType where TypeName=@TypeName

GO
/****** Object:  StoredProcedure [dbo].[usp_SelectTypeIDByTypeNames]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_SelectTypeIDByTypeNames]
@TypeName varchar(20)
as
select typeid from roomtype where typename=@TypeName

GO
/****** Object:  StoredProcedure [dbo].[usp_SelectTypeNameByTypeID]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_SelectTypeNameByTypeID]
@TypeID int
as
select typename from roomtype where typeid=@TypeID

GO
/****** Object:  StoredProcedure [dbo].[usp_SelectTypePriceByTypeID]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_SelectTypePriceByTypeID]
@TypeID int
as
select typeprice from roomtype where typeid=@TypeID

GO
/****** Object:  StoredProcedure [dbo].[usp_SelectTypePriceByTypeName]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--region [dbo].[usp_SelectRoomTypesAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   haifeng.zhang using CodeSmith 3.2.6.887
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_SelectRoomTypesAll]
-- Date Generated: 2007年9月15日
------------------------------------------------------------------------------------------------------------------------

create PROCEDURE [dbo].[usp_SelectTypePriceByTypeName]
    @TypeName nvarchar(50)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[TypePrice]
FROM
	[dbo].[RoomType]
WHERE
    [TypeName] = @TypeName
--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_SelectTypePricesByTypeName]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_SelectTypePricesByTypeName]
@TypeName varchar(20)
as
select typeprice from roomtype where typename=@TypeName

GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateRoom]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--region [dbo].[usp_UpdateRoom]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   haifeng.zhang using CodeSmith 3.2.6.887
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_UpdateRoom]
-- Date Generated: 2007年9月15日
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateRoom]
	@RoomID int,
	@Number nvarchar(50),
	@TypeID int,
	@BedNumber int,
	@Description nvarchar(50),
	@State nvarchar(50),
	@GuestNumber int
AS

SET NOCOUNT ON

UPDATE [dbo].[Room] SET
	[Number] = @Number,
	[TypeID] = @TypeID,
	[BedNumber] = @BedNumber,
	[Description] = @Description,
	[State] = @State,
	[GuestNumber] = @GuestNumber
WHERE
	[RoomID] = @RoomID

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateRoomType]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--region [dbo].[usp_UpdateRoomType]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   haifeng.zhang using CodeSmith 3.2.6.887
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[usp_UpdateRoomType]
-- Date Generated: 2007年9月15日
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateRoomType]
	@TypeID int,
	@TypeName nvarchar(50),
	@TypePrice money,
	@AddBedPrice money,
	@IsAddBed nchar(10),
	@Remark nvarchar(255)
AS

SET NOCOUNT ON

UPDATE [dbo].[RoomType] SET
	[TypeName] = @TypeName,
	[TypePrice] = @TypePrice,
	[AddBedPrice] = @AddBedPrice,
	[IsAddBed] = @IsAddBed,
	[Remark]=@Remark
WHERE
	[TypeID] = @TypeID

--endregion



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdatRoom]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_UpdatRoom]
@RoomID int,@Number varchar(20),@TypeID int,@BedNumber int,@Description varchar(200),@State varchar(20),@GuestNumber int
as
update room set number=@Number,typeid=@TypeID,bednumber=@BedNumber,description=@Description,state=@State,guestnumber=@GuestNumber where roomid=@RoomID

GO
/****** Object:  StoredProcedure [dbo].[usp_UpdatRoomType]    Script Date: 2014/4/27 18:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_UpdatRoomType]
@TypeID int,@TypeName nvarchar(20),@TypePrice money,@AddBedPrice money,@IsAddBed nvarchar(2),@Remark nvarchar(200)
as
update RoomType set TypeName=@TypeName,TypePrice=@TypePrice,AddBedPrice=@AddBedPrice,IsAddBed=@IsAddBed,Remark=@Remark where TypeID=@TypeID

GO
