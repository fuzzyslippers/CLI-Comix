#!/usr/bin/env bash
#CLI-Comix-shell-grabber v0.1
while getopts "u:n:" arg; do
	case $arg in
		u)	URL="$OPTARG";;
		n)	NUM="$OPTARG";;
	esac
done
wget --quiet $URL -O ./$NUM.png
