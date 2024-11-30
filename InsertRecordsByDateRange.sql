USE [USH]
GO
/****** Object:  StoredProcedure [dbo].[InsertRecordsByDateRange]    Script Date: 11/30/2024 11:10:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertRecordsByDateRange]
    @start_date DATE, -- Input parameter for start date
    @end_date DATE    -- Input parameter for end date
AS
BEGIN
    -- Insert records for outpatient services into the OP table
    INSERT INTO OP (S_NO, DATE, OP_FEE, OP_TYPE)
    SELECT S_NO, DATE, OP_FEE, OP_TYPE
    FROM Records
    WHERE DATE >= @start_date AND DATE <= @end_date;

    -- Insert records for procedures into the PROCEDURE_ table
    INSERT INTO PROCEDURE_ (S_NO, DATE, PROCEDURE_FEE, PROCEDURE_TYPE)
    SELECT S_NO, DATE, PROCEDURE_FEE, PROCEDURE_TYPE
    FROM Records
    WHERE DATE >= @start_date AND DATE <= @end_date;

    -- Insert records for medicines into the MEDICINES table
    INSERT INTO MEDICINES (S_NO, DATE, MEDICINES_FEE, MEDICINES_TYPE)
    SELECT S_NO, DATE, MEDICINES_FEE, MEDICINES_TYPE
    FROM Records
    WHERE DATE >= @start_date AND DATE <= @end_date;
END;
