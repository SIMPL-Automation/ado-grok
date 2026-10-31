# Testing ADO Grok

## Marketplace / Grok Bot

1. Install **ADO Grok** (`ado-grok`) and set:
   - **ADO_ORG** — Azure DevOps organization name only (e.g. `myorg`), not the URL
   - **ADO_PAT** — raw Personal Access Token with scopes: Work Items (read/write), Code (read & write), Build (read)
2. Ask: `List my Azure DevOps projects.` Expect the org's projects.
3. Work items: `Show active work items in <project>`, then `Create a Task in <project> titled "ado-grok test"` and `Set it to Active.`
4. Pull requests: `List open PRs in <project>/<repo>` and `Summarize PR <id>.`
5. Pipelines: `Show the last 5 builds in <project>` and `Why did the latest failed build fail?`

## Local (Cursor)

```bash
git clone https://github.com/SIMPL-Automation/ado-grok.git ~/.cursor/plugins/local/ado-grok
```

Set the same `ADO_ORG` / `ADO_PAT` variables, reload, and repeat step 2 above.

## Reviewer sandbox

We can provide a sandbox org and PAT on request — email the submitter at the work address on the submission form.
