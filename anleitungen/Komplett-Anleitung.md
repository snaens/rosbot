Anleitungen: https://github.com/MrGreenLlama/rosbot/

### Auf dem Roboter:
- ``/root/rosbot/startScripts/roscoreStart.sh (Roscore starten)``

### Util
- ``export ROS_MASTER_URI=http://192.168.1.200:11311 (sagt ros auf dem Rechner, wo der Roboter ist.)``
- ``hostname -I (gibt die IP-Adressen des Rechners etc. an)``
- ``export ROS_IP=${Adresse des Rechners}``

### Steuerung einrichten
1. über SSH mit Robot verbinden
2. Roscore auf dem Robot starten
3. ``source catkin_ws/devel/setup.bash``
4. ``roslaunch iotbot skid.launch``


### Auf dem laptop
``export ROS_MASTER_URI=http://192.168.1.200:11311``  
``export ROS_IP=192.168.1.100`` (laptop-IP eingeben)  

#### Anzeige/steuer-programme
``rosrun rviz rviz``  
``python3 ~/catkin_ws/src/edu_virtual_joy/scripts/edu_virtual_joy_node.py``  
