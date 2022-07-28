/****** Script for SelectTopNRows command from SSMS  ******/
SELECT ID
      ,[Name] as 'Competitor Name'
      , CASE 
	  WHEN Sex = 'M' THEN 'MALE' ELSE 'FEMALE' END AS Sex
      ,CASE
	  WHEN Age < 18 THEN 'Under 18'
	  WHEN Age BETWEEN 18 AND 25 THEN '18 - 25'
	  WHEN Age BETWEEN 25 AND 30 THEN '25 - 30'
	  WHEN Age > 30 THEN 'Over 30' END AS [Age Group]
      ,[Height]
      ,[Weight]
      ,[Team]
      ,[NOC] AS 'Nation Code'
	  --,CHARINDEX(' ',Games)-1 AS 'EXAMPLE 1'
	  --,CHARINDEX(' ',REVERSE(Games))-1 AS 'EXAMPLE 2'
	  ,LEFT(Games,CHARINDEX(' ',Games)-1) AS 'Year'
	  --,RIGHT(Games,CHARINDEX(' ',REVERSE(Games))-1) AS 'Season'
      --,[Games]
     -- ,[Year]
      ,[Season]
      --,[City]
      ,[Sport]
      ,[Event]
      ,CASE
	  WHEN Medal = 'NA' THEN 'Not Registered' ELSE Medal END AS Medal
  FROM [Olympic Games].[dbo].[athlete_events$]
  WHERE RIGHT(Games,CHARINDEX(' ',REVERSE(Games))-1) = 'Summer'
 