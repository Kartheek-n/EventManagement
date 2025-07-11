USE [Events]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateEvent]    Script Date: 7/11/2025 12:18:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_UpdateEvent]
@EventId int,
@EventName varchar(20),
@EventCode varchar(30),
@EventDate  Date,
@StartTime time,
@endTime time,
@Description varchar(max)
as begin
Update  Events set EventName=@EventName,EventCode=@EventCode,EventDate=@EventDate,StartTime=@StartTime,endTime=@endTime,Description=@Description
where EventId=@EventId
end
