#!/bin/bash

curl "http://localhost:4741/resumes" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "resume": {
      "name": "'"${NAME}"'",
      "format": "'"${FORMAT}"'",
      "content": "'"${CONTENT}"'"
    }
  }'

echo
