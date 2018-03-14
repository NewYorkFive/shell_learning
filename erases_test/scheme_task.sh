#! /usr/bin/env bash
date="`date +%Y_%m%d_%H%M`"

currentPath="/Users/doublel/shell_learning/erases_test"
targetFolder="$currentPath/test_folder"
# echo $targetFolder

# testFile*为关键字 
# attention!! 路径上不要包含这个关键字，如果用test做关键字，会导致test_folder中所有路径文件夹都会被显示
# attention!! 或者你可以采取用cd这个文件夹，然后进行删除
fileNames="`find $targetFolder -name \"testFile*\" | xargs ls -t`"
# echo $fileNames

leftThreshold=10
count=0
for fileName in $fileNames
do
    # echo $fileName
    count=`expr $count + 1`
    # echo "count = $count"
    if [ $count -gt $leftThreshold ]; then
    	
	    # rm -rf $fileName
    	theCommand="rm -rf $fileName"
    	echo $theCommand    	
	    echo $theCommand >> "$targetFolder/log.txt"
    fi
done

