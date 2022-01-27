Sodass ROS sich automatisch an der IP vom Robot anpasst, muss man ROS die IP "sagen"

    nano ~/.bashrc
    
.bashrc wird immer ausgefuehrt wenn der Nutzer ein terminal startet

in die Datei folgendes am ende hereinkoperen:

    MYIP=`hostname -I | awk '{print $1}'`
    export ROS_MASTER_URI=http://${MYIP}:11311
    export ROS_IP=${MYIP}
    export ROS_HOSTNAME=${MYIP}
    
Fertig!  
ROS passt sich jetzt an der IP vom Robot an!
