#!/bin/bash
while read p; do
  scp *.jks uniprple_blogracy@$p:
  scp blogracyUser.$p.properties uniprple_blogracy@$p:blogracyUser.properties
done < nodes.txt

