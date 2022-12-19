select * from Speciality
select * from Client
insert into Client VALUES ('Cristi',21,'Romania')

--DIRTY READS
BEGIN TRAN
	UPDATE Speciality SET SPtype='cracracra'
	WHERE SPid = 3
	waitfor delay '00:00:05'
ROLLBACK TRAN

--NON REPEATABLE READS
BEGIN TRAN
	waitfor delay '00:00:05'
	UPDATE Speciality SET SPtype='aaaa'
	WHERE SPid = 3
COMMIT TRAN

--PHANTOM READS
BEGIN TRAN
	waitfor delay '00:00:05'
	INSERT INTO Speciality VALUES ('test',1000)
COMMIT TRAN

--DEADLOCK
BEGIN TRAN
	UPDATE Speciality SET SPtype='Programmer'
	WHERE SPid = 2
	waitfor delay '00:00:05'
	UPDATE Client SET Cname='Ceao'
	WHERE Cid = 1
COMMIT TRAN

select * from Speciality
select * from Client
