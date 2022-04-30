#!/bin/bash

dir=`dirname  $0`

result_file="$dir/users_list.txt"

#settings
count_users=10 #fixme 500

rm $result_file

for i in  $(seq -w 1 $count_users); do

login="user$i"
password=$(pwgen -s 8 1)

line="$login,$password"

echo "$line" >> $result_file
#echo "test string: $line"

#[ $i -eq 100 ] && exit 7 #fixme 500
done

#echo "user001, qwerty" > #result_file
