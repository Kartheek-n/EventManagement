USE [Events]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEventsById]    Script Date: 7/11/2025 12:18:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_GetEventsById]
@EventId int 
as begin 
select * from Events 
where EventId=@EventId
end