#!/bin/bash
while read p; do
  ssh uniprple_blogracy@$p "java -jar blogracy-vuze.jar" &
  ssh uniprple_blogracy@$p "java -jar blogracy-web.jar" &
done < nodes.txt

