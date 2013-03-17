#!/bin/bash
now=$(date +"%Y-%m-%d-%H-%M")
mkdir "logs-$now"
while read p; do
  scp uniprple_blogracy@$p:dht.log "logs-$now/$p.log"
done < nodes.txt

