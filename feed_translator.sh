#!/bin/bash

if [ -z $1 ]; then
 echo "command line syntax: ./feed_translater.sh process [LANGUAGE CODE] [SOURCE PATH OF FILE] [DESTINATION PATH OF FILE]"
 exit 0;
fi

if [ ! -z $1 ]; then

if [ $1 == "help" ]; then
 echo "command line syntax: ./feed_translater.sh process [LANGUAGE CODE] [SOURCE PATH OF FILE] [DESTINATION PATH OF FILE]"
fi

if [ $1 == "refrence" ]; then
 /usr/local/bin/trans -reference
fi


if [ $1 == "process" ]; then
 if [ -z $2 ] || [ -z $3 ] || [ -z $4 ]; then
  echo "all variables not present"
 else
  ##==========================================##

  LANGUAGE_CODE=$2
  SOURCE_PATH=$3
  DESTINATION_PATH=$4
  cp $SOURCE_PATH /tmp/feed_translater_source_aa55.csv

  FIRST_LINE=`head -1 /tmp/feed_translater_source_aa55.csv`

  /usr/bin/tail -n +2 /tmp/feed_translater_source_aa55.csv > /tmp/feed_translater_source_55aa.csv

  >$DESTINATION_PATH
  echo "$FIRST_LINE" > $DESTINATION_PATH

  while IFS= read -r line
  do
  field01=`/bin/echo $line | cut -d "," -f1`
  field02=`/bin/echo $line | cut -d "," -f2`
  field03=`/bin/echo $line | cut -d "," -f3`
  field04=`/bin/echo $line | cut -d "," -f4`
  field05=`/bin/echo $line | cut -d "," -f5`
  field06=`/bin/echo $line | cut -d "," -f6`
  field07=`/bin/echo $line | cut -d "," -f7`
  field08=`/bin/echo $line | cut -d "," -f8`
  field09=`/bin/echo $line | cut -d "," -f9`
  field10=`/bin/echo $line | cut -d "," -f10`
  field11=`/bin/echo $line | cut -d "," -f11`
  field12=`/bin/echo $line | cut -d "," -f12`
  field13=`/bin/echo $line | cut -d "," -f13`
  field14=`/bin/echo $line | cut -d "," -f14`

  field03_tr=`/usr/local/bin/trans -brief -no-auto :$LANGUAGE_CODE "$field03"`
  field04_tr=`/usr/local/bin/trans -brief -no-auto :$LANGUAGE_CODE "$field04"`
  field05_tr=`/usr/local/bin/trans -brief -no-auto :$LANGUAGE_CODE "$field05"`
  field13_tr=`/usr/local/bin/trans -brief -no-auto :$LANGUAGE_CODE "$field13"`

  /bin/echo "$field01,$field02,$field03_tr,$field04_tr,$field05_tr,$field06,$field07,$field08,$field09,$field10,$field11,$field12,$field13_tr,$field14" >> $DESTINATION_PATH
  done < /tmp/feed_translater_source_55aa.csv

  ##================================##
 fi
fi

fi
