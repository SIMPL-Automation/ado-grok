---
name: ado-work-items
description: >-
  Use when the user asks about Azure DevOps work items, tickets, bugs, features,
  WIQL queries, iterations, or changing work-item state/fields. Prefer ADO MCP
  work-items tools over az devops CLI.
---

# ADO work items

Use the Azure DevOps MCP **work-items** (and **core**) tools from the ado-grok plugin.

## Context

- Organization: from `ADO_ORG` environment variable
- Project: ask the user for their default project if not specified, and remember it for the session

## Rules

- Prefer MCP tools over shell/`az devops`.
- **Read** freely for status and lookup.
- **Create / update / state changes** only when the user explicitly asks.
- When a Todoist task is linked to an ADO item and the user marks it in progress, keep ADO state in sync (Doing / equivalent) if that workflow applies.
- Summarize results in plain language; include work item IDs and links when available.
- **Capability testing**: use the sandbox `ado-grok` project for fixture tests, never production/day-to-day projects.

## Capabilities (v2.11.0)

### Work item attachments
- `wit_work_item_attachment_upload`: upload a file as a new work item attachment (returns an attachment URL).
- `wit_work_item_attachment_link`: link an uploaded attachment to a specific work item by ID.

These tools enable a two-step workflow: first upload the file to get its URL, then link it to one or more work items.
