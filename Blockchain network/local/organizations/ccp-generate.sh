#!/bin/bash

function one_line_pem {
    echo "`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $1`"
}

function json_ccp {
    local PP=$(one_line_pem $9)
    local CP=$(one_line_pem $10)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P0PORT}/$2/" \
        -e "s/\${P1PORT}/$3/" \
        -e "s/\${P2PORT}/$4/" \
        -e "s/\${P3PORT}/$5/" \
        -e "s/\${P4PORT}/$6/" \
        -e "s/\${P5PORT}/$7/" \
        -e "s/\${CAPORT}/$8/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        organizations/ccp-template.json
}

function yaml_ccp {
    local PP=$(one_line_pem $9)
    local CP=$(one_line_pem $10)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P0PORT}/$2/" \
        -e "s/\${P1PORT}/$3/" \
        -e "s/\${P2PORT}/$4/" \
        -e "s/\${P3PORT}/$5/" \
        -e "s/\${P4PORT}/$6/" \
        -e "s/\${P5PORT}/$7/" \
        -e "s/\${CAPORT}/$8/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        organizations/ccp-template.yaml | sed -e $'s/\\\\n/\\\n          /g'
}

## prepare connection profile for orglandowner
ORG=landowner
P0PORT=4444
P1PORT=4454
P2PORT=4464
P3PORT=4474
P4PORT=4484
P5PORT=4494
CAPORT=4400
PEERPEM=organizations/peerOrganizations/landowner/tlsca/tlsca.landowner-cert.pem
CAPEM=organizations/peerOrganizations/landowner/ca/ca.landowner-cert.pem

echo "$(json_ccp $ORG $P0PORT $P1PORT $P2PORT $P3PORT $P4PORT $P5PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/landowner/connection-landowner.json
echo "$(yaml_ccp $ORG $P0PORT $P1PORT $P2PORT $P3PORT $P4PORT $P5PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/landowner/connection-landowner.yaml
# save another copy of json connection profile in a different directory
echo "$(json_ccp $ORG $P0PORT $P1PORT $P2PORT $P3PORT $P4PORT $P5PORT $CAPORT $PEERPEM $CAPEM)" > network-config/network-config-landowner.json

## prepare connection profile for orglandbuyer
ORG=landbuyer
P0PORT=5555
P1PORT=5565
P2PORT=5575
P3PORT=5585
P4PORT=5595
P5PORT=5605
CAPORT=5500
PEERPEM=organizations/peerOrganizations/landbuyer/tlsca/tlsca.landbuyer-cert.pem
CAPEM=organizations/peerOrganizations/landbuyer/ca/ca.landbuyer-cert.pem

echo "$(json_ccp $ORG $P0PORT $P1PORT $P2PORT $P3PORT $P4PORT $P5PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/landbuyer/connection-landbuyer.json
echo "$(yaml_ccp $ORG $P0PORT $P1PORT $P2PORT $P3PORT $P4PORT $P5PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/landbuyer/connection-landbuyer.yaml
# save another copy of json connection profile in a different directory
echo "$(json_ccp $ORG $P0PORT $P1PORT $P2PORT $P3PORT $P4PORT $P5PORT $CAPORT $PEERPEM $CAPEM)" > network-config/network-config-landbuyer.json

## prepare connection profile for orgblockgaurdians
ORG=blockgaurdians
P0PORT=6666
P1PORT=6676
P2PORT=6686
P3PORT=6696
P4PORT=6706
P5PORT=6716
CAPORT=6600
PEERPEM=organizations/peerOrganizations/blockgaurdians/tlsca/tlsca.blockgaurdians-cert.pem
CAPEM=organizations/peerOrganizations/blockgaurdians/ca/ca.blockgaurdians-cert.pem

echo "$(json_ccp $ORG $P0PORT $P1PORT $P2PORT $P3PORT $P4PORT $P5PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/blockgaurdians/connection-blockgaurdians.json
echo "$(yaml_ccp $ORG $P0PORT $P1PORT $P2PORT $P3PORT $P4PORT $P5PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/blockgaurdians/connection-blockgaurdians.yaml
# save another copy of json connection profile in a different directory
echo "$(json_ccp $ORG $P0PORT $P1PORT $P2PORT $P3PORT $P4PORT $P5PORT $CAPORT $PEERPEM $CAPEM)" > network-config/network-config-blockgaurdians.json

## prepare connection profile for orginsurance
ORG=insurance
P0PORT=7777
P1PORT=7787
P2PORT=7797
P3PORT=7807
P4PORT=7817
P5PORT=7827
CAPORT=7700
PEERPEM=organizations/peerOrganizations/insurance/tlsca/tlsca.insurance-cert.pem
CAPEM=organizations/peerOrganizations/insurance/ca/ca.insurance-cert.pem

echo "$(json_ccp $ORG $P0PORT $P1PORT $P2PORT $P3PORT $P4PORT $P5PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/insurance/connection-insurance.json
echo "$(yaml_ccp $ORG $P0PORT $P1PORT $P2PORT $P3PORT $P4PORT $P5PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/insurance/connection-insurance.yaml
# save another copy of json connection profile in a different directory
echo "$(json_ccp $ORG $P0PORT $P1PORT $P2PORT $P3PORT $P4PORT $P5PORT $CAPORT $PEERPEM $CAPEM)" > network-config/network-config-insurance.json

## prepare connection profile for orggovernment
ORG=government
P0PORT=8888
P1PORT=8898
P2PORT=8908
P3PORT=8918
P4PORT=8928
P5PORT=8938
CAPORT=8800
PEERPEM=organizations/peerOrganizations/government/tlsca/tlsca.government-cert.pem
CAPEM=organizations/peerOrganizations/government/ca/ca.government-cert.pem

echo "$(json_ccp $ORG $P0PORT $P1PORT $P2PORT $P3PORT $P4PORT $P5PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/government/connection-government.json
echo "$(yaml_ccp $ORG $P0PORT $P1PORT $P2PORT $P3PORT $P4PORT $P5PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/government/connection-government.yaml
# save another copy of json connection profile in a different directory
echo "$(json_ccp $ORG $P0PORT $P1PORT $P2PORT $P3PORT $P4PORT $P5PORT $CAPORT $PEERPEM $CAPEM)" > network-config/network-config-government.json




