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

fn_for_loop (){
    for ((j = 0; j < 10; j++)); do
        # echo "fn loop => $j"
        echo "start by one $((j+1))"
    done
}

for ((i = 0; i < 10; i++)); do
echo "START main loop  i =>$((i+1))"
# call fn by name without any arguments
fn_for_loop
echo "END main loop  i =>$((i+1))"
done