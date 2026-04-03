#!/bin/bash

CURRENT=$(powerprofilesctl get)

if [ "$CURRENT" = "power-saver" ]; then
        echo true
    else
        echo false
fi