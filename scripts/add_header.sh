#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: ./add_header.sh [header] [ebuild]"
else
    cat $1 | cat - $2 > /tmp/out && mv /tmp/out $2
fi
