USE [USH]
GO
/****** Object:  StoredProcedure [dbo].[SetFeesToNullIfTypeIsNA]    Script Date: 11/30/2024 11:11:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SetFeesToNullIfTypeIsNA]
AS
BEGIN
    -- Start a transaction to ensure data integrity
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Update OP table: Set OP_FEE to NULL where OP_TYPE is 'N/A'
        UPDATE USH.[dbo].[OP]
        SET OP_FEE = NULL
        WHERE OP_TYPE = 'N/A';

        -- Update PROCEDURE_ table: Set PROCEDURE_FEE to NULL where PROCEDURE_TYPE is 'N/A'
        UPDATE USH.[dbo].[PROCEDURE_]
        SET PROCEDURE_FEE = NULL
        WHERE PROCEDURE_TYPE = 'N/A';

        -- Update MEDICINES table: Set MEDICINES_FEE to NULL where MEDICINES_TYPE is 'N/A'
        UPDATE USH.[dbo].[MEDICINES]
        SET MEDICINES_FEE = NULL
        WHERE MEDICINES_TYPE = 'N/A';

        -- Update Records table: Set OP_FEE to NULL where OP_TYPE is 'N/A'
        UPDATE USH.[dbo].[Records]
        SET OP_FEE = NULL
        WHERE OP_TYPE = 'N/A';

        -- Update Records table: Set PROCEDURE_FEE to NULL where PROCEDURE_TYPE is 'N/A'
        UPDATE USH.[dbo].[Records]
        SET PROCEDURE_FEE = NULL
        WHERE PROCEDURE_TYPE = 'N/A';

        -- Update Records table: Set MEDICINES_FEE to NULL where MEDICINES_TYPE is 'N/A'
        UPDATE USH.[dbo].[Records]
        SET MEDICINES_FEE = NULL
        WHERE MEDICINES_TYPE = 'N/A';

        -- Commit the transaction if all updates are successful
        COMMIT TRANSACTION;

        PRINT 'Fees set to NULL where Type is N/A.';
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if any error occurs
        ROLLBACK TRANSACTION;

        -- Log or output error details for debugging
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        PRINT 'Error occurred: ' + @ErrorMessage;
        THROW; -- Re-throw the error for external handling
    END CATCH;
END;
