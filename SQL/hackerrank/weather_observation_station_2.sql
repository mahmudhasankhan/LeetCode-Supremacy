SELECT 
    CAST(ROUND(SUM(LAT_N), 2) as decimal(10, 2)),
    CAST(ROUND(SUM(LONG_W), 2) as decimal(10,2))
FROM
    STATION;
