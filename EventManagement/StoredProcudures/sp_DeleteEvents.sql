USE [Events]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteEvent]    Script Date: 7/11/2025 12:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_DeleteEvent]
@EventId int
as begin
Delete Events
where EventId=@EventId
end