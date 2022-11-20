#!/bin/bash

source scripts/utils.sh

CHANNEL_NAME=${1:-"defaultchannel"}
CC_NAME=${2}
CC_SRC_PATH=${3}
CC_SRC_LANGUAGE=${4}
CC_VERSION=${5:-"1.0"}
CC_SEQUENCE=${6:-"1"}
CC_INIT_FCN=${7:-"NA"}
CC_END_POLICY=${8:-"NA"}
CC_COLL_CONFIG=${9:-"NA"}
DELAY=${10:-"3"}
MAX_RETRY=${11:-"5"}
VERBOSE=${12:-"false"}
CC_SKIP_PACKAGE_INSTALL=${13:-"false"}
CC_SKIP_DEPLOYMENT=${14:-"false"}

println "executing with the following"
println "- CHANNEL_NAME: ${C_GREEN}${CHANNEL_NAME}${C_RESET}"
println "- CC_NAME: ${C_GREEN}${CC_NAME}${C_RESET}"
println "- CC_SRC_PATH: ${C_GREEN}${CC_SRC_PATH}${C_RESET}"
println "- CC_SRC_LANGUAGE: ${C_GREEN}${CC_SRC_LANGUAGE}${C_RESET}"
println "- CC_VERSION: ${C_GREEN}${CC_VERSION}${C_RESET}"
println "- CC_SEQUENCE: ${C_GREEN}${CC_SEQUENCE}${C_RESET}"
println "- CC_END_POLICY: ${C_GREEN}${CC_END_POLICY}${C_RESET}"
println "- CC_COLL_CONFIG: ${C_GREEN}${CC_COLL_CONFIG}${C_RESET}"
println "- CC_INIT_FCN: ${C_GREEN}${CC_INIT_FCN}${C_RESET}"
println "- DELAY: ${C_GREEN}${DELAY}${C_RESET}"
println "- MAX_RETRY: ${C_GREEN}${MAX_RETRY}${C_RESET}"
println "- VERBOSE: ${C_GREEN}${VERBOSE}${C_RESET}"
println "- CC_SKIP_PACKAGE_INSTALL: ${C_GREEN}${CC_SKIP_PACKAGE_INSTALL}${C_RESET}"
println "- CC_SKIP_DEPLOYMENT ${C_GREEN}${CC_SKIP_DEPLOYMENT}${C_RESET}"

FABRIC_CFG_PATH=$PWD/config/

#User has not provided a name
if [ -z "$CC_NAME" ] || [ "$CC_NAME" = "NA" ]; then
  fatalln "No chaincode name was provided. Valid call example: ./network.sh deployCC -ccn basic -ccp ../asset-transfer-basic/chaincode-go -ccl go"

# User has not provided a path
elif [ -z "$CC_SRC_PATH" ] || [ "$CC_SRC_PATH" = "NA" ]; then
  fatalln "No chaincode path was provided. Valid call example: ./network.sh deployCC -ccn basic -ccp ../asset-transfer-basic/chaincode-go -ccl go"

# User has not provided a language
elif [ -z "$CC_SRC_LANGUAGE" ] || [ "$CC_SRC_LANGUAGE" = "NA" ]; then
  fatalln "No chaincode language was provided. Valid call example: ./network.sh deployCC -ccn basic -ccp ../asset-transfer-basic/chaincode-go -ccl go"

## Make sure that the path to the chaincode exists
elif [ ! -d "$CC_SRC_PATH" ]; then
  fatalln "Path to chaincode does not exist. Please provide different path."
fi

CC_SRC_LANGUAGE=$(echo "$CC_SRC_LANGUAGE" | tr [:upper:] [:lower:])

# do some language specific preparation to the chaincode before packaging
if [ "$CC_SRC_LANGUAGE" = "go" ]; then
  CC_RUNTIME_LANGUAGE=golang

  infoln "Vendoring Go dependencies at $CC_SRC_PATH"
  pushd $CC_SRC_PATH
  go mod init main
  go mod tidy
  GO111MODULE=on go mod vendor
  popd
  successln "Finished vendoring Go dependencies"

elif [ "$CC_SRC_LANGUAGE" = "java" ]; then
  CC_RUNTIME_LANGUAGE=java

  infoln "Compiling Java code..."
  pushd $CC_SRC_PATH
  ./gradlew installDist
  popd
  successln "Finished compiling Java code"
  CC_SRC_PATH=$CC_SRC_PATH/build/install/$CC_NAME

