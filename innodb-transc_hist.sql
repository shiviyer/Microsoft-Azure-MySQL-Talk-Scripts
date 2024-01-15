SELECT 
  trx_id, 
  trx_state, 
  trx_started, 
  trx_requested_lock_id, 
  trx_wait_started, 
  trx_weight, 
  trx_mysql_thread_id, 
  trx_query 
FROM information_schema.innodb_trx 
ORDER BY trx_started;
