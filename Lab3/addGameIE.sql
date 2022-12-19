
CREATE OR ALTER PROCEDURE addGameIE @hours int, @workingHours int
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRAN
		BEGIN TRY
			if dbo.checkNumber(@hours) = 0
			BEGIN
				RAISERROR('Game price cant be negative',14,1)
			END
			if dbo.checkNumber(@workingHours) = 0
			BEGIN
				RAISERROR('Game price cant be negative',14,1)
			END
			
			declare @IEid int
			set @IEid = (select IDENT_CURRENT('InternalEmployee'))

			declare @Gid int
			set @Gid = (select IDENT_CURRENT('Game'))
			
			INSERT INTO IEWorks_On VALUES (@IEid, @Gid, @hours, @workingHours)

			COMMIT TRAN
			SELECT 'Transaction committed'

		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			SELECT 'Transaction rollbacked'
			print ERROR_MESSAGE()
		END CATCH
	END
GO

select * from IEWorks_On