#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5
MESSAGE=""

while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6}' | cut -d "%" -f1 )
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MESSAGE+="$FOLDER is more than $DISK_THRESHOLD, Current usage: $USAGE \n"   #here + previous and present 6 kanna ekuva ga vastahe chupithudi /n means new line 
    fi
done <<< $DISK_USAGE
echo -e "Message: $MESSAGE"

echo "$MESSAGE" | mail -s "Hacker Alert be carefull" ramanasurya3470@gmail.com   

# echo "body" | mail -s "subject" to-address