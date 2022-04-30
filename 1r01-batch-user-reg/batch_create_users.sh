#!/bin/bash

dir=$(dirname $0)
source_file="$dir/users_list.txt"

iter_num=3

for user_data in  $(cat "$source_file"); do

login=$(echo "$user_data" | awk -F ',' {'print $1'})
password=$(echo "$user_data" | awk -F ',' {'print $2'})

echo "Create user with login: $login..."

#commands

adduser "$login" &>> /dev/null << EOF
$password
$password





Y

EOF

if [ $? -ne 0 ]; then
echo "error: User already exist"
else 
echo "done."
fi
echo ""

[ $iter_num -eq 3 ]&& exit 10 #fixme

#iter_num=$(($iter_nam+1))

done
