#!/bin/bash

submissions_file="./assets/submissions.txt"
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=5

echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
