#!/bin/sh

killall -q compton
while pgrep -x compton >/dev/null; do sleep 1; done
compton --backend glx --config ~/.compton.conf

killall -q flashfocus
flashfocus

echo "Done.."
