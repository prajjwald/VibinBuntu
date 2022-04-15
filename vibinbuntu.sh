#!/bin/bash

WORKDIR="/tmp/vibinbuntu"; mkdir -p ${WORKDIR}
BASEDIR=$(realpath `dirname $0`)


VIBDEB="https://download.cdn.viber.com/cdn/desktop/Linux/viber.deb";
LIBSSLDEB="http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1l-1ubuntu1.2_amd64.deb";

cd ${WORKDIR};

echo "Downloading deb files";
wget -c ${VIBDEB} & wget -c ${LIBSSLDEB} &
wait;

echo "Installing Viber deb";
# We will need 'ar' from 'binutils' for the next step
sudo apt install -y ./${VIBDEB} binutils;

echo "extracting libssl shared objects locally";
ar vx libssl*.deb;
tar xvf data.tar.zst;
echo "copying files and folders to /opt/viber";
sudo cp -r usr/lib/x86_64-linux-gnu/ /opt/viber/ssl;
# The Viber binary is 'Viber' with an uppercase V
sudo cp ${BASEDIR}/viber /opt/viber;
sudo sed -i 's[/Viber[/viber[g' /usr/share/applications/viber.desktop;
echo "Done";
echo "To uninstall: you can uninstall and re-install the viber deb";