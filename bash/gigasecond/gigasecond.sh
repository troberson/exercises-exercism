#!/usr/bin/env bash

date -u -d "$1+$((10**9)) seconds" "+%a %b %-d %T %Z %Y"
