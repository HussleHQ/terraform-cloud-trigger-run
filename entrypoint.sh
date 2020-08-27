#!/bin/sh -l

set -e

TF_TOKEN=$1
WORKSPACE_NAME=$2
ORG_NAME=$3

WORKSPACE_DATA=$(
    curl \
        --header "Authorization: Bearer $TF_TOKEN" \
        --header "Content-Type: application/vnd.api+json" \
        "https://app.terraform.io/api/v2/organizations/$ORG_NAME/workspaces/$WORKSPACE_NAME"
)
WORKSPACE_ID=$(echo "$WORKSPACE_DATA" | jq -r '.data.id')
NEW_RUN_DATA="{\"data\": {\"type\": \"runs\", \"relationships\": {\"workspace\": {\"data\": {\"id\": \"$WORKSPACE_ID\"}}}, \"attributes\": {\"message\": \"Automated run from ${GITHUB_REPOSITORY} github action.\"}}}"

curl \
  --header "Authorization: Bearer $TF_TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data "$NEW_RUN_DATA" \
  https://app.terraform.io/api/v2/runs
