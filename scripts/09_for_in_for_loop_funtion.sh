#!/usr/bin/env bash
#shellcheck shell=bash

# FOUND HERE - https://www.geeksforgeeks.org/linux-unix/shell-scripting-set-command/
# set -x #This option prints the commands in the sequence as they got executed or is mainly used to do some script debugging
# set -e #It terminates the execution when the error occurs.

# FOUND HERE - https://labex.io/de/tutorials/shell-how-to-handle-unbound-variable-issue-415857
# Parameter Expansion: ${variable_name}
# Command Substitution: $(command)
# Arithmetic Expansion: $((expression))

# FOUND HERE - https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
# sot -u / set -o nounset - Treat unset variables and parameters
# set -e / set -o xtrace - Exit immediately
# set -E / set -o errtrace - If set, any trap on ERR is inherited by shell functions, command substitutions, and commands executed in a 
#                            subshell environment. The ERR trap is normally not inherited in such cases
# set -o pipefail

# found here - https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
# set -eEuo pipefail

# set -Euo pipefail
 set -Eo pipefail

trap "echo ERR trap fired!" ERR

#set -euxo pipefail
#set -euxo pipefail
#set -euxo pipefail
#set -euxo pipefail


# # >> shellcheck -V <<
# ShellCheck - shell script analysis tool
# version: 0.10.0
# >>shellcheck "<SCRIPT-NAME>" <<

# shfmt --version 3.8.0
# For more information, see 'man shfmt' and https://github.com/mvdan/sh.
# >> shfmt -ln=bash --write  "<SCRIPT-NAME>" <<

# OLD PLEASE REMOVE
# change to /tmp/playground for run
# cd /tmp/playground || return 0

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


setup_playground () {


# FOUND HERE - https://stackoverflow.com/questions/7411455/what-does-export-do-in-shell-programming
# export - It makes the assignment visible to subprocesses 
# playground_folder
PLAYGROUND_FOLDER="./playground"
export PLAYGROUND_FOLDER

# WASTE
# bash -c "set $PLAYGROUND_FOLDER"

echo "PLAYGROUND => ${PLAYGROUND_FOLDER}"
# declare $PLAYGROUND_FOLDER
# commands for playground
init_playground=$(cat <<'EOF'
# crate/init testcase
cd /tmp && echo "PWD => $PWD"
# CAN REMOVE echo "${PLAYGROUND_FOLDER} =>"
# test id file exists
if [ -d "${PLAYGROUND_FOLDER}" ]; then
  ### Take action if $DIR exists ###
  echo "Error: Folder PLAYGROUND =>  ${PLAYGROUND_FOLDER} available. Remove it first - EXIT 1"
  exit 1
else
  ###  Control will jump here if ${PLAYGROUND_FOLDER} does NOT exists ###
  echo "Folder ${PLAYGROUND_FOLDER} not available. Create it..."
  mkdir ${PLAYGROUND_FOLDER} && cd $_ && echo "PWD => $PWD"
  mkdir foo bar baz
  touch foo/1.jpg
  touch foo/2.txt
  touch bar/foo-{1..500}-cache.txt # create 500 files
  touch baz/do_not_delete_me.txt
fi
EOF
)


# init_playground=$(cat <<'EOF'
# # crate/init testcase
# cd /tmp
# echo "$PLAYGROUND_FOLDER"
# mkdir $PLAYGROUND_FOLDER && cd $_
# # mkdir foo bar baz
# # touch foo/1.jpg
# # touch foo/2.txt
# # touch bar/foo-{1..500}-cache.txt # create 500 files
# # touch baz/do_not_delete_me.txt
# # pwd
# # cd $PLAYGROUND_FOLDER
# # ls *
# EOF
# )


# if playground available , if yes delete
if [ -d "PLAYGROUND_FOLDER" ]; then
  echo "PLAYGROUND_FOLDER does exist.";
  echo "PLEASE remove it first!"
  exit 1;
else
    # init/create playground
    bash -c "echo $init_playground"
fi

}




main() {

    setup_playground
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