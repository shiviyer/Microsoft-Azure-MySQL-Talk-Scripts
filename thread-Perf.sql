SELECT 
    p.THREAD_ID, 
    p.PROCESSLIST_COMMAND, 
    p.PROCESSLIST_STATE, 
    es.SUM_TIMER_WAIT/1000000 AS total_wait_time_ms,
    es.COUNT_STAR AS total_executions
FROM performance_schema.threads p
JOIN performance_schema.events_statements_summary_by_thread_by_event_name es 
    ON p.THREAD_ID = es.THREAD_ID
WHERE p.TYPE = 'FOREGROUND';
