SELECT COUNT(1)  FROM poc.repeated, UNNEST(x1) x WHERE x IN (1)
