#!/bin/bash

dh_url="https://api.dreamhost.com/?key=$dh_api_key"

ip_addr=$(/usr/bin/curl "http://bot.whatismyipaddress.com/")

old_ip_addr=`curl "$dh_url&cmd=dns-list_records" | grep $dh_domain | grep -o "\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}"`
dh_url_add="$dh_url&cmd=dns-add_record&record=$dh_domain&type=A&value=$ip_addr"
dh_url_del="$dh_url&cmd=dns-remove_record&record=$dh_domain&type=A&value=$old_ip_addr"

echo NEW IP: $ip_addr
echo OLD IP: $old_ip_addr

if [ “$ip_addr” == “$old_ip_addr” ]; then
echo SAME
else
echo DIFFERENT. UPDATING . . .

if [ -n $old_ip_addr ]; then 
	echo "Removing Old IP: $dh_url_del"
	curl "$dh_url_del"
fi

echo "Adding new IP: $dh_url_add"
curl "$dh_url_add"
fi
