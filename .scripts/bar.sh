#!/bin/sh

batt() {
    if [ -e /sys/class/power_supply/BAT0/capacity ]
    then
        batt="/sys/class/power_supply/BAT0/capacity"; echo "Batt" && cat $batt && echo "%"
    else
        echo "%{F#edf630}No Battery%{F-}"
    fi
}

dat() {
    date +"%a, %d %b %Y %r"
}

music() {
    current=$(mpc current); echo "%{F#edf630}$current%{F-}"
}

bspwm() {
    BSPWM=$(bspc query -D)
    BUSY=$(bspc query -D -d .occupied)

    for DESK in $BSPWM
    do
        CHAR="x"
        if [[ $BUSY =~ $DESK ]]
        then
            CHAR="o"
        fi
        echo -n "%{A:bspc desktop $DESK -f:}"
        if [ $DESK = $(bspc query -D -d) ]
        then
            echo -n "%{F#8484ff}$CHAR%{F-}"
        else
            echo -n "$CHAR"
        fi
        echo -n "%{A} "
    done
}


volume()
{
    volStatus=$(amixer get Master | tail -n 1 | cut -d '[' -f 3 | sed 's/].*//g')
    volLevel=$(amixer get Master | tail -n 1 | cut -d '[' -f 2 | sed 's/%.*//g')
    if [ "$volStatus" == "on" ]
        then
        echo "Vol%{F#8484ff} $volLevel%%{F-}"
        else
        echo "Vol%{F#ff8484} $volLevel% %{F-}M"
    fi
}


temp() {
    if [ -e /sys/class/thermal/thermal_zone0/temp ]
    then
        temp="/sys/class/thermal/thermal_zone0/temp"; echo "Temp" && cat $temp | cut -c -2 && echo "°C"
    else
        echo "%{F#8484ff}No Device%{F-}"
    fi

}

while true; do
    # BAR_INPUT="[ $(temp)%% ] [ BAT $(batt)%% ] [ $(date) ]"
    BAR_INPUT="%{B#160822 F#ffffff}%{l}[$(bspwm)] [$(music)] %{r}[$(volume)] | [$(temp)] | [$(batt)] - [$(dat)]"
    echo $BAR_INPUT
    sleep 1
done
