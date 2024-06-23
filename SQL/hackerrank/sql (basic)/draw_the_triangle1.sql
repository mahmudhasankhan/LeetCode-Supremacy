DECLARE @i INT
SET @i = 20

WHILE @i > 0
BEGIN
    select replicate('* ', @i);
    SET @i = @i - 1
END
