#!/bin/bash

username="uname"   # replace uname with your username 
password="passwd"  # replace passwd with your password

while true
	do
		magic=$(curl -s -k "https://agnigarh.iitg.ac.in:1442/login?" | grep "name=\"magic\"" | grep -oP 'value="\K[^"]*')

		auth=$(curl -s -k  "https://agnigarh.iitg.ac.in:1442/" --data "4Tredir=https%3A%2F%2Fagnigarh.iitg.ac.in%3A1442%2Flogin%3F&magic=$magic&username=$username&password=$password" --compressed | grep -Eo "https:\/\/agnigarh.iitg.ac.in:1442\/keepalive\?[A-Za-z0-9]+")
		echo "Auth started"
		status="true"

		while [ "$status" = "true" ]  
		    do  
		        alive=$(curl -s -k "$auth" | grep -o "$auth")  
		        if [ "$alive" != "$auth" ]
		        then
		            status="false"
		            echo "Auth failed"
		        else
		            sleep 150
		        fi
		done
		sleep 30
	done
