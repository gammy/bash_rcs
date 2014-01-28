#!/bin/bash
# Use xe.com to convert currency on the commandline

# Idea stolen from 
# http://www.commandlinefu.com/commands/view/7866/currency-converter-using-xe.com

function xe() {

	if [ $# -ne 3 ]; then
		echo "Usage: xe <amount> <source currency> <target currency>"
		echo "Example: xe 100 usd gbp"
		return 1
	fi

	amount="$1"
	# Assumes bash4+
	currency_src="${2^^}"
	currency_dst="${3^^}"
	
	ret=$(curl "http://www.xe.com/wap/2co/convert.cgi?Amount=${amount}&From=${currency_src}&To=${currency_dst}" -A "Mozilla" -s)

	if [ $? -ne 0 ]; then
		echo "It appears that script execution failed: cannot convert currency"!
		return 1
	fi

	echo -n "$amount $currency_src = "
	echo -n $ret | sed -n "s/.*>\(.*\) $currency_dst<.*/\1/p"
	echo " $currency_dst"
}
