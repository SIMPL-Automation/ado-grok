#!/usr/bin/env bash
# Encode a raw ADO PAT for Microsoft @azure-devops/mcp, then exec the server.
# Runs on Grok Bot's computer — users paste the raw PAT into Grok Bot only.
set -euo pipefail

if [[ -z "${ADO_ORG:-}" ]]; then
  echo "ado-grok: ADO_ORG is required" >&2
  exit 1
fi
if [[ -z "${ADO_PAT:-}" ]]; then
  echo "ado-grok: ADO_PAT (raw Personal Access Token) is required" >&2
  exit 1
fi

# Microsoft MCP expects base64 of email:PAT (email may be any non-empty string).
export PERSONAL_ACCESS_TOKEN
PERSONAL_ACCESS_TOKEN="$(printf '%s' "x:${ADO_PAT}" | base64 | tr -d '\n')"

exec npx -y @azure-devops/mcp "${ADO_ORG}" \
  --authentication pat \
  -d core work-items repositories pipelines
