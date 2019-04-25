basename=${1%.*}
rm -v ${basename}_[0-9]*_messages.log ${basename}_[0-9]*_errors.log
../sipp/sipp 10.105.72.24:5065 -sf "$1" -m 1 -trace_msg -trace_err -p 5432
