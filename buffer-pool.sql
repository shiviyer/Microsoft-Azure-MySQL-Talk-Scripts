SELECT
    EVENT_NAME,
    COUNT_ALLOC AS Allocations,
    COUNT_FREE AS Free_Operations,
    SUM_NUMBER_OF_BYTES_ALLOC AS Bytes_Allocated,
    SUM_NUMBER_OF_BYTES_FREE AS Bytes_Freed
FROM performance_schema.memory_summary_global_by_event_name
WHERE memory_summary_global_by_event_name.EVENT_NAME LIKE 'memory/innodb/buf%'; 
