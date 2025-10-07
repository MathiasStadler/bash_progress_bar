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

    # echo "len $len"
    # echo "current $current"
 
    # SC2155
    local perc_done
    perc_done=$(awk -v a="${current}" -v b="${len}}" 'BEGIN {printf "%.1f\n", a*100/b }')
    
    # tmp_perc_done=$perc_done

    # echo "perc_done $perc_done"
    # echo "tmp_perc_done $tmp_perc_done"
    echo "processing $current/$len ($perc_done%)"
    # echo "processing $current/$len - $perc_done"
    # echo "processing $current/$len "

    
    # local s='['


    # target=$perc_done

    # echo "target $target"

    # for ((i = 0; i < 10; i++)); do
    #          echo "$i"
    #          s+="|"
    # done
    # s+="|"
    # s+=']'

    # echo "$s"
  echo "perc_done $perc_done"
  # for ((i = 0; i < 10; i++)); do
  # echo $i
  # done

    # for ((i = 0; i < perc_done; i++)); do
    # # for ((i = 0; i < 10; i++)); do
    #     echo "| $i"
    #     # s+='|'
        
    # done
    # #     s+=']'
    # #     echo "$s"
}

shopt -s globstar nullglob
echo 'finding files'
find . -name '*cache'
# all sub directories

files=(./**/*cache.txt)
len=${#files[@]}
echo  "found $len files"

i=0
for file in "${files[@]}"; do
    # echo "$((i+1))"
    progress_bar "$((i+1))" "$len"
    # echo "$file"
    ((i++))
done

exit 0