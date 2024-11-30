CREATE TABLE [dbo].[Records] (
    S_NO INT NOT NULL PRIMARY KEY, -- Sequential number (Primary Key)
    DATE DATETIME NULL,            -- Timestamp
    NAME NVARCHAR(100) NULL,       -- Patient name
    OLD_NEW NVARCHAR(10) NULL,     -- Old or new patient indicator
    How_you_find_us NVARCHAR(50) NULL, -- Source of patient referral
    AGE FLOAT NULL,                -- Age of the patient
    PHONE_NUMBER FLOAT NULL,       -- Contact number
    ADDRESS NVARCHAR(255) NULL,    -- Patient address
    OP_FEE FLOAT NULL,             -- Fee for OP services
    OP_TYPE NVARCHAR(50) NULL,     -- Type of OP service
    PROCEDURE_FEE FLOAT NULL,      -- Fee for procedure
    PROCEDURE_TYPE NVARCHAR(100) NULL, -- Type of procedure
    MEDICINES_FEE FLOAT NULL,      -- Fee for medicines
    MEDICINES_TYPE NVARCHAR(100) NULL, -- Type of medicine
    Location NVARCHAR(100) NULL    -- Patient location
);
