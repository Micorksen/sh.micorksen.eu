#!/bin/bash
LOOP=true
if [ $1 = "--i-dont-care-about-the-law" ]; then
  LOOP=false
fi

while $LOOP; do
  curl -sSL https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash
done
