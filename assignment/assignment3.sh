#!/bin/bash

#NIKHIL BIPINCHANDRA PRAJAPATI
#STUDENT ID: 10467336
#ASSIGNMENT 3 - SOFTWARE BASED SOLUTION

[[ -e imgs.txt ]] || [[ -s imgs.txt ]] || curl {https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152} | grep -o -e 'http[^"]*\.jpg' > imgs.txt | sort -u imgs.txt

#this is a function to download a single file
downloadOne()
{
read -p "Please enter the last 4 digit of the image you want to download: " digit
wget - 'https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152'DSC0$digit.jpg

echo "PROGRAM FINISHED. SPECIFIC FILE DOWNLOADED" #Program finished
}

#function to download all files
downloadALL()
{
wget -i imgs.txt

echo "PROGRAM FINISHED. ALL FILES DOWNLOADED" #Program finished
}

#function to download a range of files
downloadRange()
{
read -p "please enter the last four digits in your range (start): " start
read -p "please enter the last four digits in your range (end): " end
let end+=1
while (( $start < $end )) ; do
wget - 'https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152'DSC0$start.jpg
let start+=1
done

echo "PROGRAM FINISHED" #Program finished
}

#function to download specified number of files
downloadRandom()
{
read -p "Please enter the amount of images you want to download: " numbers
shuf -n $numbers imgs.txt > chosen.txt
wget -i chosen.txt

echo "PROGRAM FINISHED. SPECIFIED IMAGES DOWNLOADED" #Program finished
}

#This is the menu for the user to interact with
echo """1)Download a specific image
2)Download all images
3)Download images in a range
4)Download specified number of images"""
read -p "Please input your option: " option

case $option in
1)
downloadOne ;; #jump to this function when 1 is inputted
2)
downloadALL ;; #jump to this function when 2 is inputted
3)
downloadRange ;; #jump to this function when 3 is inputted
4)
downloadRandom ;; #jump to this function when 4 is inputted
*)

#This will print an error when any other key is inputted
echo "ERROR, INVALID OPTION!!" ;; 
esac