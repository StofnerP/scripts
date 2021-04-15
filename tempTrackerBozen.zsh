#!/bin/bash
# Aussentemperatur
wget -O out --user A1102 --password A11022018 http://dns.loxonecloud.com/504F94110081/dev/sps/io/Aussentemperatur/state >/dev/null 2>/dev/null
line=$(cat out | tail -n 1)
for i in {55..60}; do
	if [ ${line:$i:1} = ° ]; then 
		index=$i
		break
	fi
done
delta=$(($index-55))
outTemp=${line:55:$delta}
echo $outTemp

# Luftfeuchte aussen
wget -O out --user A1102 --password A11022018 http://dns.loxonecloud.com/504F94110081/dev/sps/io/.Luftfeuchte\ aussen/state >/dev/null 2>/dev/null
line=$(cat out | tail -n 1)
for i in {58..62}; do
	if [ ${line:$i:1} = % ]; then
		index=$i
		break
	fi
done
delta=$(($index-58))
outHumidity=${line:58:$delta}
echo $outHumidity
rm -rf out
