# NAME:		AUSTIN REEVES
# EUID:		AWR0047
# DATE:		FEB 22, 2020


#! /bin/bash
exitPrompt()
{
	echo "(SIGINT) recieved"
	read -p "Would you like to quit (Y or N): " ans
	
	case $ans in
	Y|y)	
		echo "Goodbye!"; exit 1 ;;
	*) 
		echo "Continuing program!" ;;
	esac
}

trap exitPrompt SIGINT

now=`date +'%a %d %b %Y %T %p %Z'`		#holds the current date
userCount=0								#holds the number of users
processCount=0							#holds the number of processes

if [ $# -ne 0 ]
then	#only check processes for given users
	while true; do
		
		list=("$@")
		
		#updating user count 
		userCount=$#
		processCount=0
		
		#prints heading
		echo "$now"
		printf "%-20s %10s\n" "User ID" "Count"
		
		#printing all users and processes
		for (( i=0 ; $i<${#list[*]}; i=$i+1 ))
        do
				# printing out specified user and their processes
				printf "%-20s %10s\n" "${list[i]}" "$(ps -u ${list[i]}|wc -l)"
				
				#updating process counts
				let processCount=$processCount+$(ps -u ${list[i]}|wc -l)
        done
		echo "--- USERS: $userCount; PROCESSES: $processCount ---"
		
		# holding for 5 seconds
		sleep 5
	done
	
else	#check processes for everyone
	while true; do
		#prints heading
		echo "$now"
		printf "%-20s %10s\n" "User ID" "Count"
		
		#printing all users and processes
		ps -eo user=|sort|uniq -c|gawk '{ printf("%-20s %10s\n", $2, $1) }' 
			
		# counting number of users and commands
		userCount=$(ps -eaho user|sort -u|wc -l)
		processCount=$(ps aux |wc -l)
		echo "--- USERS: $userCount; PROCESSES: $processCount ---"
		
		# holding for 5 seconds
		sleep 5
	done
fi	
	