elif [ "$CC_SRC_LANGUAGE" = "javascript" ]; then
  CC_RUNTIME_LANGUAGE=node

elif [ "$CC_SRC_LANGUAGE" = "typescript" ]; then
  CC_RUNTIME_LANGUAGE=node

  infoln "Compiling TypeScript code into JavaScript..."
  pushd $CC_SRC_PATH
  npm install
  npm run build
  popd
  successln "Finished compiling TypeScript code into JavaScript"

else
  fatalln "The chaincode language ${CC_SRC_LANGUAGE} is not supported by this script. Supported chaincode languages are: go, java, javascript, and typescript"
  exit 1
fi

INIT_REQUIRED="--init-required"
# check if the init fcn should be called
if [ "$CC_INIT_FCN" = "NA" ]; then
  INIT_REQUIRED=""
fi

if [ "$CC_END_POLICY" = "NA" ]; then
  CC_END_POLICY=""
else
  CC_END_POLICY="--signature-policy $CC_END_POLICY"
fi

if [ "$CC_COLL_CONFIG" = "NA" ]; then
  CC_COLL_CONFIG=""
else
  CC_COLL_CONFIG="--collections-config $CC_COLL_CONFIG"
fi

# import utils
. scripts/envVar.sh

packageChaincode() {
  
  peer lifecycle chaincode package ${CC_NAME}.tar.gz --path ${CC_SRC_PATH} --lang ${CC_RUNTIME_LANGUAGE} --label ${CC_NAME}_${CC_VERSION} >&log.txt
  res=$?
  
  cat log.txt
  verifyResult $res "Chaincode packaging has failed"
  successln "Chaincode is packaged"
}

# installChaincode PEER ORG
installChaincode() {
  PEER=$1
  ORG=$2
  setGlobals $PEER $ORG
  
  peer lifecycle chaincode install ${CC_NAME}.tar.gz >&log.txt
  res=$?
  
  cat log.txt
  verifyResult $res "Chaincode installation on peer${PEER}.${ORG} has failed"
  successln "Chaincode is installed on peer${PEER}.${ORG}"
}

