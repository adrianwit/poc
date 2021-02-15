SELECT COUNT(DISTINCT id)  FROM poc.repeated_v1 t
WHERE EXISTS(SELECT 1 FROM poc.repeated_idx_x3 i
             WHERE value IN (3) AND i.batch_id = t.batch_id
             AND  i.records & 1 << t.seq != 0)
SELECT COUNT(DISTINCT id)  FROM poc.repeated
WHERE  EXISTS(SELECT 1 FROM UNNEST(x3) x  WHERE x IN (3))
