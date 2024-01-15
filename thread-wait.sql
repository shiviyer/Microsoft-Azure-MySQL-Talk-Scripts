SELECT 
  p.THREAD_ID, 
  p.PROCESSLIST_ID,
  e.EVENT_NAME, 
  e.COUNT_STAR AS event_count, 
  e.SUM_TIMER_WAIT/1000000 AS total_wait_time_ms, 
  e.AVG_TIMER_WAIT/1000000 AS avg_wait_time_ms
FROM performance_schema.events_waits_summary_by_thread_by_event_name e
JOIN performance_schema.threads p ON e.THREAD_ID = p.THREAD_ID
WHERE p.TYPE = 'FOREGROUND'
ORDER BY total_wait_time_ms DESC;
