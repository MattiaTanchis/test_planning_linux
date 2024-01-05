#!/usr/bin/env bash

# exit when any command fails
set -e

# Aggiorna i pacchetti e installa python3 e tar
apt-get update && apt-get install -y python3 tar

# Installa sudo
apt-get update && apt-get install -y sudo

# Crea un utente temporaneo e aggiungilo al gruppo sudo
useradd -m -G sudo myuser

# Configura sudo per l'utente
echo 'myuser ALL=(ALL:ALL) NOPASSWD:ALL' > /etc/sudoers.d/myuser

# Cambia l'utente predefinito a myuser
su myuser

# Cambia il working directory
cd /home/myuser

# Torna a root
su root

# Installa sudo di nuovo (potrebbe non essere necessario, a seconda della situazione)
apt-get update && apt-get install -y sudo

# Rimuovi i file temporanei
rm -rf /var/lib/apt/lists/*

# Aggiorna l'utente myuser e il gruppo associato
usermod -aG sudo myuser
echo 'myuser ALL=(ALL:ALL) NOPASSWD:ALL' > /etc/sudoers.d/myuser
usermod -u 1000 myuser
groupmod -g 1000 myuser

# Cambia utente predefinito
su myuser

# Installa cmake
cd /tmp
wget https://github.com/Kitware/CMake/releases/download/v3.28.1/cmake-3.28.1.tar.gz
tar -zxvf cmake-3.28.1.tar.gz
cd cmake-3.28.1
./bootstrap
make
sudo make install

sudo apt-get update
sudo apt-get install build-essential autoconf

