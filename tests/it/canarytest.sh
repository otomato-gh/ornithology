#! /bin/sh -x
export APP_URL=ornithology-canary
i=10
while [ $i -ge 0  ];
do
  i=$(( $i - 1 ))
  echo i is $i
  curl --connect-timeout 2 http://${APP_URL}:5000/ping
done
if [ $? -ne 0 ]; then
  exit 1
fi
#else - run component test
/tests/ct/run.sh
