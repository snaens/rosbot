<!---
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
WENN DU DAS HIER LESEN KANNST DANN HAST DU DAS NICHT ALS MARKDOWN GEÖFFNET
42 ist eine tolle Zahl
--->

Installieren vom YDLidar-SDK
===
---

>**Alles in den kästen auf einmal reinkopieren, dann wird alles nacheinander ausgeführt**
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
> **`sudo apt update` aktualisiert Pakete nicht, sondern sucht nur nach Updates!**

<br>

---
<br>
YDLidar-SDK herunterladen und installieren:

    cd ~/ydlidar_ws/src/
    git clone https://github.com/YDLIDAR/YDLidar-SDK.git
    mkdir YDLidar-SDK/build
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

<br>

---
---
<br>

Den Lidar starten!
===

<br>

---

>Es gibt zwei Möglichkeiten: entweder von Hand starten, **oder mein tolles handgemachtes Skript benutzten!** 

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

ist das nicht pog?! ![POG! {hier sollte ein bild sein lol}](http://pipeman.org/poggers.png) 

<br>
<br>
Ach ja, das andere Verfahren...  

---

>Man kann auch den LIDAR "manuell", also ohne mein Skript starten (bzw selber dieselben Sachen machen):

Lidar ausstecken!

    cd /dev/
    ls
Lidar wieder einstecken!

    ls
>Es wird ein Gerät auftauchen: `ttyUSBx`. Das x wird eine Zahl sein, merkt euch dieses Gerät
 
>Genau dies kann man mit dem `findUSBdev.sh` Skript machen! 

<br>

Dann zum lidar.launch:

    cd ~/ydlidar_ws/src/ydlidar_ros_driver/launch/
    ls
<br>
Jetzt stehen da viele launch-Dateien, nehmt die von eurem Lidar (hier als beispiel der X4):

    nano X4.launch
<br>
Jetzt stehen da viele einstellungen, sucht die vom `port` und bessert den port zum Lidar dem Port, den ihr euch merken solltet aus.

> \<param name="port"         type="string" value="/dev/ydlidar"/>

wird zu

> \<param name="port"         type="string" value="PORT VON VORHER"/>

<br>

Dann kann man den Lidar endlich starten

    roslaunch ydlidar_ros_driver X4.launch

> Zuerst roscore mit dem kommando `roscore` starten, sonst gibts errors!

> Ich empfehle mit Screens zu arbeiten.  
> Screen kann man mit `sudo apt install screen` installieren  
> Um sachen in einen Screen zu starten: `screen -S <irgendein name> <Kommando>` (Kommando wird in dem neuen screen ausgeführt)
> z.B.: `screen -S lidar roslaunch ydlidar_ros_driver X4.launch`
> 
> um aus dem Screen herauszukommen `strg` + `a` + `d` drücken
> 
> um wieder hereinzukommen `screen -r <name>` z.B.: `screen -r lidar`
> 
> oder um alle anzuzeigen, nur `screen -ls` eingeben
> 
> der screen lässt sich wie ein normaler prozess mit `strg + c` schließen
> 
> für mehr infos: `man screen` nutzten (man gibts in apt, wenn nicht vorinstalliert)
