#!/bin/bash
while read p; do
  ssh uniprple_blogracy@$p "killall -9 java" &
done < nodes.txt
