#!/bin/sh
current=$(mpc current); notify-send "$current"



MUSIC_DIR="/sdcard/Music" # Path to real folder, not symlink

COVER=/tmp/cover.jpg

function reset_background
{
    printf "\e]20;;100x100+1000+1000\a"
}

{
    album="$(mpc --format %album% current)"
    file="$(mpc --format %file% current)"
    album_dir="${file%/*}"
    [[ -z "$album_dir" ]] && exit 1
    album_dir="$MUSIC_DIR/$album_dir"

    covers="$(find "$album_dir" -type d -exec find {} -maxdepth 1 -type f -iregex ".*/.*\(${album}\|cover\|folder\|artwork\|front\).*[.]\(jpe?g\|png\|gif\|bmp\)" \; )"
    src="$(echo -n "$covers" | head -n1)"
    rm -f "$COVER" 
    if [[ -n "$src" ]] ; then
        #resize the image's width to 300px 
        convert "$src" -resize 500x "$COVER"
        if [[ -f "$COVER" ]] ; then
           #scale down the cover to 30% of the original
           #place it 1% away from left and 50% away from top.
           printf "\e]20;${COVER};80x80+2+15:op=keep-aspect\a"
        else
            reset_background
        fi
    else
        reset_background
    fi
} &
