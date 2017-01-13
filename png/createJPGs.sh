#!/bin/sh
find . -type d -maxdepth 1 | grep -v ^.$ |cut -c 3- >./languages.txt

for l in $(cat ./languages.txt)
do
  echo  ../$l/ => ../jpg/$l/
  mkdir --parents ../jpg/$l


  find ./$l/ -name '*.png' -exec convert -format jpg -quality 50 '{}' ../jpg/'{}'.jpg \;

done

#convert image.png image.jpg
