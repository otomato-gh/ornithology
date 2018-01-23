#! /bin/sh
canary_version=$(grep \'version\': /tests/api.py | cut -d \' -f 4)
version=test
count=100
while [ $canary_version != $version ];
 do version=$(curl http://35.224.1.71:5000/version)
 count=$(( count-1 ))
 if [ $count -eq 0 ];
  then exit 1;
 fi;
done
