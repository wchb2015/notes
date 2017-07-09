#!/bin/bash

read -t 30 -p "Please input a dir :" dir
if [ -d "$dir"  ]
   then
       echo "Is dir!"
   else
       echo "No No No!"
fi
