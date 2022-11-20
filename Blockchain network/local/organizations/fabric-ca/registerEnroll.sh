#!/bin/bash

function createlandowner() {
  infoln "Enrolling the CA admin"
  mkdir -p organizations/peerOrganizations/landowner/

  export FABRIC_CA_CLIENT_HOME=${PWD}/organizations/peerOrganizations/landowner/


  fabric-ca-client enroll -u https://admin:adminpw@localhost:4400 --caname ca-landowner --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem


  echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-4400-ca-landowner.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-4400-ca-landowner.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-4400-ca-landowner.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-4400-ca-landowner.pem
    OrganizationalUnitIdentifier: orderer' >${PWD}/organizations/peerOrganizations/landowner/msp/config.yaml

  infoln "Registering peer0"

  fabric-ca-client register --caname ca-landowner --id.name peer0 --id.secret peer0pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem


  infoln "Registering peer1"

  fabric-ca-client register --caname ca-landowner --id.name peer1 --id.secret peer1pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem


  infoln "Registering peer2"

  fabric-ca-client register --caname ca-landowner --id.name peer2 --id.secret peer2pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem


  infoln "Registering peer3"

  fabric-ca-client register --caname ca-landowner --id.name peer3 --id.secret peer3pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem


  infoln "Registering peer4"

  fabric-ca-client register --caname ca-landowner --id.name peer4 --id.secret peer4pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem


  infoln "Registering peer5"

  fabric-ca-client register --caname ca-landowner --id.name peer5 --id.secret peer5pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem


  infoln "Registering user"

  fabric-ca-client register --caname ca-landowner --id.name user1 --id.secret user1pw --id.type client --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem


  infoln "Registering the org admin"

  fabric-ca-client register --caname ca-landowner --id.name landowneradmin --id.secret landowneradminpw --id.type admin --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem


  infoln "Generating the peer0 msp"

  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:4400 --caname ca-landowner -M ${PWD}/organizations/peerOrganizations/landowner/peers/peer0.landowner/msp --csr.hosts peer0.landowner --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem


  infoln "Generating the peer1 msp"

  fabric-ca-client enroll -u https://peer1:peer1pw@localhost:4400 --caname ca-landowner -M ${PWD}/organizations/peerOrganizations/landowner/peers/peer1.landowner/msp --csr.hosts peer1.landowner --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem


  infoln "Generating the peer2 msp"

  fabric-ca-client enroll -u https://peer2:peer2pw@localhost:4400 --caname ca-landowner -M ${PWD}/organizations/peerOrganizations/landowner/peers/peer2.landowner/msp --csr.hosts peer2.landowner --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem


  infoln "Generating the peer3 msp"

  fabric-ca-client enroll -u https://peer3:peer3pw@localhost:4400 --caname ca-landowner -M ${PWD}/organizations/peerOrganizations/landowner/peers/peer3.landowner/msp --csr.hosts peer3.landowner --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem


  infoln "Generating the peer4 msp"

  fabric-ca-client enroll -u https://peer4:peer4pw@localhost:4400 --caname ca-landowner -M ${PWD}/organizations/peerOrganizations/landowner/peers/peer4.landowner/msp --csr.hosts peer4.landowner --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem


  infoln "Generating the peer5 msp"

  fabric-ca-client enroll -u https://peer5:peer5pw@localhost:4400 --caname ca-landowner -M ${PWD}/organizations/peerOrganizations/landowner/peers/peer5.landowner/msp --csr.hosts peer5.landowner --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem


  cp ${PWD}/organizations/peerOrganizations/landowner/msp/config.yaml ${PWD}/organizations/peerOrganizations/landowner/peers/peer0.landowner/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/landowner/msp/config.yaml ${PWD}/organizations/peerOrganizations/landowner/peers/peer1.landowner/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/landowner/msp/config.yaml ${PWD}/organizations/peerOrganizations/landowner/peers/peer2.landowner/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/landowner/msp/config.yaml ${PWD}/organizations/peerOrganizations/landowner/peers/peer3.landowner/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/landowner/msp/config.yaml ${PWD}/organizations/peerOrganizations/landowner/peers/peer4.landowner/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/landowner/msp/config.yaml ${PWD}/organizations/peerOrganizations/landowner/peers/peer5.landowner/msp/config.yaml

  infoln "Generating the peer0-tls certificates"
  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:4400 --caname ca-landowner -M ${PWD}/organizations/peerOrganizations/landowner/peers/peer0.landowner/tls --enrollment.profile tls --csr.hosts peer0.landowner --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem

  infoln "Generating the peer1-tls certificates"
  fabric-ca-client enroll -u https://peer1:peer1pw@localhost:4400 --caname ca-landowner -M ${PWD}/organizations/peerOrganizations/landowner/peers/peer1.landowner/tls --enrollment.profile tls --csr.hosts peer1.landowner --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem

  infoln "Generating the peer2-tls certificates"
  fabric-ca-client enroll -u https://peer2:peer2pw@localhost:4400 --caname ca-landowner -M ${PWD}/organizations/peerOrganizations/landowner/peers/peer2.landowner/tls --enrollment.profile tls --csr.hosts peer2.landowner --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem

  infoln "Generating the peer3-tls certificates"
  fabric-ca-client enroll -u https://peer3:peer3pw@localhost:4400 --caname ca-landowner -M ${PWD}/organizations/peerOrganizations/landowner/peers/peer3.landowner/tls --enrollment.profile tls --csr.hosts peer3.landowner --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem

  infoln "Generating the peer4-tls certificates"
  fabric-ca-client enroll -u https://peer4:peer4pw@localhost:4400 --caname ca-landowner -M ${PWD}/organizations/peerOrganizations/landowner/peers/peer4.landowner/tls --enrollment.profile tls --csr.hosts peer4.landowner --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem

  infoln "Generating the peer5-tls certificates"
  fabric-ca-client enroll -u https://peer5:peer5pw@localhost:4400 --caname ca-landowner -M ${PWD}/organizations/peerOrganizations/landowner/peers/peer5.landowner/tls --enrollment.profile tls --csr.hosts peer5.landowner --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem

  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer0.landowner/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/landowner/peers/peer0.landowner/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer0.landowner/tls/signcerts/* ${PWD}/organizations/peerOrganizations/landowner/peers/peer0.landowner/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer0.landowner/tls/keystore/* ${PWD}/organizations/peerOrganizations/landowner/peers/peer0.landowner/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer1.landowner/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/landowner/peers/peer1.landowner/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer1.landowner/tls/signcerts/* ${PWD}/organizations/peerOrganizations/landowner/peers/peer1.landowner/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer1.landowner/tls/keystore/* ${PWD}/organizations/peerOrganizations/landowner/peers/peer1.landowner/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer2.landowner/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/landowner/peers/peer2.landowner/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer2.landowner/tls/signcerts/* ${PWD}/organizations/peerOrganizations/landowner/peers/peer2.landowner/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer2.landowner/tls/keystore/* ${PWD}/organizations/peerOrganizations/landowner/peers/peer2.landowner/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer3.landowner/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/landowner/peers/peer3.landowner/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer3.landowner/tls/signcerts/* ${PWD}/organizations/peerOrganizations/landowner/peers/peer3.landowner/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer3.landowner/tls/keystore/* ${PWD}/organizations/peerOrganizations/landowner/peers/peer3.landowner/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer4.landowner/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/landowner/peers/peer4.landowner/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer4.landowner/tls/signcerts/* ${PWD}/organizations/peerOrganizations/landowner/peers/peer4.landowner/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer4.landowner/tls/keystore/* ${PWD}/organizations/peerOrganizations/landowner/peers/peer4.landowner/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer5.landowner/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/landowner/peers/peer5.landowner/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer5.landowner/tls/signcerts/* ${PWD}/organizations/peerOrganizations/landowner/peers/peer5.landowner/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer5.landowner/tls/keystore/* ${PWD}/organizations/peerOrganizations/landowner/peers/peer5.landowner/tls/server.key



  mkdir -p ${PWD}/organizations/peerOrganizations/landowner/msp/tlscacerts
  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer0.landowner/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/landowner/msp/tlscacerts/ca.crt

  mkdir -p ${PWD}/organizations/peerOrganizations/landowner/tlsca
  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer0.landowner/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/landowner/tlsca/tlsca.landowner-cert.pem

  mkdir -p ${PWD}/organizations/peerOrganizations/landowner/ca
  cp ${PWD}/organizations/peerOrganizations/landowner/peers/peer0.landowner/msp/cacerts/* ${PWD}/organizations/peerOrganizations/landowner/ca/ca.landowner-cert.pem

  infoln "Generating the user msp"

  fabric-ca-client enroll -u https://user1:user1pw@localhost:4400 --caname ca-landowner -M ${PWD}/organizations/peerOrganizations/landowner/users/User1@landowner/msp --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem


  cp ${PWD}/organizations/peerOrganizations/landowner/msp/config.yaml ${PWD}/organizations/peerOrganizations/landowner/users/User1@landowner/msp/config.yaml

  infoln "Generating the org admin msp"

  fabric-ca-client enroll -u https://landowneradmin:landowneradminpw@localhost:4400 --caname ca-landowner -M ${PWD}/organizations/peerOrganizations/landowner/users/Admin@landowner/msp --tls.certfiles ${PWD}/organizations/fabric-ca/landowner/tls-cert.pem


  cp ${PWD}/organizations/peerOrganizations/landowner/msp/config.yaml ${PWD}/organizations/peerOrganizations/landowner/users/Admin@landowner/msp/config.yaml
}
function createlandbuyer() {
  infoln "Enrolling the CA admin"
  mkdir -p organizations/peerOrganizations/landbuyer/

  export FABRIC_CA_CLIENT_HOME=${PWD}/organizations/peerOrganizations/landbuyer/


  fabric-ca-client enroll -u https://admin:adminpw@localhost:5500 --caname ca-landbuyer --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem


  echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-5500-ca-landbuyer.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-5500-ca-landbuyer.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-5500-ca-landbuyer.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-5500-ca-landbuyer.pem
    OrganizationalUnitIdentifier: orderer' >${PWD}/organizations/peerOrganizations/landbuyer/msp/config.yaml

  infoln "Registering peer0"

  fabric-ca-client register --caname ca-landbuyer --id.name peer0 --id.secret peer0pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem


  infoln "Registering peer1"

  fabric-ca-client register --caname ca-landbuyer --id.name peer1 --id.secret peer1pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem


  infoln "Registering peer2"

  fabric-ca-client register --caname ca-landbuyer --id.name peer2 --id.secret peer2pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem


  infoln "Registering peer3"

  fabric-ca-client register --caname ca-landbuyer --id.name peer3 --id.secret peer3pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem


  infoln "Registering peer4"

  fabric-ca-client register --caname ca-landbuyer --id.name peer4 --id.secret peer4pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem


  infoln "Registering peer5"

  fabric-ca-client register --caname ca-landbuyer --id.name peer5 --id.secret peer5pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem


  infoln "Registering user"

  fabric-ca-client register --caname ca-landbuyer --id.name user1 --id.secret user1pw --id.type client --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem


  infoln "Registering the org admin"

  fabric-ca-client register --caname ca-landbuyer --id.name landbuyeradmin --id.secret landbuyeradminpw --id.type admin --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem


  infoln "Generating the peer0 msp"

  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:5500 --caname ca-landbuyer -M ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer0.landbuyer/msp --csr.hosts peer0.landbuyer --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem


  infoln "Generating the peer1 msp"

  fabric-ca-client enroll -u https://peer1:peer1pw@localhost:5500 --caname ca-landbuyer -M ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer1.landbuyer/msp --csr.hosts peer1.landbuyer --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem


  infoln "Generating the peer2 msp"

  fabric-ca-client enroll -u https://peer2:peer2pw@localhost:5500 --caname ca-landbuyer -M ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer2.landbuyer/msp --csr.hosts peer2.landbuyer --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem


  infoln "Generating the peer3 msp"

  fabric-ca-client enroll -u https://peer3:peer3pw@localhost:5500 --caname ca-landbuyer -M ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer3.landbuyer/msp --csr.hosts peer3.landbuyer --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem


  infoln "Generating the peer4 msp"

  fabric-ca-client enroll -u https://peer4:peer4pw@localhost:5500 --caname ca-landbuyer -M ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer4.landbuyer/msp --csr.hosts peer4.landbuyer --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem


  infoln "Generating the peer5 msp"

  fabric-ca-client enroll -u https://peer5:peer5pw@localhost:5500 --caname ca-landbuyer -M ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer5.landbuyer/msp --csr.hosts peer5.landbuyer --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem


  cp ${PWD}/organizations/peerOrganizations/landbuyer/msp/config.yaml ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer0.landbuyer/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/landbuyer/msp/config.yaml ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer1.landbuyer/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/landbuyer/msp/config.yaml ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer2.landbuyer/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/landbuyer/msp/config.yaml ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer3.landbuyer/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/landbuyer/msp/config.yaml ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer4.landbuyer/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/landbuyer/msp/config.yaml ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer5.landbuyer/msp/config.yaml

  infoln "Generating the peer0-tls certificates"
  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:5500 --caname ca-landbuyer -M ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer0.landbuyer/tls --enrollment.profile tls --csr.hosts peer0.landbuyer --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem

  infoln "Generating the peer1-tls certificates"
  fabric-ca-client enroll -u https://peer1:peer1pw@localhost:5500 --caname ca-landbuyer -M ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer1.landbuyer/tls --enrollment.profile tls --csr.hosts peer1.landbuyer --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem

  infoln "Generating the peer2-tls certificates"
  fabric-ca-client enroll -u https://peer2:peer2pw@localhost:5500 --caname ca-landbuyer -M ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer2.landbuyer/tls --enrollment.profile tls --csr.hosts peer2.landbuyer --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem

  infoln "Generating the peer3-tls certificates"
  fabric-ca-client enroll -u https://peer3:peer3pw@localhost:5500 --caname ca-landbuyer -M ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer3.landbuyer/tls --enrollment.profile tls --csr.hosts peer3.landbuyer --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem

  infoln "Generating the peer4-tls certificates"
  fabric-ca-client enroll -u https://peer4:peer4pw@localhost:5500 --caname ca-landbuyer -M ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer4.landbuyer/tls --enrollment.profile tls --csr.hosts peer4.landbuyer --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem

  infoln "Generating the peer5-tls certificates"
  fabric-ca-client enroll -u https://peer5:peer5pw@localhost:5500 --caname ca-landbuyer -M ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer5.landbuyer/tls --enrollment.profile tls --csr.hosts peer5.landbuyer --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem

  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer0.landbuyer/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer0.landbuyer/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer0.landbuyer/tls/signcerts/* ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer0.landbuyer/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer0.landbuyer/tls/keystore/* ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer0.landbuyer/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer1.landbuyer/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer1.landbuyer/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer1.landbuyer/tls/signcerts/* ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer1.landbuyer/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer1.landbuyer/tls/keystore/* ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer1.landbuyer/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer2.landbuyer/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer2.landbuyer/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer2.landbuyer/tls/signcerts/* ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer2.landbuyer/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer2.landbuyer/tls/keystore/* ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer2.landbuyer/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer3.landbuyer/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer3.landbuyer/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer3.landbuyer/tls/signcerts/* ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer3.landbuyer/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer3.landbuyer/tls/keystore/* ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer3.landbuyer/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer4.landbuyer/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer4.landbuyer/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer4.landbuyer/tls/signcerts/* ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer4.landbuyer/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer4.landbuyer/tls/keystore/* ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer4.landbuyer/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer5.landbuyer/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer5.landbuyer/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer5.landbuyer/tls/signcerts/* ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer5.landbuyer/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer5.landbuyer/tls/keystore/* ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer5.landbuyer/tls/server.key



  mkdir -p ${PWD}/organizations/peerOrganizations/landbuyer/msp/tlscacerts
  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer0.landbuyer/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/landbuyer/msp/tlscacerts/ca.crt

  mkdir -p ${PWD}/organizations/peerOrganizations/landbuyer/tlsca
  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer0.landbuyer/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/landbuyer/tlsca/tlsca.landbuyer-cert.pem

  mkdir -p ${PWD}/organizations/peerOrganizations/landbuyer/ca
  cp ${PWD}/organizations/peerOrganizations/landbuyer/peers/peer0.landbuyer/msp/cacerts/* ${PWD}/organizations/peerOrganizations/landbuyer/ca/ca.landbuyer-cert.pem

  infoln "Generating the user msp"

  fabric-ca-client enroll -u https://user1:user1pw@localhost:5500 --caname ca-landbuyer -M ${PWD}/organizations/peerOrganizations/landbuyer/users/User1@landbuyer/msp --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem


  cp ${PWD}/organizations/peerOrganizations/landbuyer/msp/config.yaml ${PWD}/organizations/peerOrganizations/landbuyer/users/User1@landbuyer/msp/config.yaml

  infoln "Generating the org admin msp"

  fabric-ca-client enroll -u https://landbuyeradmin:landbuyeradminpw@localhost:5500 --caname ca-landbuyer -M ${PWD}/organizations/peerOrganizations/landbuyer/users/Admin@landbuyer/msp --tls.certfiles ${PWD}/organizations/fabric-ca/landbuyer/tls-cert.pem


  cp ${PWD}/organizations/peerOrganizations/landbuyer/msp/config.yaml ${PWD}/organizations/peerOrganizations/landbuyer/users/Admin@landbuyer/msp/config.yaml
}
function createblockgaurdians() {
  infoln "Enrolling the CA admin"
  mkdir -p organizations/peerOrganizations/blockgaurdians/

  export FABRIC_CA_CLIENT_HOME=${PWD}/organizations/peerOrganizations/blockgaurdians/


  fabric-ca-client enroll -u https://admin:adminpw@localhost:6600 --caname ca-blockgaurdians --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem


  echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-6600-ca-blockgaurdians.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-6600-ca-blockgaurdians.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-6600-ca-blockgaurdians.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-6600-ca-blockgaurdians.pem
    OrganizationalUnitIdentifier: orderer' >${PWD}/organizations/peerOrganizations/blockgaurdians/msp/config.yaml

  infoln "Registering peer0"

  fabric-ca-client register --caname ca-blockgaurdians --id.name peer0 --id.secret peer0pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem


  infoln "Registering peer1"

  fabric-ca-client register --caname ca-blockgaurdians --id.name peer1 --id.secret peer1pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem


  infoln "Registering peer2"

  fabric-ca-client register --caname ca-blockgaurdians --id.name peer2 --id.secret peer2pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem


  infoln "Registering peer3"

  fabric-ca-client register --caname ca-blockgaurdians --id.name peer3 --id.secret peer3pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem


  infoln "Registering peer4"

  fabric-ca-client register --caname ca-blockgaurdians --id.name peer4 --id.secret peer4pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem


  infoln "Registering peer5"

  fabric-ca-client register --caname ca-blockgaurdians --id.name peer5 --id.secret peer5pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem


  infoln "Registering user"

  fabric-ca-client register --caname ca-blockgaurdians --id.name user1 --id.secret user1pw --id.type client --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem


  infoln "Registering the org admin"

  fabric-ca-client register --caname ca-blockgaurdians --id.name blockgaurdiansadmin --id.secret blockgaurdiansadminpw --id.type admin --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem


  infoln "Generating the peer0 msp"

  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:6600 --caname ca-blockgaurdians -M ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer0.blockgaurdians/msp --csr.hosts peer0.blockgaurdians --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem


  infoln "Generating the peer1 msp"

  fabric-ca-client enroll -u https://peer1:peer1pw@localhost:6600 --caname ca-blockgaurdians -M ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer1.blockgaurdians/msp --csr.hosts peer1.blockgaurdians --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem


  infoln "Generating the peer2 msp"

  fabric-ca-client enroll -u https://peer2:peer2pw@localhost:6600 --caname ca-blockgaurdians -M ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer2.blockgaurdians/msp --csr.hosts peer2.blockgaurdians --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem


  infoln "Generating the peer3 msp"

  fabric-ca-client enroll -u https://peer3:peer3pw@localhost:6600 --caname ca-blockgaurdians -M ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer3.blockgaurdians/msp --csr.hosts peer3.blockgaurdians --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem


  infoln "Generating the peer4 msp"

  fabric-ca-client enroll -u https://peer4:peer4pw@localhost:6600 --caname ca-blockgaurdians -M ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer4.blockgaurdians/msp --csr.hosts peer4.blockgaurdians --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem


  infoln "Generating the peer5 msp"

  fabric-ca-client enroll -u https://peer5:peer5pw@localhost:6600 --caname ca-blockgaurdians -M ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer5.blockgaurdians/msp --csr.hosts peer5.blockgaurdians --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem


  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/msp/config.yaml ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer0.blockgaurdians/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/msp/config.yaml ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer1.blockgaurdians/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/msp/config.yaml ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer2.blockgaurdians/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/msp/config.yaml ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer3.blockgaurdians/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/msp/config.yaml ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer4.blockgaurdians/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/msp/config.yaml ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer5.blockgaurdians/msp/config.yaml

  infoln "Generating the peer0-tls certificates"
  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:6600 --caname ca-blockgaurdians -M ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer0.blockgaurdians/tls --enrollment.profile tls --csr.hosts peer0.blockgaurdians --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem

  infoln "Generating the peer1-tls certificates"
  fabric-ca-client enroll -u https://peer1:peer1pw@localhost:6600 --caname ca-blockgaurdians -M ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer1.blockgaurdians/tls --enrollment.profile tls --csr.hosts peer1.blockgaurdians --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem

  infoln "Generating the peer2-tls certificates"
  fabric-ca-client enroll -u https://peer2:peer2pw@localhost:6600 --caname ca-blockgaurdians -M ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer2.blockgaurdians/tls --enrollment.profile tls --csr.hosts peer2.blockgaurdians --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem

  infoln "Generating the peer3-tls certificates"
  fabric-ca-client enroll -u https://peer3:peer3pw@localhost:6600 --caname ca-blockgaurdians -M ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer3.blockgaurdians/tls --enrollment.profile tls --csr.hosts peer3.blockgaurdians --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem

  infoln "Generating the peer4-tls certificates"
  fabric-ca-client enroll -u https://peer4:peer4pw@localhost:6600 --caname ca-blockgaurdians -M ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer4.blockgaurdians/tls --enrollment.profile tls --csr.hosts peer4.blockgaurdians --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem

  infoln "Generating the peer5-tls certificates"
  fabric-ca-client enroll -u https://peer5:peer5pw@localhost:6600 --caname ca-blockgaurdians -M ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer5.blockgaurdians/tls --enrollment.profile tls --csr.hosts peer5.blockgaurdians --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem

  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer0.blockgaurdians/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer0.blockgaurdians/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer0.blockgaurdians/tls/signcerts/* ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer0.blockgaurdians/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer0.blockgaurdians/tls/keystore/* ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer0.blockgaurdians/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer1.blockgaurdians/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer1.blockgaurdians/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer1.blockgaurdians/tls/signcerts/* ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer1.blockgaurdians/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer1.blockgaurdians/tls/keystore/* ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer1.blockgaurdians/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer2.blockgaurdians/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer2.blockgaurdians/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer2.blockgaurdians/tls/signcerts/* ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer2.blockgaurdians/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer2.blockgaurdians/tls/keystore/* ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer2.blockgaurdians/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer3.blockgaurdians/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer3.blockgaurdians/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer3.blockgaurdians/tls/signcerts/* ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer3.blockgaurdians/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer3.blockgaurdians/tls/keystore/* ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer3.blockgaurdians/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer4.blockgaurdians/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer4.blockgaurdians/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer4.blockgaurdians/tls/signcerts/* ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer4.blockgaurdians/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer4.blockgaurdians/tls/keystore/* ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer4.blockgaurdians/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer5.blockgaurdians/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer5.blockgaurdians/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer5.blockgaurdians/tls/signcerts/* ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer5.blockgaurdians/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer5.blockgaurdians/tls/keystore/* ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer5.blockgaurdians/tls/server.key



  mkdir -p ${PWD}/organizations/peerOrganizations/blockgaurdians/msp/tlscacerts
  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer0.blockgaurdians/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/blockgaurdians/msp/tlscacerts/ca.crt

  mkdir -p ${PWD}/organizations/peerOrganizations/blockgaurdians/tlsca
  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer0.blockgaurdians/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/blockgaurdians/tlsca/tlsca.blockgaurdians-cert.pem

  mkdir -p ${PWD}/organizations/peerOrganizations/blockgaurdians/ca
  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/peers/peer0.blockgaurdians/msp/cacerts/* ${PWD}/organizations/peerOrganizations/blockgaurdians/ca/ca.blockgaurdians-cert.pem

  infoln "Generating the user msp"

  fabric-ca-client enroll -u https://user1:user1pw@localhost:6600 --caname ca-blockgaurdians -M ${PWD}/organizations/peerOrganizations/blockgaurdians/users/User1@blockgaurdians/msp --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem


  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/msp/config.yaml ${PWD}/organizations/peerOrganizations/blockgaurdians/users/User1@blockgaurdians/msp/config.yaml

  infoln "Generating the org admin msp"

  fabric-ca-client enroll -u https://blockgaurdiansadmin:blockgaurdiansadminpw@localhost:6600 --caname ca-blockgaurdians -M ${PWD}/organizations/peerOrganizations/blockgaurdians/users/Admin@blockgaurdians/msp --tls.certfiles ${PWD}/organizations/fabric-ca/blockgaurdians/tls-cert.pem


  cp ${PWD}/organizations/peerOrganizations/blockgaurdians/msp/config.yaml ${PWD}/organizations/peerOrganizations/blockgaurdians/users/Admin@blockgaurdians/msp/config.yaml
}
function createinsurance() {
  infoln "Enrolling the CA admin"
  mkdir -p organizations/peerOrganizations/insurance/

  export FABRIC_CA_CLIENT_HOME=${PWD}/organizations/peerOrganizations/insurance/


  fabric-ca-client enroll -u https://admin:adminpw@localhost:7700 --caname ca-insurance --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem


  echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-7700-ca-insurance.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-7700-ca-insurance.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-7700-ca-insurance.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-7700-ca-insurance.pem
    OrganizationalUnitIdentifier: orderer' >${PWD}/organizations/peerOrganizations/insurance/msp/config.yaml

  infoln "Registering peer0"

  fabric-ca-client register --caname ca-insurance --id.name peer0 --id.secret peer0pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem


  infoln "Registering peer1"

  fabric-ca-client register --caname ca-insurance --id.name peer1 --id.secret peer1pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem


  infoln "Registering peer2"

  fabric-ca-client register --caname ca-insurance --id.name peer2 --id.secret peer2pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem


  infoln "Registering peer3"

  fabric-ca-client register --caname ca-insurance --id.name peer3 --id.secret peer3pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem


  infoln "Registering peer4"

  fabric-ca-client register --caname ca-insurance --id.name peer4 --id.secret peer4pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem


  infoln "Registering peer5"

  fabric-ca-client register --caname ca-insurance --id.name peer5 --id.secret peer5pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem


  infoln "Registering user"

  fabric-ca-client register --caname ca-insurance --id.name user1 --id.secret user1pw --id.type client --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem


  infoln "Registering the org admin"

  fabric-ca-client register --caname ca-insurance --id.name insuranceadmin --id.secret insuranceadminpw --id.type admin --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem


  infoln "Generating the peer0 msp"

  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:7700 --caname ca-insurance -M ${PWD}/organizations/peerOrganizations/insurance/peers/peer0.insurance/msp --csr.hosts peer0.insurance --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem


  infoln "Generating the peer1 msp"

  fabric-ca-client enroll -u https://peer1:peer1pw@localhost:7700 --caname ca-insurance -M ${PWD}/organizations/peerOrganizations/insurance/peers/peer1.insurance/msp --csr.hosts peer1.insurance --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem


  infoln "Generating the peer2 msp"

  fabric-ca-client enroll -u https://peer2:peer2pw@localhost:7700 --caname ca-insurance -M ${PWD}/organizations/peerOrganizations/insurance/peers/peer2.insurance/msp --csr.hosts peer2.insurance --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem


  infoln "Generating the peer3 msp"

  fabric-ca-client enroll -u https://peer3:peer3pw@localhost:7700 --caname ca-insurance -M ${PWD}/organizations/peerOrganizations/insurance/peers/peer3.insurance/msp --csr.hosts peer3.insurance --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem


  infoln "Generating the peer4 msp"

  fabric-ca-client enroll -u https://peer4:peer4pw@localhost:7700 --caname ca-insurance -M ${PWD}/organizations/peerOrganizations/insurance/peers/peer4.insurance/msp --csr.hosts peer4.insurance --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem


  infoln "Generating the peer5 msp"

  fabric-ca-client enroll -u https://peer5:peer5pw@localhost:7700 --caname ca-insurance -M ${PWD}/organizations/peerOrganizations/insurance/peers/peer5.insurance/msp --csr.hosts peer5.insurance --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem


  cp ${PWD}/organizations/peerOrganizations/insurance/msp/config.yaml ${PWD}/organizations/peerOrganizations/insurance/peers/peer0.insurance/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/insurance/msp/config.yaml ${PWD}/organizations/peerOrganizations/insurance/peers/peer1.insurance/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/insurance/msp/config.yaml ${PWD}/organizations/peerOrganizations/insurance/peers/peer2.insurance/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/insurance/msp/config.yaml ${PWD}/organizations/peerOrganizations/insurance/peers/peer3.insurance/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/insurance/msp/config.yaml ${PWD}/organizations/peerOrganizations/insurance/peers/peer4.insurance/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/insurance/msp/config.yaml ${PWD}/organizations/peerOrganizations/insurance/peers/peer5.insurance/msp/config.yaml

  infoln "Generating the peer0-tls certificates"
  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:7700 --caname ca-insurance -M ${PWD}/organizations/peerOrganizations/insurance/peers/peer0.insurance/tls --enrollment.profile tls --csr.hosts peer0.insurance --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem

  infoln "Generating the peer1-tls certificates"
  fabric-ca-client enroll -u https://peer1:peer1pw@localhost:7700 --caname ca-insurance -M ${PWD}/organizations/peerOrganizations/insurance/peers/peer1.insurance/tls --enrollment.profile tls --csr.hosts peer1.insurance --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem

  infoln "Generating the peer2-tls certificates"
  fabric-ca-client enroll -u https://peer2:peer2pw@localhost:7700 --caname ca-insurance -M ${PWD}/organizations/peerOrganizations/insurance/peers/peer2.insurance/tls --enrollment.profile tls --csr.hosts peer2.insurance --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem

  infoln "Generating the peer3-tls certificates"
  fabric-ca-client enroll -u https://peer3:peer3pw@localhost:7700 --caname ca-insurance -M ${PWD}/organizations/peerOrganizations/insurance/peers/peer3.insurance/tls --enrollment.profile tls --csr.hosts peer3.insurance --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem

  infoln "Generating the peer4-tls certificates"
  fabric-ca-client enroll -u https://peer4:peer4pw@localhost:7700 --caname ca-insurance -M ${PWD}/organizations/peerOrganizations/insurance/peers/peer4.insurance/tls --enrollment.profile tls --csr.hosts peer4.insurance --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem

  infoln "Generating the peer5-tls certificates"
  fabric-ca-client enroll -u https://peer5:peer5pw@localhost:7700 --caname ca-insurance -M ${PWD}/organizations/peerOrganizations/insurance/peers/peer5.insurance/tls --enrollment.profile tls --csr.hosts peer5.insurance --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem

  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer0.insurance/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/insurance/peers/peer0.insurance/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer0.insurance/tls/signcerts/* ${PWD}/organizations/peerOrganizations/insurance/peers/peer0.insurance/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer0.insurance/tls/keystore/* ${PWD}/organizations/peerOrganizations/insurance/peers/peer0.insurance/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer1.insurance/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/insurance/peers/peer1.insurance/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer1.insurance/tls/signcerts/* ${PWD}/organizations/peerOrganizations/insurance/peers/peer1.insurance/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer1.insurance/tls/keystore/* ${PWD}/organizations/peerOrganizations/insurance/peers/peer1.insurance/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer2.insurance/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/insurance/peers/peer2.insurance/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer2.insurance/tls/signcerts/* ${PWD}/organizations/peerOrganizations/insurance/peers/peer2.insurance/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer2.insurance/tls/keystore/* ${PWD}/organizations/peerOrganizations/insurance/peers/peer2.insurance/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer3.insurance/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/insurance/peers/peer3.insurance/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer3.insurance/tls/signcerts/* ${PWD}/organizations/peerOrganizations/insurance/peers/peer3.insurance/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer3.insurance/tls/keystore/* ${PWD}/organizations/peerOrganizations/insurance/peers/peer3.insurance/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer4.insurance/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/insurance/peers/peer4.insurance/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer4.insurance/tls/signcerts/* ${PWD}/organizations/peerOrganizations/insurance/peers/peer4.insurance/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer4.insurance/tls/keystore/* ${PWD}/organizations/peerOrganizations/insurance/peers/peer4.insurance/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer5.insurance/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/insurance/peers/peer5.insurance/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer5.insurance/tls/signcerts/* ${PWD}/organizations/peerOrganizations/insurance/peers/peer5.insurance/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer5.insurance/tls/keystore/* ${PWD}/organizations/peerOrganizations/insurance/peers/peer5.insurance/tls/server.key



  mkdir -p ${PWD}/organizations/peerOrganizations/insurance/msp/tlscacerts
  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer0.insurance/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/insurance/msp/tlscacerts/ca.crt

  mkdir -p ${PWD}/organizations/peerOrganizations/insurance/tlsca
  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer0.insurance/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/insurance/tlsca/tlsca.insurance-cert.pem

  mkdir -p ${PWD}/organizations/peerOrganizations/insurance/ca
  cp ${PWD}/organizations/peerOrganizations/insurance/peers/peer0.insurance/msp/cacerts/* ${PWD}/organizations/peerOrganizations/insurance/ca/ca.insurance-cert.pem

  infoln "Generating the user msp"

  fabric-ca-client enroll -u https://user1:user1pw@localhost:7700 --caname ca-insurance -M ${PWD}/organizations/peerOrganizations/insurance/users/User1@insurance/msp --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem


  cp ${PWD}/organizations/peerOrganizations/insurance/msp/config.yaml ${PWD}/organizations/peerOrganizations/insurance/users/User1@insurance/msp/config.yaml

  infoln "Generating the org admin msp"

  fabric-ca-client enroll -u https://insuranceadmin:insuranceadminpw@localhost:7700 --caname ca-insurance -M ${PWD}/organizations/peerOrganizations/insurance/users/Admin@insurance/msp --tls.certfiles ${PWD}/organizations/fabric-ca/insurance/tls-cert.pem


  cp ${PWD}/organizations/peerOrganizations/insurance/msp/config.yaml ${PWD}/organizations/peerOrganizations/insurance/users/Admin@insurance/msp/config.yaml
}
function creategovernment() {
  infoln "Enrolling the CA admin"
  mkdir -p organizations/peerOrganizations/government/

  export FABRIC_CA_CLIENT_HOME=${PWD}/organizations/peerOrganizations/government/


  fabric-ca-client enroll -u https://admin:adminpw@localhost:8800 --caname ca-government --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem


  echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-8800-ca-government.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-8800-ca-government.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-8800-ca-government.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-8800-ca-government.pem
    OrganizationalUnitIdentifier: orderer' >${PWD}/organizations/peerOrganizations/government/msp/config.yaml

  infoln "Registering peer0"

  fabric-ca-client register --caname ca-government --id.name peer0 --id.secret peer0pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem


  infoln "Registering peer1"

  fabric-ca-client register --caname ca-government --id.name peer1 --id.secret peer1pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem


  infoln "Registering peer2"

  fabric-ca-client register --caname ca-government --id.name peer2 --id.secret peer2pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem


  infoln "Registering peer3"

  fabric-ca-client register --caname ca-government --id.name peer3 --id.secret peer3pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem


  infoln "Registering peer4"

  fabric-ca-client register --caname ca-government --id.name peer4 --id.secret peer4pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem


  infoln "Registering peer5"

  fabric-ca-client register --caname ca-government --id.name peer5 --id.secret peer5pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem


  infoln "Registering user"

  fabric-ca-client register --caname ca-government --id.name user1 --id.secret user1pw --id.type client --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem


  infoln "Registering the org admin"

  fabric-ca-client register --caname ca-government --id.name governmentadmin --id.secret governmentadminpw --id.type admin --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem


  infoln "Generating the peer0 msp"

  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:8800 --caname ca-government -M ${PWD}/organizations/peerOrganizations/government/peers/peer0.government/msp --csr.hosts peer0.government --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem


  infoln "Generating the peer1 msp"

  fabric-ca-client enroll -u https://peer1:peer1pw@localhost:8800 --caname ca-government -M ${PWD}/organizations/peerOrganizations/government/peers/peer1.government/msp --csr.hosts peer1.government --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem


  infoln "Generating the peer2 msp"

  fabric-ca-client enroll -u https://peer2:peer2pw@localhost:8800 --caname ca-government -M ${PWD}/organizations/peerOrganizations/government/peers/peer2.government/msp --csr.hosts peer2.government --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem


  infoln "Generating the peer3 msp"

  fabric-ca-client enroll -u https://peer3:peer3pw@localhost:8800 --caname ca-government -M ${PWD}/organizations/peerOrganizations/government/peers/peer3.government/msp --csr.hosts peer3.government --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem


  infoln "Generating the peer4 msp"

  fabric-ca-client enroll -u https://peer4:peer4pw@localhost:8800 --caname ca-government -M ${PWD}/organizations/peerOrganizations/government/peers/peer4.government/msp --csr.hosts peer4.government --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem


  infoln "Generating the peer5 msp"

  fabric-ca-client enroll -u https://peer5:peer5pw@localhost:8800 --caname ca-government -M ${PWD}/organizations/peerOrganizations/government/peers/peer5.government/msp --csr.hosts peer5.government --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem


  cp ${PWD}/organizations/peerOrganizations/government/msp/config.yaml ${PWD}/organizations/peerOrganizations/government/peers/peer0.government/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/government/msp/config.yaml ${PWD}/organizations/peerOrganizations/government/peers/peer1.government/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/government/msp/config.yaml ${PWD}/organizations/peerOrganizations/government/peers/peer2.government/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/government/msp/config.yaml ${PWD}/organizations/peerOrganizations/government/peers/peer3.government/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/government/msp/config.yaml ${PWD}/organizations/peerOrganizations/government/peers/peer4.government/msp/config.yaml
  cp ${PWD}/organizations/peerOrganizations/government/msp/config.yaml ${PWD}/organizations/peerOrganizations/government/peers/peer5.government/msp/config.yaml

  infoln "Generating the peer0-tls certificates"
  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:8800 --caname ca-government -M ${PWD}/organizations/peerOrganizations/government/peers/peer0.government/tls --enrollment.profile tls --csr.hosts peer0.government --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem

  infoln "Generating the peer1-tls certificates"
  fabric-ca-client enroll -u https://peer1:peer1pw@localhost:8800 --caname ca-government -M ${PWD}/organizations/peerOrganizations/government/peers/peer1.government/tls --enrollment.profile tls --csr.hosts peer1.government --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem

  infoln "Generating the peer2-tls certificates"
  fabric-ca-client enroll -u https://peer2:peer2pw@localhost:8800 --caname ca-government -M ${PWD}/organizations/peerOrganizations/government/peers/peer2.government/tls --enrollment.profile tls --csr.hosts peer2.government --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem

  infoln "Generating the peer3-tls certificates"
  fabric-ca-client enroll -u https://peer3:peer3pw@localhost:8800 --caname ca-government -M ${PWD}/organizations/peerOrganizations/government/peers/peer3.government/tls --enrollment.profile tls --csr.hosts peer3.government --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem

  infoln "Generating the peer4-tls certificates"
  fabric-ca-client enroll -u https://peer4:peer4pw@localhost:8800 --caname ca-government -M ${PWD}/organizations/peerOrganizations/government/peers/peer4.government/tls --enrollment.profile tls --csr.hosts peer4.government --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem

  infoln "Generating the peer5-tls certificates"
  fabric-ca-client enroll -u https://peer5:peer5pw@localhost:8800 --caname ca-government -M ${PWD}/organizations/peerOrganizations/government/peers/peer5.government/tls --enrollment.profile tls --csr.hosts peer5.government --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem

  cp ${PWD}/organizations/peerOrganizations/government/peers/peer0.government/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/government/peers/peer0.government/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/government/peers/peer0.government/tls/signcerts/* ${PWD}/organizations/peerOrganizations/government/peers/peer0.government/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/government/peers/peer0.government/tls/keystore/* ${PWD}/organizations/peerOrganizations/government/peers/peer0.government/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/government/peers/peer1.government/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/government/peers/peer1.government/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/government/peers/peer1.government/tls/signcerts/* ${PWD}/organizations/peerOrganizations/government/peers/peer1.government/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/government/peers/peer1.government/tls/keystore/* ${PWD}/organizations/peerOrganizations/government/peers/peer1.government/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/government/peers/peer2.government/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/government/peers/peer2.government/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/government/peers/peer2.government/tls/signcerts/* ${PWD}/organizations/peerOrganizations/government/peers/peer2.government/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/government/peers/peer2.government/tls/keystore/* ${PWD}/organizations/peerOrganizations/government/peers/peer2.government/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/government/peers/peer3.government/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/government/peers/peer3.government/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/government/peers/peer3.government/tls/signcerts/* ${PWD}/organizations/peerOrganizations/government/peers/peer3.government/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/government/peers/peer3.government/tls/keystore/* ${PWD}/organizations/peerOrganizations/government/peers/peer3.government/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/government/peers/peer4.government/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/government/peers/peer4.government/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/government/peers/peer4.government/tls/signcerts/* ${PWD}/organizations/peerOrganizations/government/peers/peer4.government/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/government/peers/peer4.government/tls/keystore/* ${PWD}/organizations/peerOrganizations/government/peers/peer4.government/tls/server.key



  cp ${PWD}/organizations/peerOrganizations/government/peers/peer5.government/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/government/peers/peer5.government/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/government/peers/peer5.government/tls/signcerts/* ${PWD}/organizations/peerOrganizations/government/peers/peer5.government/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/government/peers/peer5.government/tls/keystore/* ${PWD}/organizations/peerOrganizations/government/peers/peer5.government/tls/server.key



  mkdir -p ${PWD}/organizations/peerOrganizations/government/msp/tlscacerts
  cp ${PWD}/organizations/peerOrganizations/government/peers/peer0.government/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/government/msp/tlscacerts/ca.crt

  mkdir -p ${PWD}/organizations/peerOrganizations/government/tlsca
  cp ${PWD}/organizations/peerOrganizations/government/peers/peer0.government/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/government/tlsca/tlsca.government-cert.pem

  mkdir -p ${PWD}/organizations/peerOrganizations/government/ca
  cp ${PWD}/organizations/peerOrganizations/government/peers/peer0.government/msp/cacerts/* ${PWD}/organizations/peerOrganizations/government/ca/ca.government-cert.pem

  infoln "Generating the user msp"

  fabric-ca-client enroll -u https://user1:user1pw@localhost:8800 --caname ca-government -M ${PWD}/organizations/peerOrganizations/government/users/User1@government/msp --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem


  cp ${PWD}/organizations/peerOrganizations/government/msp/config.yaml ${PWD}/organizations/peerOrganizations/government/users/User1@government/msp/config.yaml

  infoln "Generating the org admin msp"

  fabric-ca-client enroll -u https://governmentadmin:governmentadminpw@localhost:8800 --caname ca-government -M ${PWD}/organizations/peerOrganizations/government/users/Admin@government/msp --tls.certfiles ${PWD}/organizations/fabric-ca/government/tls-cert.pem


  cp ${PWD}/organizations/peerOrganizations/government/msp/config.yaml ${PWD}/organizations/peerOrganizations/government/users/Admin@government/msp/config.yaml
}
function createorderer1() {
  infoln "Enrolling the CA admin"
  mkdir -p organizations/ordererOrganizations/orderer1

  export FABRIC_CA_CLIENT_HOME=${PWD}/organizations/ordererOrganizations/orderer1


  fabric-ca-client enroll -u https://admin:adminpw@localhost:2200 --caname ca-orderer1 --tls.certfiles ${PWD}/organizations/fabric-ca/orderer1/tls-cert.pem


  echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-2200-ca-orderer1.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-2200-ca-orderer1.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-2200-ca-orderer1.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-2200-ca-orderer1.pem
    OrganizationalUnitIdentifier: orderer' >${PWD}/organizations/ordererOrganizations/orderer1/msp/config.yaml

  infoln "Registering orderer"

  fabric-ca-client register --caname ca-orderer1 --id.name orderer --id.secret ordererpw --id.type orderer --tls.certfiles ${PWD}/organizations/fabric-ca/orderer1/tls-cert.pem


  infoln "Registering the orderer admin"

  fabric-ca-client register --caname ca-orderer1 --id.name ordererAdmin --id.secret ordererAdminpw --id.type admin --tls.certfiles ${PWD}/organizations/fabric-ca/orderer1/tls-cert.pem


  infoln "Generating the orderer msp"

  fabric-ca-client enroll -u https://orderer:ordererpw@localhost:2200 --caname ca-orderer1 -M ${PWD}/organizations/ordererOrganizations/orderer1/config.orderers/msp --csr.hosts orderer1 --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/orderer1/tls-cert.pem


  cp ${PWD}/organizations/ordererOrganizations/orderer1/msp/config.yaml ${PWD}/organizations/ordererOrganizations/orderer1/config.orderers/msp/config.yaml

  infoln "Generating the orderer-tls certificates"

  fabric-ca-client enroll -u https://orderer:ordererpw@localhost:2200 --caname ca-orderer1 -M ${PWD}/organizations/ordererOrganizations/orderer1/config.orderers/tls --enrollment.profile tls --csr.hosts orderer1 --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/orderer1/tls-cert.pem


  cp ${PWD}/organizations/ordererOrganizations/orderer1/config.orderers/tls/tlscacerts/* ${PWD}/organizations/ordererOrganizations/orderer1/config.orderers/tls/ca.crt
  cp ${PWD}/organizations/ordererOrganizations/orderer1/config.orderers/tls/signcerts/* ${PWD}/organizations/ordererOrganizations/orderer1/config.orderers/tls/server.crt
  cp ${PWD}/organizations/ordererOrganizations/orderer1/config.orderers/tls/keystore/* ${PWD}/organizations/ordererOrganizations/orderer1/config.orderers/tls/server.key

  mkdir -p ${PWD}/organizations/ordererOrganizations/orderer1/config.orderers/msp/tlscacerts
  cp ${PWD}/organizations/ordererOrganizations/orderer1/config.orderers/tls/tlscacerts/* ${PWD}/organizations/ordererOrganizations/orderer1/config.orderers/msp/tlscacerts/tlsca-cert.pem

  mkdir -p ${PWD}/organizations/ordererOrganizations/orderer1/msp/tlscacerts
  cp ${PWD}/organizations/ordererOrganizations/orderer1/config.orderers/tls/tlscacerts/* ${PWD}/organizations/ordererOrganizations/orderer1/msp/tlscacerts/tlsca-cert.pem

  infoln "Generating the admin msp"

  fabric-ca-client enroll -u https://ordererAdmin:ordererAdminpw@localhost:2200 --caname ca-orderer1 -M ${PWD}/organizations/ordererOrganizations/orderer1/users/Admin@example.com/msp --tls.certfiles ${PWD}/organizations/fabric-ca/orderer1/tls-cert.pem


  cp ${PWD}/organizations/ordererOrganizations/orderer1/msp/config.yaml ${PWD}/organizations/ordererOrganizations/orderer1/users/Admin@example.com/msp/config.yaml
}
function createorderer2() {
  infoln "Enrolling the CA admin"
  mkdir -p organizations/ordererOrganizations/orderer2

  export FABRIC_CA_CLIENT_HOME=${PWD}/organizations/ordererOrganizations/orderer2


  fabric-ca-client enroll -u https://admin:adminpw@localhost:2201 --caname ca-orderer2 --tls.certfiles ${PWD}/organizations/fabric-ca/orderer2/tls-cert.pem


  echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-2201-ca-orderer2.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-2201-ca-orderer2.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-2201-ca-orderer2.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-2201-ca-orderer2.pem
    OrganizationalUnitIdentifier: orderer' >${PWD}/organizations/ordererOrganizations/orderer2/msp/config.yaml

  infoln "Registering orderer"

  fabric-ca-client register --caname ca-orderer2 --id.name orderer --id.secret ordererpw --id.type orderer --tls.certfiles ${PWD}/organizations/fabric-ca/orderer2/tls-cert.pem


  infoln "Registering the orderer admin"

  fabric-ca-client register --caname ca-orderer2 --id.name ordererAdmin --id.secret ordererAdminpw --id.type admin --tls.certfiles ${PWD}/organizations/fabric-ca/orderer2/tls-cert.pem


  infoln "Generating the orderer msp"

  fabric-ca-client enroll -u https://orderer:ordererpw@localhost:2201 --caname ca-orderer2 -M ${PWD}/organizations/ordererOrganizations/orderer2/config.orderers/msp --csr.hosts orderer2 --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/orderer2/tls-cert.pem


  cp ${PWD}/organizations/ordererOrganizations/orderer2/msp/config.yaml ${PWD}/organizations/ordererOrganizations/orderer2/config.orderers/msp/config.yaml

  infoln "Generating the orderer-tls certificates"

  fabric-ca-client enroll -u https://orderer:ordererpw@localhost:2201 --caname ca-orderer2 -M ${PWD}/organizations/ordererOrganizations/orderer2/config.orderers/tls --enrollment.profile tls --csr.hosts orderer2 --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/orderer2/tls-cert.pem


  cp ${PWD}/organizations/ordererOrganizations/orderer2/config.orderers/tls/tlscacerts/* ${PWD}/organizations/ordererOrganizations/orderer2/config.orderers/tls/ca.crt
  cp ${PWD}/organizations/ordererOrganizations/orderer2/config.orderers/tls/signcerts/* ${PWD}/organizations/ordererOrganizations/orderer2/config.orderers/tls/server.crt
  cp ${PWD}/organizations/ordererOrganizations/orderer2/config.orderers/tls/keystore/* ${PWD}/organizations/ordererOrganizations/orderer2/config.orderers/tls/server.key

  mkdir -p ${PWD}/organizations/ordererOrganizations/orderer2/config.orderers/msp/tlscacerts
  cp ${PWD}/organizations/ordererOrganizations/orderer2/config.orderers/tls/tlscacerts/* ${PWD}/organizations/ordererOrganizations/orderer2/config.orderers/msp/tlscacerts/tlsca-cert.pem

  mkdir -p ${PWD}/organizations/ordererOrganizations/orderer2/msp/tlscacerts
  cp ${PWD}/organizations/ordererOrganizations/orderer2/config.orderers/tls/tlscacerts/* ${PWD}/organizations/ordererOrganizations/orderer2/msp/tlscacerts/tlsca-cert.pem

  infoln "Generating the admin msp"

  fabric-ca-client enroll -u https://ordererAdmin:ordererAdminpw@localhost:2201 --caname ca-orderer2 -M ${PWD}/organizations/ordererOrganizations/orderer2/users/Admin@example.com/msp --tls.certfiles ${PWD}/organizations/fabric-ca/orderer2/tls-cert.pem


  cp ${PWD}/organizations/ordererOrganizations/orderer2/msp/config.yaml ${PWD}/organizations/ordererOrganizations/orderer2/users/Admin@example.com/msp/config.yaml
}
function createorderer3() {
  infoln "Enrolling the CA admin"
  mkdir -p organizations/ordererOrganizations/orderer3

  export FABRIC_CA_CLIENT_HOME=${PWD}/organizations/ordererOrganizations/orderer3


  fabric-ca-client enroll -u https://admin:adminpw@localhost:2202 --caname ca-orderer3 --tls.certfiles ${PWD}/organizations/fabric-ca/orderer3/tls-cert.pem


  echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-2202-ca-orderer3.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-2202-ca-orderer3.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-2202-ca-orderer3.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-2202-ca-orderer3.pem
    OrganizationalUnitIdentifier: orderer' >${PWD}/organizations/ordererOrganizations/orderer3/msp/config.yaml

  infoln "Registering orderer"

  fabric-ca-client register --caname ca-orderer3 --id.name orderer --id.secret ordererpw --id.type orderer --tls.certfiles ${PWD}/organizations/fabric-ca/orderer3/tls-cert.pem


  infoln "Registering the orderer admin"

  fabric-ca-client register --caname ca-orderer3 --id.name ordererAdmin --id.secret ordererAdminpw --id.type admin --tls.certfiles ${PWD}/organizations/fabric-ca/orderer3/tls-cert.pem


  infoln "Generating the orderer msp"

  fabric-ca-client enroll -u https://orderer:ordererpw@localhost:2202 --caname ca-orderer3 -M ${PWD}/organizations/ordererOrganizations/orderer3/config.orderers/msp --csr.hosts orderer3 --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/orderer3/tls-cert.pem


  cp ${PWD}/organizations/ordererOrganizations/orderer3/msp/config.yaml ${PWD}/organizations/ordererOrganizations/orderer3/config.orderers/msp/config.yaml

  infoln "Generating the orderer-tls certificates"

  fabric-ca-client enroll -u https://orderer:ordererpw@localhost:2202 --caname ca-orderer3 -M ${PWD}/organizations/ordererOrganizations/orderer3/config.orderers/tls --enrollment.profile tls --csr.hosts orderer3 --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/orderer3/tls-cert.pem


  cp ${PWD}/organizations/ordererOrganizations/orderer3/config.orderers/tls/tlscacerts/* ${PWD}/organizations/ordererOrganizations/orderer3/config.orderers/tls/ca.crt
  cp ${PWD}/organizations/ordererOrganizations/orderer3/config.orderers/tls/signcerts/* ${PWD}/organizations/ordererOrganizations/orderer3/config.orderers/tls/server.crt
  cp ${PWD}/organizations/ordererOrganizations/orderer3/config.orderers/tls/keystore/* ${PWD}/organizations/ordererOrganizations/orderer3/config.orderers/tls/server.key

  mkdir -p ${PWD}/organizations/ordererOrganizations/orderer3/config.orderers/msp/tlscacerts
  cp ${PWD}/organizations/ordererOrganizations/orderer3/config.orderers/tls/tlscacerts/* ${PWD}/organizations/ordererOrganizations/orderer3/config.orderers/msp/tlscacerts/tlsca-cert.pem

  mkdir -p ${PWD}/organizations/ordererOrganizations/orderer3/msp/tlscacerts
  cp ${PWD}/organizations/ordererOrganizations/orderer3/config.orderers/tls/tlscacerts/* ${PWD}/organizations/ordererOrganizations/orderer3/msp/tlscacerts/tlsca-cert.pem

  infoln "Generating the admin msp"

  fabric-ca-client enroll -u https://ordererAdmin:ordererAdminpw@localhost:2202 --caname ca-orderer3 -M ${PWD}/organizations/ordererOrganizations/orderer3/users/Admin@example.com/msp --tls.certfiles ${PWD}/organizations/fabric-ca/orderer3/tls-cert.pem


  cp ${PWD}/organizations/ordererOrganizations/orderer3/msp/config.yaml ${PWD}/organizations/ordererOrganizations/orderer3/users/Admin@example.com/msp/config.yaml
}



