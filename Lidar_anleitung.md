Installieren vom YDLidar-SDK
===
---

>**einfach alles in den kästen auf einmal reinkopieren, dann wird alles nacheinander durchgeführt**
---
<br>
(nur empfohlen) ein neues workspace anlagen:

    cd
    mkdir ydlidar_ws/ ydlidar_ws/src/
    cd ydlidar_ws/
    catkin_make

>Einen neuen Workspace anlegen, sodass es einfacher ist zu wissen, wo welche Pakete installiert sind.
> 
>catkin_make macht aus dem ordner ein workspace.  

>**mehr infos unter: `http://wiki.ros.org/catkin/workspaces`**

<br>

---
<br>
Benötigte Pakete installieren:

    sudo apt install pkg-config && sudo apt update

>falls `sudo apt update` pakete zum Aktualisieren findet, `sudo apt upgrade` ausführen
>
> **`sudo apt update` aktualisiert pakete nicht, sondern such nur nach Updates!**

<br>

---
<br>
YDLidar-SDK runterladen und installieren:

    cd ~/ydlidar_ws/src/
    git clone https://github.com/YDLIDAR/YDLidar-SDK.git
    cd YDLidar-SDK/build
    cmake ..
    make
    sudo make install

>Steht auch auf `https://github.com/YDLIDAR/YDLidar-SDK/blob/master/doc/howto/how_to_build_and_install.md`

<br>

**FERTIG!**

---
---
<br>

Installieren vom YDLidar-ROS-driver
===

>ausführlich dokumentiert auf `https://github.com/YDLIDAR/ydlidar_ros_driver/blob/master/README.md`

~~es ist schon 23:15 Uhr, das hier nochmal aufzuschreiben lässt sich bestimmt aufschieben~~  
~~was du heute kannst besorgen verschiebe schön auf morgen!~~

<br>

---
---
<br>

Den Lidar starten!
===

<br>

---

>es gibt 2 Möglichkeiten: entweder von hand starten, **oder mein tolles handgemachtes Skript benutzten!** 

<br>
Herunterladen von meinen Skripten:

    cd
    git clone https://github.com/MrGreenLlama/rosbot.git
<br>
das Betriebssystem muss dem nutzer erlaubnis geben, die Skripte auszuführen:
    
    sudo chmod +x rosbot/*

>mit `./` kann man jetzt die Skripte ausführen! z.B.:`./rosbot/roscore-start.sh`  
>
> falls es nicht geht, müsst ihr wahrscheinlich die erste variable `LAUNCH` auf den richtigen Dateipfad weisen

ist das nicht pog?! ![{POG! hier sollte ein bild sein lol}](http://pipeman.org/poggers.png) 

<br>
<br>
ach ja, das andere verfahren...  

---

>man kann auch den LIDAR "manuell", also ohne mein skript starten (bzw selber dieselben sachen machen):

lidar ausstecken!

    cd /dev/
    ls
lidar wieder einstecken!

    ls
>es wird ein Gerät auftauchen, `ttyUSBx` das x wird eine Zahl sein, merkt euch dieses Gerät
 
>genau dies kann man mit dem `findUSBdev.sh` skript machen! 

<br>

dann zum lidar.launch:

    cd ~/ydlidar_ws/src/ydlidar_ros_driver/launch/
    ls
<br>
jetzt stehen da viele launch-dateien, nehmt die von eurem Lidar (hier als beispiel der X4):

    nano X4.launch
<br>
jetzt stehen da viele einstellungen, sucht die vom `port` und bessert den port zum Lidar `/dev/ttyUSBx` aus:

> \<param name="port"         type="string" value="/dev/ydlidar"/>

wird zu

> \<param name="port"         type="string" value="/dev/ttyUSBx"/>

<br>

dann kann man den endlich starten

    roslaunch ydlidar_ros_driver X4.launch

> Zuerst roscore mit dem kommando `roscore` starten, sonst gibts errors!

> Ich empfehle es mit screens zu arbeiten.  
> screen kann man mit `sudo apt install screen` installieren  
> um sachen in einen screen auszuführen einfach `screen -S <irgendein name> <Kommando>`
> z.B.: `screen -S lidar roslaunch ydlidar_ros_driver X4.launch`
> 
> um aus den screen herauszukommen `strg + a` + `d` drücken
> 
> um wieder hereinzukommen `screen -r <name>` z.B.: `screen -r lidar`
> 
> oder um alle anzuzeigen, nur `screen -r` eingeben
> 
> der screen lässt sich wie ein normaler prozess mit `strg + c` schliessen
> 
> für mehr infos `man screen nutzten` (man gibts in apt, wenn nicht vorinstalliert)
