#!/bin/bash
while read p; do
  ssh uniprple_blogracy@$p "rm -r cache" &
done < nodes.txt

