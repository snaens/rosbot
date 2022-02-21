#!/bin/bash

# user-definable variables
LAUNCH='/root/ydlidar_ws/src/ydlidar_ros_driver/launch/X4.launch'
NAME='lidar'

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

# check if lidar is already running
if screen -list | grep -q "${NAME}"; then
  printf "${RED}ERROR: ${NAME} is already running.\nStart anyway? (not recommended) y/n${NC}%s\n" # ask if user would like to continue anyway
  read -r YN
	if ! [ "$YN" = "y" ]||[ "$YN" = "Y" ]; then
		exit 1
fi; fi


# some script I took *inspiration* from off stackoverflow (actual script is findUSBdev.sh)
# It returns the LIDAR's /dev/ttyUSBx -port
# I barely know how it works so NO TOUCHY! (unless you know what you are doing)
DEV="Silicon_Labs_CP2102_USB_to_UART_Bridge_Controller_0001"

port=$( ( (
for sysdevpath in $(find /sys/bus/usb/devices/usb*/ -name dev ); do    
    # ( to launch a subshell here
    (
        syspath="${sysdevpath%/dev}"
        devname="$(udevadm info -q name -p $syspath)"
        [[ "$devname" == "bus/"* ]] && exit
        eval "$(udevadm info -q property --export -p $syspath)"        
        [[ -z "$ID_SERIAL" ]] && exit
        echo "/dev/$devname - $ID_SERIAL"
    )& # & here is causing all of these queries to run simultaneously  
done
# wait then gives a chance for all of the iterations to complete       
wait
# output order is random due to multiprocessing so sort results        
) | sort ) | grep "$DEV" | awk '{print $1}' )


# edit lidar setup file to correct port
line=$(grep -nw port "${LAUNCH}" | cut -f1 -d:)

sed -i "${line}"c"\ \ \ \ <param name=\"port\"         type=\"string\" value=\"${port}\"/>" "${LAUNCH}"

if ! [ -e ${port} ]; then # check if the port exists
  printf "${RED}ERROR: could not find ${NAME}.${NC}%s\n" && exit 1
fi

# LAUNCH!
printf "${YELLOW}starting ${NAME}...${NC}%s\n"
rm /root/rosbot/logs/${NAME}Log.txt # remove old log, otherwise log just keeps on getting longer...
{
screen -dm -L -Logfile "/root/rosbot/logs/${NAME}Log.txt" -S ${NAME} roslaunch "${LAUNCH}" && printf "${GREEN}Screen '${NAME}' started!${NC}%s\n"
}||{ printf "${RED}ERROR: could not start screen '${NAME}'${NC}%s\n"; }

sleep 8
if ! screen -list | grep -q "${NAME}"; then
  printf "${RED}ERROR: screen crashed! Check logs at '~/rosbot/logs/${NAME}Log.txt'${NC}%s\n" && exit 2
fi
