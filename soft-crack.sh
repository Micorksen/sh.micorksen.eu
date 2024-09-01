#!/bin/bash
rickroll() {
  curl -sSL https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash
}

LOOP=false
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --i-dont-care-about-the-law)
            LOOP=true
            ;;
    esac
    shift
done

rickroll()
while $LOOP; do
  rickroll()
done
