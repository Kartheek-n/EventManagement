USE [Events]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEvents]    Script Date: 7/11/2025 12:18:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_GetEvents]
as begin 
select * from Events 
end