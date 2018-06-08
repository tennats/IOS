#!/bin/sh

allFiles=`cat $1`

filename="/home/imjasojedov/Documents/IOS/projekt1/file"
temp=""

for file in $allFiles
do 
		
		if [ ! -f "$file" ]; then				
			sed -i '/'$file'/d' $filename
			#grep -v "$file" $filename >> $temp ; cat $temp >> $filename			
		fi
done
