#!/bin/bash

## Download Tabelle
 cd data/tabelle
curl -O http://amministratori.interno.it/tabelle/tabella[6-10].txt 
curl -O http://amministratori.interno.it/tabelle/codicicarica.txt

cd ../comuni
curl -O http://amministratori.interno.it/amministratori/storico/comuni3112[1985-2015].zip

cd ../province
curl -O http://amministratori.interno.it/amministratori/storico/province3112[1985-2015].zip

cd ../regioni
curl -O http://amministratori.interno.it/amministratori/storico/regioni3112[1985-2015].zip

# Corpo elettorale
cd ../electorate
curl -O http://amministratori.interno.it/semestrale/seme/3006[1988-2015].zip
curl -O http://amministratori.interno.it/semestrale/seme/3112[1988-2015].zip