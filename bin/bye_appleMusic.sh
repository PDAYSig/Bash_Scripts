#!/bin/bash

if /usr/bin/pgrep pgrep -x Music > /dev/null; then
   /usr/bin/pkill -x Music
fi
