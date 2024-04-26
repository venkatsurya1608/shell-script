#!/bin/bash

disk_usage=$(df -hT | grep xfs)
disk_threshold=4


while IFS= read -r line 
do 
   usage=$(echo $line | awk -F " " '{print $6F}' | cut -d "% -f1" )
   folder=$(echo $line | awk -F " " '{print $NF}')
   if [ $usage -ge $disk_threshold ]
   then 
      message+="$folder is more than $disk_threshold, current usage: $usage \n"
      fi 
      done <<<$disk_usage


#message

      