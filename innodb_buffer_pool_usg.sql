SELECT
    VARIABLE_NAME,
    VARIABLE_VALUE
FROM performance_schema.global_status
WHERE VARIABLE_NAME IN ('INNODB_BUFFER_POOL_READ_REQUESTS',
                        'INNODB_BUFFER_POOL_READS',
                        'INNODB_BUFFER_POOL_WAIT_FREE',
                        'INNODB_BUFFER_POOL_WRITE_REQUESTS');
