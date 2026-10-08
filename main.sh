#!/usr/bin/env bash

while IFS= read -r line; do

    msg=$(curl -s -H\
    "Authorization: Bearer $TOKEN" \
    "https://gmail.googleapis.com/gmail/v1/users/me/messages/$line"\
    | jq -r '.payload | .parts[0]  |.body | .data' | tr '_-' '/+' | base64 -d | sed -E 's/[[:blank:]]+/ /g' | sed '/^[[:space:]]*$/d'\
    )

    echo "$msg" | grep -i --group-separator= -e 'UPI/' -e "credited" -e "debited" -e "INR"
    echo "$msg" | grep -A 1 -i "Date"

    echo "------------------------------------"

done < text.text

# | grep -i --group-separator= -e 'UPI/' -e "credited" -e "debited" -e "INR"
# | jq '.payload.headers[] | select(.name=="From") | .value'
