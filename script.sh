#!/bin/bash

username="uname"   # replace uname with your username 
password="passwd"  # replace passwd with your password

while true
	do
		magic=$(curl -s -k "https://agnigarh.iitg.ac.in:1442/login?" | grep "name=\"magic\"" | grep -oP 'value="\K[^"]*')

		auth=$(curl -s -k  "https://agnigarh.iitg.ac.in:1442/" --data "4Tredir=https%3A%2F%2Fagnigarh.iitg.ac.in%3A1442%2Flogin%3F&magic=$magic&username=$username&password=$password" --compressed | grep -Eo "https:\/\/agnigarh.iitg.ac.in:1442\/keepalive\?[A-Za-z0-9]+")
		time=$(date +%H:%M:%S)
		echo "$time: Auth started"
		status="true"

		while [ "$status" = "true" ]  
		    do  
		        alive=$(curl -s -k "$auth" | grep -o "$auth")  
		        if [ "$alive" != "$auth" ]
		        then
		            status="false"
		            time=$(date +%H:%M:%S)
		            echo "$time: Auth failed (status 1: New refresh url does not match existing)" #Mostly occurs when regfesh URL expires (will re-attempt login)
		        else
		        	if [[ -z "$alive" ]] 
		        	then
		            	status="false"
		            	time=$(date +%H:%M:%S)
		            	echo "$time: Auth failed (status 2: Refresh URL was empty)" #this happens when refresh and login fail consecutively (mostly happens when there are power cuts or a non IITG network is used)
		            else
		            	sleep 150
		            fi
		        fi
			done
		sleep 30
	done
