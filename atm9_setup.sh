#!/bin/bash

# ATM9 Server Auto-Installer
# Works on Ubuntu 22.04+, Amazon Linux 2

echo "Updating server..."
sudo apt update && sudo apt upgrade -y

echo "Installing required packages..."
sudo apt install -y openjdk-17-jdk wget unzip screen

echo "Setting up ATM9 server directory..."
mkdir -p ~/atm9-server
cd ~/atm9-server

echo "Downloading ATM9 server pack..."
wget https://mediafilez.forgecdn.net/files/5232/740/ATM9-0.0.63-server.zip -O atm9_server.zip

echo "Unzipping server files..."
unzip atm9_server.zip
rm atm9_server.zip

echo "Accepting EULA..."
echo "eula=true" > eula.txt

echo "Making start script..."
cat <<EOL > start.sh
#!/bin/bash
java -Xms6G -Xmx6G -jar forge-*.jar nogui
EOL
chmod +x start.sh

echo "Done! To start your server:"
echo "cd ~/atm9-server"
echo "./start.sh"
