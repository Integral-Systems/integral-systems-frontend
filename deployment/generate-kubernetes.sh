#!/bin/bash

if [ -z "$*" ]; 
    then 
    echo "No arguments Provided";
    echo "available arguments are"
    echo "-e|--envfile     | Suply enyromentfile" 
    echo "-s|--sourcedir   | Supply source directory"
    echo "-o|--output      | Supply output directory"
    exit 1
fi

while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    -e|--envfile)
    ENVFILE="$2"
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
fi

mkdir -p $OUTPUT/../../deployment
FILES=$SOURCE/*
for f in $FILES
do
    if [ ${f: -4} == ".yml" ] || [ ${f: -5} == ".yaml" ]
    then
        if [ ${f##*/} == "namespace.yml" ] || [ ${f##*/} == "network-policies.yml" ]
        then
        mkdir -p $OUTPUT/namespace/
            kubetpl render --allow-fs-access $f -i $ENVFILE -o $OUTPUT/namespace/${f##*/}
            echo Namespcaefile Generated ${f##*/}
        else
            kubetpl render --allow-fs-access $f -i $ENVFILE -o $OUTPUT/${f##*/}
            echo Generated ${f##*/}
        fi
    fi
done

echo Copying files

cp $SOURCE/../generate-kubernetes.sh $OUTPUT/../
cp $SOURCE/../apply-kubernetes.sh $OUTPUT/../
cp $SOURCE/../delete-kubernetes.sh $OUTPUT/../
mkdir -p $OUTPUT/../values
cp -f $ENVFILE $OUTPUT/../values/
mkdir -p $OUTPUT/../template/kubernetes/
cp -R $SOURCE $OUTPUT/../template/kubernetes/

find $OUTPUT/ -type f -name "*.yml" -exec sed -i'' -e 's/version: $TAG/version: "$TAG"/g' {} +
find $OUTPUT/ -type f -name '*.yml-e' -delete

echo "# kubetpl:syntax:$"|cat - $OUTPUT/deployment.yml > /tmp/out && mv /tmp/out $OUTPUT/deployment.yml

echo finished