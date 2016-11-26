#!/bin/bash

find . -name '*.zip' -exec unzip -n '{}'  -d ./unzipped/ \;

cd ./unzipped

find . -name '*.TTF' -exec mv '{}' ../ttf/ \;
find . -name '*.ttf' -exec mv '{}' ../ttf/ \;

cd ..

mkdir ~/.fonts

cp ./ttf/*.ttf ~/.fonts
cp ./ttf/*.TTF ~/.fonts

fc-cache -f -v
