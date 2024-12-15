#!/bin/bash

set -e

xemubox-installer

/root/xemubox-postinstall-scripts/archinstall.sh

/root/xemubox-postinstall-scripts/postinstall.sh

