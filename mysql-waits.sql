SELECT 
    EVENT_NAME,
    COUNT_STAR AS `Total Waits`,
    SUM_TIMER_WAIT/1000000000000 AS `Total Wait Time in Sec`,
    MAX_TIMER_WAIT/1000000000000 AS `Max Wait Time in Sec`,
    AVG_TIMER_WAIT/1000000000000 AS `Avg Wait Time in Sec`
FROM 
    performance_schema.events_waits_summary_global_by_event_name
WHERE 
    COUNT_STAR > 0
ORDER BY 
    `Total Wait Time in Sec` DESC;
