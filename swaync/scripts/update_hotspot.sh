#!/bin/bash

if nmcli con show --active | grep -q "Ali"; then
        echo true
    else
        echo false
fi