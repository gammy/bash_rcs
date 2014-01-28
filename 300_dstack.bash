#!/bin/bash

# Very simple stack-like directory handler.
# spush to push the current directory to the stack.
# spop to cd into the last pushed directory.
#
# SOURCE this in your bashrc to use it
# by gammy & phyber 

STACK_FILE="$HOME/.dstack.txt"

function spush {

	if [ $# -gt 0 ]; then
		path="$1"
	else
		path="$(pwd)"
	fi

	echo "$path" >> "$STACK_FILE"
}
	
function spop {

	if [ -f "$STACK_FILE" ]; then
		lines=$(wc -l "$STACK_FILE" | cut -d ' ' -f 1)
	else
		echo "Nothing to pop."
		return
	fi

	if [ $lines -eq 0 ]; then
		echo "Nothing to pop."
		return
	fi

	path=$(tail -n -1 "$STACK_FILE")

	head -n -1 "$STACK_FILE" > "$STACK_FILE.tmp"

	if [ $? -eq 0 ]; then
		mv "$STACK_FILE.tmp" "$STACK_FILE"
	else
		echo "Error with temporary file."
		return
	fi

	cd "$path"
}

