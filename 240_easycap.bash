#!/bin/bash

export EASYCAP_FMT="PAL_60"

# Use last easycap device we find
export EASYCAP_DEV=$(ls /dev/easycap* > /dev/null 2>&1 | tail -n1)

#if [ ! -e "$EASYCAP_DEV" ]; then
#	echo "$0: No easycap device found"
#fi
