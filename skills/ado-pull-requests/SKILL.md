---
name: ado-pull-requests
description: >-
  Use when the user asks about Azure DevOps pull requests: list, status, summarize,
  reviewers, or diffs. Prefer ADO MCP repositories tools over az devops CLI.
---

# ADO pull requests

Use Azure DevOps MCP **repositories** tools from ado-grok for PR workflows.

## Rules

- Prefer MCP over `az repos` / REST from shell.
- Ask for the user's project if not already known from context; remember it for the session.
- Summarize PRs with title, author, status, and link; do not approve/merge unless the user explicitly asks.
- **Capability testing**: use the sandbox `ado-grok` project for fixture tests, never production/day-to-day projects.