# queryInstalled PEER ORG
queryInstalled() {
  PEER=$1
  ORG=$2
  setGlobals $PEER $ORG
  
  peer lifecycle chaincode queryinstalled >&log.txt
  res=$?
  
  cat log.txt
  PACKAGE_ID=$(sed -n "/${CC_NAME}_${CC_VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
  verifyResult $res "Query installed on peer${PEER}.${ORG} has failed"
  successln "Query installed successful on peer${PEER}.${ORG} on channel"
}

# approveForMyOrg VERSION PEER ORG
approveForMyOrg() {
  PEER=$1
  ORG=$2
  setGlobals $PEER $ORG
  
  peer lifecycle chaincode approveformyorg -o localhost:1100 --ordererTLSHostnameOverride orderer1 --tls --cafile $ORDERER1_CA --channelID $CHANNEL_NAME --name ${CC_NAME} --version ${CC_VERSION} --package-id ${PACKAGE_ID} --sequence ${CC_SEQUENCE} ${INIT_REQUIRED} ${CC_END_POLICY} ${CC_COLL_CONFIG} >&log.txt
  res=$?
  
  cat log.txt
  verifyResult $res "Chaincode definition approved on peer${PEER}.${ORG} on channel '$CHANNEL_NAME' failed"
  successln "Chaincode definition approved on peer${PEER}.${ORG} on channel '$CHANNEL_NAME'"
}

# checkCommitReadiness VERSION PEER ORG
checkCommitReadiness() {
  PEER=$1
  ORG=$2
  shift 2
  setGlobals $PEER $ORG
  infoln "Checking the commit readiness of the chaincode definition on peer${PEER}.${ORG} on channel '$CHANNEL_NAME'..."
  local rc=1
  local COUNTER=1
  # continue to poll
  # we either get a successful response, or reach MAX RETRY
  while [ $rc -ne 0 -a $COUNTER -lt $MAX_RETRY ]; do
    sleep $DELAY
    infoln "Attempting to check the commit readiness of the chaincode definition on peer${PEER}.${ORG}, Retry after $DELAY seconds."
    
    peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME --name ${CC_NAME} --version ${CC_VERSION} --sequence ${CC_SEQUENCE} ${INIT_REQUIRED} ${CC_END_POLICY} ${CC_COLL_CONFIG} --output json >&log.txt
    res=$?
    
    let rc=0
    for var in "$@"; do
      grep "$var" log.txt &>/dev/null || let rc=1
    done
    COUNTER=$(expr $COUNTER + 1)
  done
  cat log.txt
  if test $rc -eq 0; then
    infoln "Checking the commit readiness of the chaincode definition successful on peer${PEER}.${ORG} on channel '$CHANNEL_NAME'"
  else
    fatalln "After $MAX_RETRY attempts, Check commit readiness result on peer${PEER}.${ORG} is INVALID!"
  fi
}

# commitChaincodeDefinition VERSION PEER ORG (PEER ORG)...
commitChaincodeDefinition() {
  parsePeerConnectionParameters $@
  res=$?
  verifyResult $res "Invoke transaction failed on channel '$CHANNEL_NAME' due to uneven number of peer and org parameters "

  # while 'peer chaincode' command can get the orderer endpoint from the
  # peer (if join was successful), let's supply it directly as we know
  # it using the "-o" option
  
  peer lifecycle chaincode commit -o localhost:1100 --ordererTLSHostnameOverride orderer1 --tls --cafile $ORDERER1_CA --channelID $CHANNEL_NAME --name ${CC_NAME} $PEER_CONN_PARMS --version ${CC_VERSION} --sequence ${CC_SEQUENCE} ${INIT_REQUIRED} ${CC_END_POLICY} ${CC_COLL_CONFIG} >&log.txt
  res=$?
  
  cat log.txt
  verifyResult $res "Chaincode definition commit failed on peer${PEER}.${ORG} on channel '$CHANNEL_NAME' failed"
  successln "Chaincode definition committed on channel '$CHANNEL_NAME'"
}

# queryCommitted ORG
queryCommitted() {
  PEER=$1
  ORG=$2
  setGlobals $PEER $ORG
  EXPECTED_RESULT="Version: ${CC_VERSION}, Sequence: ${CC_SEQUENCE}, Endorsement Plugin: escc, Validation Plugin: vscc"
  infoln "Querying chaincode definition on peer${PEER}.${ORG} on channel '$CHANNEL_NAME'..."
  local rc=1
  local COUNTER=1
  # continue to poll
  # we either get a successful response, or reach MAX RETRY
  while [ $rc -ne 0 -a $COUNTER -lt $MAX_RETRY ]; do
    sleep $DELAY
    infoln "Attempting to Query committed status on peer${PEER}.${ORG}, Retry after $DELAY seconds."
    
    peer lifecycle chaincode querycommitted --channelID $CHANNEL_NAME --name ${CC_NAME} >&log.txt
    res=$?
    
    test $res -eq 0 && VALUE=$(cat log.txt | grep -o '^Version: '$CC_VERSION', Sequence: [0-9]*, Endorsement Plugin: escc, Validation Plugin: vscc')
    test "$VALUE" = "$EXPECTED_RESULT" && let rc=0
    COUNTER=$(expr $COUNTER + 1)
  done
  cat log.txt
  if test $rc -eq 0; then
    successln "Query chaincode definition successful on peer${PEER}.${ORG} on channel '$CHANNEL_NAME'"
  else
    fatalln "After $MAX_RETRY attempts, Query chaincode definition result on peer${PEER}.${ORG} is INVALID!"
  fi
}

chaincodeInvokeInit() {
  parsePeerConnectionParameters $@
  res=$?
  verifyResult $res "Invoke transaction failed on channel '$CHANNEL_NAME' due to uneven number of peer and org parameters "

  # while 'peer chaincode' command can get the orderer endpoint from the
  # peer (if join was successful), let's supply it directly as we know
  # it using the "-o" option
  
  fcn_call='{"function":"'${CC_INIT_FCN}'","Args":[]}'
  infoln "invoke fcn call:${fcn_call}"
  peer chaincode invoke -o localhost:1100 --ordererTLSHostnameOverride orderer1 --tls --cafile $ORDERER1_CA -C $CHANNEL_NAME -n ${CC_NAME} $PEER_CONN_PARMS --isInit -c ${fcn_call} >&log.txt
  res=$?
  
  cat log.txt
  verifyResult $res "Invoke execution on $PEERS failed "
  successln "Invoke transaction successful on $PEERS on channel '$CHANNEL_NAME'"
}

chaincodeQuery() {
  PEER=$1
  ORG=$2
  setGlobals $PEER $ORG
  infoln "Querying on peer${PEER}.${ORG} on channel '$CHANNEL_NAME'..."
  local rc=1
  local COUNTER=1
  # continue to poll
  # we either get a successful response, or reach MAX RETRY
  while [ $rc -ne 0 -a $COUNTER -lt $MAX_RETRY ]; do
    sleep $DELAY
    infoln "Attempting to Query peer${PEER}.${ORG}, Retry after $DELAY seconds."
    
    peer chaincode query -C $CHANNEL_NAME -n ${CC_NAME} -c '{"Args":["queryAllCars"]}' >&log.txt
    res=$?
    
    let rc=$res
    COUNTER=$(expr $COUNTER + 1)
  done
  cat log.txt
  if test $rc -eq 0; then
    successln "Query successful on peer${PEER}.${ORG} on channel '$CHANNEL_NAME'"
  else
    fatalln "After $MAX_RETRY attempts, Query result on peer${PEER}.${ORG} is INVALID!"
  fi
}

## package the chaincode
if [ "$CC_SKIP_PACKAGE_INSTALL" = "true" ]; then
  infoln "Skipping Chaincode packaging and installing..."
else
  packageChaincode

  infoln "Installing chaincode ..."
  # peer0 of landowner
  installChaincode 0 landowner
  # peer1 of landowner
  installChaincode 1 landowner
  # peer2 of landowner
  installChaincode 2 landowner
  # peer3 of landowner
  installChaincode 3 landowner
  # peer4 of landowner
  installChaincode 4 landowner
  # peer5 of landowner
  installChaincode 5 landowner
  # peer0 of landbuyer
  installChaincode 0 landbuyer
  # peer1 of landbuyer
  installChaincode 1 landbuyer
  # peer2 of landbuyer
  installChaincode 2 landbuyer
  # peer3 of landbuyer
  installChaincode 3 landbuyer
  # peer4 of landbuyer
  installChaincode 4 landbuyer
  # peer5 of landbuyer
  installChaincode 5 landbuyer
  # peer0 of blockgaurdians
  installChaincode 0 blockgaurdians
  # peer1 of blockgaurdians
  installChaincode 1 blockgaurdians
  # peer2 of blockgaurdians
  installChaincode 2 blockgaurdians
  # peer3 of blockgaurdians
  installChaincode 3 blockgaurdians
  # peer4 of blockgaurdians
  installChaincode 4 blockgaurdians
  # peer5 of blockgaurdians
  installChaincode 5 blockgaurdians
  # peer0 of insurance
  installChaincode 0 insurance
  # peer1 of insurance
  installChaincode 1 insurance
  # peer2 of insurance
  installChaincode 2 insurance
  # peer3 of insurance
  installChaincode 3 insurance
  # peer4 of insurance
  installChaincode 4 insurance
  # peer5 of insurance
  installChaincode 5 insurance
  # peer0 of government
  installChaincode 0 government
  # peer1 of government
  installChaincode 1 government
  # peer2 of government
  installChaincode 2 government
  # peer3 of government
  installChaincode 3 government
  # peer4 of government
  installChaincode 4 government
  # peer5 of government
  installChaincode 5 government
fi
## Install chaincode on peer0 of all organizations
if [ "$CC_SKIP_DEPLOYMENT" = "true" ]; then
  infoln "Skipping Chaincode deployments..."
  exit 0
fi

if [ "$CHANNEL_NAME" = "bazaar" ]; then
  ## query whether the chaincode is installed
  queryInstalled 0 landowner

 ## approve the definition for config.orgs
  approveForMyOrg 0 landowner
  approveForMyOrg 0 landbuyer
  approveForMyOrg 0 blockgaurdians
  approveForMyOrg 0 insurance
  approveForMyOrg 0 government
  ## check whether the chaincode definition is ready to be committed
  ## expect all of them to have approved

  checkCommitReadiness 0 landowner
  checkCommitReadiness 0 landbuyer
  checkCommitReadiness 0 blockgaurdians
  checkCommitReadiness 0 insurance
  checkCommitReadiness 0 government

  ## commit the definition
  commitChaincodeDefinition landowner landbuyer blockgaurdians insurance government 

  ## query to see that the definition committed successfully
  queryCommitted 0 landowner
  queryCommitted 0 landbuyer
  queryCommitted 0 blockgaurdians
  queryCommitted 0 insurance
  queryCommitted 0 government

  ## Invoke the chaincode - this does require that the chaincode have the 'initLedger'
  ## method defined
  if [ "$CC_INIT_FCN" = "NA" ]; then
    infoln "Chaincode initialization is not required"
  else
    chaincodeInvokeInit landowner
  fi
else
	errorln "Channel name unknown"
fi

exit 0




