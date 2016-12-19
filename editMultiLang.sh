#!/bin/bash

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

find ./cards -name "*.svg" >./print.txt



 /usr/bin/inkscape &



 for i in $(cat ./print.txt)
  do

   echo $i
   /usr/bin/inkscape $i &

   echo cards.EN/$(basename $(dirname $i))/$(basename $i)
   /usr/bin/inkscape cards.EN/$(basename $(dirname $i))/$(basename $i) &
  
   read
  done


