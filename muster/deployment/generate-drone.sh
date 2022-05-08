#!/bin/bash

if [ -z "$*" ]; 
    then 
    echo "No arguments Provided";
    echo "available arguments are"
    echo "-e|--envfolder     | Suply enyromentfolder" 
    echo "-s|--sourcedir   | Supply source directory"
    echo "-o|--output      | Supply output directory"
    exit 1
fi

while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    -e|--envfolder)
    ENVFOLDER="$2"
    shift # past argument
    shift # past value
    ;;
    -s|--sourcedir)
    SOURCE="$2"
    shift # past argument
    shift # past value
    ;;
    -o|--output)
    OUTPUT="$2"
    shift # past argument
    shift # past value
    ;;
    *) echo "Unknown parameter passed: $1"; exit 1 ;;
esac
done

mkdir -p $OUTPUT
read -p "Delete content of $(cd "$(dirname "$OUTPUT")" && pwd)/$(basename "$OUTPUT"): " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Deleting content of $(cd "$(dirname "$OUTPUT")" && pwd)/$(basename "$OUTPUT")!"
    rm -rf $OUTPUT/*
    rm -rf $OUTPUT/.drone.yml
fi

FILES=$ENVFOLDER/*

COUNT=$(find $SOURCE -maxdepth 1 -name '*.*' | wc -l)

mkdir -p $OUTPUT/../deployment/
if [ "$COUNT" -gt "0" ]
then
    for f in $FILES
    do
        if [ ${f: -4} == ".yml" ] || [ ${f: -5} == ".yaml" ]
        then
            NAME=$(basename "$f")
            ENV_FILE=${NAME%}
            kubetpl render --allow-fs-access $SOURCE/$ENV_FILE -i $ENVFOLDER/$ENV_FILE >> $SOURCE/tmp.yml
            cp $ENVFOLDER/$ENV_FILE $OUTPUT/../deployment/
        fi
    done
echo Copying files
cp $SOURCE/tmp.yml $OUTPUT/.drone.yml
cp $SOURCE/../files/* $OUTPUT/
rm $SOURCE/tmp.yml
cp $SOURCE/../generate-drone.sh $OUTPUT/../deployment/
mkdir -p $OUTPUT/template
cp -R $SOURCE $OUTPUT/template
mkdir -p $OUTPUT/../deployment/template/drone/master
cp -R $SOURCE $OUTPUT/../deployment/template/drone/master
cp -R $SOURCE/../files $OUTPUT/../deployment/template/drone/files
fi
echo finished