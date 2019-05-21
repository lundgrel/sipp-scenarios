#!/bin/sh -x

basename=${1%.*}
rm -v ${basename}_[0-9]*_messages.log ${basename}_[0-9]*_errors.log
../sipp/sipp.git/sipp 10.105.72.24:5065 -sf "$1" -s 888 -l 1 -t t1 -aa -trace_msg -trace_err -mp 7206 -p 4268
echo completed
cat ${basename}_[0-9]*_errors.log
