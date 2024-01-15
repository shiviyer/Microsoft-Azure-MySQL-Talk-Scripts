-- Top RW-locks causing contention
SELECT EVENT_NAME, COUNT_STAR, SUM_TIMER_WAIT
FROM performance_schema.events_waits_summary_global_by_event_name
WHERE EVENT_NAME LIKE 'wait/synch/rwlock/innodb/%'
ORDER BY SUM_TIMER_WAIT DESC
LIMIT 10;
