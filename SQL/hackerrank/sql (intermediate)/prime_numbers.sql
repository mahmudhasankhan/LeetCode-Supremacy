CREATE TABLE PRIMES(Number INT)


DECLARE @max int
DECLARE @inner int
DECLARE @prime bit

SET @max = 2

WHILE @max <=1000
BEGIN
    SET @inner = 2
    SET @prime = 1
    WHILE @inner < @max
        BEGIN
        IF @max % @inner = 0
            SET @prime = 0
        SET @inner = @inner + 1
        END
    IF @prime = 1
        INSERT INTO PRIMES(NUMBER) VALUES(@max)        
    SET @max = @max + 1  
END

SELECT STRING_AGG(Number, '&') FROM PRIMES
