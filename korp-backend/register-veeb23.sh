#!/bin/bash
# Execute scripts needed to register corpora files for cwb

# check for existence of file
if [ "$#" -ne 1 ] || ! [ -f "$1" ]; then
  echo "Usage: $0 vrt file" >&2
  exit 1
fi


FILENAME=$1
FN=`echo $FILENAME|sed 's/[.]vrt//g'`
FNUPPER=`echo $FN|tr '[:lower:]' '[:upper:]'`

CWBVERSION="cwb-3.4.8"
# CWBVERSION="cwb-3.4.11"

CWBENCODE=`which cwb-encode`
CWBMAKEALL=`which cwb-makeall`


# 0. Clean old data
rm -rf /corpora/data/$FN
rm -rf /corpora/registry/$FN
mkdir /corpora/data/$FN

# 1. Convert vrt to cwb format

$CWBENCODE -s -p - -d /corpora/data/$FN -R /corpora/registry/$FN -c utf8 -f /corpora/$FILENAME -P word -P baseform -P pos -P msd \
	   -S sentence:0+n -S paragraph:0+n+heading \
	   -S doc:0+feed_hostname+feed_title+url+timestamp_year+date+datefrom+dateto+timefrom+timeto+genre+topic+title


# 2. Register corpus
$CWBMAKEALL -r /corpora/registry -V $FNUPPER

# 3. Insert info about corpus
echo -e "Sentences: $(cat $FILENAME|grep '<sentence'|wc -l)\nUpdated: $(date -I)\n" > data/$FN/.info

# # TEST
# echo $FILENAME
# echo $FN
# echo $FNUPPER
