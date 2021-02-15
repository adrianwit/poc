CREATE OR REPLACE TABLE `poc.repeated` AS
WITH t AS (
    SELECT
        seq,
        GENERATE_ARRAY(seed, seed + (step * 200), step) AS x1,
        GENERATE_ARRAY(seed, seed+200) AS x2,
        GENERATE_ARRAY(seed, seed + (step * 100), step) AS x3,
        GENERATE_ARRAY(seed , seed  +100) AS x4,
        GENERATE_ARRAY(seed, seed + (step * 5), step) AS x5,
        GENERATE_ARRAY(MOD(seed, 4), MOD(seed, 4)+5)  AS x6
    FROM (
          SELECT
                  1 + CAST(5000 * RAND()  AS INT64) AS seed,
                  2 + CAST(100 * RAND()  AS INT64) AS step,
                  seq
          FROM  UNNEST(GENERATE_ARRAY(1, 1000000)) seq
             )
)
SELECT t.* EXCEPT(seq),
       (mul * 1000000) + seq  AS id,
FROM t
         CROSS JOIN UNNEST(GENERATE_ARRAY(0, 999)) mul