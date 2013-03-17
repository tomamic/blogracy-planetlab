#!/bin/bash
while read p; do
  scp *.jar uniprple_blogracy@$p:
done < nodes.txt

