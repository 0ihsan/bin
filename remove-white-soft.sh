#!/bin/sh

convert $1 \
	-negate -grayscale brightness -level 10,70% \
	\( +clone -fill Black -colorize 100 \) \
	+swap -compose CopyOpacity -composite \
	-channel rgb -negate +channel \
  $2
