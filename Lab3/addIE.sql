
CREATE OR ALTER PROCEDURE addIE @IEname varchar(30), @IEage int, @IEbirthday varchar(10), @IEsex char, @IEspeciality int, @IEdep int
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRAN
		BEGIN TRY
			if dbo.checkString(@IEname) = 0
			BEGIN
				RAISERROR('Game name is null or numeric',14,1)
			END
			if dbo.checkString(@IEbirthday) = 0
			BEGIN
				RAISERROR('Game type is null or numeric',14,1)
			END
			if dbo.checkNumber(@IEage) = 0
			BEGIN
				RAISERROR('Game price cant be negative',14,1)
			END
			

			INSERT INTO InternalEmployee(IEname, IEage, IEbirthday, IEsex, IEspeciality, IEdep) VALUES (@IEname, @IEage, @IEbirthday, @IEsex, @IEspeciality, @IEdep)

			COMMIT TRAN
			SELECT 'Transaction committed'

		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			SELECT 'Transaction rollbacked'
			print ERROR_MESSAGE()
			RETURN 1
		END CATCH
		RETURN 0
	END
GO

EXECUTE addIE 'Cristi',21,'1998/08/13','M',1,1
EXECUTE addIE 'Cristi',21,'1998/08/13','M',100,1

select * from InternalDepartment
select * from Speciality
select * from InternalEmployee