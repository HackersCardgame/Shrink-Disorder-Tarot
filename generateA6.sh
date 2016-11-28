#!/bin/bash

echo "


"
echo "You need to install the fonts (./fonts/install.sh), to close all instances of inkscape, and you maybe have to remove the clipit package temporarly"
echo -n "Press [ENTER] if you changed the settings."
read answer

#unfortunately inkscape -p has a bug in debian jessie => Workarround

echo "


"

echo -n "install required debian jessie packages (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
sudo apt-get install xdotool figlet
else
    echo not installing packages
fi

echo "

"


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
   sleep 0.4
   xdotool key Ctrl+v
   sleep 0.5
   xdotool key Ctrl+g
   sleep 0.2
   xdotool key Alt+Escape
   sleep 0.2
   xdotool key Alt+F4
   sleep 0.5

   if (( $counter % 2 == 0 ))
   then 
     file=$file-$(basename $i .svg)

     xdotool key Ctrl+Alt+a
     sleep 0.2
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
     sleep 0.2
     xdotool type $file
     sleep 0.5
   fi
  done

