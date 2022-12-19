
CREATE OR ALTER PROCEDURE addWithRecovery @Gname varchar(15), @Gtype varchar(10), @Gprice tinyint, @Gage_restriction tinyint,
											@IEname varchar(30), @IEage int, @IEbirthday varchar(10), @IEsex char, @IEspeciality int, @IEdep int,
											@hours int, @workingHours int
AS
BEGIN
	SET NOCOUNT ON

	declare @game int
	execute @game = dbo.addGame @Gname, @Gtype, @Gprice, @Gage_restriction
	if(@game <> 1)
	begin
		declare @ie int
		execute @ie = dbo.addIE @IEname, @IEage, @IEbirthday, @IEsex, @IEspeciality, @IEdep
		if(@ie <> 1)
		begin
			execute dbo.addGameIE @hours, @workingHours
		end
	end
END

execute addWithRecovery 'JocFain', 'Action',5,6,'Timotei',13,'2020/01/01','F',1,1,60,17
execute addWithRecovery 'Esuare', 'Lalala',5,6,'Timotei',13,'2020/01/01','F',101,1,60,17

select * from Game
select * from InternalEmployee
select * from IEWorks_On

delete from Game where Gname='JocFain'
delete from Game where Gname='Esuare'
delete from InternalEmployee where IEname='Timotei'
delete from IEWorks_On