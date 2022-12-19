

CREATE OR ALTER FUNCTION checkString(@something varchar(50))
RETURNS INT
AS
BEGIN
	IF len(@something) = 0 or ISNUMERIC(@something) = 1
	BEGIN
		RETURN 0
	END

	RETURN 1
END
GO

CREATE OR ALTER FUNCTION checkNumber(@number tinyint)
RETURNS INT
AS
BEGIN
	IF @number <= 0 or ISNUMERIC(@number) = 0
	BEGIN
		RETURN 0
	END

	RETURN 1
END
GO

CREATE OR ALTER FUNCTION checkDate(@datee datetime)
RETURNS INT
AS
BEGIN
	IF ISDATE(@datee) = 0
	BEGIN
		RETURN 0
	END

	RETURN 1
END
GO

PRINT dbo.checkString('12')
PRINT dbo.checkNumber('aaa')
PRINT dbo.checkDate('2020/08/13')