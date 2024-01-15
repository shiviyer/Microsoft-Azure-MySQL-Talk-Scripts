SELECT 
    SCHEMA_NAME,
    DIGEST_TEXT AS query,
    COUNT_STAR AS execution_count,
    SUM_TIMER_WAIT/1000000 AS total_latency_ms,
    AVG_TIMER_WAIT/1000000 AS avg_latency_ms,
    MIN_TIMER_WAIT/1000000 AS min_latency_ms,
    MAX_TIMER_WAIT/1000000 AS max_latency_ms
FROM performance_schema.events_statements_summary_by_digest
WHERE SCHEMA_NAME IS NOT NULL
ORDER BY avg_latency_ms DESC;
