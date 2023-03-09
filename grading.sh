#!/bin/bash
scriptName=$1
assignmentName="designbycontract-vivekanandareddy-ponugoti" | sed -E 's/([^-]*)-(.*)/ \1 \2'

python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt

# loop through each submission directory
for submission in $(ls); do
   # check a file is a directory
  if [ -d $submission/ ]; then
    cd "$submission"
    crash=0
    python3 main_simple.py || crash=1
    cd ..
    echo "$submission,$crash" >> $assignmentName.csv 
  fi
done

deactivate