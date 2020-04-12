#!/bin/mksh

set -vex

# maor load
function config_workloads
{
    if [[ ! -z ${RECNUM} ]]; then
        sed -i "s/recordcount=[0-9]*/recordcount=${RECNUM:=1000000}/g" \
        /opt/ycsb-*/workloads/workload${WORKLETTER}
    fi
    if [[ ! -z ${OPNUM} ]]; then     
        sed -i "s/operationcount=[0-9]*/operationcount=${OPNUM:=5000000}/g" \
        /opt/ycsb-*/workloads/workload${WORKLETTER}
    fi
    if [[ ! -z ${READPROPORTION} ]]; then
        sed -i "s/readproportion=[0-9\.]*/readproportion=${READPROPORTION:=0.5}/g" \
        /opt/ycsb-*/workloads/workload${WORKLETTER}
    fi
    if [[ ! -z ${UPDATEPROPORTION} ]]; then
        sed -i "s/updateproportion=[0-9\.]*/updateproportion=${UPDATEPROPORTION:=0.5}/g" \
        /opt/ycsb-*/workloads/workload${WORKLETTER}
    fi
    if [[ ! -z ${SCANPROPORTION} ]]; then    
        sed -i "s/scanproportion=[0-9\.]*/scanproportion=${SCANPROPORTION:=0.95}/g" \
        /opt/ycsb-*/workloads/workload${WORKLETTER}
    fi
    if [[ ! -z ${INSERTPROPORTION} ]]; then
        sed -i "s/insertproportion=[0-9\.]*/insertproportion=${INSERTPROPORTION:=0.5}/g" \
        /opt/ycsb-*/workloads/workload${WORKLETTER}
    fi
    if [[ ! -z ${REQUESTDISTRIBUTION} ]]; then      
        sed -i "s/requestdistribution=zipfian/requestdistribution=${REQUESTDISTRIBUTION:=zipfian}/g" \
        /opt/ycsb-*/workloads/workload${WORKLETTER}
    fi
    if [[ ! -z ${MAXSCANLENGTH} ]]; then   
        sed -i "s/maxscanlength=[0-9.]*/maxscanlength=${MAXSCANLENGTH:=100}/g" \
        /opt/ycsb-*/workloads/workload${WORKLETTER}
    fi
    if [[ ! -z ${SCANLENGTHDISTRIBUTION} ]]; then  
        sed -i "s/scanlengthdistribution=uniform/scanlengthdistribution=${SCANLENGTHDISTRIBUTION:=uniform}/g" \
        /opt/ycsb-*/workloads/workload${WORKLETTER}
    fi    
        
    return
}

function load_data
{
    if [[ ! -e /.loaded_data ]]; then

        /opt/ycsb-*/bin/ycsb.sh load "${DBTYPE}" -s -P "workloads/workload${WORKLETTER}" "${DBARGS}" && touch /.loaded_data
    fi

    return
}

# exit message
trap 'echo "\n${progname} has finished\n"' EXIT

# make it easier to see logs in the rancher ui
sleep 5

# make sure all the params are set and go.
if [[ -z ${DBTYPE} || -z ${WORKLETTER} || -z ${DBARGS} ]]; then
  echo "Missing params! Exiting"
  exit 1
else
  config_workloads
  if [[ ! -z "${ACTION}" ]]; then
    eval ./bin/ycsb "${ACTION}" "${DBTYPE}" -s -P "workloads/workload${WORKLETTER}" "${DBARGS}"
  else
    load_data
    eval ./bin/ycsb run "${DBTYPE}" -s -P "workloads/workload${WORKLETTER}" "${DBARGS}"
  fi
fi
