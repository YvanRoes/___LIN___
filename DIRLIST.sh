#!/bin/bash

#Ver1.1
#Created by YvanRoes / 690101 690101@student.inholland.nl
#Directory listing script

#this script creates a directory listing and fole count for any directory that is userd when starting this script



#variables used: argument_count, directory,content, output_file, directory_file_count



argument_count=$#
output_file=/tmp/DIRLIST.txt
content=""

#create new file /tmp/DIRLIST.txt
> $output_file

#if one argument present, assign $directory with that argument
if (($argument_count == 1))
then
	directory=$1
else
	echo "wrong amount of arguments provided"
	exit
fi
#check if directory exists
if ! test -d $directory
then 
	echo "directory '$directory' does not exist"
	exit
fi

# check if dir is empty
if ! ls -A1q /var/log | grep -q .
then  
	echo "$directory is empty"
	exit
fi

#get file_count
file_count=$(ls $directory | wc -l)

#overwrite file and insert header data
echo -e "THE DIRECTORY ${directory} CONTAINS $file_count FILES\nBELOW IS THE DIRECTORY LIST IN UPPERCASE:\n" >> $output_file



#add all entries
for file in "$directory"/*
do
	echo "$content${file^^}" >> $output_file
done
