#!/bin/bash

# Obtenha os inputs da action
GITHUB_TOKEN=$GITHUB_TOKEN
ISSUE_ID=$ISSUE_ID
COMMENT=$COMMENT

# Inicialize o cliente do GitHub
response=$(curl -s -X POST -H "Authorization: token ${GITHUB_TOKEN}" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/repos/${GITHUB_REPOSITORY}/issues/${ISSUE_ID}/comments \
    -d "{\"body\": \"${COMMENT}\"}")

# Obtenha o ID do comentário criado
comment_id=$(echo $response | jq -r .id)

# Define o output com o ID do comentário

echo "comment-id=$(echo $comment_id)" >> $GITHUB_OUTPUT

echo "Comentário adicionado com sucesso! ID do comentário: $comment_id"
