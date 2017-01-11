#!/bin/bash

clear

echo -e "\e[31m * You need to install the fonts (./fonts/install.sh),
 * to close all instances of inkscape
 * and you maybe have to remove the clipit package (sudo apt-get remove clipit) temporarly\e[0m
 * for the moment it runs only on GNOME
"
echo -n "Press [ENTER] if you changed the settings."
read answer

echo

echo -n "install/remove required/unrequired debian jessie packages (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
sudo apt-get install xdotool figlet
sudo apt-get remove clipit
else
    echo not installing packages
fi


find ./cards -name "*.svg" >./A6.txt

counter=0

 for i in $(cat ./A6.txt)
  do
   let counter=counter+1
   if (( $counter % 2 == 1 ))
   then 
     inkscape ./assembled/A6/templateA6.svg &
     file=$(basename $i .svg)
     sleep 3
   fi
 
   /usr/bin/inkscape $i &
   sleep 3
   xdotool key Ctrl+Alt+a
   sleep 2
   xdotool key Ctrl+c
   sleep 0.2
   xdotool key Alt+Escape
   sleep 2
   xdotool key Ctrl+v
   sleep 1
   xdotool key Ctrl+g
   sleep 1
   xdotool key Alt+Escape
   sleep 0.2
   xdotool key Alt+F4

   if (( $counter % 2 == 0 ))
   then 
     file=$file-$(basename $i .svg)
     sleep 2
     xdotool key Ctrl+Alt+a
     sleep 1
     xdotool key Shift+Ctrl+a
     sleep 0.2
     xdotool key Tab Tab Tab Tab Tab
     sleep 0.5
     xdotool key space
     sleep 0.5
     xdotool key Tab Tab Tab Tab Tab Tab
     sleep 0.5
     xdotool key space
     sleep 0.5
     xdotool key Tab Tab Tab Tab Tab Tab Tab Tab Tab Tab Tab Tab Tab Tab Tab Tab Tab Tab space

    xdotool key Ctrl+Shift+s
     sleep 0.8
     xdotool type $file
     sleep 0.5
     xdotool key KP_Enter
     sleep 1.5
     xdotool key Alt+F4
   fi
  done

