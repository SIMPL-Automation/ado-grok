# ADO Grok (`ado-grok`)

Marketplace plugin that connects **Grok Bot** to [Azure DevOps](https://dev.azure.com/) using Microsoft’s official local MCP server [`@azure-devops/mcp`](https://github.com/microsoft/azure-devops-mcp).

## Design goals

- Runs on **Grok Bot’s computer** (the shared box) — **no user laptop** and **no Azure CLI** required for the default install path.
- Auth is a **Personal Access Token** supplied as a plugin secret (base64 of `email:PAT`).
- Default org: `SimplAutomation`. Override with the `ADO_ORG` setup field.
- Tool domains loaded by default: `core`, `work-items`, `repositories`, `pipelines`.

Companion bot: designed to pair with an **ADO Grok** specialist bot (skills + workflows). Plugin-only install also works.

## What it includes

- **MCP:** `npx -y @azure-devops/mcp ${ADO_ORG} --authentication pat` with domains above
- **Skills:**
  - `ado-getting-started` — first-run auth check and smoke tests
  - `ado-work-items` — tickets / WIQL / state updates
  - `ado-pull-requests` — PR list, summary, review helpers
  - `ado-pipelines` — builds and pipeline status

Upstream MCP tools are owned by Microsoft; this repo’s MIT license covers packaging and skills only (see `NOTICE`).

## Install (marketplace)

1. Search Grok Bot plugins for **ADO Grok** (`ado-grok`) and install.
2. Set setup fields:
   - **ADO_ORG** — e.g. `SimplAutomation`
   - **ADO_PAT** — base64 of `email:YOUR_PAT` (email can be any non-empty string)
3. Ask the agent to list projects or call a core MCP tool to smoke-test.

### Encode a PAT

```bash
printf '%s' 'you@example.com:YOUR_ADO_PAT' | base64
```

Create the PAT in Azure DevOps → User settings → Personal access tokens. Typical scopes: **Work Items** (read/write), **Code** (read), **Build** (read). Add more only if your workflows need them.

## Install (local / Cursor)

```bash
mkdir -p ~/.cursor/plugins/local
ln -sfn ~/code/simpl/github/ado-grok ~/.cursor/plugins/local/ado-grok
```

Configure the same `ADO_ORG` / `ADO_PAT` variables in the client’s plugin or MCP env. Restart / reload, then smoke-test.

> Grok Bot does not load `~/.cursor/plugins/local/` the same way Cursor IDE does — prefer marketplace install for Grok Bot.

## Optional: Azure CLI auth

Power users who already have `az login` on the **bot computer** can switch MCP args to `--authentication azcli` and drop the PAT env. That is **not** the default for marketplace users who want zero CLI setup.

## Auth note (remote MCP)

Microsoft also offers a **remote** Azure DevOps MCP (`https://mcp.dev.azure.com/{org}`) with Entra OAuth. This plugin ships the **local stdio** server so Grok Bot can use PAT secrets without depending on Entra dynamic client registration. Remote/OAuth can be a later path.

## Develop

1. Edit `.cursor-plugin/plugin.json` for marketplace metadata and `variables`.
2. Keep `mcp.json` pointed at `@azure-devops/mcp` with PAT env `${ADO_PAT}`.
3. Add skills under `skills/<name>/SKILL.md`.
4. Run Create Plugin **review-plugin-submission** checks before publishing.

## License

MIT for packaging and skills. Microsoft MCP package: see upstream license / `NOTICE`.
