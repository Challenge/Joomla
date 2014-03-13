# This file is a wrapper for the scripts located in the build folder
# It can be run by calling make (see GNU Makefile for more help)
OUTPUT_FOLDER="builds"
BUILD_SCRIPT_NAME="build.sh"
CLEAN_SCRIPT_NAME="clean.sh"

all: joomla

joomla:
	@echo "Buildng Joomla components"
	@mkdir -p "${OUTPUT_FOLDER}"
	@sh "${OUTPUT_FOLDER}/${BUILD_SCRIPT_NAME}" ${OUTPUT_FOLDER}

clean:
	@echo "Cleaning Joomla components"
	@sh "${OUTPUT_FOLDER}/${CLEAN_SCRIPT_NAME}" ${OUTPUT_FOLDER}



