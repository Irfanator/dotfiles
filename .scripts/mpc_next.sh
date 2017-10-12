#!/bin/sh
mpc next; sleep 0.1; current=$(mpc current); notify-send "$current"
