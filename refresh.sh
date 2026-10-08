#!/usr/bin/env bash

curl -X POST https://oauth2.googleapis.com/token \
  -d "client_id=xyz" \
  -d "client_secret=xyz" \
  -d "refresh_token=xyz" \
  -d "grant_type=refresh_token" | tee token.json

echo -e "\n"

jq -r ".access_token" < token.json
