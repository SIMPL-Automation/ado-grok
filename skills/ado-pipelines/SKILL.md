---
name: ado-pipelines
description: >-
  Use when the user asks about Azure DevOps pipelines, builds, run status, or
  failing CI. Prefer ADO MCP pipelines tools over az pipelines CLI.
---

# ADO pipelines

Use Azure DevOps MCP **pipelines** tools from ado-grok.

## Rules

- Prefer MCP over shell/`az pipelines`.
- Default project `SIMPLware` unless specified.
- Report run status, failed jobs, and links; do not queue or cancel runs unless the user explicitly asks.
