#!/bin/bash 

function batch_update() {
    for file in `ls $1`
    do
        if test -d  $file 
        then
            (cd $file ; git pull  ) 
        else
         echo  haha $file
        fi
    done
}

batch_update
