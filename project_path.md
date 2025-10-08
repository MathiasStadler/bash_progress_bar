# Project path of - Creating an Animated Progress Bar from scratch in Bash to batch-process files [![alt text][1]](https://www.youtube.com/watch?v=U4CzyBXyOms)
<!-- keep the format ktf-->
## Use follow extension
<!-- ktf -->
- Markdown Code Block Runner [![alt text][1]](https://open-vsx.org/extension/renathossain/markdown-runner)
- "TODO Tree" [![alt text][1]](https://open-vsx.org/extension/Gruntfuggly/todo-tree)
<!-- ktf -->
>[!NOTE]
> Packages **ripgrep** must already be installed for this [![alt text][1]](https://packages.debian.org/sid/ripgrep)
<!-- ktf -->
- "TODO Highlight" [![alt text][1]](https://open-vsx.org/extension/wayou/vscode-todo-highlight)

## Step 0 - template bash script
<!-- start of bach code block -->
```bash <!-- markdownlint-disable-line code-block-style -->
cat >00_template-bash-script.sh <<EoF
#!/usr/bin/env bash
#shellcheck shell=bash

# # >> shellcheck -V <<
# ShellCheck - shell script analysis tool
# version: 0.10.0
# >>shellcheck "<SCRIPT-NAME>" <<

# shfmt --version 3.8.0
# For more information, see 'man shfmt' and https://github.com/mvdan/sh.
# >> shfmt -ln=bash --write  "<SCRIPT-NAME>" <<
exit 0
EoF
```
<!-- end of bach code block -->
<!-- ktf -->
## Step 1 - create script folder
<!-- start of bach code block -->
```bash <!-- markdownlint-disable-line code-block-style -->
mkdir scripts && cd $_
```
<!-- end of bach code block -->
<!-- ktf -->
## Step 2 - create script progress-bar.sh
<!-- start of bach code block -->
```bash <!-- markdownlint-disable-line code-block-style -->
cat >01_create_files.sh <<EoF
#!/usr/bin/env bash
#shellcheck shell=bash

# # >> shellcheck -V <<
# ShellCheck - shell script analysis tool
# version: 0.10.0
# >>shellcheck "<SCRIPT-NAME>" <<

# shfmt --version 3.8.0
# For more information, see 'man shfmt' and https://github.com/mvdan/sh.
# >> shfmt -ln=bash --write  "<SCRIPT-NAME>" <<

shopt -s globstar nullglob
echo 'finding files'
find . -name '*cache'
# with all sub directories<!-- start of bach code block -->
```bash <!-- markdownlint-disable-line code-block-style -->
files=(./**/*cache)
len=${#files[@]}
echo  "found $len files"
exit 0
EoF
```
<!-- end of bach code block -->
<!-- ktf -->
## Step 3 - make script executable
<!-- start of bach code block -->
```bash <!-- markdownlint-disable-line code-block-style -->
chmod +x scripts/01_create_files.sh
```
<!-- end of bach code block -->
<!-- ktf -->
## Step 4 - make test files
<!-- start of bach code block -->
```bash <!-- markdownlint-disable-line code-block-style -->
cd /tmp
mkdir playground && cd $_
mkdir foo bar baz
touch foo/1.jpg
touch foo/2.txt
touch bar/foo-{1..500}-cache.txt # create 500 files
touch baz/do_not_delete_me.txt
ls *
```
<!-- end of bach code block -->
<!-- ktf -->
## Step 5 - next step
<!-- start of bach code block -->
```bash <!-- markdownlint-disable-line code-block-style -->
```
<!-- end of bach code block -->
<!-- ktf -->
## Step 6 - next step
<!-- start of bach code block -->
```bash <!-- markdownlint-disable-line code-block-style -->
```
<!-- end of bach code block -->
<!-- ktf -->
For further steps, see Project path [![alt text][1]](project_path.md)
<!-- make folder and download the link sign via curl -->
<!-- mkdir -p img && curl --create-dirs --output-dir img -O  "https://raw.githubusercontent.com/MathiasStadler/link_symbol_svg/refs/heads/main/link_symbol.svg"-->
<!-- Link sign - Don't Found a better way :-( - You know a better method? - **send me a email** -->
[1]: ./img/link_symbol.svg
<!-- keep the format -->
