Anleitungen: https://github.com/MrGreenLlama/rosbot/

### Auf dem Roboter:
- ``/root/rosbot/startScripts/./roscoreStart.sh (Roscore starten)``

### Util
- ``export ROS_MASTER_URI=http://192.168.1.200:11311 (sagt ros auf dem Rechner, wo der Roboter ist.)``
- ``hostname -I (gibt die IP-Adressen des Rechners etc. an)``
- ``export ROS_IP=${Adresse des Rechners}``

### Steuerung einrichten
1. über SSH mit Robot verbinden
2. Roscore auf dem Robot starten
3. ``cd catkin_ws/src/iotbot/launch``
4. ``roslaunch skid.launch``
5. ``cd ~/wls/controller_ws``
6. ``export ROS_MASTER_URI=http://192.168.1.200:11311``
``export ROS_IP=192.168.1.100``
7. ``source devel/setup.bash`` 
8. ``python3 src/edu_virtual_joy/scripts/edu_virtual_joy_node.py``
