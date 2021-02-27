# Process-Report

### Overview
A Bash script that checks all the processes for either all users or a single user signed in to the system. It reports back the ID of the user and the number of processes they have running every 5 seconds. Catches the SIGINT signal and prompts the user with an exit confirmation. Developed in a Linux Environment. 

### To Run
Execute the script. Add a user's id as a command line argument to only see processes from that user. 

### To Use
The program will automatically run on its own until the user gives the SIGINT signal, usually `CTRL + C`. The user will then be prompted to confirm their exit. 
