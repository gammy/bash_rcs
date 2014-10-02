#!/bin/bash

#export PERL_LOCAL_LIB_ROOT="/home/gammy/perl5";
#export PERL_MB_OPT="--install_base /home/gammy/perl5";
#export PERL_MM_OPT="INSTALL_BASE=/home/gammy/perl5";
#export PERL5LIB="/home/gammy/perl5/lib/perl5/x86_64-linux-thread-multi:/home/gammy/perl5/lib/perl5";
#export PATH="/home/gammy/perl5/bin:$PATH";

# DevkitPPC


export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export IPEC_SG_ROOT="/home/gammy/code/work/SG/"

# Fix mouse scroll(button 3,4) not working in some gtk3 apps (https://bugs.archlinux.org/task/35348)
export GDK_CORE_DEVICE_EVENTS=1
