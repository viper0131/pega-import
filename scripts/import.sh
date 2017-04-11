#!/bin/bash
IMPORT_FILENAME=$1
IMPORT_DIRECTORY="/imports"
IMPORT_PATH=$IMPORT_DIRECTORY/$IMPORT_FILENAME

if [[ ! -f $IMPORT_PATH ]]; then
    echo "Import file $IMPORT_FILENAME not found in $IMPORT_DIRECTORY, exiting..."
    exit 3
fi

dropdb pega
echo "Check if we use a list ($IMPORT_PATH.list)..."
if [[ ! -f $IMPORT_PATH.list ]]; then
  echo "  no list found...."
  pg_restore /imports/$IMPORT_FILENAME -C -d postgres
else
  echo "  list found...."
  pg_restore -C -d postgres -L $IMPORT_PATH.list $IMPORT_PATH
fi
