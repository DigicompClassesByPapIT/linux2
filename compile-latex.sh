#!/usr/bin/bash
# Check lualatex is installed
if ! [ -x "$(command -v lualatex)" ]; then
  echo 'Error: lualatex is not installed.' >&2
  exit 1
fi
# cd in doc or handle error
cd doc || exit 1
# Compile LaTeX with lualatex, compile twice to get the table of contents
lualatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=build/pdf linux-2.tex
lualatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=build/pdf linux-2.tex