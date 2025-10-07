#!/usr/bin/env bash
#shellcheck shell=bash

shopt -s globstar nullglob

# # >> shellcheck -V <<
# ShellCheck - shell script analysis tool
# version: 0.10.0
# >>shellcheck "<SCRIPT-NAME>" <<

# shfmt --version 3.8.0
# For more information, see 'man shfmt' and https://github.com/mvdan/sh.
# >> shfmt -ln=bash --write  "<SCRIPT-NAME>" <<

cd /tmp/playground || return 0

files=(./**/*cache.txt)
len=${#files[@]}


fn_for_loop () {
    for ((j = 0; j < 10; j++)); do
        # echo "fn loop => $j"
        echo "start by one $((j+1))"
    done
}

progress_bar () {
    local current=$1
    local len=$2

    # echo "processing $i/$len"

    local perc_done=$((current * 100 / len))

    # echo "=> $perc_done"
    # echo "processing $current/$len ($perc_done%)"

    local i
    for ((i = 0; i < perc_done; i++)); do
        echo "$i/$len"
        s+='|'
    done
}

# run function

run ()  {

    echo  "found $len files"

    echo "run"

    i=0
    for files in "${files[@]}"; do
    # echo "$i"
    # echo "$files"
    progress_bar "$((i+1))" "$len"
    ((i++))
    done
}

main() {

    run

}

# main function
 main

# for ((i = 0; i < 10; i++)); do
# echo "START main loop  i =>$((i+1))"
# # call fn by name without any arguments
# fn_for_loop
# echo "END main loop  i =>$((i+1))"
# done