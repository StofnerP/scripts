#!/bin/bash
df=`df -H | head -n 2 | tail -n 1`
i=0
while [ $i -lt 2 ]; do
	if [[ ${df:$j:1} == "G" ]]; then
		df=${df:$((j+1))}
		i=$((i+1))
		j=0
	else
		j=$((j+1))
	fi
done
while [ true ]; do
		if [[ ${df:$j:1} == "G" ]]; then
				break
		else
			j=$((j+1))
		fi
done
df=${df:0:$j}
echo "`date '+%d/%m/%y'`;=500-$df" >> ~/Developer/scripts/tracker/fsTracker.csv
