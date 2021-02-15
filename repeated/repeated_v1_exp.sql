EXPORT DATA OPTIONS(
uri='gs://myproject_bitsy/repeated/*.json.gz',
format='JSON',
compression='GZIP') AS
SELECT batch_id, seq, x1, x2, x3, x4, x5, x6  FROM `poc.repeated_v1`
ORDER BY 1, 2