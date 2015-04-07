#!/bin/bash
#######################################################################################
# English                                                                             #
# with editor ( nano or vi) a new file name to create "mcs.sh"                        #
# copy the script into the file "mcs.sh" and make with "chmod 777 mcs.sh" executable  #
# script start with "./mcs.sh "                                                       #
#######################################################################################
# German                                                                              #
# mit Editor (nano oder vi) eine neue Datei mit dem namen mcs.sh anlegen              #
# Skript reinkopieren und mit "chmod 777 mcs.sh" ausfuehrbar machen                   #
# Skript starten mit "./mcs.sh"                                                       #
#######################################################################################

apt-get update
echo "update = done"
apt-get install screen -y
echo "install screen = done"
apt-get install openjdk-7-jre-headless -y
echo "install openjdk-7-jre-headless = done"

mkdir /home/programme/mcs
cd /home/programme/mcs

wget https://s3.amazonaws.com/Minecraft.Download/versions/1.8.3/minecraft_server.1.8.3.jar 
echo "download = done"
mv minecraft_server.1.8.3.jar minecraft_server.jar

sleep 60

echo "#!/bin/bash" > start_mcs.sh
echo "cd /home/programme/mcs" >> start_mcs.sh
echo "screen -A -m -d -S minecraft_server java -Xms512M -Xmx1024M -jar minecraft_server.jar" >> start_mcs.sh

echo "#!/bin/bash" > stop_mcs.sh
echo "screen -A -m -d -S minecraft_server -X quit" >> stop_mcs.sh

chmod -R 777 /home/programme/mcs/start_mcs.sh
chmod -R 777 /homr/programme/mcs/stop_mcs.sh

./start_mcs.sh
echo "pleas wait a moment..."
sleep 180
./stop_mcs.sh

rm server.properties

echo "level-name=world" > server.properties
echo "allow-nether=true" >> sever.properties
echo "view-distance=10" >> sever.properties
echo "spawn-monsters=true" >> sever.properties
echo "online-mode=false" >> sever.properties
echo "spawn-animals=true" >> sever.properties
echo "max-players=20" >> sever.properties
echo "server-ip=" >> sever.properties
echo "pvp=true" >> sever.properties
echo "level-seed=" >> sever.properties
echo "server-port=25565" >> sever.properties
echo "allow-flight=false" >> sever.properties
echo "white-list=false" >> sever.properties

echo "server.properties = configured"
./start_mcs.sh
echo "please wait a moment..."
sleep 60
echo "now connect you to your server and play minecraft ;)"
