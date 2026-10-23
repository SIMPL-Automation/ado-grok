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

## Capabilities (v2.11.0)

### Organization-wide PR listing
Use `repo_pull_request_org` to list active pull requests across all projects and repositories in the organization for the authenticated user. Accepts `is_reviewer` (boolean: true for PRs where user is reviewer, false for PRs created by user), `reviewStatus` (all/approved/pending), `top`, and `skip`. Returns only active PRs.

### Repository file operations
- `repo_file_write` with action `create`: create a new text file on an existing branch and commit the change.
- `repo_file_write` with action `update`: update an existing text file on an existing branch and commit the change.

### PR thread reply and resolve
`repo_pull_request_thread_write` with action `reply` now returns the new comment ID and optionally updates thread status in the same call. To reply and resolve a thread in one step, include the `status` parameter (e.g., `Fixed` or `Closed`).

### PR update behavior
When updating a PR with `repo_pull_request_write`, the `isDraft` parameter is optional. If omitted, the existing draft status is preserved. Only set `isDraft` to change the draft state.

### Repository identification
When using `repositoryId` as a repository name (not a GUID), you must provide the `project` parameter. GUIDs do not require a project.
