#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
cd "$repo_root"

echo "=== Running format ==="
make fmt

echo "=== Running lint ==="
make lint

echo "=== Running tests ==="
make test

echo "=== Running build ==="
make build

echo "=== All checks passed ==="
