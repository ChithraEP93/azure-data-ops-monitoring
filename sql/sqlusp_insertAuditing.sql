CREATE PROCEDURE dbo.usp_insertAuditing
(
    @PipelineName VARCHAR(100),
    @FileName VARCHAR(100),
    @Status VARCHAR(20),
    @RowsProcessed INT,
    @ExecutionDuration INT = NULL,
    @ErrorMessage VARCHAR(500) = NULL
)
AS
BEGIN

    INSERT INTO Audit_Log
    (
        PipelineName,
        FileName,
        LoadDate,
        Status,
        RowsProcessed,
        ExecutionDuration,
        ErrorMessage
    )
    VALUES
    (
        @PipelineName,
        @FileName,
        GETDATE(),
        @Status,
        @RowsProcessed,
        @ExecutionDuration,
        @ErrorMessage
    );

END;
GO