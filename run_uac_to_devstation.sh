#!/bin/sh -x

basename=${1%.*}
rm -vf ${basename}_[0-9]*_messages.log ${basename}_[0-9]*_errors.log
DN="${2:-90019}"
echo run sipp
../sipp.git/sipp.root 10.105.79.12:5062 -sf "$1" -s "$DN" -l 1 -m 1 -trace_msg -trace_err -mp 8000  -t t1
echo completed
cat ${basename}_[0-9]*_errors.log
