#!/bin/bash
# Use this script to facilitate most common jobs related with transifex-client.
# ----------------------------------------------------------------------------
# 2014 Written by filux <heross(@@)o2.pl>
# Copyright (c) 2014-2016 under GNU GPL v3.0+

CURRENTDIR="$(dirname "$(readlink -f "$0")")"
cd $CURRENTDIR/..
if [ "$1" = "--help" ]; then
echo -e "\n Use this script to facilitate most common jobs related with transifex-client.
 In default (without parameters) script performs update of all translations.\n
 Usage: tx.sh [OPTION].
  available options (only one at once):
    '... --release'   - pull with abandonment of insufficiently complete translations
                        (is worth to use it e.g. just before new release),
    '... --push'      - push to transifex new version of sources,
    '... --push-all'  - push to transifex new version of sources and also improved
                        translations (before this step it's very recommended to use
                        '... --release' first),
    '... --help'      - this text.\n"
    exit 0
elif [ "$1" = "--release" ]; then
    find . -maxdepth 4 -name "*.lng" -type f -not -name "english.lng" -not -name "*_english.lng" \
	    -not -name "*_default.lng" | xargs rm -f
fi

tx_cl="$(which tx)"
tx_pull="$tx_cl pull -a --skip"
tx_push="$tx_cl push -s --skip"
tx_push_all="$tx_cl push -s -t --skip"
if [ "$1" = "--push" ]; then
    $tx_push
elif [ "$1" = "--push-all" ]; then
    $tx_push_all
elif [ "$1" = "" ] || [ "$1" = "--release" ]; then
    $tx_pull

    lang_list1="$(find ./data/lang/hint/ -maxdepth 1 -name "*.lng" -type f -not -name "*english.lng" \
		-not -name "*default.lng")"
    lang_list2="$(find . -maxdepth 4 -name "*.lng" -type f -not -name "*english.lng" \
		-not -name "*default.lng" -not -wholename "./data/lang/*.lng")"
    lang_list="$(echo -e "$lang_list1\n$lang_list2" | awk -F "/" '{ print $NF }' \
		| awk -F "_" '{ print $NF }' | awk '!a[$0]++' | xargs echo)"
    for s_lang in $lang_list; do
		main_lang="$(find ./data/lang/ -maxdepth 1 -name "$s_lang" -type f | xargs echo)"
		if [ "$main_lang" = "" ]; then find . -maxdepth 4 -name "*$s_lang" | xargs rm -f; fi
    done

    main_lang2="$(find ./data/lang/ -maxdepth 1 -name "*.lng" -type f -not -name "*english.lng" \
		-not -name "*default.lng")"
    p_lang_list="$(echo -e "$main_lang2\n$lang_list1\n$lang_list2" | awk -F "/" '{ print $NF }' \
		| awk -F "_" '{ print $NF }' | awk -F "." '{ print $1 }' | sort -u | xargs echo)"
    echo -e "\nThe list of currently supported languages in relation to 'lang_map':\n$p_lang_list"
    echo "If you see something strange on this list, then probably 'lang_map' needs a fix"
    echo -e "and after that, script should be executed once again with '--release' parameter.\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # this part has sed rules from the script Written by Tom Reynolds <tomreyn@megaglest.org>
    # with Copyright (c) 2012 Tom Reynolds under GNU GPL v3.0
    files="$(find . -maxdepth 4 -type f -name "*.lng" | sort -u | xargs)"
	for file in $files; do
		sed -i -e 's/&quot;/"/g' -e 's/&bdquo;/„/g' -e 's/&ldquo;/“/g' -e 's/[ \t]*$//' -e 's/^\([^=]*\)=\s*/\1=/' \
			-e 's/  */ /g' -e 's/ \\n/\\n/g' -e 's/\\n /\\n/g' -e 's/\\n\\n\\n/\\n\\n/g' -e 's/\\n\\n$/\\n/g' "$file"
	done
	# -^V- a tiny bit more time between edits
	for file in $files; do
		sed -i -e '$a\' "$file"
	done
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    "$CURRENTDIR/../others/appdata/estimate-the-translations.sh"; echo
fi

exit 0
