#!/usr/bin/bash

## SETTINGS
database="anagrafe"
user="root"
passw="root"
function run_mysql_cmd {
   /Applications/MAMP/Library/bin/mysql --user=$user --password=$passw --database=$database -e "$1" 
} 


## Extract Gender Frequency
run_mysql_cmd "SELECT REPLACE(NOME,',',' ') as nome, COUNT(*) as tot, SUM(case when SESSO = 'M' then 1 else 0 end) as male, SUM(case when SESSO = 'F' then 1 else 0 end) as female FROM comuni WHERE SESSO!='' GROUP BY NOME" | tr '\t' ',' > data/gender.txt
