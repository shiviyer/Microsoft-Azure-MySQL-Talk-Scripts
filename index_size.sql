SELECT 
  table_schema AS `Database`,
  table_name AS `Table`,
  index_name AS `Index`,
  ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS `Size (MB)`
FROM information_schema.STATISTICS
JOIN information_schema.TABLES USING (table_schema, table_name)
GROUP BY table_schema, table_name, index_name
ORDER BY SUM(data_length + index_length) DESC;
