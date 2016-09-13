#!/bin/sh
# Use this script to estimate percent of advancement of translations.
#
# ----------------------------------------------------------------------------
# 2016 Written by filux <heross(@@)o2.pl>
# Copyright (c) 2016 under GNU GPL v3.0+
LANG=C

CURRENTDIR="$(dirname "$(readlink -f "$0")")"
cd "$CURRENTDIR"
Appdata_file="$CURRENTDIR/megaglest.appdata.xml"

Lang_map="$(awk -F '=' '/lang_map/ {print "=" $2}' "$CURRENTDIR/../../.tx/config" | sed 's/[,=] /\\n/g')"
Translations_list="$(find "$CURRENTDIR/../../data/lang" -maxdepth 1 -name "*.lng" -type f \
    | awk -F '/' '{ print $NF }' | awk -F '.lng' '{ print $1 }' | sort)"
En_files="$(find "$CURRENTDIR/../../" -maxdepth 4 -name "*english.lng" -o -name "*_default.lng" -type f)"
En_strings=0
for En_file in $En_files; do
    En_strings="$(($En_strings + $(grep -v '^[;#]\|^[\t ]*$' "$En_file" -c)))"
done
Languages="  <languages>"
for Translation in $Translations_list; do
    if [ "$Translation" != "english" ]; then
	Tr_abbreviation="$(echo "$Lang_map" | awk -F ':' '/'$Translation'$/ {print $1}')"
	Tr_files="$(find "$CURRENTDIR/../../" -maxdepth 4 -name "*${Translation}.lng" -type f)"
	Tr_strings=0
	for Tr_file in $Tr_files; do
	    Tr_strings="$(($Tr_strings + $(grep -v '^[;#]\|^[\t ]*$' "$Tr_file" -c)))"
	done
	Tr_perc="$(((($Tr_strings * 100) + ($En_strings / 2)) / $En_strings))"
	# ^ correct rounding
    else
	Tr_abbreviation="en"; Tr_files="$En_files"; Tr_strings="$En_strings"; Tr_perc=100
    fi
    Languages="$Languages|||    <lang percentage=\"$Tr_perc\">$Tr_abbreviation</lang>"
    Translations="${Translations}$Translation - $Tr_perc%, "
done
echo "$Translations"
Languages="$Languages|||  </languages>"
sed -z -i -e 's/\n/|||/g' "$Appdata_file"; sleep 0.25s
sed -i -e "s@[ \t]*<languages>.*</languages>@$Languages@" "$Appdata_file"; sleep 0.25s
sed -z -i -e 's/|||/\n/g' "$Appdata_file"
