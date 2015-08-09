file<-"~/Github/anagrafeAmministratoriITA/regioni31122014.txt"

z <- read.csv(file,sep=";")

names(z)
with(z, table(TITOLO_DI_STUDIO, SESSO))

## Regione and gender
tab <- with(z, table(DESC_REGIONE, SESSO))
chisq.test(tab) ## Chisq. find an association between gender & region

## 
with(z, table(DESCRIZIONE_CARICA,SESSO))
