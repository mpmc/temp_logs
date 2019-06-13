#!/bin/bash
stamp=$(date +%s)
now=$(date)
rtl=$(which rtl_433)

dir=$PWD'/logs'
mkdir $dir -p || exit 1;
filename="$dir/temp_sensors-$stamp.json"
echo "{\"started\": \"$now\", \"timestamp\": \"$stamp\"}" >> $filename;

nohup $PWD/log_run.sh &>/tmp/log_run.log  &
nohup $rtl -G -M utc -M level -F json:$filename &>/tmp/rtl.log &
