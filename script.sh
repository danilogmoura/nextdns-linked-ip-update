#!/bin/sh
FILE=$1

echo $(date)
while read line; do
    echo "${NEXTDNS_HOST}/${line}/${NEXTDNS_USER}"
    curl --request GET --url "${NEXTDNS_HOST}/${line}/${NEXTDNS_USER}"
    echo
done < $FILE