#! /usr/bin/env bash

echo "Hello world !"

ndk_13b="/Users/doublel/Documents/Android_NDK/android-ndk-r13b"
ndk_15c="/Users/doublel/Documents/Android_NDK/android-ndk-r15c"
ndk_real="/Users/doublel/Documents/Android_NDK/android-ndk-r15c"

if test $ndk_real = $ndk_15c
then
	echo 'equal'
else
	echo 'not equal'
	exit
fi

echo "ndk 15 branch"
