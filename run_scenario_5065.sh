#!/bin/bash

set -x

echo I am running as `id`
basename=${1%.*}
# rm -vf ${basename}_[0-9]*_messages.log ${basename}_[0-9]*_errors.log 2> /dev/null && true
logfile=${basename}-log.txt
errfile=${basename}-err.txt
DN="${2:-2012}"

../sipp.git/sipp.root 10.105.79.12:5065 -sf "$1" -s "$DN" -l 1 -m 1 -aa -trace_msg -message_file $logfile -trace_err -error_file $errfile  -t u1
echo completed
cat $errfile
echo .
