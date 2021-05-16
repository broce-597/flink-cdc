FROM flink:1.12.1-scala_2.11

# Copy sql-client script
COPY sql-client/ /opt/sql-client

#Copy batch submit
COPY batch-submit/ /opt/batch-submit

# Open permissions
RUN chmod +x /opt/sql-client/sql-client.sh && chmod +x /opt/batch-submit/sql-submit.sh && mkdir -p /opt/sql-client/lib

# Download connector libraries
# Download mysql-cdc connector
RUN wget -P /opt/sql-client/lib/ https://repo.maven.apache.org/maven2/org/apache/flink/flink-json/1.12.1/flink-json-1.12.1.jar; \
    wget -P /opt/sql-client/lib/ https://repo.maven.apache.org/maven2/org/apache/flink/flink-sql-connector-kafka_2.11/1.12.1/flink-sql-connector-kafka_2.11-1.12.1.jar; \
    wget -P /opt/sql-client/lib/ https://repo.maven.apache.org/maven2/org/apache/flink/flink-sql-connector-elasticsearch7_2.11/1.12.1/flink-sql-connector-elasticsearch7_2.11-1.12.1.jar; \
    wget -P /opt/sql-client/lib/ https://repo.maven.apache.org/maven2/org/apache/flink/flink-connector-jdbc_2.11/1.12.1/flink-connector-jdbc_2.11-1.12.1.jar; \
    wget -P /opt/sql-client/lib/ https://repo.maven.apache.org/maven2/org/postgresql/postgresql/42.2.14/postgresql-42.2.14.jar;
    wget -P /opt/sql-client/lib/ https://repo1.maven.org/maven2/com/alibaba/ververica/flink-sql-connector-mysql-cdc/1.3.0/flink-sql-connector-mysql-cdc-1.3.0.jar

# Copy configuration
COPY conf/* /opt/flink/conf/

WORKDIR /opt/sql-client
