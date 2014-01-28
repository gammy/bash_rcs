# Main bash_rcs configuration file. Replace your .bashrc with this.
# All bash components will be loaded in numerical order.

# Script path. All source:able scripts should reside here or be symlinked to
# this path, and should have .bash as the postfix. Subdirectories aren't read;
# you can do that yourself, for subcript execution 
# (01_foo i run here, and 01_foo executes scripts in bar/)
scripts=$HOME/.bash/

if [ ! -d "$scripts" ]; then
	echo "$0: script path \"$scripts\" is not a directory; can't run scripts"
	return 1
fi

# Each script is executed in numerical order and gets the script path
# passed to it as the first parameter.
good=0
bad=0

for f in $(find "$scripts" -maxdepth 1 -type f -iname "*.bash" | sort -n); do

	source "$f" "$scripts"

	if [ $? -ne 0 ]; then
		echo "$0: Nonzero exit code $exitcode after running \"$f\""
		let bad=$bad+1
	else
		let good=$good+1
	fi
done

let total=$good+$bad

echo "$0: Successfully ran $good/$total scripts from \"$scripts\""
