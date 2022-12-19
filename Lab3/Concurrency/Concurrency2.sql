--DIRTY READS
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRAN
	SELECT * FROM Speciality
	waitfor delay '00:00:05'
	SELECT * FROM Speciality
COMMIT TRAN

--SOLVE DIRTY READS
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRAN
	SELECT * FROM Speciality
	waitfor delay '00:00:05'
	SELECT * FROM Speciality
COMMIT TRAN
--------------------------------------------------------------------------------
--NON REPEATABLE READS
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRAN
	SELECT * FROM Speciality
	waitfor delay '00:00:05'
	SELECT * FROM Speciality
COMMIT TRAN

--SOLVE NON REPEATABLE READS
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN
	SELECT * FROM Speciality
	waitfor delay '00:00:05'
	SELECT * FROM Speciality
COMMIT TRAN
--------------------------------------------------------------------------------
--PHANTOM READS
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN
	SELECT * FROM Speciality
	waitfor delay '00:00:05'
	SELECT * FROM Speciality
COMMIT TRAN

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRAN
	SELECT * FROM Speciality
	waitfor delay '00:00:05'
	SELECT * FROM Speciality
COMMIT TRAN
---------------------------------------------------------------------------------
--DEADLOCK
SET DEADLOCK_PRIORITY HIGH
BEGIN TRAN
	UPDATE Client SET Cname='Ceao2'
	WHERE Cid = 1
	waitfor delay '00:00:05'
	UPDATE Speciality SET SPtype='deadlock2'
	WHERE SPid = 2
COMMIT TRAN
