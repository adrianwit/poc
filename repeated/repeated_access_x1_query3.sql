    SELECT COUNT(1)  FROM poc.repeated  WHERE  EXISTS(SELECT 1 FROM UNNEST(x1) x  WHERE x IN (1))
