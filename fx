#!/bin/sh

# License: MIT
# Created at: 2020 Nov 29 20:51:31+UTC
# Description: foreign exchange converter
# Author: ihsan, ihsan[at]pm[dot]me, https://github.com/ihsanturk

# deps: usage,python

title='fx - foreign exchange'
args='fx -i:<currency1> -o:<currency2>'
showhelp() { usage "$title" "$args"; }
multiply() { while read -r line; do python -c "print($line * $1)"; done; }

c1=USD
c2=TRY
while getopts :i:o:a:h args; do case $args in
	(i) c1=$(echo "$OPTARG" | tr '[:lower:]' '[:upper:]') ;;
	(o) c2=$(echo "$OPTARG" | tr '[:lower:]' '[:upper:]') ;;
	(h) showhelp; exit 0 ;;
	([?]) showhelp; exit 1 ;;
esac; done

# TODO: add check for crypto currencies
rate=$(curl -s "https://api.exchangeratesapi.io/latest?base=$c1" |
	grep -o "\"$c2\":[^,]*" | cut -f2 -d:)

multiply "$rate" # with stdin

