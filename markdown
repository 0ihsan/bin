#!/bin/sh

pandoc --toc -sc style.css "$1" > \
	"$(echo "$1" | sed 's/.md/.html/')"
