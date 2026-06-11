#!/bin/bash

echo I am running as `id`
basename=${1%.*}
rm -v ${basename}_[0-9]*_messages.log ${basename}_[0-9]*_errors.log
../sipp.git/sipp 172.19.98.101:5065 -sf "$1" -s 888 -t t1 -l 1 -aa -trace_msg -trace_err  -rate_increase 37 -rate_max 1 -m 1 -message_file ${basename}_messages.log -error_file ${basename}_errors.log
echo completed
cat ${basename}_errors.log
echo .
