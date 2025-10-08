#!/usr/bin/env bash
#shellcheck shell=bash



# # >> shellcheck -V <<
# ShellCheck - shell script analysis tool
# version: 0.10.0
# >>shellcheck "<SCRIPT-NAME>" <<

# shfmt --version 3.8.0
# For more information, see 'man shfmt' and https://github.com/mvdan/sh.
# >> shfmt -ln=bash --write  "<SCRIPT-NAME>" <<

# change to /tmp/playground for run
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

    sleep 0.001
}

clearLastLine() {
        # FOUND HERE - https://stackoverflow.com/questions/12628327/how-to-show-and-update-echo-on-same-line/12628482#12628482
        # tput cuu 1 && tput el1
        tput cuu1  && tput el1
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
    
    # clearLastLine
    # echo -ne  "$s"
    
    # FOUND HERE - https://stackoverflow.com/questions/12628327/how-to-show-and-update-echo-on-same-line/12628482#12628482
    # printf "\r Hallo "
    clearLastLine
    printf '\r|%10s|\r\n' "$s"
    # printf '\r|%10s|' "$s"
    
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

# commands for playground
init_playground=$(cat <<'EOF'
# crate/init testcase
cd /tmp
mkdir playground && cd $_
mkdir foo bar baz
touch foo/1.jpg
touch foo/2.txt
touch bar/foo-{1..500}-cache.txt # create 500 files
touch baz/do_not_delete_me.txt
ls *
EOF
)

# if playground available , if yes delete
if [ -d "$DIRECTORY" ]; then
  echo "$DIRECTORY does exist."
fi

# init/create playground
bash -c "echo $init_playground"



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