#!/bin/bash

if [ "$1"  = "post" ]; then
	systemctl restart --now getty@tty1
fi
