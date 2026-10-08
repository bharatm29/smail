#!/usr/bin/env bash

msg=$(curl -s -H \
    "Authorization: Bearer $TOKEN" \
    "https://gmail.googleapis.com/gmail/v1/users/me/messages/$1")

echo "$msg"
