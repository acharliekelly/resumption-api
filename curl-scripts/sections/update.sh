#!/bin/bash

curl "http://localhost:4741/sections/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --data '{
    "section": {
      "name": "'"${NAME}"'",
      "sectype_id": '"${TYPE}"',
      "content": "'"${CONTENT}"'"
    }
  }'

echo
