#!/bin/sh

# releaseVersionName = "1.8.0.1-20180224-1830R"

lineNumber=0

funcChangeDate(){
	current_time="`date +%Y%m%d-%H%M`"
	# echo "current_time $current_time"
	old_version="`grep releaseVersionName build.gradle`"
	# echo "old_version $old_version"
	old_version=${old_version#*-}
	# echo "old_version $old_version"
	old_version=${old_version%R*}
	# echo "old_version $old_version"

	echo "releaseVersionName changed old($old_version) new($current_time)  lineNumber $lineNumber"
	sed -i "" ${lineNumber}s/$old_version/$current_time/g build.gradle
}

# . ./get_libs.sh
. ./copy_version.sh

echo "\ngenerate begin"
case $1 in
		--nodate)
			echo "generate with parameter --nodate"
			;;
		*)
			lineNumber="`awk '/releaseVersionName/{print NR}' build.gradle`"
			funcChangeDate
			;;
esac

