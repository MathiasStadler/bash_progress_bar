#!/bin/bash



function clearLastLine() {
        tput cuu 1 && tput el
}

echo "ond"
sleep 1
clearLastLine
echo "second"