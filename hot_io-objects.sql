SELECT
    `io`.`OBJECT_NAME` AS `Table Name`,
    `io`.`INDEX_NAME` AS `Index Name`,
    `io`.`COUNT_READ` AS `Read Count`,
    (`io`.`SUM_TIMER_READ` / 1e9) AS `Read Time (seconds)`,
    `io`.`COUNT_WRITE` AS `Write Count`,
    (`io`.`SUM_TIMER_WRITE` / 1e9) AS `Write Time (seconds)`
FROM
    (SELECT
         `OBJECT_NAME` AS `OBJECT_NAME`,
         `INDEX_NAME`,
         `SUM_TIMER_READ`,
         `COUNT_READ`,
         `SUM_TIMER_WRITE`,
         `COUNT_WRITE`
     FROM
         `performance_schema`.`table_io_waits_summary_by_index_usage`
     UNION
     SELECT
         `OBJECT_NAME` AS `OBJECT_NAME`,
         NULL AS `INDEX_NAME`,
         `SUM_TIMER_READ`,
         `COUNT_READ`,
         `SUM_TIMER_WRITE`,
         `COUNT_WRITE`
     FROM
         `performance_schema`.`table_io_waits_summary_by_table`
    ) AS `io`
WHERE
            `io`.`COUNT_READ` + `io`.`COUNT_WRITE` > 0
ORDER BY
    (`io`.`SUM_TIMER_READ` + `io`.`SUM_TIMER_WRITE`) DESC
LIMIT 10;
