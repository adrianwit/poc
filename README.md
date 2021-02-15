### Data bitset indexing


Bitsy rule:

```yaml
when:
  prefix: /repeated/
  suffix: .gz
dest:
  URL: gs://myproject_bqtail/repeated/$TimePath/$fragment/data-$UUID.json
  TableRoot: repeated_idx_
batchField: batch_id
sequenceField: seq
allowQuotedNumbers: true
recordsField: records
indexingFields:
  - Name: x1
    Type: int
  - Name: x2
    Type: int
  - Name: x3
    Type: int
  - Name: x4
    Type: int
  - Name: x5
    Type: int
  - Name: x6
    Type: int
onDone: delete
```

BqTail ingestion rule:

```yaml
Async: true
When:
  Prefix: /repeated/
  Suffix: .json

Batch:
  Window:
    DurationInSec: 120
Dest:
  Table: poc.${tableName}
  Pattern: /repeated/\d+/\d+/\d+/\d+/int/([^\/]+)/.+
  Parameters:
    - Name: tableName
      Expression: $1
  MaxBadRecords: 1
  Transient:
    Dataset: temp
    Template: poc.repeated_idx_int_tmpl
OnSuccess:
  - Action: delete
```