#!/bin/bash
#判断用户的输入
read -p  "Please choose yes/no:  "   -t 10 cho

case $cho in
          "yes")
	       echo "Your choose is yes!"
	       ;;
  	  "no")
	       echo "Your choose is no!"
	       ;;
           *)
	       echo "Your choose if other!"
	       ;;
esac
