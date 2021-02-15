  CREATE OR REPLACE  TABLE `poc.repeated_v1`
  CLUSTER BY batch_id
  AS SELECT
  CAST(ROW_NUMBER() OVER() /  64 AS INT64)  AS batch_id,
  MOD(ROW_NUMBER() OVER(), 64) AS seq,
  t.*
  FROM  `poc.repeated` t
