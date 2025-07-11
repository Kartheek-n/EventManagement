USE [Events]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsetEvent]    Script Date: 7/11/2025 12:18:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_InsetEvent]
@EventName varchar(20),
@EventCode varchar(30),
@EventDate  Date,
@StartTime time,
@endTime time,
@Description varchar(max)
as begin
insert into Events (EventName,EventCode,EventDate,StartTime,endTime,Description)
values(@EventName,@EventCode,@EventDate,@StartTime,@endTime,@Description)
end
