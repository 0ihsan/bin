#!/bin/sh

m=${1:-1}
while read -r num; do
	case $num in
		([0-9,.]*)
			echo "$num % $m" | bc -l | sed 's/0*$/0/g'
		;;
		(*)
			>&2 echo 'error: mod \033[31mexpects a number.\033[0m'
		;;
	esac
done
