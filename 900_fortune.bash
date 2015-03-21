#!/bin/bash

if which fortune > /dev/null 2>&1; then
	fortune
	echo
fi

return 0
