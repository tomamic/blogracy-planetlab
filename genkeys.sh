#!/bin/bash 
rm blogracy.jks
args=""
while read p; do
  printf "\n\n\n\n\n\ny\n" | keytool -genkeypair -alias $p -keyalg RSA -keysize 512 -keystore blogracy.jks -storepass blogracy -keypass blogracy #</dev/tty
  args+=" $p"
done < nodes.txt

java -cp blogracy-web.jar net.blogracy.model.hashes.Hashes $args >node-hashes.txt

rm blogracyUser.basic.properties
i=1
while read h; do
  echo "blogracy.user.friends.$i = $h" >>blogracyUser.basic.properties
  i=$(($i + 1))
done < node-hashes.txt
rm node-hashes.txt

while read p; do
  cp blogracyUser.basic.properties blogracyUser.$p.properties
  echo "blogracy.user.user = \\" >>blogracyUser.$p.properties
  java -cp blogracy-web.jar net.blogracy.model.hashes.Hashes $p >>blogracyUser.$p.properties
done < nodes.txt
rm blogracyUser.basic.properties

