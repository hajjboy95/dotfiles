#!/bin/zsh

cp .my* ~/

for file in ~/.my-*; do
    [ -e "$file" ] || continue

    if grep -R "$file" ~/.zshrc
    then
        echo "exists already $file"
        # do nothing since it exists
    else
        echo "source $file" >> ~/.zshrc
    fi
done

source ~/.zshrc

