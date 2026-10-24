#!/usr/bin/env bash

# ICS 213 General Message Form Generator
# This script prompts the user for standard ICS 213 fields and outputs
# a formatted plain-text message suitable for email, print, or voice transmission.

clear
echo "======================================="
echo "===ICS 213 GENERAL MESSAGE GENERATOR==="
echo "======================================="
echo "Please fill in the following fields:"
echo ""

# Defaults for date/time
DEFAULT_DATE=$(date +%m-%d-%Y)
DEFAULT_TIME=$(date +%H:%M)

# Prompting for fields
read -p "1. Incident Name: " INCIDENT_NAME
read -p "2. To (Name and Position/Title): " TO_FIELD
read -p "3. From (Name and Position/Title): " FROM_FIELD
read -p "4. Subject: " SUBJECT
read -p "5. Date (MM-DD-YYYY) [$DEFAULT_DATE]: " MSG_DATE
MSG_DATE=${MSG_DATE:-$DEFAULT_DATE}
read -p "6. Time (HH:MM) [$DEFAULT_TIME]: " MSG_TIME
MSG_TIME=${MSG_TIME:-$DEFAULT_TIME}

echo "7. Message Body (Press Ctrl+D on a new line when finished):"
echo "-----------------------------------------------------------"
MESSAGE=$(cat)

# Outputting the formatted ICS 213 Form
clear
cat << EOF
=============================
===ICS 213 GENERAL MESSAGE===
=============================
1. INCIDENT NAME: ${INCIDENT_NAME:-[N/A]}
2. TO: ${TO_FIELD:-[N/A]}   
3. FROM: ${FROM_FIELD:-[N/A]}
4. SUBJECT: ${SUBJECT:-[N/A]}
5. DATE: ${MSG_DATE}
6. TIME: ${MSG_TIME}
7. MESSAGE:
${MESSAGE:-[No message provided]}
EOF
