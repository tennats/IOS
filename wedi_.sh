#!/bin/sh

POSIXLY_CORRECT=yes

#--------------VARIABLES---------------
arg="$1"
EDITOR=nano

export WEDI_RC=$HOME/.config/wedirc


if [ -z "$WEDI_RC" ]; then 
        echo "Premenna WEDI_RC nieje nastavena">&2 
	exit 13 
fi


#--------------EDITORY-----------------
#if [ -z "$EDITOR" ]; then
#	if [ -z "$VISUAL" ]; then
#		echo "Premenna EDITOR a VISUAL neboli nastavene!!!" >&2
#		EDITOR=vi
#	else
#		$VISUAL "$arg";
#	fi
#else
#	$EDITOR "$arg";	
#fi

#--------------------------------------


# check WEDI_RC 
#-----------------WEDI_RC--FORMAT---------------------
#NazovSuboru	DatumEditace	PocetEditacii	
# subor1	datum		1
# subor2 	datum		3


edit()
{
	$1 "$2"
	exit_code=$?
	fullPath=`readlink -f "$2"`
	printf "$fullPath|`date +"%F_%T"`|42\n" >>$WEDI_RC
	exit $exit_code
}





if [ $# -eq 0 ]; then
	echo "NO ARGUMENTS!"
elif [ $# -eq 1 ] && [ -f $1 ]; then
	edit $EDITOR "$1"
	
elif [ $# -eq 1 ] && [ -d $1 ]; then
	directory="$1"
	fullPath=`readlink -f "$1"`
	fileName=`grep "$fullPath" "$WEDI_RC" | cut -f1 -d '|' | awk -F"/" 'NF{ print $NF }'`	
	edit $EDITOR "$fileName"
fi

#elif [ $# -eq 2 ] && [ "$1" = "-l" ]; then
	
#elif [ $# -eq 2 ] && [ "$1" = "-m" ]; then
	





















#if [ -f $1 ]; then
#	$EDITOR "$1";
#else
#	echo "ERROR!">&2
#fi

