DECLARE @i INT
SET @i = 1

WHILE @i < 21
BEGIN
    select replicate('* ', @i);
    SET @i = @i + 1
END
