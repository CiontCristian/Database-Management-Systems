
CREATE OR ALTER PROCEDURE addGame @Gname varchar(15), @Gtype varchar(10), @Gprice tinyint, @Gage_restriction tinyint
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRAN
		BEGIN TRY
			if dbo.checkString(@Gname) = 0
			BEGIN
				RAISERROR('Game name is null or numeric',14,1)
			END
			if dbo.checkString(@Gtype) = 0
			BEGIN
				RAISERROR('Game type is null or numeric',14,1)
			END
			if dbo.checkNumber(@Gprice) = 0
			BEGIN
				RAISERROR('Game price cant be negative',14,1)
			END
			if dbo.checkNumber(@Gage_restriction) = 0
			BEGIN
				RAISERROR('Game age restriction cant be negative',14,1)
			END

			INSERT INTO Game(Gname, Gtype, Gprice, Gage_restriction) VALUES (@Gname, @GType, @Gprice, @Gage_restriction)

			COMMIT TRAN
			SELECT 'Transaction committed'

		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			SELECT 'Game transaction rollbacked'
			print ERROR_MESSAGE()
			RETURN 1
		END CATCH
		RETURN 0
	END
GO

EXECUTE addGame 'Cristi','Cal',10,15
EXECUTE addGame '','Cal',12,13

select * from Game
delete from Game where Gid=10