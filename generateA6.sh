#!/bin/bash

#xdg-open ./PrinterSettings.png

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

echo -e "\e[34m"

figlet -f banner WARNING!!!
echo -e "\e[31mmy printer-firmware seems to hate this cards, even it has no route to the internet. eg if you printed 10 Cards the printer is electrostatically loaded, so the cards stick together you the printer takes 2-5 cards at the same time, so in this case it's the easiest to remove all paper from all trays and put the cards single into the printer

\e[0mplease press [enter] to continue
"
read answer


find ./cards -name "*.svg" >./A6.txt

counter=0

 for i in $(cat ./A6.txt)
  do
   let counter=counter+1
   if (( $counter % 2 == 1 ))
   then inkscape ./assembled/A6/templateA6.svg &
   fi
 

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
   sleep 0.5

   if (( $counter % 2 == 0 ))
   then 
     xdotool key Ctrl+Alt+a
     sleep 0.2
     xdotool key Shift+Ctrl+a
     sleep 0.2
     xdotool key Tab
     sleep 0.5
     xdotool key Tab
     sleep 0.5
     xdotool key Tab
     sleep 0.5
     xdotool key Tab
     sleep 0.5
     xdotool key Tab
     sleep 0.5
     xdotool key space
     sleep 0.5
     xdotool key Tab
     sleep 0.5
     xdotool key Tab
     sleep 0.5
     xdotool key Tab
     sleep 0.5
     xdotool key Tab
     sleep 0.5
     xdotool key Tab
     sleep 0.5
     xdotool key Tab
     sleep 0.5
     xdotool key space
     sleep 0.5
     xdotool key Tab Tab Tab Tab Tab Tab Tab Tab Tab Tab Tab Tab Tab Tab Tab Tab Tab Tab space

    xdotool key Ctrl+Shift+s
     sleep 0.2
     xdotool type 'temp'
   fi


   echo printed $i

  done

