#!/bin/bash

echo I am running as `id`
basename=${1%.*}
rm -vf ${basename}_[0-9]*_messages.log ${basename}_[0-9]*_errors.log
../sipp.git/sipp.root 10.8.74.183:5065 -sf "$1" -i 10.105.79.90 -s 888 -l 1 -aa -trace_msg -trace_err -mp 7206 -p 4268 -rate_increase 37 -rate_max 1 -m 1 -message_file ${basename}_messages.log -error_file ${basename}_errors.log
echo completed
cat ${basename}_errors.log
echo .
