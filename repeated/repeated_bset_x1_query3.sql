SELECT COUNT(DISTINCT id)  FROM poc.repeated_v1 t
WHERE EXISTS(SELECT 1 FROM poc.repeated_idx_x1 i
             WHERE value IN (1) AND i.batch_id = t.batch_id
             AND  i.records & 1 << t.seq != 0)