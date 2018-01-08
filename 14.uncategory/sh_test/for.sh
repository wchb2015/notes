#!/bin/bash


for i in 11 22 33  44 55
    do
      echo $i
    done


for i in "$*"
    do
       echo $i

    done

for y in "$@"

    do
       echo $y
    done
