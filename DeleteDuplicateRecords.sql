USE [USH]
GO
/****** Object:  StoredProcedure [dbo].[DeleteDuplicateRecords]    Script Date: 11/30/2024 11:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[DeleteDuplicateRecords]
AS
BEGIN
    -- Start a transaction
    BEGIN TRANSACTION;

    -- Delete duplicates in the Records table
    WITH CTE_Records AS (
        SELECT 
            S_NO,
            ROW_NUMBER() OVER (PARTITION BY S_NO ORDER BY S_NO) AS RowNum
        FROM USH.[dbo].[Records]
    )
    DELETE FROM USH.[dbo].[Records]
    WHERE S_NO IN (
        SELECT S_NO 
        FROM CTE_Records
        WHERE RowNum > 1
    );

    -- Delete duplicates in the MEDICINES table
    WITH CTE_Medicines AS (
        SELECT 
            S_NO,
            ROW_NUMBER() OVER (PARTITION BY S_NO ORDER BY S_NO) AS RowNum
        FROM USH.[dbo].[MEDICINES]
    )
    DELETE FROM USH.[dbo].[MEDICINES]
    WHERE S_NO IN (
        SELECT S_NO 
        FROM CTE_Medicines
        WHERE RowNum > 1
    );

    -- Delete duplicates in the OP table
    WITH CTE_OP AS (
        SELECT 
            S_NO,
            ROW_NUMBER() OVER (PARTITION BY S_NO ORDER BY S_NO) AS RowNum
        FROM USH.[dbo].[OP]
    )
    DELETE FROM USH.[dbo].[OP]
    WHERE S_NO IN (
        SELECT S_NO 
        FROM CTE_OP
        WHERE RowNum > 1
    );

    -- Delete duplicates in the PROCEDURE_ table
    WITH CTE_Procedure AS (
        SELECT 
            S_NO,
            ROW_NUMBER() OVER (PARTITION BY S_NO ORDER BY S_NO) AS RowNum
        FROM USH.[dbo].[PROCEDURE_]
    )
    DELETE FROM USH.[dbo].[PROCEDURE_]
    WHERE S_NO IN (
        SELECT S_NO 
        FROM CTE_Procedure
        WHERE RowNum > 1
    );

    -- Commit the transaction
    COMMIT TRANSACTION;
END;
