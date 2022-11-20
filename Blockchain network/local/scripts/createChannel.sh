#!/bin/bash

# imports
. scripts/envVar.sh
. scripts/utils.sh

CHANNEL_NAME="$1"
DELAY="$2"
MAX_RETRY="$3"
VERBOSE="$4"
: ${CHANNEL_NAME:="defaultchannel"}
: ${DELAY:="3"}
: ${MAX_RETRY:="5"}
: ${VERBOSE:="false"}
CHANNEL_PROFILE="$5"

if [ ! -d "channel-artifacts" ]; then
	mkdir channel-artifacts
fi

createChannelTx() {
	
	configtxgen -profile ${CHANNEL_PROFILE} -outputCreateChannelTx ./channel-artifacts/${CHANNEL_NAME}.tx -channelID $CHANNEL_NAME
	res=$?
	
	verifyResult $res "Failed to generate channel configuration transaction..."
}

createChannel() {
	ORG=$1
	setGlobals 0 $ORG
	# Poll in case the raft leader is not set yet
	local rc=1
	local COUNTER=1
	while [ $rc -ne 0 -a $COUNTER -lt $MAX_RETRY ]; do
		sleep $DELAY
		
		peer channel create -o localhost:1100 -c $CHANNEL_NAME --ordererTLSHostnameOverride orderer1 -f ./channel-artifacts/${CHANNEL_NAME}.tx --outputBlock $BLOCKFILE --tls --cafile $ORDERER1_CA >&log.txt
		res=$?
		
		let rc=$res
		COUNTER=$(expr $COUNTER + 1)
	done
	cat log.txt
	verifyResult $res "Channel creation failed"
}

# joinChannel ORG
joinChannel() {
	FABRIC_CFG_PATH=$PWD/config/
	PEER=$1
	ORG=$2
	setGlobals $PEER $ORG
	local rc=1
	local COUNTER=1
	## Sometimes Join takes time, hence retry
	while [ $rc -ne 0 -a $COUNTER -lt $MAX_RETRY ]; do
		sleep $DELAY
		
		peer channel join -b $BLOCKFILE >&log.txt
		res=$?
		
		let rc=$res
		COUNTER=$(expr $COUNTER + 1)
	done
	cat log.txt
	verifyResult $res "After $MAX_RETRY attempts, peer${PEER}.${ORG} has failed to join channel '$CHANNEL_NAME' "
}

setAnchorPeer() {
	ORG=$1
	docker exec cli ./scripts/setAnchorPeer.sh $ORG $CHANNEL_NAME
}

FABRIC_CFG_PATH=${PWD}/configtx

## Create channeltx
infoln "Generating channel create transaction '${CHANNEL_NAME}.tx'"
createChannelTx

FABRIC_CFG_PATH=$PWD/config/
BLOCKFILE="./channel-artifacts/${CHANNEL_NAME}.block"

if [ "$CHANNEL_NAME" = "bazaar" ]; then
	## Create channel
	infoln "Creating channel ${CHANNEL_NAME}"
	createChannel landowner
	successln "Channel '$CHANNEL_NAME' created"
	## Join all the peers to the bazaar
    infoln "Joining landowner peer 0 to the bazaar..."
	joinChannel 0 landowner
    infoln "Joining landowner peer 1 to the bazaar..."
	joinChannel 1 landowner
    infoln "Joining landowner peer 2 to the bazaar..."
	joinChannel 2 landowner
    infoln "Joining landowner peer 3 to the bazaar..."
	joinChannel 3 landowner
    infoln "Joining landowner peer 4 to the bazaar..."
	joinChannel 4 landowner
    infoln "Joining landowner peer 5 to the bazaar..."
	joinChannel 5 landowner
    infoln "Joining landbuyer peer 0 to the bazaar..."
	joinChannel 0 landbuyer
    infoln "Joining landbuyer peer 1 to the bazaar..."
	joinChannel 1 landbuyer
    infoln "Joining landbuyer peer 2 to the bazaar..."
	joinChannel 2 landbuyer
    infoln "Joining landbuyer peer 3 to the bazaar..."
	joinChannel 3 landbuyer
    infoln "Joining landbuyer peer 4 to the bazaar..."
	joinChannel 4 landbuyer
    infoln "Joining landbuyer peer 5 to the bazaar..."
	joinChannel 5 landbuyer
    infoln "Joining blockgaurdians peer 0 to the bazaar..."
	joinChannel 0 blockgaurdians
    infoln "Joining blockgaurdians peer 1 to the bazaar..."
	joinChannel 1 blockgaurdians
    infoln "Joining blockgaurdians peer 2 to the bazaar..."
	joinChannel 2 blockgaurdians
    infoln "Joining blockgaurdians peer 3 to the bazaar..."
	joinChannel 3 blockgaurdians
    infoln "Joining blockgaurdians peer 4 to the bazaar..."
	joinChannel 4 blockgaurdians
    infoln "Joining blockgaurdians peer 5 to the bazaar..."
	joinChannel 5 blockgaurdians
    infoln "Joining insurance peer 0 to the bazaar..."
	joinChannel 0 insurance
    infoln "Joining insurance peer 1 to the bazaar..."
	joinChannel 1 insurance
    infoln "Joining insurance peer 2 to the bazaar..."
	joinChannel 2 insurance
    infoln "Joining insurance peer 3 to the bazaar..."
	joinChannel 3 insurance
    infoln "Joining insurance peer 4 to the bazaar..."
	joinChannel 4 insurance
    infoln "Joining insurance peer 5 to the bazaar..."
	joinChannel 5 insurance
    infoln "Joining government peer 0 to the bazaar..."
	joinChannel 0 government
    infoln "Joining government peer 1 to the bazaar..."
	joinChannel 1 government
    infoln "Joining government peer 2 to the bazaar..."
	joinChannel 2 government
    infoln "Joining government peer 3 to the bazaar..."
	joinChannel 3 government
    infoln "Joining government peer 4 to the bazaar..."
	joinChannel 4 government
    infoln "Joining government peer 5 to the bazaar..."
	joinChannel 5 government
	## Set the anchor peers for each org in the channel
	infoln "Setting anchor peer for landowner to the bazaar..."
	setAnchorPeer landowner
	infoln "Setting anchor peer for landbuyer to the bazaar..."
	setAnchorPeer landbuyer
	infoln "Setting anchor peer for blockgaurdians to the bazaar..."
	setAnchorPeer blockgaurdians
	infoln "Setting anchor peer for insurance to the bazaar..."
	setAnchorPeer insurance
	infoln "Setting anchor peer for government to the bazaar..."
	setAnchorPeer government

else
	errorln "Channel name unknown"
fi

successln "Channel '$CHANNEL_NAME' joined"

