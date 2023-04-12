#!/bin/bash




#check if user is root
if [ "$EUID" -ne 0 ]
then echo "Please run as root"
	exit
fi



create_user(){
	echo "create user"
}

display_user(){
	echo "display user"
}

delete_user(){
	echo "delete user"
}

pwd_management(){
	echo "password management"
}

display_menu(){
	echo -e "Choose an option:\n -(1) Create a User\n-(2) Display user information\n-(3) Delete a user\n-(4) Password management"
read input

case input in
"1")
	createuser
	;;
esac
}

input=""
display_menu
while [[ !($input != "stop") ]]
do
	display_menu
done
