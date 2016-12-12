#!/bin/bash

find . -name '*.png' -exec convert -format jpg -quality 50 '{}' ./small/'{}'.jpg \;

#convert image.png image.jpg
