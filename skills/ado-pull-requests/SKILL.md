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
- Default project `SIMPLware` unless specified.
- Summarize PRs with title, author, status, and link; do not approve/merge unless the user explicitly asks.
- For deep code-behavior questions, route to SIMPL Code Researcher when that teammate policy applies.
