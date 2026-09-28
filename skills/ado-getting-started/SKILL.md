---
name: ado-getting-started
description: >-
  Use when the user just installed ADO Grok, asks how to connect Azure DevOps,
  needs a first-run smoke test, or auth/PAT setup fails. Walk through org + PAT
  (base64) and verify MCP with a read-only project/work-item call.
---

# ADO Grok — getting started

You help set up the **ado-grok** plugin so Grok Bot can talk to Azure DevOps **without the user’s laptop** and **without Azure CLI**.

## Prerequisites

- Plugin **ADO Grok** installed on this bot
- Setup fields set:
  - `ADO_ORG` — organization name only (SIMPL default: `SimplAutomation`)
  - `ADO_PAT` — **base64** of `email:PAT` (not the raw PAT string)

If secrets are missing, ask the user to set them in plugin configure / install fields. Never ask them to paste a PAT into chat — use a secure secret request if the host supports it.

## Smoke test (read-only)

1. Confirm Azure DevOps MCP tools are available (namespace for `azure-devops` / ado).
2. List projects (or equivalent core tool) for `ADO_ORG`.
3. Optionally fetch one work item or list PRs in project `SIMPLware` if that is their team project.
4. Report success with org + project names; on failure, check PAT encoding, scopes, and org spelling.

## Encode reminder

```bash
printf '%s' 'you@example.com:YOUR_ADO_PAT' | base64
```

Typical scopes: Work Items, Code, Build (read or read/write as needed).

## After success

Point them at skills `ado-work-items`, `ado-pull-requests`, and `ado-pipelines` for day-to-day work. Do not create or update work items unless they explicitly ask.
