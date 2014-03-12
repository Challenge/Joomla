#!/bin/bash

### Global variables
BUILD_FOLDER="builds"
COMPONENT_START_NAME="com_"


### Initialize
# Create build folder
mkdir -p ${BUILD_FOLDER}


### Main
# Loop through all files in the directory
for f in *; do

    # File is a directory and starts with $COMPONENT_START_NAME
    if [[ -d ${f} ]] && [[ ${f} == "$COMPONENT_START_NAME"* ]]; then

        # Get version of Joomla component
        version=$(cat ${f}/*.xml | grep -i '<version>.*</version>' | sed -r -e 's_.*<version>(.*)</version>_\1_g')

        # Zip Joomla components
        echo -n "Zipping ${f}..."
        zip -r "${BUILD_FOLDER}/${f}-${version}.zip" "${f}" > /dev/null 2>&1
        echo "Done"

    fi
done



