USE [AlphaSpringWH_PBI]
GO

/****** Object:  View [dbo].[V_ALPHA_SPRING_WH_PBI]    Script Date: 7/31/2023 3:23:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[V_ALPHA_SPRING_WH_PBI] as
(select [dbo].[PBI_ASLoad_SecCostingOpenPostion].*,
cast (left (CONCAT(dbo.[PBI_ASLoad_SecCostingOpenPostion].Security_ID,[dbo].[PBI_ASLoad_SecCostingOpenPostion].Client), 100 )as nchar) as  SEC_CLIENT,
[ASPReports_Custom].[BBG_Costing].Premium costing_premium,
[ASPReports_Custom].[BBG_Costing].CorpAction Costing_CorpAction,
[ASPReports_Custom].[BBG_Costing].[BBGCOSTINGID] Costing_BBGCOSTINGID,
[ASPReports_Custom].[BBG_Costing].[UniqueID] Costing_UniqueID,
[ASPReports_Custom].[BBG_Costing].[Application] Costing_Application,
[ASPReports_Custom].[BBG_Costing].[ClassName] Costing_ClassName,
[ASPReports_Custom].[BBG_Costing].[KeyValue] Costing_KeyValue,
[ASPReports_Custom].[BBG_Costing].[Security_Master_and_Packaged] Costing_Secruity_Master_and_Packaged
      ,[ASPReports_Custom].[BBG_Costing].[AccessFee] Costing_AccessFee
      ,[ASPReports_Custom].[BBG_Costing].[Intraday_Pricing] Costing_Intraday_Pricing
      ,[ASPReports_Custom].[BBG_Costing].[End_of_Day_Pricing] Costing_End_of_Day_Pricing
      
      ,[ASPReports_Custom].[BBG_Costing].[MonthYear] Costing_MonthYear
      ,[ASPReports_Custom].[BBG_Costing].[Source] Costing_Source
      ,[ASPReports_Custom].[BBG_Costing].[DateModified] Costing_DateModified
      ,[ASPReports_Custom].[BBG_Costing].[DateCreated] Costing_DateCreated
      ,[ASPReports_Custom].[BBG_Costing].[LastModifiedBy] Costing_LastModifiedBy,
	  [ASPReports_Custom].[BBG_FixedCosting].[BBGCOSTINGID] FixedCosting_BBGCOSTINGID
      ,[ASPReports_Custom].[BBG_FixedCosting].[UniqueID] FixedCosting_UniqueID
      ,[ASPReports_Custom].[BBG_FixedCosting].[Application] FixedCosting_Application
      ,[ASPReports_Custom].[BBG_FixedCosting].[FixedCost] FixedCosting_FixedCost
      ,[ASPReports_Custom].[BBG_FixedCosting].[MonthYear] FixedCosting_MonthYear
      ,[ASPReports_Custom].[BBG_FixedCosting].[Source] FixedCosting_Source
      ,[ASPReports_Custom].[BBG_FixedCosting].[DateModified] FixedCosting_DateModified
      ,[ASPReports_Custom].[BBG_FixedCosting].[DateCreated] FixedCosting_DateCreated
      ,[ASPReports_Custom].[BBG_FixedCosting].[LastModifiedBy] FixedCosting_LastModifiedBy,
	  [AlphaSpringWH_PBI].[ASPReports_Custom].[Costing_Client_Location].[BBGCOSTINGID] Client_Costing_BBGCOSTINGID
      ,[AlphaSpringWH_PBI].[ASPReports_Custom].[Costing_Client_Location].[UniqueID] Client_Costing_UniqueID
      ,[AlphaSpringWH_PBI].[ASPReports_Custom].[Costing_Client_Location].[Application] Client_Costing_Application
      ,[AlphaSpringWH_PBI].[ASPReports_Custom].[Costing_Client_Location].[Client] Client_Costing_Client
      ,[AlphaSpringWH_PBI].[ASPReports_Custom].[Costing_Client_Location].[Portfolio] Client_Costing_Portfolio
      ,[AlphaSpringWH_PBI].[ASPReports_Custom].[Costing_Client_Location].[Location] Client_Costing_Location
      ,[AlphaSpringWH_PBI].[ASPReports_Custom].[Costing_Client_Location].[DateModified] Client_Costing_DateModified
      ,[AlphaSpringWH_PBI].[ASPReports_Custom].[Costing_Client_Location].[DateCreated] Client_Costing_DateCreated
      ,[AlphaSpringWH_PBI].[ASPReports_Custom].[Costing_Client_Location].[LastModifiedBy] Client_Costing_LastModifiedBy


from [dbo].[PBI_ASLoad_SecCostingOpenPostion]
left join [ASPReports_Custom].[BBG_Costing]
on [dbo].[PBI_ASLoad_SecCostingOpenPostion].month_year = [ASPReports_Custom].[BBG_Costing].MonthYear and [dbo].[PBI_ASLoad_SecCostingOpenPostion].Key_Value = [ASPReports_Custom].[BBG_Costing].KeyValue
left join [ASPReports_Custom].[BBG_FixedCosting]
on  [dbo].[PBI_ASLoad_SecCostingOpenPostion].month_year = [ASPReports_Custom].[BBG_FixedCosting].MonthYear and [dbo].[PBI_ASLoad_SecCostingOpenPostion].Application =[ASPReports_Custom].[BBG_FixedCosting].Application
left join [AlphaSpringWH_PBI].[ASPReports_Custom].[Costing_Client_Location] 
on [dbo].[PBI_ASLoad_SecCostingOpenPostion].Fund_Name = [AlphaSpringWH_PBI].[ASPReports_Custom].[Costing_Client_Location].Portfolio)
GO


select COUNT(*) from [dbo].[V_ALPHA_SPRING_WH_PBI]

select COUNT(*) from [dbo].[PBI_ASLoad_SecCostingOpenPostion]