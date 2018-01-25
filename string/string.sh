#! /usr/bin/env bash

today="`date +%Y%m%d_%H%M`"
echo $today

# combine
current_time_string="today-${today}"
echo $current_time_string


# substring
# 1、使用 # 号操作符。用途是从左边开始删除第一次出现子字符串即其左边字符，保留右边字符。用法为#*substr,例如
str='http://www.你的域名.com/cut-string.html'
echo ${str#*//}

# 2、使用 ## 号操作符。用途是从左边开始删除最后一次出现子字符串即其左边字符，保留右边字符。用法为##*substr,例如：
str='http://www.你的域名.com/cut-string.html'
echo ${str##*/}


# 3、使用 % 号操作符。用途是从右边开始删除第一次出现子字符串即其右边字符，保留左边字符。用法为%substr*,例如：
str='http://www.你的域名.com/cut-string.html'
echo ${str%/*}

# 4、使用 %% 号操作符。用途是从右边开始删除最后一次出现子字符串即其右边字符，保留左边字符。用法为%%substr*,例如：
str='http://www.你的域名.com/cut-string.html'
echo ${str%%/*}




echo "new substring----"
# 1、从左边第几个字符开始以及字符的个数，用法为:start:len,例如：
str='http://www.你的域名.com/cut-string.html'
echo ${str:0:5}
# 其中的 0 表示左边第一个字符开始，5 表示字符的总个数。
# 结果是：http:

# 2、从左边第几个字符开始一直到结束，用法为:start,例如：
str='http://www.你的域名.com/cut-string.html'
echo ${str:7}
# 其中的 7 表示左边第8个字符开始
# 结果是：www.你的域名.com/cut-string.html

# 3、从右边第几个字符开始以及字符的个数，用法:0-start:len,例如：
str='http://www.你的域名.com/cut-string.html'
echo ${str:0-15:10}
# 其中的 0-6 表示右边算起第6个字符开始，10 表示字符的个数。
# 结果是：cut-string

# 3、从右边第几个字符开始一直到结束，用法:0-start,例如：
str='http://www.你的域名.com/cut-string.html'
echo ${str:0-4}
# 其中的 0-6 表示右边算起第6个字符开始，10 表示字符的个数。
# 结果是：html注：（左边的第一个字符是用 0 表示，右边的第一个字符用 0-1 表示）


