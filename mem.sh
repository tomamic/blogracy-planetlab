#!/bin/bash
while read p; do
  ssh uniprple_blogracy@$p "free -t -m" &
done < nodes.txt

