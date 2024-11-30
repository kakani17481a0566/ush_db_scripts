USE [USH]
GO
/****** Object:  StoredProcedure [dbo].[VerifyAndDeleteDuplicateRecords]    Script Date: 11/30/2024 11:13:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[VerifyAndDeleteDuplicateRecords]
AS
BEGIN
    -- Step 1: Display duplicate records in the Records table
    SELECT S_NO, COUNT(*) AS DuplicateCount
    FROM USH.[dbo].[Records]
    GROUP BY S_NO
    HAVING COUNT(*) > 1;

    -- Step 2: Display duplicate records in the MEDICINES table
    SELECT S_NO, COUNT(*) AS DuplicateCount
    FROM USH.[dbo].[MEDICINES]
    GROUP BY S_NO
    HAVING COUNT(*) > 1;

    -- Step 3: Display duplicate records in the OP table
    SELECT S_NO, COUNT(*) AS DuplicateCount
    FROM USH.[dbo].[OP]
    GROUP BY S_NO
    HAVING COUNT(*) > 1;

    -- Step 4: Display duplicate records in the PROCEDURE_ table
    SELECT S_NO, COUNT(*) AS DuplicateCount
    FROM USH.[dbo].[PROCEDURE_]
    GROUP BY S_NO
    HAVING COUNT(*) > 1;

    -- Note to the user
    PRINT 'Verify the above duplicates. To delete them, uncomment the DELETE section and execute the procedure again.';
END;
