# Changelog

## 0.1.1

- Accept a **raw** Azure DevOps PAT in plugin setup (`ADO_PAT`); encode on the bot computer via `scripts/run-ado-mcp.sh`
- `mcp.json` runs the wrapper through `${CURSOR_PLUGIN_ROOT}` (no user laptop / no manual base64)
- README and `ado-getting-started` updated for secure paste-only UX

## 0.1.0

- Initial scaffold: Microsoft `@azure-devops/mcp` (local stdio) with PAT auth
- Domains: core, work-items, repositories, pipelines
- Skills: getting-started, work-items, pull-requests, pipelines
