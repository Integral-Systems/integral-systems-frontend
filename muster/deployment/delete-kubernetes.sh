#!/bin/bash

if [ -z "$*" ]; 
    then 
    echo "No arguments Provided";
    echo "available arguments are"
    echo "-s|--sourcedir   | Supply source directory"
    echo "-e|--envfile     | Suply enyromentfile" 
    exit 1
fi

while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    -e|--envfile)
    ENVFILE="-i $2"
    shift # past argument
    shift # past value
    ;;
    -s|--source)
    SOURCE="$2"
    shift # past argument
    shift # past value
    ;;
    *) echo "Unknown parameter passed: $1"; exit 1 ;;
esac
done

read -p "Are you sure you want to DELETE the deployment?" -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
    FILENAME=$(basename -- "$SOURCE")
    if [[ ${FILENAME: -4} == ".yml" ]] || [[ ${FILENAME: -5} == ".yaml" ]]
    then
        echo Deleting singlefile
        kubetpl render --allow-fs-access $SOURCE $ENVFILE -s TAG=latest | kubectl delete -f -
        echo applyed ${f##*/}
    else
    echo Deleting multiple files
    FILES=$SOURCE/*
    for f in $FILES
        do
            if [[ ${f: -4} == ".yml" ]] || [[ ${f: -5} == ".yaml" ]]
            then
                kubetpl render --allow-fs-access $f $ENVFILE -s TAG=latest | kubectl delete -f -
                echo applyed ${f##*/}
            fi
        done
    fi
    echo finished
fi


