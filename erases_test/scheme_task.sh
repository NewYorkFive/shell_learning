#! /usr/bin/env bash
date="`date +%Y_%m%d_%H%M`"

currentPath="/Users/Now/shell_learning/erases_test"
targetFolder="$currentPath/test_folder"
# 20为超过的时间
# test*为关键字
fileNames="`find $targetFolder -name \"test*\" -mmin +20`"
# echo $targetFolder

# echo $fileNames

for fileName in $fileNames
do
    # echo $fileName
    rm -rf $fileName
    theCommand="rm -rf $fileName"
    echo $theCommand
    echo $theCommand >> "$targetFolder/log.txt"
done

