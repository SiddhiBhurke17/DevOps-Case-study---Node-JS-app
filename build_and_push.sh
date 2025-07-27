#!/usr/bin/env bash
set -euo pipefail

# --- CONFIGURATION ---
DOCKER_USERNAME="siddhi17"  
REPO_NAME="nodejs-app"  
GIT_COMMIT=$(git rev-parse --short HEAD)

# --- BUILD AND PUSH ---
IMAGE="$DOCKER_USERNAME/$REPO_NAME:$GIT_COMMIT"

echo "🛠️  Building Docker image: $IMAGE"
docker build -t "$IMAGE" .

echo "🚀 Pushing to DockerHub..."
docker push "$IMAGE"

echo "✅ Done! Image pushed as $IMAGE"

