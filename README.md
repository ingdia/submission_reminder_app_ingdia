#!/bin/bash

Submission Reminder App

#the overview
This projct is shell script-based application that is crafted to remind(alert)students about upcoming assignment deadlines.

My task: is  to write a srcipt that automates the application environment making sure that all neccessary directories and files are propely structured and configured.
addittionaly the name of the directory that must  contaion other sub directory the user of an app have to enter name  and the parent directory will be created based on this input.


#here are key steps i followed 


1. creating a git hub repository called "submission_reminder_app_ingdia"
2. cloning that repository
   cloning my repository to my local sandbox

#after cloning 
3. creating the "create_environment.sh (sript)"
 
  a. creating a script called create_environment.sh that is going to keep all all our workings ( int's the file or script in which we are going to work inside)
#we started withaking the user to enter name
  b.using echo to ask user enter name and using read me to read the name from the user

4. created a parent directory and sub directorie
     a. chose to use variable parent to avoid coping the larger name whenever it is needed
     parent_dir="submission_reminder_${name}"
     b. we craeted parent directory tha is going to hold all other sub directories and also created it's directory with it's subdirectories 

5. adding the file to their respective directories
      a. we touch file to their corresponding subdirectories and make sure each file is at correct directory by using touch command
         b. we created files and give the content as we were given in the instructions.
6.  created startup script and give it the content of executiong the reminder.
     created a "startup.sh" script that excute reminder.sh

7. giving permission for executing files 

chmod +x "$parent_dir/app/reminder.sh"
chmod +x "$parent_dir/modules/functions.sh"
chmod +x "$parent_dir/startup.sh"
8. after exting create_environment.sh
   a. changed the permission for create_environment
   b.executing and use ingabire name for testing.      
