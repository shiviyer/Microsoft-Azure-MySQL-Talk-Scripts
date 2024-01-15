SELECT 
  object_schema AS 'Database',
  object_name AS 'Table',
  index_name AS 'Index',
  COUNT_FETCH AS 'Read Requests',
  COUNT_INSERT AS 'Write Requests'
FROM performance_schema.table_io_waits_summary_by_index_usage
WHERE COUNT_FETCH = 0
ORDER BY object_schema, object_name, index_name;
