#!/bin/bash
#########################################################################################
# published under the x-license                                                         #
# Copyright (c) 2015 http://www.creator110.com                                          #
#########################################################################################

apt-get update
echo "update = done"
apt-get install screen -y
echo "install screen = done"
apt-get install openjdk-7-jre-headless -y #install JAVA
echo "install openjdk-7-jre-headless = done"

#create the directory 
mkdir /home/programme/mcs 
#change into the directory
cd /home/programme/mcs 

# download the minecraft server package
wget https://s3.amazonaws.com/Minecraft.Download/versions/1.8.3/minecraft_server.1.8.3.jar 
echo "download = done"
# rename the package 
mv minecraft_server.1.8.3.jar minecraft_server.jar

# create the file "start_mcs.sh" and write into
echo "#!/bin/bash" > start_mcs.sh
echo "cd /home/programme/mcs" >> start_mcs.sh
echo "screen -A -m -d -S minecraft_server java -Xms512M -Xmx1024M -jar minecraft_server.jar" >> start_mcs.sh

# create the file "stop_mcs.sh" and write into
echo "#!/bin/bash" > stop_mcs.sh
echo "screen -A -m -d -S minecraft_server -X quit" >> stop_mcs.sh

# make the scripts startable
chmod -R 777 /home/programme/mcs/start_mcs.sh
chmod -R 777 /homr/programme/mcs/stop_mcs.sh

# start the server
./start_mcs.sh
echo "pleas wait a moment..."
sleep 180 # wait while the server is starting
# stop the server
./stop_mcs.sh

# delete the file "server.properties"
rm server.properties

# create the file "server.properties and write the values 
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
# start the server
./start_mcs.sh
echo "please wait a moment..."
sleep 60 # wait while server is starting
echo "now connect to your server and play minecraft ;)"
