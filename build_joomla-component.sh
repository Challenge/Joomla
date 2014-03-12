#!/bin/bash

### Check for dependencies
# This script relies on the normal linux base system and the following programs:
DEPENDENCIES="zip"

for dep in $DEPENDENCIES
do
    if ! which $dep > /dev/null 2>&1
    then
        echo "This script requires '$dep' to run but it is not installed."
        echo "Please install the required program and re-run the script."
        exit 1
    fi
done

### Global variables
BUILD_FOLDER="builds"
COMPONENT_START_NAME="com_"

# Get the absolute path to the folder where the script resides
SCRIPT_PATH=$(dirname $(readlink -f $0))


### Initialize
# Create build folder
mkdir -p ${SCRIPT_PATH}/${BUILD_FOLDER}

### Main
# Loop through all files in the directory
for f in $(ls -1 ${SCRIPT_PATH}); do

    # File is a directory and starts with $COMPONENT_START_NAME
    if [[ -d ${f} ]] && [[ ${f} == "$COMPONENT_START_NAME"* ]]; then

        # Get version of Joomla component
        version=$(cat ${f}/*.xml | grep -i '<version>.*</version>' | sed -r -e 's_.*<version>(.*)</version>_\1_g')

        # Zip Joomla components
        echo -n "Zipping ${f}..."
        zip -r "${SCRIPT_PATH}/${BUILD_FOLDER}/${f}-${version}.zip" "${SCRIPT_PATH}/${f}" > /dev/null 2>&1
        echo "Done"

    fi
done



