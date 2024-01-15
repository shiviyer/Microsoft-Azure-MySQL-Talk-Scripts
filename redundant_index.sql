SELECT 
  table_schema,
  table_name,
  GROUP_CONCAT(column_name ORDER BY seq_in_index) AS 'Index Columns'
FROM information_schema.statistics
GROUP BY table_schema, table_name, index_name
HAVING COUNT(*) > 1
ORDER BY table_schema, table_name;
