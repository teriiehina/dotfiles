#!/bin/sh

brew install libusb
brew install freetype

ln -s /usr/local/include/freetype2 /usr/local/include/freetype

sudo pip install PIL
sudo pip install qrcode
sudo pip install pyusb==1.0.0b1
sudo pip install pyserial
sudo pip install SOAPpy
sudo pip install suds
