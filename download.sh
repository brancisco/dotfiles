#!/bin/bash

DIRECTORY="$HOME/.dotfiles"
TMP="repo.zip"
OWNER="brancisco"
REPO="dotfiles"
API_URL="https://api.github.com/repos/$OWNER/$REPO/releases/latest"

if [ -d $DIRECTORY ]; then
  echo There\'s already $DIRECTORY directory.
  exit 1
fi

echo Getting the zipball location...
# Grab the url on the line containing the zipball and remove the quotes.
DOWNLOAD_URL=$( curl -s $API_URL \
  | awk '/zipball/ { print $2 }' \
  | cut -d '"' -f2 )

echo Making a nice place to keep our dotfiles.
mkdir -p $DIRECTORY

echo Downloading the zipball...
curl -sL -o $DIRECTORY/$TMP $DOWNLOAD_URL

echo Unzipping the zipball...
unzip -qq -d $DIRECTORY/. $DIRECTORY/$TMP

# Get the contents we're unzipping, then
# get the 4th column of lines that contain the repo owner, then
# grab the first one which should be the outer directory.
EXTRACTED_DIR=$(unzip -l $DIRECTORY/$TMP          \
  | awk -v owner=$OWNER '$0 ~ owner { print $4 }' \
  | sed '1p;d')

echo Cleaning up our dotfile directory.
# Now lets move all these files to the top level of our directory.
mv $DIRECTORY/$EXTRACTED_DIR* $DIRECTORY
# And remove the now empty directory as well as the temp zipfile.
rm -rf $DIRECTORY/$EXTRACTED_DIR $DIRECTORY/$TMP
