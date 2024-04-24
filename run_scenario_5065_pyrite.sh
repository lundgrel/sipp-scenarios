#!/bin/bash

PYRITE_IP=$(echo $SSH_CLIENT | cut -d ' ' -f 1)
basename=${1%.*}
logfile=${basename}-log.txt
errfile=${basename}-err.txt
DN="${2:-2012}"

rm -vf ${basename}_[0-9]*_messages.log ${basename}_[0-9]*_errors.log 2> /dev/null && true

echo I am running as `id` Remote ${PYRITE_IP}:5065


../sipp.git/sipp.root ${PYRITE_IP}:5065  -sf "$1" -s "$DN" -l 1 -m 1 -aa -trace_msg -message_file $logfile -trace_err -error_file $errfile  -t u1
echo completed  ${errfile}
cat ${errfile}
echo .
