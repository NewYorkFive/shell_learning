#! /usr/bin/env bash

# 1 chech ndk 
ndk_13b="/Users/doublel/Documents/Android_NDK/android-ndk-r13b"
ndk_15c="/Users/doublel/Documents/Android_NDK/android-ndk-r15c"

if test $ANDROID_NDK = $ndk_15c
then
	echo 'ndk 15c continue'
else
	echo 'ndk not 15c exit'
	exit 1
fi

# 2正则查找版本号
path_demux_datatype="datatype.h"
compile_demux_version="`grep \#NOUNI $path_demux_datatype`"
# echo $compile_demux_version
compile_demux_version=${compile_demux_version#*\"}
# echo $compile_demux_version
compile_demux_version=${compile_demux_version%\#*}
# compile_demux_version=${compile_demux_version:0-19:12}
echo "-----------"
echo $compile_demux_version

# 如果参数为--date，改变datatype的时间
date_flag=0
case $1 in
		--date)
			echo "use date parameter."
			date_flag=1
esac

if test $date_flag = 1 
then
	echo "change demuxdate"
	current_time="`date +%Y%m%d%H%M`"
	echo $current_time
	sed -i "" s/$compile_demux_version/$current_time/g $path_demux_datatype
	compile_demux_version=$current_time
fi

echo $compile_demux_version

#3 版本号
# today="`date +%Y%m%d%H%M`"
# echo today : $today


#3.1 echo $ijkversion
# 被修改文件信息
the_branch_version="1.8.0.1"
path_ps_ijkversion="ps_ijkversion.h"


the_ijk_version="PS_IJK_VERRSION"
ijk_version="`grep $the_ijk_version $path_ps_ijkversion`"
# echo $ijk_version
ijk_version=${ijk_version#*-}
# echo $ijk_version
ijk_version=${ijk_version%\"*}
echo $ijk_version



the_demux_version="PS_DEMUX_VERSION"
demux_version="`grep $the_demux_version $path_ps_ijkversion`"
# echo $demux_version
demux_version=${demux_version#*-}
# echo $demux_version
demux_version=${demux_version%\"*}
echo "----"
echo $demux_version



sed -i "" s/$ijk_version/$compile_demux_version/g $path_ps_ijkversion
sed -i "" s/$demux_version/$compile_demux_version/g $path_ps_ijkversion


# getline
# line_ijk_version="`grep -n $the_ijk_version $path_ps_ijkversion`"
# line_ijk_version=${line_ijk_version%\:*}
# echo line_ijk_version + $line_ijk_version


# new_ijkversion="#define $the_ijk_version \"$the_branch_version-${compile_demux_version}\""
# echo $ijk_version
# echo $new_ijkversion
# echo "11111"

# demux_to_demux_version="PS_DEMUX_VERSION"
# psdemux_version="`grep $demux_to_demux_version $path_ps_ijkversion`"
# new_psdemux_version="#define $demux_to_demux_version \"$the_branch_version-${compile_demux_version}\""
# echo $psdemux_version
# echo $new_psdemux_version

# sed -i '\"\"' 's/${psdemux_version}/${new_psdemux_version}/g' $path_ps_ijkversion
