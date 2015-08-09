#!/usr/bin/bash
if [ "$#" -ne 1 ]; then
   echo "Illegal number of parameters"
   exit
fi

## SETTINGS
database="anagrafe"
user="root"
passw="root"
function run_mysql_cmd {
   /Applications/MAMP/Library/bin/mysql --user=$user --password=$passw --database=$database -e "$1" 
} 

if [ $1 = "-comuni" ]; then
   table="anagrafe.comuni"
   files=data/comuni/*.zip
fi

if [ $1 = "-province" ]; then
   table="anagrafe.province"
   files=data/province/*.zip
fi

if [ $1 = "-regioni" ]; then
   table="anagrafe.regioni"
   files=data/regioni/*.zip
fi


run_mysql_cmd "TRUNCATE $table"
for f in $files
do
   unzip $f
   filename=$(basename $f)
   filename=${filename%.*}.txt
   fields=$(head -n 1 $filename)
   fields=${fields//;/,}
   echo "Upload...$filename"
   run_mysql_cmd "LOAD DATA LOCAL INFILE '"$filename"' INTO TABLE $table COLUMNS TERMINATED BY ';' LINES TERMINATED BY '\r' IGNORE 1 LINES ($fields);"
#   run_mysql_cmd "SELECT count(*) from $table"
   rm $filename
done


