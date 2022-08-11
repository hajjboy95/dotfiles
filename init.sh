#!/bin/bash

cp .my* ~/

for file in ~/.my-*; do
    [ -e "$file" ] || continue
    echo "source $file" >> ~/.zshrc
done

