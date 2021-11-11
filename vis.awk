#!/usr/bin/awk -f

{
	printf $1" "$2"\t";
	for(c=0; c<$NF/1; c++) printf "x";
	printf "\n";
}
