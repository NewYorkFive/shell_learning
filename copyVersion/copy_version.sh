#!/bin/sh
tmp_str=""
version_str=""
version_str_old=""
lineNumber=0

funcGetVersion(){
	keyWords="$1"
	# echo $keyWords
	path="$2"
	# echo $path
	tmp_str="`grep $keyWords $path`"
	# echo $tmp_str
	tmp_str=${tmp_str#*-}
	# echo $tmp_str
	tmp_str=${tmp_str%\"}
	# echo $tmp_str
	return 0
}

funcGerVersionFromGradle(){
	keyWords="$1"
	# echo $keyWords
	path="$2"
	# echo $path
	tmp_str="`grep $keyWords $path`"
	# echo $tmp_str
	tmp_str=${tmp_str#*-}
	# echo $tmp_str
	tmp_str=${tmp_str%%\\*}
	# echo $tmp_str
	return 0	
}


# funcChangeVersion keyWords_target keyWords_old path_source path_target
funcChangeVersion(){
	keyWords_target="$1"
	keyWords_old="$2"
	path_source="$3"
	path_target="$4"
	funcGetVersion $keyWords_target $path_source
	version_str=$tmp_str
	funcGerVersionFromGradle $keyWords_old $path_target
	version_str_old=$tmp_str
	echo "version_new $version_str  verson_old $version_str_old  lineNumber $lineNumber"
	sed -i "" ${lineNumber}s/$version_str_old/$version_str/g $path_target

}

# funcGetLineNumber(){
# 	keyWords="$1"
# 	echo "funcGetLineNumber keyWords $keyWords"
# 	path="$2"
# 	echo "funcGetLineNumber path $path"
# 	lineNumber="`awk '/${keyWords}/{print NR}' $path`"
# 	echo "lineNumber $lineNumber"
# 	return $lineNumber
# }

path_version_txt="version.txt"
path_version_target="build.gradle"


# change base
lineNumber="`awk '/baseVersionName/{print NR}' $path_version_target`"
funcChangeVersion PI_iLiveBase baseVersionName $path_version_txt $path_version_target

# change mcVersionName
lineNumber="`awk '/mcVersionName/{print NR}' $path_version_target`"
# funcChangeVersion keyWords_target keyWords_old path_source path_target
funcChangeVersion PI_MediaCore mcVersionName $path_version_txt $path_version_target

# change pslstreaming
lineNumber="`awk '/psl/{print NR}' $path_version_target`"
funcChangeVersion psl psl $path_version_txt $path_version_target

# change psdVersionName
lineNumber="`awk '/psdVersionName/{print NR}' $path_version_target`"
funcChangeVersion android_psdemux psdVersionName $path_version_txt $path_version_target

# change ijkVersionName
lineNumber="`awk '/ijkVersionName/{print NR}' $path_version_target`"
funcChangeVersion android_ijk ijkVersionName $path_version_txt $path_version_target



# version_str=""
# version_str_old=""

# funcGetVersion psl $path_version_txt
# version_str=$tmp_str
# # echo "1. version_str $version_str \n"

# funcGerVersionFromGradle psl $path_version_target
# version_str_old=$tmp_str
# # echo "2. version_str_old $version_str_old \n"

# # lineNumber=funcGetLineNumber psl $path_version_target
# lineNumber="`awk '/psl/{print NR}' $path_version_target`"
# echo "lineNumber $lineNumber \n"

# echo "version_new $version_str  verson_old $version_str_old   lineNumber $lineNumber"
# sed -i "" ${lineNumber}s/$version_str_old/$version_str/g $path_version_target



# funcGetVersion android_psdemux $path_version_txt
# version_str=$tmp_str
# funcGerVersionFromGradle psdVersionName $path_version_target
# version_str_old=$tmp_str
# lineNumber="`awk '/psdVersionName/{print NR}' $path_version_target`"
# echo "version_new $version_str  verson_old $version_str_old   lineNumber $lineNumber"
# sed -i "" ${lineNumber}s/$version_str_old/$version_str/g $path_version_target






# echo $line
# path_build_gradle="build.gradle"

# lineNumber="`awk '/psl/{print NR}' $path_build_gradle`"
# lineNumber="`expr $lineNumber + 3`"
# echo $lineNumber



    # releaseVersionName = "1.8.0.1-20180224-1830R"

    # baseVersionName = "\"PI_iLiveBase-20180224-1815-1801\""
    # aacVersionName = "\"0.1.5-20171107\""
    # mcVersionName = "\"1.8.0.1-20180220R02\""
    # pslVersionName = "\"1.8.0.1-20180220R02\""
    # psdVersionName = "\"1.8.0.1-201802241700\""
    # ijkVersionName = "\"1.8.0.1-201802241700\""