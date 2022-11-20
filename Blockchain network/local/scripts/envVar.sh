#!/bin/bash
#
# Copyright IBM Corp All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#

# This is a collection of bash functions used by different scripts

# imports
. scripts/utils.sh

export CORE_PEER_TLS_ENABLED=true

export ORDERER1_CA=${PWD}/organizations/ordererOrganizations/orderer1/msp/tlscacerts/tlsca-cert.pem
export ORDERER2_CA=${PWD}/organizations/ordererOrganizations/orderer2/msp/tlscacerts/tlsca-cert.pem
export ORDERER3_CA=${PWD}/organizations/ordererOrganizations/orderer3/msp/tlscacerts/tlsca-cert.pem
export PEER0_LANDOWNER_CA=${PWD}/organizations/peerOrganizations/landowner/peers/peer0.landowner/tls/ca.crt
export PEER0_LANDBUYER_CA=${PWD}/organizations/peerOrganizations/landbuyer/peers/peer0.landbuyer/tls/ca.crt
export PEER0_BLOCKGAURDIANS_CA=${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer0.blockgaurdians/tls/ca.crt
export PEER0_INSURANCE_CA=${PWD}/organizations/peerOrganizations/insurance/peers/peer0.insurance/tls/ca.crt
export PEER0_GOVERNMENT_CA=${PWD}/organizations/peerOrganizations/government/peers/peer0.government/tls/ca.crt

# Set environment variables for the peer org
setGlobals() {
  PEER=$1
  local USING_ORG=""
  if [ -z "$OVERRIDE_ORG" ]; then
    USING_ORG=$2
  else
    USING_ORG="${OVERRIDE_ORG}"
  fi
  infoln "Using organization ${USING_ORG}"
  if [ "$USING_ORG" == "landowner" ]; then
    export CORE_PEER_LOCALMSPID="landownermsp"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_LANDOWNER_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/landowner/users/Admin@landowner/msp
    # export CORE_PEER_ADDRESS=localhost:4444
    if [ $PEER -eq 0 ]; then
      export CORE_PEER_ADDRESS=localhost:4444
    elif [ $PEER -eq 1 ]; then
      export CORE_PEER_ADDRESS=localhost:4454
    elif [ $PEER -eq 2 ]; then
      export CORE_PEER_ADDRESS=localhost:4464
    elif [ $PEER -eq 3 ]; then
      export CORE_PEER_ADDRESS=localhost:4474
    elif [ $PEER -eq 4 ]; then
      export CORE_PEER_ADDRESS=localhost:4484
    elif [ $PEER -eq 5 ]; then
      export CORE_PEER_ADDRESS=localhost:4494
    elif [ $PEER -eq 6 ]; then
      export CORE_PEER_ADDRESS=localhost:4504
    elif [ $PEER -eq 7 ]; then
      export CORE_PEER_ADDRESS=localhost:4514
    elif [ $PEER -eq 8 ]; then
      export CORE_PEER_ADDRESS=localhost:4524
    fi
  elif [ "$USING_ORG" == "landbuyer" ]; then
    export CORE_PEER_LOCALMSPID="landbuyermsp"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_LANDBUYER_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/landbuyer/users/Admin@landbuyer/msp
    # export CORE_PEER_ADDRESS=localhost:5555
    if [ $PEER -eq 0 ]; then
      export CORE_PEER_ADDRESS=localhost:5555
    elif [ $PEER -eq 1 ]; then
      export CORE_PEER_ADDRESS=localhost:5565
    elif [ $PEER -eq 2 ]; then
      export CORE_PEER_ADDRESS=localhost:5575
    elif [ $PEER -eq 3 ]; then
      export CORE_PEER_ADDRESS=localhost:5585
    elif [ $PEER -eq 4 ]; then
      export CORE_PEER_ADDRESS=localhost:5595
    elif [ $PEER -eq 5 ]; then
      export CORE_PEER_ADDRESS=localhost:5605
    elif [ $PEER -eq 6 ]; then
      export CORE_PEER_ADDRESS=localhost:5615
    elif [ $PEER -eq 7 ]; then
      export CORE_PEER_ADDRESS=localhost:5625
    elif [ $PEER -eq 8 ]; then
      export CORE_PEER_ADDRESS=localhost:5635
    fi
  elif [ "$USING_ORG" == "blockgaurdians" ]; then
    export CORE_PEER_LOCALMSPID="blockgaurdiansmsp"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_BLOCKGAURDIANS_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/blockgaurdians/users/Admin@blockgaurdians/msp
    # export CORE_PEER_ADDRESS=localhost:6666
    if [ $PEER -eq 0 ]; then
      export CORE_PEER_ADDRESS=localhost:6666
    elif [ $PEER -eq 1 ]; then
      export CORE_PEER_ADDRESS=localhost:6676
    elif [ $PEER -eq 2 ]; then
      export CORE_PEER_ADDRESS=localhost:6686
    elif [ $PEER -eq 3 ]; then
      export CORE_PEER_ADDRESS=localhost:6696
    elif [ $PEER -eq 4 ]; then
      export CORE_PEER_ADDRESS=localhost:6706
    elif [ $PEER -eq 5 ]; then
      export CORE_PEER_ADDRESS=localhost:6716
    elif [ $PEER -eq 6 ]; then
      export CORE_PEER_ADDRESS=localhost:6726
    elif [ $PEER -eq 7 ]; then
      export CORE_PEER_ADDRESS=localhost:6736
    elif [ $PEER -eq 8 ]; then
      export CORE_PEER_ADDRESS=localhost:6746
    fi
  elif [ "$USING_ORG" == "insurance" ]; then
    export CORE_PEER_LOCALMSPID="insurancemsp"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_INSURANCE_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/insurance/users/Admin@insurance/msp
    # export CORE_PEER_ADDRESS=localhost:7777
    if [ $PEER -eq 0 ]; then
      export CORE_PEER_ADDRESS=localhost:7777
    elif [ $PEER -eq 1 ]; then
      export CORE_PEER_ADDRESS=localhost:7787
    elif [ $PEER -eq 2 ]; then
      export CORE_PEER_ADDRESS=localhost:7797
    elif [ $PEER -eq 3 ]; then
      export CORE_PEER_ADDRESS=localhost:7807
    elif [ $PEER -eq 4 ]; then
      export CORE_PEER_ADDRESS=localhost:7817
    elif [ $PEER -eq 5 ]; then
      export CORE_PEER_ADDRESS=localhost:7827
    elif [ $PEER -eq 6 ]; then
      export CORE_PEER_ADDRESS=localhost:7837
    elif [ $PEER -eq 7 ]; then
      export CORE_PEER_ADDRESS=localhost:7847
    elif [ $PEER -eq 8 ]; then
      export CORE_PEER_ADDRESS=localhost:7857
    fi
  elif [ "$USING_ORG" == "government" ]; then
    export CORE_PEER_LOCALMSPID="governmentmsp"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_GOVERNMENT_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/government/users/Admin@government/msp
    # export CORE_PEER_ADDRESS=localhost:8888
    if [ $PEER -eq 0 ]; then
      export CORE_PEER_ADDRESS=localhost:8888
    elif [ $PEER -eq 1 ]; then
      export CORE_PEER_ADDRESS=localhost:8898
    elif [ $PEER -eq 2 ]; then
      export CORE_PEER_ADDRESS=localhost:8908
    elif [ $PEER -eq 3 ]; then
      export CORE_PEER_ADDRESS=localhost:8918
    elif [ $PEER -eq 4 ]; then
      export CORE_PEER_ADDRESS=localhost:8928
    elif [ $PEER -eq 5 ]; then
      export CORE_PEER_ADDRESS=localhost:8938
    elif [ $PEER -eq 6 ]; then
      export CORE_PEER_ADDRESS=localhost:8948
    elif [ $PEER -eq 7 ]; then
      export CORE_PEER_ADDRESS=localhost:8958
    elif [ $PEER -eq 8 ]; then
      export CORE_PEER_ADDRESS=localhost:8968
    fi

  else
    errorln "ORG Unknown"
  fi

  if [ "$VERBOSE" == "true" ]; then
    env | grep CORE
  fi
}

# Set environment variables for use in the CLI container 
setGlobalsCLI() {
  setGlobals 0 $1

  local USING_ORG=""
  if [ -z "$OVERRIDE_ORG" ]; then
    USING_ORG=$1
  else
    USING_ORG="${OVERRIDE_ORG}"
  fi
  if [ "$USING_ORG" == "landowner" ]; then
    export CORE_PEER_ADDRESS=peer0.landowner:4444
  elif [ "$USING_ORG" == "landbuyer" ]; then
    export CORE_PEER_ADDRESS=peer0.landbuyer:5555
  elif [ "$USING_ORG" == "blockgaurdians" ]; then
    export CORE_PEER_ADDRESS=peer0.blockgaurdians:6666
  elif [ "$USING_ORG" == "insurance" ]; then
    export CORE_PEER_ADDRESS=peer0.insurance:7777
  elif [ "$USING_ORG" == "government" ]; then
    export CORE_PEER_ADDRESS=peer0.government:8888

  else
    errorln "ORG Unknown"
  fi
}

# parsePeerConnectionParameters $@
# Helper function that sets the peer connection parameters for a chaincode
# operation
parsePeerConnectionParameters() {
  PEER_CONN_PARMS=""
  PEERS=""
  echo $1
  while [ "$#" -gt 0 ]; do
    setGlobals 0 $1
    PEER="peer0.$1"
    ## Set peer addresses
    PEERS="$PEERS $PEER"
    PEER_CONN_PARMS="$PEER_CONN_PARMS --peerAddresses $CORE_PEER_ADDRESS"
    ## Set path to TLS certificate
    TLSINFO=$(eval echo "--tlsRootCertFiles \$PEER0_$(echo $1 | tr 'a-z' 'A-Z')_CA")
    PEER_CONN_PARMS="$PEER_CONN_PARMS $TLSINFO"
    # shift by one to get to the next organization
    shift
  done
  # remove leading space for output
  PEERS="$(echo -e "$PEERS" | sed -e 's/^[[:space:]]*//')"
}

verifyResult() {
  if [ $1 -ne 0 ]; then
    fatalln "$2"
  fi
}

