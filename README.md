flink-mysql-cdc

1、如果拥有mysql-service ，在没有开启bin-log的情况下，请开启bin-log，然后执行mysql-demo.sql

```
[mysqld]
#flink cdc
server-id=1
log_bin=mysql-bin
expire_logs_days=7 #设置bin-log过期清理
binlog_format=row
```

2、进入 flink-sql-client

```
# docker exec -it flink-batch-submit bash
```

flink-sql-demo.sql可通过batch-submit脚本批量执行，或通过sql-client-web 手动执行

```
sh /opt/sql-client/sql-client.sh
```

或

```
sh /opt/batch-submit/sql-submit.sh -f flink-sql-demo.sql
```