#!/bin/bash

basename=${1%.*}
rm -vf ${basename}_[0-9]*_messages.log ${basename}_[0-9]*_errors.log
DN="${2:-90010}"
OOC_SCENARIO="sipp_ooc_answer_clear_15s.xml"

ss state time-wait dport = 5062
ss state time-wait dport = 5062 -K


echo run sipp
# -mp 8000   media-port
# -p 5060  local port
set -x
../sipp.git/sipp.root 10.105.79.12:5062 -sf "$1"  -oocsf "$OOC_SCENARIO"  -s "$DN" -l 1 -m 1 -aa -trace_msg -trace_err -t t1
set +x
echo completed
cat ${basename}_[0-9]*_errors.log
echo .

