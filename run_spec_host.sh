#!/bin/bash

if [[ $# -lt 2 ]]; then
    echo 'Syntax  scenario.xml  remote-ip:port' >&2
    exit 1
fi

echo I am running as `id`
basename=${1%.*}
pyrite_ip=$2

rm -vf ${basename}_[0-9]*_messages.log ${basename}_[0-9]*_errors.log

../sipp.git/sipp.root ${pyrite_ip} -sf "$1" -s "$DN" -l 1 -m 1 -aa -trace_msg -trace_err -p 5060 -t t1 -message_file ${basename}_messages.log -error_file ${basename}_errors.log
echo completed
cat ${basename}_errors.log
echo .
