#!/bin/sh
FILE=$1

# No Color
NC='\033[0m' 
#Colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'

echo -e "${CYAN}NextDns${NC} ${GREEN}::${NC} Update linked IP..."
while read line; do
    echo -n -e "${NEXTDNS_HOST}/${GREEN}${line}${NC}/${NEXTDNS_USER}\t"
    curl --silent --request GET --url "${NEXTDNS_HOST}/${line}/${NEXTDNS_USER}" | grep -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
done < $FILE
echo