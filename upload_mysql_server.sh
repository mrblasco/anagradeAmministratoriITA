#!/usr/bin/bash

database=anagrafe
user=root
passw=root

function anagrafe {
   /Applications/MAMP/Library/bin/mysql --user=$user --password=$passw --database=$database -e "$1" 
} 

anagrafe "TRUNCATE anagrafe.comuni"
for f in data/comuni/*.zip
do
   echo "Unzipping..."$f
   unzip $f
   filename=$(basename $f)
   filename=${filename%.*}.txt
   fields=$(head -n 1 $f)
   fields=${fields//;/,}
   echo "Adding..."$filename
   anagrafe "LOAD DATA LOCAL INFILE '"$filename"'INTO TABLE anagrafe.comuni COLUMNS TERMINATED BY ';' LINES TERMINATED BY '\r' IGNORE 1 LINES ($fields);"
   anagrafe "SELECT count(*) from comuni"
   rm $filename
# done


