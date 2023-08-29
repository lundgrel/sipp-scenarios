#!/bin/sh -x

basename=${1%.*}
rm -vf ${basename}_[0-9]*_messages.log ${basename}_[0-9]*_errors.log
DN="${2:-2012}"
echo run sipp
# -mp 8000   media-port
# -p 5060  local port
../sipp.git/sipp.root 10.105.79.12:5062 -sf "$1" -s "$DN" -l 1 -m 1 -aa -trace_msg -trace_err -t u1 
echo completed
cat ${basename}_[0-9]*_errors.log
echo .