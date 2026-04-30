#!/usr/bin/env bash
set -euo pipefail

IMAGE="pandoc-ja:latest"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOCKER_DIR="${SCRIPT_DIR}/docker"

if ! docker info > /dev/null 2>&1; then
  echo "[ERROR] Docker デーモンが起動していません。"
  echo "        次のコマンドで起動してください: open -a Docker"
  echo "        起動後、数秒待ってから再実行してください。"
  exit 1
fi

if docker image inspect "$IMAGE" > /dev/null 2>&1; then
  echo "[INFO] Docker image '$IMAGE' は既に存在します。スキップします。"
  exit 0
fi

echo "[INFO] Docker image '$IMAGE' をビルドします (初回のみ、数分かかります)..."
docker build -t "$IMAGE" "$DOCKER_DIR"
echo "[INFO] ビルド完了: $IMAGE"
