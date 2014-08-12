#!/bin/bash

# Mplayer aliases: 
# mplayer-easycap-composite, 
# mplayer-easycap-svideo, 
# mplayer-webcam, 
# mplayer-hdmi-audio, 
# mplayer-dvd, 
# mplayer-dvd-hdmi-audio
alias "mplayer-easycap-composite"="mplayer -tv driver=v4l2:norm=${EASYCAP_FMT}:width=640:height=480:outfmt=uyvy:device=${EASYCAP_DEV}:input=1:fps=25:buffersize=16:alsa:amode=1:forcechan=2:audiorate=32000:adevice=plughw.1,0:forceaudio:immediatemode=0 -hardframedrop -ao alsa -vf screenshot tv://"
alias "mplayer-easycap-svideo"="mplayer -tv driver=v4l2:norm=${EASYCAP_FMT}:width=640:height=480:outfmt=uyvy:device=${EASYCAP_DEV}:input=5:fps=25:buffersize=16:alsa:amode=1:forcechan=2:audiorate=32000:adevice=plughw.1,0:forceaudio:immediatemode=0 -hardframedrop -ao alsa -vf screenshot tv://"
alias "mplayer-webcam"="mplayer -tv driver=v4l2:width=640:height=480 -vf screenshot tv://"
alias "mplayer-hdmi-audio"="mplayer -vo gl -ao alsa:device=hw=0.3"
#alias "mplayer-dvd"="mplayer -nocache -vo gl:yuv=2:force-pbo -dr -framedrop -vf yadif=3,hqdn3d=3:2.8:1:3 -mouse-movements dvdnav:// -dvd-device "
alias "mplayer-dvd"="mplayer dvdnav:// -dvd-device "
alias "mplayer-dvd-hdmi-audio"="mplayer -ao alsa:device=hw=0.3 -mouse-movements dvdnav:// -dvd-device "


# Miscellaneous aliases
#alias "sshfs"="sshfs -o reconnect -o workaround=all"

# Naughty and system-breaking!
which wget > /dev/null 2>&1 || alias "wget"='curl -L -O'

alias "nzbget-add-all"='find . -maxdepth 1 -iname "*.nzb" | while read f; do echo "To add: \"$f\""; nzbget -A F "$f" && rm "$f" && sleep 1; done'
alias "journalctlf"="urxvt -title journalctlf -e sudo journalctl -f"
alias "xload"='xload -bg "#202020" -hl white -fg "#b93f3f" -nolabel -update 1'
alias "topf"="urxvt -title topf -e top"
alias "webfsd"="webfsd -F -f index.html -r /home/gammy/doc/webfs"
alias "xsnow"="xsnow -snowflakes 500 -bg \"#1f2c41\" -solidbg"
alias "pacman-aur"="trizen"
