#!/usr/bin/env bash
#shellcheck shell=bash



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

process-files () {
    local files=('$@')

    sleep .01
}

clearLastLine() {
        tput cuu 1 && tput el
}

progress_bar () {
    local current=$1
    local len=$2

    local bar_char='|'
    local empty_char=' '
    local start_char='['
    local end_char=']'
    local length=30

    local perc_done=$((current * 100 / len))
    local num_bars=$((perc_done * length /100))

    

    local i
    local s+=$start_char
    local d=$((length - num_bars ))

    # echo "=> $perc_done"

    #debug
    #echo "processing $current/$len ($perc_done /$num_bars/$length/$d)"
    
    # LAST PLACE
    # echo "processing $current/$len ($perc_done%)"
   
    #echo "processing $current/$len ($perc_done%) \033[0K\r"
    # s output string
    # local s='['
    # for ((i = 0; i < perc_done; i++)); do
    #     # echo "$i/$len"
    #     s+=$bar_char
    # done
    for ((i = 0; i < num_bars; i++)); do
        # echo "$i/$len"
        s+=$bar_char
    done
    # for ((i = 0; i < num_bars; i++)); do
    #     s+=$empty_char
    # done
    # for ((i = 0; i < length; i++)); do
    #     s+=$empty_char
    # done
    for ((i = 0; i < d; i++)); do
         s+=$empty_char
    done


    #echo -ne "$s $current/$len ($perc_done)"

    s+=$end_char
    
    s+="processing $current/$len ($perc_done%) \n"
    # echo "processing $current/$len ($perc_done%)"

    #show progress bar right format
    clearLastLine
    echo -ne "$s"
    #echo -ne "[INFO] \033[0K\r"
    # echo "${#s}"
}

# run function
shopt -s globstar nullglob
run ()  {

    echo  "found $len files"

    echo "run"

    i=0
    for files in "${files[@]}"; do
    # echo "$i"
    # echo "$files"
    progress_bar "$((i+1))" "$len"
    process-files "${files[@]:1:BATCHSIZE}"
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