#!/bin/sh

# nix-shell
# nix-shell -p gnuplot

gnuplot -persist <(echo "plot '<(sort -n listOfNumbers.txt)' with lines")

# gnuplot -p -e 'set terminal png enhanced truecolor; set output "out.png"; plot "/dev/stdin" using 1:2'
# >&2 echo 'created: out.png'
