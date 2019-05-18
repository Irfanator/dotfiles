# Ipan was here
alias e='startx'
alias edit='vim'
alias listenlinein='pactl load-module module-loopback'
alias stoplinelin='pactl unload-module module-loopback'
alias ping254='ping 192.168.1.254 -i 1 -s 1'
alias pinga='ping -i 0.5 -s 9000'
alias pingg='ping goo.gl -i 1 -s 1'
alias noscreenoff='xset s noblank'
alias screenoff='xset s blank'
alias soff='xset dpms force off'
alias nfi='clear; neofetch; echo; echo'
alias nvv='ncmpcpp --screen visualizer'
alias nll='ncmpcpp --screen playlist'
alias nass='nausea -c -d 3 -k -p /tmp/mpd.fifo'
alias scrot='scrot ~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png -q -85'
alias cls='source ~/.bashrc'
alias cll='source ~/.zshrc'
alias rg='ranger'
#alias ls='ls -hal --color=auto'
alias dir='dir --color=auto'
alias w3m='cd ~/w3m/ && w3m'
alias w3mm='cd ~/w3m/ && w3m -cookie'
alias hh='cd ~/'
alias mv='mv -i'
alias rm='rm -i'
alias xil='xinput list'
alias xrdbr='xrdb -remove; xrdb -merge ~/.Xresources'
alias yy="yaourt"
alias sd="sudo"
alias p="pacman"
alias dis10='xinput set-prop 10 "Device Enabled" 0'
alias ena10='xinput set-prop 10 "Device Enabled" 1'
alias dis11='xinput set-prop 11 "Device Enabled" 0'
alias ena11='xinput set-prop 11 "Device Enabled" 1'
alias mednafenalsa='/usr/bin/mednafen -sound.device sexyal-literal-default'
alias steam1='LD_PRELOAD="/usr/lib/libasound.so.2:/usr/lib32/libasound.so.2" steam'

alias resizejpg40='mogrify -resize 40x40% -quality 80% -filter Lanczos -interlace Plane -gaussian-blur 0.05 -format jpg *.jpg'
alias resizejpg60='mogrify -resize 60x60% -quality 80% -filter Lanczos -interlace Plane -gaussian-blur 0.05 -format jpg *.jpg'
alias resizejpg80='mogrify -resize 80x80% -quality 80% -filter Lanczos -interlace Plane -gaussian-blur 0.05 -format jpg *.jpg'
alias renamejpg='for f in *; do mv "$f" "$f.jpg"; done'




