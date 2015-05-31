#!/usr/bin/bash

database=anagrafe
user=root
passw=root

function anagrafe {
   /Applications/MAMP/Library/bin/mysql --user=$user --password=$passw --database=$database -e "$1" 
} 


for f in data/comuni/*.zip
do
   echo "Unzipping..."$f
   unzip $f
done

for f in *.txt
do
   line=$(head -n 1 $f)
   line=${line//;/,}
   echo "Adding..."$f
   anagrafe "LOAD DATA LOCAL INFILE '"$f"'INTO TABLE anagrafe.comuni COLUMNS TERMINATED BY ';' LINES TERMINATED BY '\r' IGNORE 1 LINES ($line);"
   anagrafe "SELECT count(*) from comuni"
   rm $f
done


