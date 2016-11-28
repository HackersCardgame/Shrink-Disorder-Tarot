#!/bin/bash

clear

echo -e "\e[31m* You need to install the fonts (./fonts/install.sh),
* to close all instances of inkscape
* and you maybe have to remove the clipit package (sudo apt-get remove clipit) temporarly\e[0m
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


find ./cards -name "*.svg" >./A4.txt

counter=0

 for i in $(cat ./A4.txt)
  do
   let counter=counter+1
   if (( $counter % 8 == 1 ))
   then 
     inkscape ./assembled/A4/templateA4.svg &
     file=$(basename $i .svg)
     sleep 3
   else
     file=$file-$(basename $i .svg)
   fi
   echo $i
   echo $file 
   /usr/bin/inkscape $i &
   sleep 6
   xdotool key Ctrl+Alt+a
   sleep 2
   xdotool key Ctrl+c
   sleep 0.2
   xdotool key Alt+Escape
   sleep 0.4
   xdotool key Ctrl+v
   sleep 0.5
   xdotool key Ctrl+g
   sleep 0.2
   xdotool key Alt+Escape
   sleep 0.2
   xdotool key Alt+F4

   if (( $counter % 8 == 0 ))
   then 
     sleep 0.5
     xdotool key Ctrl+Alt+a

     sleep 0.5
     xdotool key Alt+o

     sleep 0.5
     xdotool key End KP_Enter
     sleep 0.5
     xdotool key Tab
     sleep 0.2
     xdotool type '2'
     sleep 0.2
     xdotool key Tab Tab Tab
     sleep 0.2
     #xdotool type '4'
     sleep 0.2
     xdotool key Tab Tab Tab Tab
     sleep 0.2
     xdotool type '0'
     sleep 0.2
     xdotool key Tab
     sleep 0.2
     xdotool type '0'
     sleep 0.2
     xdotool key Tab
     sleep 0.1
     xdotool key KP_Enter
     sleep 1
     xdotool key Ctrl+Alt+a
     sleep 0.2
     xdotool key Ctrl+g
     sleep 0.2
     xdotool key Shift+Ctrl+a
     sleep 0.5
     xdotool key Tab Tab Tab Tab Tab
     sleep 0.5
     xdotool key KP_Enter
     sleep 0.5
     xdotool key Tab Tab Tab Tab Tab Tab
     sleep 0.5
     xdotool key KP_Enter

     xdotool key Ctrl+Shift+s
     sleep 0.2
     echo filename $file .svg
     sleep 1
     xdotool type "$file"
     sleep 1.5
  exit 0
     xdotool key KP_Enter
     sleep 1.5
     xdotool key Alt+F4
   fi
  done

