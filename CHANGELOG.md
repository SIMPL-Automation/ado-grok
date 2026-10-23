# Changelog

## 0.1.4

- Synced skills to @azure-devops/mcp 2.11.0 stable capabilities:
  - **ado-pull-requests**: added org-wide PR listing (`repo_pull_request_org`), repository file create/update (`repo_file_write`), reply+resolve in one call (`repo_pull_request_thread_write` with `status`), PR update draft preservation, and repository name vs GUID handling.
  - **ado-work-items**: added work item attachment upload (`wit_work_item_attachment_upload`) and linking (`wit_work_item_attachment_link`).
- Related upstream PRs: #1600 (org-wide PRs), #1620 (file write), #1640 (attachments), #1672 (draft preservation), #1678 (repo name requires project), #1699 (reply+resolve).

## 0.1.3

- Plugin icon eyes enlarged 50% to match the new Grok Bot avatars

## 0.1.2

- Set plugin author attribution to **SIMPL Automation** (P4 packaging)

## 0.1.1

- Accept a **raw** Azure DevOps PAT in plugin setup (`ADO_PAT`); encode on the bot computer via `scripts/run-ado-mcp.sh`
- `mcp.json` runs the wrapper through `${CURSOR_PLUGIN_ROOT}` (no user laptop / no manual base64)
- README and `ado-getting-started` updated for secure paste-only UX

## 0.1.0

- Initial scaffold: Microsoft `@azure-devops/mcp` (local stdio) with PAT auth
- Domains: core, work-items, repositories, pipelines
- Skills: getting-started, work-items, pull-requests, pipelines
