#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

#check if roscore is running
if screen -list | grep -q "roscore"; then
    printf "${RED}ERROR: roscore is already running.${NC}%s\n"
    printf "${RED}start anyway? (not recommended) y/n${NC}%s\n" #ask if user would like to continue anyway
    read -r YN
        if ! [ "$YN" = "y" ]||[ "$YN" = "Y" ]; then
                exit 1
fi
fi


#start roscore and check for errors
printf "${YELLOW}starting roscore...${NC}%s\n"
rm /root/rosbot/logs/roscoreLog.txt #remove old log, otherwise log just keeps on getting longer...
{ screen -dm -L -Logfile "/root/rosbot/logs/roscoreLog.txt" -S roscore roscore && printf "${GREEN}roscore started in screen 'roscore'!${NC}%s\n"; }||{ printf "${RED}error starting screen 'roscore'${NC}%s\n"; }

sleep 4
if ! screen -list | grep -q "${NAME}"; then
  printf "${RED}ERROR: screen crashed! Check logs at '~/rosbot/logs/${NAME}Log.txt'${NC}%s\n" && exit 2
fi
