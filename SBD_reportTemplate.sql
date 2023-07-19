USE yfSBD
GO


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (100000) 
td.[Id]
      ,CASE WHEN [RSId] = 3
		THEN 'HR'
		WHEN [RSId] = 2
		THEN 'SPED'
		WHEN [RSId] = 4
		THEN 'AR'
		WHEN [RSId] = 1
		THEN 'SR'
		ELSE 'Unknown'
	END [Record Series]
      ,[IsActiveDoc]
      ,[CampusId]
	  ,mc.CampusName
      ,[PersonDataId]
	  ,pd.LastName, pd.FirstName, pd.IdentificationNumber, pd.DateofBirth
      ,[AccountTemplateId]
	  ,ma.CatName [DocType]
      ,[BoxNumber]
      ,[OriginalDocumentName]
      ,[AccountIdMetaData]
      ,[DocIdMetaData]
      ,[PDFPageCount]
      ,[LastUpdatedDt]
      ,[DocumentSize]
  FROM [yfSBD].[dbo].[tDocDetails] (NOLOCK) td
  JOIN [yfSBD].[dbo].[mAccountTemplate] ma (NOLOCK)
  ON ma.[Id] = td.AccountTemplateId
  JOIN [yfSBD].[dbo].[tPersonData] pd (NOLOCK)
  ON pd.[Id] = td.PersonDataId
  JOIN [yfSBD].[dbo].[mCampus] mc (NOLOCK)
  ON mc.[Id] = td.CampusId
  WHERE 
  BoxNumber 
  LIKE 'SBDAR%'
  --LIKE 'SBDAR%'
  --OR BoxNumber  LIKE 'SBDHR%'
  --OR BoxNumber  LIKE 'SBDAR%'
  --AND 
  AND RSId = 4
  ORDER BY BoxNumber
  
