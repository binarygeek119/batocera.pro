#!/bin/bash
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------




app=sunshine
url=$(curl -s https://api.github.com/repos/LizardByte/Sunshine/releases/latest | grep 'browser_' | cut -d\" -f4 | grep AppImage)




#--------------------------------------------------------------------------------------------------------------------------------
#################################################################################################################################
# optional: ---------------------------------------------------------------------------------------------------------------------
prefix="" 								# install directory, default: /userdata/system/pro/$app
ext="" 									# default: extras.txt, filelist to download for get-extras
dep="" 									# get app dependencies/libs  
repo=""									# specify custom repo/hosting
mode="" 								# screen / text, default=screen
theme=""  								# color / bw, default=color
loader="" 								# loading animation yes/no, default=yes 
custom="" 								# run app-custom/post/install script, default=/extras/custom.sh  
port="" 								# add port (name), none = /extras/port.sh (to $app.sh), or /extras/launcher.sh 
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
#################################################################################################################################
# start pro-framework 
cd /tmp/ ; rm /tmp/pro-framework.sh 2>/dev/null ; wget -q -O --no-cache /tmp/pro-framework.sh \
https://raw.githubusercontent.com/uureel/batocera.pro/main/.dep/pro-framework.sh ; dos2unix /tmp/pro-framework.sh ; 
source /tmp/pro-framework.sh ; start-pro-framework
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
say-hi
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
get-appimage $url $prefix
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
get-extras
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
# run app-custom script, default=/extras/custom.sh 
add-custom
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
add-port 
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
add-autostart
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
say-bye
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
