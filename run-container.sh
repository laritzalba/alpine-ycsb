#! /bin/bash

# Examples ycsb for cassandra DB
# DB cassandra is runing in other container with the port 9042 exposed and all the setups that are explained in ycsb for testing cassandra (create the required keyspaces and table)
#  to create a container open terminal and use "./run-container.sh a " use differents functions names (a, b, c, d, e )

# host IP
IP="192.168.0.11"

#Attention with whitespaces (not whiteespaces after the \ or before the next line)

# Running a container created from images "ycsb-build", the paremeters are: 
# The file workloads/workloada from ycsb (https://github.com/brianfrankcooper/YCSB/tree/master/workloads) without modifications, 
# change the ip address with the ip addres of your host container. 
# See workload_template (https://github.com/brianfrankcooper/YCSB/blob/master/workloads/workload_template) for a complete parameter’s documentation.
#a:
function a { 

docker rm -f ycsb-workloada

docker run -t --name ycsb-workloada \
-e ACTION='load' \
-e DBTYPE='cassandra-cql' \
-e WORKLETTER='a' \
-e DBARGS="-p hosts=$IP" \
laritzalba/alpine-ycsb:latest

}

# Running a container created from images "ycsb-build", the paremeters are: 
# The file workloads/workloada from ycsb (https://github.com/brianfrankcooper/YCSB/tree/master/workloads) and modifiying the requestditribution to uniform, 
# change the ip address with the ip addres of your host container. 
# See workload_template (https://github.com/brianfrankcooper/YCSB/blob/master/workloads/workload_template) for a complete parameter’s documentation.
#a:

function a1 { 

docker rm -f ycsb-workloada1

docker run -t --name ycsb-workloada1 \
-e ACTION='load' \
-e DBTYPE='cassandra-cql' \
-e WORKLETTER='a' \
-e RECNUM='500' \
-e OPNUM='1000' \
-e REQUESTDISTRIBUTION='uniform' \
-e DBARGS="-p hosts=$IP" \
laritzalba/alpine-ycsb:latest

}

function  a2 { 

docker rm -f ycsb-workloada2

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

}


  
# Running a container created from images "ycsb-build", the paremeters are: 
# The file workloads/workloadb from ycsb (https://github.com/brianfrankcooper/YCSB/tree/master/workloads) and modifiying the requestditribution to uniform, 
# change the ip address with the ip addres of your host container. 
# See workload_template (https://github.com/brianfrankcooper/YCSB/blob/master/workloads/workload_template) for a complete parameter’s documentation.
#a:
function b { 
 
docker rm -f ycsb-workloadb

docker run -t --name ycsb-workloadb \
-e ACTION='load' \
-e DBTYPE='cassandra-cql' \
-e WORKLETTER='b' \
-e RECNUM='500' \
-e OPNUM='1000' \
-e REQUESTDISTRIBUTION='uniform' \
-e DBARGS="-p hosts=$IP" \
laritzalba/alpine-ycsb:latest

}


# Running a container created from images "ycsb-build", the paremeters are: 
# The file workloads/workloadc from ycsb (https://github.com/brianfrankcooper/YCSB/tree/master/workloads) and modifiying the requestditribution to uniform, 
# change the ip address with the ip addres of your host container. 
# See workload_template (https://github.com/brianfrankcooper/YCSB/blob/master/workloads/workload_template) for a complete parameter’s documentation.
#c:
function c { 
docker rm -f ycsb-workloadc

docker run -t --name ycsb-workloadc \
-e ACTION='load' \
-e DBTYPE='cassandra-cql' \
-e WORKLETTER='c' \
-e RECNUM='500' \
-e OPNUM='1000' \
-e REQUESTDISTRIBUTION='uniform' \
-e DBARGS="-p hosts=$IP" \
laritzalba/alpine-ycsb:latest

}



# Running a container created from images "ycsb-build", the paremeters are: 
# The file workloads/workloada from ycsb (https://github.com/brianfrankcooper/YCSB/tree/master/workloads) and modifiying the requestditribution to uniform, 
# change the ip address with the ip addres of your host container. 
# See workload_template (https://github.com/brianfrankcooper/YCSB/blob/master/workloads/workload_template) for a complete parameter’s documentation.
#d:
function d { 
docker rm -f ycsb-workloadd

docker run -t --name ycsb-workloadc \
-e ACTION='load' \
-e DBTYPE='cassandra-cql' \
-e WORKLETTER='d' \
-e RECNUM='500' \
-e OPNUM='1000' \
-e REQUESTDISTRIBUTION='uniform' \
-e DBARGS="-p hosts=$IP" \
ycsb-build:latest

}


# Running a container created from images "ycsb-build", the paremeters are: 
# The file workloads/workloada from ycsb (https://github.com/brianfrankcooper/YCSB/tree/master/workloads) and modifiying the requestditribution to uniform, 
# change the ip address with the ip addres of your host container. 
# See workload_template (https://github.com/brianfrankcooper/YCSB/blob/master/workloads/workload_template) for a complete parameter’s documentation.
#e:
function e { 
docker rm -f ycsb-workloade

docker run -t --name ycsb-workloade \
-e ACTION='load' \
-e DBTYPE='cassandra-cql' \
-e WORKLETTER='e' \
-e RECNUM='50' \
-e OPNUM='100' \
-e READPROPORTION='0.4' \
-e UPDATEPROPORTION='0.1' \
-e SCANPROPORTION='0.1' \
-e INSERTPROPORTION='0.5' \
-e REQUESTDISTRIBUTION='zipfian' \
-e MAXSCANLENGTH='90' \
-e SCANLENGTHDISTRIBUTION='zipfian' \
-e DBARGS="-p hosts=$IP" \
laritzalba/alpine-ycsb:latest

}


"$@"