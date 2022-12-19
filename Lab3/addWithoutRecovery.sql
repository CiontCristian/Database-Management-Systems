
CREATE OR ALTER PROCEDURE addWithoutRecovery @Gname varchar(15), @Gtype varchar(10), @Gprice tinyint, @Gage_restriction tinyint,
											@IEname varchar(30), @IEage int, @IEbirthday varchar(10), @IEsex char, @IEspeciality int, @IEdep int,
											@hours int, @workingHours int
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
			if dbo.checkNumber(@hours) = 0
			BEGIN
				RAISERROR('Game price cant be negative',14,1)
			END
			if dbo.checkNumber(@workingHours) = 0
			BEGIN
				RAISERROR('Game price cant be negative',14,1)
			END
			
			INSERT INTO Game(Gname, Gtype, Gprice, Gage_restriction) VALUES (@Gname, @GType, @Gprice, @Gage_restriction)
			PRINT 'Insert Game Successfull'

			INSERT INTO InternalEmployee(IEname, IEage, IEbirthday, IEsex, IEspeciality, IEdep) VALUES (@IEname, @IEage, @IEbirthday, @IEsex, @IEspeciality, @IEdep)
			PRINT 'Insert IE Successfull'

			declare @IEid int
			set @IEid = (select IDENT_CURRENT('InternalEmployee'))

			declare @Gid int
			set @Gid = (select IDENT_CURRENT('Game'))

			INSERT INTO IEWorks_On VALUES (@IEid, @Gid, @hours, @workingHours)
			PRINT 'Insert GameIE Successfull'

			COMMIT TRAN 
			PRINT 'Transaction Commited'
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			SELECT 'Transaction rollbacked'
			print ERROR_MESSAGE()
		END CATCH
	END
GO

execute addWithoutRecovery 'JocFain', 'Action',5,6,'Timotei',13,'2020/01/01','F',1,1,60,17
execute addWithoutRecovery 'Esuare', 'Lalala',5,6,'Timotei',13,'','F',1,1,60,17

select * from Game
select * from InternalEmployee
select * from IEWorks_On

delete from Game where Gname='JocFain'
delete from Game where Gname='Esuare'
delete from InternalEmployee where IEname='Timotei'
delete from IEWorks_On