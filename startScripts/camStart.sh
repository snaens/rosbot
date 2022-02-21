#!/bin/bash

# user-definable variables
LAUNCH='/root/catkin_ws/libuvc_camera.launch'
NAME='cam'

# colors!
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# check if roscore is running
if ! screen -list | grep -q "roscore"; then
    printf "${RED}ERROR: Could not find screen 'roscore', start it first!${NC}%s\n"
	exit 0
fi

# check if camera is already running
if screen -list | grep -q "${NAME}"; then
    printf "${RED}ERROR: ${NAME} is already running.\nStart anyway? (not recommended) y/n${NC}%s\n"
    read -r YN
	if ! [ "$YN" = "y" ]||[ "$YN" = "Y" ]; then
		exit 1
fi; fi

# LAUNCH!
printf "${YELLOW}starting ${NAME}...${NC}%s\n"
rm /root/rosbot/logs/${NAME}Log.txt # remove old log, otherwise log just keeps on getting longer...
{
screen -dm -L -Logfile "/root/rosbot/logs/${NAME}Log.txt" -S ${NAME} roslaunch "${LAUNCH}" && printf "${GREEN}Screen '${NAME}' started!${NC}%s\n"
}||{ printf "${RED}ERROR: could not start screen '${NAME}'${NC}%s\n"; }

sleep 14
if ! screen -list | grep -q "${NAME}"; then
  printf "${RED}ERROR: screen crashed! Check logs at '~/rosbot/logs/${NAME}Log.txt'${NC}%s\n"
fi
