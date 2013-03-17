#!/bin/bash
while read p; do
  ssh uniprple_blogracy@$p "rm -r *" &
  ssh uniprple_blogracy@$p "rm -r .*" &
done < nodes.txt
