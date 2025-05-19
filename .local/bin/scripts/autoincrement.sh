#!/bin/bash

FILE_NAME=$1

if [ ! -f "$FILE_NAME" ]; then
  echo "File not found: $FILE_NAME"
  exit 1
fi

TEMP=temp

cp $FILE_NAME $TEMP
mv --backup=numbered $TEMP $FILE_NAME

ls ${FILE_NAME}*
