#/bin/bash
echo " please enter the name"
read name
parent_dir="submission_reminder_${name}"
#craeting the parent directory
mkdir -p  "$parent_dir"/{app,modules,assets,config}
#creating files to their corresponding directory
touch "$parent_dir"/config/config.env
touch "$parent_dir"/app/reminder.sh
touch "$parent_dir"/modules/functions.sh
touch "$parent_dir"/startup.sh
touch "$parent_dir"/assets/submissions.txt
#details for config.env
echo 'ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2' > "$parent_dir/config/config.env"
# script for reminder
echo '#!/bin/bash

source ./config/config.env
source ./modules/functions.sh

submissions_file="./assets/submissions.txt"

echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file' > "$parent_dir/app/reminder.sh"
#script for function
# Corrected script creation for reminder.sh
echo '#!/bin/bash

function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    declare -A reminded_students  # Create an associative array

    while IFS=, read -r student assignment status; do
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            if [[ -z "${reminded_students[$student]}" ]]; then
                echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
                reminded_students[$student]=1
            fi
        fi
    done < <(tail -n +2 "$submissions_file")
}
' > "$parent_dir/modules/functions.sh"

# Creating reminder.sh with fixed code
echo '#!/bin/bash

submissions_file="./assets/submissions.txt"
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=5

echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file' > "$parent_dir/app/reminder.sh"

# Use echo to write the content to the file
echo "Student Name, Assignment, Status" > "$parent_dir/assets/submissions.txt"
echo "Chinemerem, Shell Navigation, not submitted" >> "$parent_dir/assets/submissions.txt"
echo "Chiagoziem, Git, submitted" >> "$parent_dir/assets/submissions.txt"
echo "Divine, Shell Navigation, not submitted" >> "$parent_dir/assets/submissions.txt"
echo "Anissa, Shell Basics, submitted" >> "$parent_dir/assets/submissions.txt"
#execusion of reminder
echo '#!/bin/bash

cd "$(dirname "$0")"

bash ./app/reminder.sh

echo "executed successfully!"' > "$parent_dir/startup.sh"
chmod +x "$parent_dir/app/reminder.sh"
chmod +x "$parent_dir/modules/functions.sh"
chmod +x "$parent_dir/startup.sh"


