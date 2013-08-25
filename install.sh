#!/bin/bash
for i in _*; do
    i=${i#_}
    if [ ! -e "$HOME/$i" ]; then
        cmd="ln -sf $PWD/_$i $HOME/$i"
        echo $cmd
        $cmd
    fi
done
