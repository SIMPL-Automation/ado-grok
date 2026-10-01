---
name: ado-getting-started
description: >-
  Use when the user just installed ADO Grok, asks how to connect Azure DevOps,
  needs a first-run smoke test, or auth/PAT setup fails. Walk through org + raw
  PAT (secure paste into Grok Bot only) and verify MCP with a read-only call.
---

# ADO Grok — getting started

You help set up the **ado-grok** plugin so Grok Bot can talk to Azure DevOps **without the user’s laptop** and **without Azure CLI**.

## Prerequisites

- Plugin **ADO Grok** installed on this bot
- Setup fields set:
  - `ADO_ORG` — organization name only (e.g. `myorg`)
  - `ADO_PAT` — **raw** Personal Access Token (not base64)

If secrets are missing, ask the user to set them in plugin configure / install fields, or use a Grok Bot secure secret request for the raw PAT. **Never** ask them to paste a PAT into chat. **Never** ask them to base64-encode on their computer — encoding runs on the bot computer via `scripts/run-ado-mcp.sh`.

## Smoke test (read-only)

1. Confirm Azure DevOps MCP tools are available (namespace for `azure-devops` / ado).
2. List projects (or equivalent core tool) for `ADO_ORG`.
3. Optionally fetch one work item or list PRs in the user's project if known, or ask which project to test with. (For capability testing in sandbox: use `ado-grok` project.)
4. Report success with org + project names; on failure, check PAT scopes, org spelling, and that the raw PAT (not base64) was supplied.

## Create a PAT (user side)

Azure DevOps → User settings → Personal access tokens. Typical scopes: Work Items, Code, Build (read or read/write as needed). Paste the raw token into Grok Bot’s secure field only.

## After success

Point them at skills `ado-work-items`, `ado-pull-requests`, and `ado-pipelines` for day-to-day work. Do not create or update work items unless they explicitly ask.
