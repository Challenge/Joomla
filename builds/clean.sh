#!/bin/bash

### Global variables
BUILD_FOLDER="$1"
EXTENSION=".zip"

# Get the absolute path to the folder
SCRIPT_PATH=$(readlink -f $(pwd))

# Run the cleanup
echo "${SCRIPT_PATH}/${BUILD_FOLDER}/*${EXTENSION}"
rm -rf "${SCRIPT_PATH}/${BUILD_FOLDER}/*${EXTENSION}"



