---
name: ado-work-items
description: >-
  Use when the user asks about Azure DevOps work items, tickets, bugs, features,
  WIQL queries, iterations, or changing work-item state/fields. Prefer ADO MCP
  work-items tools over az devops CLI.
---

# ADO work items

Use the Azure DevOps MCP **work-items** (and **core**) tools from the ado-grok plugin.

## Defaults (SIMPL)

- Organization: from `ADO_ORG` (often `SimplAutomation`)
- Common project: `SIMPLware` unless the user names another

## Rules

- Prefer MCP tools over shell/`az devops`.
- **Read** freely for status and lookup.
- **Create / update / state changes** only when the user explicitly asks.
- When a Todoist task is linked to an ADO item and the user marks it in progress, keep ADO state in sync (Doing / equivalent) if that workflow applies.
- Summarize results in plain language; include work item IDs and links when available.
