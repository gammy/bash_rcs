#!/bin/bash

if [ -f /etc/locale.conf ]; then
	source /etc/locale.conf
	export LANG=$LANG
fi
