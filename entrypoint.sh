#!/bin/bash

COMMAND="localazy tag"

if [ ! -z "$INPUT_CONFIG_FILE" ]; then
  COMMAND="$COMMAND -c $INPUT_CONFIG_FILE"
fi

if [ ! -z "$INPUT_KEY_FILE" ]; then
  COMMAND="$COMMAND -k $INPUT_KEY_FILE"
fi

if [ ! -z "$INPUT_READ_KEY" ]; then
  COMMAND="$COMMAND -r $INPUT_READ_KEY"
fi

if [ ! -z "$INPUT_WRITE_KEY" ]; then
  COMMAND="$COMMAND -w $INPUT_WRITE_KEY"
fi

if [ ! -z "$INPUT_PUBLISH" ]; then
  COMMAND="$COMMAND publish $INPUT_PUBLISH"
fi

if [ ! -z "$INPUT_PROMOTE_FROM" -a ! -z "$INPUT_PROMOTE_TO" ]; then
  COMMAND="$COMMAND promote $INPUT_PROMOTE_FROM $INPUT_PROMOTE_TO"
fi

if $INPUT_LIST; then
  COMMAND="$COMMAND list"
fi

if [ ! -z "$INPUT_RENAME_FROM" -a ! -z "$INPUT_RENAME_TO" ]; then
  COMMAND="$COMMAND rename $INPUT_RENAME_FROM $INPUT_RENAME_TO"
fi

if [ ! -z "$INPUT_DELETE" ]; then
  COMMAND="$COMMAND delete $INPUT_DELETE"
fi

if [ ! -z "$INPUT_MERGE_FROM" -a ! -z "$INPUT_MERGE_TO" -a ! -z "$INPUT_MERGE_OUTPUT" ]; then
  COMMAND="$COMMAND merge"
  if [ ! -z "$INPUT_MERGE_PARAMETERS" ]; then
    COMMAND="$COMMAND $INPUT_MERGE_PARAMETERS"
  fi
  COMMAND="$COMMAND $INPUT_MERGE_FROM $INPUT_MERGE_TO $INPUT_MERGE_OUTPUT"
fi

if [ ! -z "$INPUT_WORKDIR" ]; then
  cd $INPUT_WORKDIR
fi

echo "::set-output name=command::$COMMAND"
$COMMAND
