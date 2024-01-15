-- Threads with the most wait time
SELECT THREAD_ID, EVENT_NAME, SUM_TIMER_WAIT
FROM performance_schema.events_waits_summary_by_thread_by_event_name
WHERE EVENT_NAME LIKE 'wait/synch/%'
ORDER BY SUM_TIMER_WAIT DESC
LIMIT 10;
