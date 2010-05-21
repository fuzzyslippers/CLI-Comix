#!/usr/bin/env bash
while getopts "xc" arg; do
	case "$arg" in
		x)	mkdir ~/XKCD
			perl ../resources/xkcd.pl;;
		c)  mkdir ~/CaH
			perl ../resources/cyanide.pl;;
	esac
done