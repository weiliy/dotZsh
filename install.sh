#!/bin/bash

source_string="source $(pwd)/zshrc"
dot_zshrc="~/.zshrc"  

if [ $(grep "^$source_string$" ~/.zshrc | wc -l) -eq 0 ]; then
    echo "$source_string" >> ~/.zshrc
fi
