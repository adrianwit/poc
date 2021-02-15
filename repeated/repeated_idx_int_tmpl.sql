    CREATE OR REPLACE TABLE poc.repeated_idx_int_tmpl (
        batch_id INT64,
        value INT64,
        records INT64
    ) CLUSTER BY value, batch_id;