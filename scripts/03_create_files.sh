#!/usr/bin/env bash
#shellcheck shell=bash

# # >> shellcheck -V <<
# ShellCheck - shell script analysis tool
# version: 0.10.0
# >>shellcheck "<SCRIPT-NAME>" <<

# shfmt --version 3.8.0
# For more information, see 'man shfmt' and https://github.com/mvdan/sh.
# >> shfmt -ln=bash --write  "<SCRIPT-NAME>" <<

progress_bar(){
    local current=$1
    local len=$2

    local perc_done=$((current * 100 / len))

    echo "processing $current/$len ($perc_done%)"

    
    local s='['

    # for ((i = 0; i < perc_done; i++)); do
    #     echo "$i/$len"
    #     s+='|'
    # done
}

shopt -s globstar nullglob
echo 'finding files'
find . -name '*cache'
# all sub directories

files=(./**/*cache.txt)
len=${#files[@]}
echo  "found $len files"

echo "next"

i=0
for file in "${files[@]}"; do
    progress_bar "$((i+1))" "$len"
    # echo "$file"
    ((
        i++))
done

exit 0