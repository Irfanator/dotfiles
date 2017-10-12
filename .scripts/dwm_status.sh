#!/bin/sh
CPU=$(top -bn1 | sed -n '/Cpu/p' | awk '{printf "CPU: " $2 "%"}' | sed 's/..,//')
DATE=`date "+%a, %d %b %Y %I:%M"`
MPCSONG=$(mpc | sed -n '1,1p')
MPCVOL=$(mpc vol)
VOLUME=$(amixer sget Master | grep -e 'Front Left:' | sed 's/[^\[]*\[\([0-9]\{1,3\}%\).*\(on\|off\).*/\2 \1/' | sed 's/off/M/' | sed 's/on //')
xsetroot -name "[${MPCSONG}] | [${CPU}] [${MPCVOL} - ${VOLUME}] | ${DATE}"
