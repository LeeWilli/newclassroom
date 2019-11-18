#!/bin/bash

if [ $# -ne 3 ]; then
	echo "parameters should be 3. Usage is : score ids homework output"
	echo "ids is the file containing the ids of all student"
	echo "homework is the dir that sutends used to submit their homework"
	echo "output is used to save the students's scores."
fi

rm $3
cat $1 | while read line
do
	echo ${line}
	user=${line}
	app=0
	all=0
	for file in /home/$user/$2/*
	do
		if [ -x $file ]
		then
			app=$[$app+1]
			echo "$user,$file"
		fi
		echo $file
		if [ $file != "/home/$user/$2/*" ]
		then
			all=$[$all+1]
		fi
	done

	echo "$user,$app,$all">>$3
done
