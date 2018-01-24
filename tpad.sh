#!/bin/bash

device=`xinput list | grep  'SynPS/2 Synaptics TouchPad' | grep -oP 'id=\K.*?(?=\s)'`
state=`xinput list-props "$device" | grep "Device Enabled" | grep -o "[01]$"`
effect="1"

[[ $state == "1" ]] && effect="0" || effect="1"

`xinput set-prop "$device" "Device Enabled" "$effect"`