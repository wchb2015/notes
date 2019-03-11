#!/bin/bash

test=$(env |grep "USER" |cut -d "=" -f 2)
#echo	$test

if [ "$test" == wangchongbei ]
 then
  echo "Current user is root."
fi

