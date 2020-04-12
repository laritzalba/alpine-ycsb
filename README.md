# alpine-ycsb
YCSB running on Alpine Linux and Zulu JDK

### Getting Started

###### Command line example with cassandra:

```
docker run -t --name ycsb-workloada2 \
-e ACTION='load' \
-e DBTYPE='cassandra-cql' \
-e WORKLETTER='a' \
-e RECNUM='500' \
-e OPNUM='1000' \
-e READPROPORTION='0.4' \
-e UPDATEPROPORTION='0.1' \
-e SCANPROPORTION='0.2' \
-e INSERTPROPORTION='0.5' \
-e REQUESTDISTRIBUTION='zipfian' \
-e DBARGS="-p hosts=$IP" \
laritzalba/alpine-ycsb:latest

```
###### Command line example with redis:

```
docker run -t --name ycsb-loadgen \
-e ACTION='load' \
-e DBTYPE='redis' \
-e WORKLETTER='a' \
-e DBARGS='-p redis.host=10.0.0.1' \
laritzalba/alpine-ycsb:latest
```
See more command line examples in run-container.sh in https://github.com/laritzalba/alpine-ycsb

You need to pass these four environment variables:
  * `ACTION`
    * `load`, `run`
  * `DBTYPE`
    * `accumulo`
    * `aerospike`
    * `arangodb`
    * `arangodb3`
    * `asynchbase`
    * `azuredocumentdb`
    * `basic`
    * `cassandra-cql`
    * `cassandra2-cql`
    * `cloudspanner`
    * `couchbase`
    * `couchbase2`
    * `dynamodb`
    * `elasticsearch`
    * `geode`
    * `googlebigtable`
    * `googledatastore`
    * `hbase094`
    * `hbase098`
    * `hbase10`
    * `hbase12`
    * `hypertable`
    * `infinispan`
    * `infinispan-cs`
    * `jdbc`
    * `kudu`
    * `mapkeeper`
    * `memcached`
    * `mongodb`
    * `mongodb-async`
    * `nosqldb`
    * `orientdb`
    * `rados`
    * `redis`
    * `rest`
    * `riak`
    * `s3`
    * `solr`
    * `solr6`
    * `tarantool`
    * `voldemort`
  * `WORKLETTER`
    * `a`, `b`, `c`, `d`, `e`, `f`

  * `DBARGS`
    * `DBARGS` are dependent on the `DBTYPE` you selected
    * See https://github.com/brianfrankcooper/YCSB
    * MUST BE SURROUNDED WITH QUOTES.
    * `'-p KEY0=VALUE0 -p KEY1=VALUE1'`
  
  The fallowing parameters are not mandatory. If they are not used, then the default parameters of WORKLETTER will be used. See workload_template (https://github.com/brianfrankcooper/YCSB/blob/master/workloads/workload_template) for a complete parameter’s documentation.

  * `RECNUM`
    * `The number of records in the table to be inserted in the load phase or the number of records already in the table before the run phase. ie: 20000, 30000, 1000000, etc.`
  * `OPNUM`
    * `The number of operations to use during the run phase. ie: 200000, 3000000, etc.`
  * `READPROPORTION`
    * `What proportion of operations are reads, i.e: READPROPORTION=0.95`
  * `UPDATEPROPORTION`
      * `What proportion of operations are updates, i.e: UPDATEPROPORTION=0.05 `
  * `INSERTPROPORTION`
      * `What proportion of operations are inserts, i.e: INSERTPROPORTION=0`
  * `SCANPROPORTION` 
      * `What proportion of operations are scans, i.e: SCANPROPORTION=0` 
  * `REQUESTDISTRIBUTION`
    * `zipfian`, `uniform`, `latest`
  * `MAXSCANLENGTH` 
    * `On a single scan, the maximum number of records to access, i.e: MAXSCANLENGTH=1000` 
  * `SCANLENGTHDISTRIBUTION`
      * `zipfian`, `uniform`
    
