#!/usr/bin/env bash

PAGE_TOKEN=""

while true; do
    RESPONSE=$(curl -s -H "Authorization: Bearer $TOKEN" \
        --get \
        --data-urlencode 'q=from:alerts@axis.bank.in' \
        ${PAGE_TOKEN:+--data-urlencode "pageToken=$PAGE_TOKEN"} \
        "https://gmail.googleapis.com/gmail/v1/users/me/messages")

    echo "$RESPONSE" | jq -r '.messages[]?.id'

    COUNT=$(echo "$RESPONSE" | jq '.messages | length')

    TOTAL=$((TOTAL + COUNT))

    if [ "$TOTAL" -ge 200 ]; then
        break
    fi

    PAGE_TOKEN=$(echo "$RESPONSE" | jq -r '.nextPageToken // empty')

    if [ -z "$PAGE_TOKEN" ]; then
        break
    fi
done
