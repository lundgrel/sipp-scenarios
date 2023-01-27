#!/bin/bash

echo I am running as `id`
basename=${1%.*}
rm -v ${basename}_[0-9]*_messages.log ${basename}_[0-9]*_errors.log 2> /dev/null && true

../sipp.git/sipp 10.105.79.12:5065 -sf "$1" -s "$DN" -l 1 -m 1 -aa -trace_msg -trace_err -p 5060 -t t1
echo completed
cat ${basename}_errors.log
echo .
