#!/bin/bash

files=$(git ls-files)
bundle=$(printf '%s\n' "${PWD##*/}")

rm -rf ./$bundle
rm -rf ./$bundle.zip
mkdir ./$bundle
for file in $files
do
    echo "Processing $file"
    fullpath="./$bundle"
    for i in $(echo $file | tr "/" "\n")
    do
        if [[ "$i" != *"."* ]]; then
            fullpath="$fullpath/$i"
        fi

    done

    echo "Creating $fullpath"
    mkdir -p $fullpath

    cp $file ./$bundle/$file
done
zip -r ./$bundle.zip ./$bundle/*
rm -rf ./$bundle
