# ADO Grok (`ado-grok`)

Marketplace plugin that connects **Grok Bot** to [Azure DevOps](https://dev.azure.com/) using Microsoft’s official local MCP server [`@azure-devops/mcp`](https://github.com/microsoft/azure-devops-mcp).

## Design goals

- Runs on **Grok Bot’s computer** — **no user laptop** and **no Azure CLI** required for the default install path.
- Auth is a **raw Personal Access Token** pasted into Grok Bot’s secure plugin setup. The plugin encodes it on the bot computer before starting MCP (users never base64-encode themselves).
- Configured via the `ADO_ORG` setup field (your organization name).
- Tool domains loaded by default: `core`, `work-items`, `repositories`, `pipelines`.

Companion bot: designed to pair with an **ADO Grok** specialist bot (skills + workflows). Plugin-only install also works.

## Icons

- **`assets/logo-mark.svg` / `.png`** — transparent mark (~29px pad on 512) for bot/plugin display
- **`assets/logo-marketplace.svg` / `.png`** — #111111 rounded plate with mark inset ~83px on 512 (marketplace style)

The `plugin.json` `logo` field points to the transparent mark (`assets/logo.svg`).

## What it includes

- **MCP:** `scripts/run-ado-mcp.sh` → `npx -y @azure-devops/mcp ${ADO_ORG} --authentication pat` with domains above
- **Skills:**
  - `ado-getting-started` — first-run auth check and smoke tests
  - `ado-work-items` — tickets / WIQL / state updates
  - `ado-pull-requests` — PR list, summary, review helpers
  - `ado-pipelines` — builds and pipeline status

Upstream MCP tools are owned by Microsoft; this repo’s MIT license covers packaging and skills only (see `NOTICE`).

## Install (marketplace)

1. Search Grok Bot plugins for **ADO Grok** (`ado-grok`) and install.
2. In plugin setup, set:
   - **ADO_ORG** — your Azure DevOps organization name (e.g. `myorg`)
   - **ADO_PAT** — paste your **raw** Azure DevOps PAT into the secure field (do not base64-encode; do not paste into chat)
3. Ask the agent to list projects or call a core MCP tool to smoke-test.

Create the PAT in Azure DevOps → User settings → Personal access tokens. Typical scopes: **Work Items** (read/write), **Code** (read), **Build** (read). Add more only if your workflows need them.

## How PAT encoding works

Microsoft’s MCP expects `PERSONAL_ACCESS_TOKEN` as base64 of `email:PAT`. This plugin accepts the **raw** PAT in `ADO_PAT`, then `scripts/run-ado-mcp.sh` (on the bot computer) encodes it and starts the server. You never need your laptop for that step.

## Install (local / Cursor)

```bash
mkdir -p ~/.cursor/plugins/local
ln -sfn ~/code/simpl/github/ado-grok ~/.cursor/plugins/local/ado-grok
```

Configure the same `ADO_ORG` / `ADO_PAT` variables (raw PAT) in the client’s plugin or MCP env. Restart / reload, then smoke-test.

> Grok Bot does not load `~/.cursor/plugins/local/` the same way Cursor IDE does — prefer marketplace install for Grok Bot.

## Optional: Azure CLI auth

Power users who already have `az login` on the **bot computer** can switch MCP args to `--authentication azcli` and drop the PAT env. That is **not** the default for marketplace users who want zero CLI setup.

## Auth note (remote MCP)

Microsoft also offers a **remote** Azure DevOps MCP (`https://mcp.dev.azure.com/{org}`) with Entra OAuth. This plugin ships the **local stdio** server so Grok Bot can use PAT secrets without depending on Entra dynamic client registration. Remote/OAuth can be a later path.

## Develop

1. Edit `.cursor-plugin/plugin.json` for marketplace metadata and `variables`.
2. Keep `mcp.json` pointing at `scripts/run-ado-mcp.sh` via `${CURSOR_PLUGIN_ROOT}`.
3. Add skills under `skills/<name>/SKILL.md`.
4. Run Create Plugin **review-plugin-submission** checks before publishing.

## License

MIT for packaging and skills. Microsoft MCP package: see upstream license / `NOTICE`.
