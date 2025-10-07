#!/usr/bin/env bash
#shellcheck shell=bash

# # >> shellcheck -V <<
# ShellCheck - shell script analysis tool
# version: 0.10.0
# >>shellcheck "<SCRIPT-NAME>" <<

# shfmt --version 3.8.0
# For more information, see 'man shfmt' and https://github.com/mvdan/sh.
# >> shfmt -ln=bash --write  "<SCRIPT-NAME>" <<

for ((i = 0; i < 10; i++)); do
echo "here i => $i"
    for ((j = 0; j < 10; j++)); do
        echo "j => $j"
    done
done