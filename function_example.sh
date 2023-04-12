#!/bin/bash

echo "enter a name"
read name
F1(){
	echo "Hello $1, id: $2"
}


F1 $name 10
