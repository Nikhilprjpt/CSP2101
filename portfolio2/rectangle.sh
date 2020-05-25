#!/bin/bash

#Nikhil Bipinchandra Prajapati
#Student ID 10467336
#Portfolio 2 - rectangle.sh

INPUT=rectangle.txt > rectangle_f.txt
#field separator
OLDIFS=$IFS
IFS=','
#this will check all files for any input with the name - rectangle.txt
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
#this will loop to the end of the file
while read name height width area colour
do
#This will display all data in rectangle.txt file into a formatted file
   echo "Name:$name Height:$height Width:$width Area:$area Colour:$colour" | sed -e 's/,,/, ,/g' | column -t -s " " #I tried alligning my formatted data, but it did not work whatsoever
done < $INPUT
#code done
IFS=$OLDIFS
