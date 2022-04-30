#!/bin/bash

dir=`dirname $0`

source_file="$dir/users_list.txt"

mkdir /backups

backup_directory='/backups'

iter_num=1

cur_date="$(date +"DATE_%y_%m_%d_TIME_%I_%M_%S")" 
#echo $cur_date

backup_name="users_backup_$cur_date"

#echo $backup_name

backup_path="$backup_directory/$backup_name.tar"

#echo $backup_path
 

for user_data in  $(cat "$source_file"); do

login=$(echo "$user_data" |awk -F ',' {'print $1'})
password=$(echo "$user_data" |awk -F ',' {'print $2'})

echo "Delete user with login: $login..."

#commands

if [ "$1" == "backup" ];
then
tar --directory="/home" -rvf $backup_path $login &>> /dev/null

if [ $? -ne 0 ]; then
echo "backup error: user does not exist"
else
echo "backup done"
fi
fi

deluser --remove-home "$login" &>>/dev/null

if [ $? -ne 0 ]; then
echo "error."
else
echo "done."
fi
echo ""

[ $iter_num -eq 1 ]&& exit 10 #fixme

#iter_num=$(($iter_nam+1))

done
