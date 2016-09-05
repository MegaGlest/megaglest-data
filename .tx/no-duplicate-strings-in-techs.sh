#!/bin/sh
# Use this script to remove duplicate lines from default language files in tech trees,
# e.g. megapack_default.lng. Basically script is usefull only (once) with freshly produced
# default lng (--translate-techtrees=x).
#
# How to use: Execute this script with one parameter, which should be an absolute path
# to default lng file.
# ----------------------------------------------------------------------------
# 2016 Written by filux <heross(@@)o2.pl>
# Copyright (c) 2016 under GNU GPL v3.0+
LANG=C

CURRENTDIR="$(dirname "$(readlink -f "$0")")"
cd "$CURRENTDIR"

awk -i inplace '!/^UnitTypeName_/ {print;next};{print;print}' "$1"; sleep 0.5s
sed -z -i -e 's/\n/|||/g' "$1"; sleep 0.5s
sed -i -e 's/; Unit|||UnitTypeName_[^=]*=/; Unit > /g' "$1"; sleep 0.5s
sed -z -i -e 's/|||/\n/g' "$1"; sleep 0.5s
awk -i inplace '/^; / { print; next; }; !a[$0]++' "$1"; sleep 0.5s
sed -z -i -e 's/\n/|||/g' "$1"; sleep 0.5s
sed -i -e 's/; Levels for this Unit|||; -*|||//g' -e 's/; Types of Commands for this Unit|||; -/; -/g' \
-e 's/; Levels for this Unit|||//g' -e 's/; Types of Commands for this Unit|||//g' \
-e 's/; Unit > [^|]*|||UnitTypeName_/UnitTypeName_/g' -e 's/; -*|||; -/; -/g' \
-e 's/; Unit > [^|]*|||; -------------------------------------|||//g' \
-e 's/; Unit > [^|]*|||; --------------------------------------*/; -----------------------------------------------------------------------------/g' \
-e 's/; -*|||; -/; -/g' "$1"; sleep 0.5s
sed -z -i -e 's/|||/\n/g' "$1"
