#! /usr/bin/env bash
date="`date +%Y_%m%d_%H%M`"
# path="`path`"
# targetFolder="${path}/test_folder"
currentPath="/Users/Now/shell_learning/erases_test"
targetFolder="$currentPath/test_folder"

testFileName="testFile_${date}.zip"
fileNameTouch="$targetFolder/$testFileName"
# echo $fileNameTouch
touch $fileNameTouch

# log
echo $fileNameTouch >> "$targetFolder/log.txt"
