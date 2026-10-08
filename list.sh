#!/usr/bin/env bash

curl -s -H \
    "Authorization: Bearer $TOKEN" \
  --get \
  --data-urlencode 'q=from:alerts@axis.bank.in' \
  "https://gmail.googleapis.com/gmail/v1/users/me/messages"\
  | jq -r '.messages[].id' | tee text.text
