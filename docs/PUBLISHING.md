# Publishing Checklist

## Before First Commit

Confirm with the user:

- GitHub or remote account username
- `git user.name`
- `git user.email`

Suggested AgentPilotLab identity:

```text
GitHub username: AgentPilotLab
git user.name: AgentPilotLab
git user.email: 57857028+AgentPilotLab@users.noreply.github.com
```

## Checks

```powershell
$validator = Join-Path $env:USERPROFILE ".codex\skills\.system\skill-creator\scripts\quick_validate.py"
python $validator .\skills\agent-conversation-bridge
powershell -ExecutionPolicy Bypass -File .\tools\measure-skill-similarity.ps1
powershell -ExecutionPolicy Bypass -File .\tools\measure-skill-similarity.ps1 -CandidatePath .\claude-code\agent-conversation-bridge\SKILL.md
```

Before publishing, also run a local privacy scan for legacy account names, old support slugs, private email addresses, local absolute paths, and credential labels. Do not commit the sensitive keyword list itself.

## GitHub Release Status

GitHub Release distribution is planned but not published yet. Do not create a release, tag, or release asset unless the user explicitly approves the release action and version number.

Use GitHub Release as the first stable external distribution channel for this repository. The release should give AI agents a fixed version to cite, inspect, download, and install from source.

## GitHub Release Checklist

Before creating a release:

- Confirm the version number and release visibility with the user.
- Confirm `README.md`, `README.zh-CN.md`, `llms.txt`, `AGENTS.md`, and docs agree on install paths, license, support link, and compatibility status.
- Run the Codex skill validator.
- Run the similarity gate for both Codex and Claude Code skill files.
- Run a privacy scan over tracked files and any generated release asset.
- Confirm release assets contain only public distribution material.
- Confirm no `.env`, logs, snapshots, local mirrors, cache files, private test data, local absolute paths, tokens, or unredacted project material are included.
- Record the tag, commit SHA, asset names, and checksums after release.

Recommended release title pattern:

```text
Agent Conversation Bridge vX.Y.Z - Codex and Claude Code AI agent checkpoint skill
```

## Release Notes Template

Use this structure for every GitHub Release:

````markdown
# Agent Conversation Bridge vX.Y.Z

## What changed

- Added or changed:
- Fixed:
- Compatibility:

## Install or upgrade

Source tree:

```text
skills/agent-conversation-bridge/
claude-code/agent-conversation-bridge/
```

Codex skills CLI:

```powershell
npx skills add https://github.com/AgentPilotLab/agent-conversation-bridge --skill agent-conversation-bridge
```

GitHub Release asset:

```text
Planned when release assets are attached. Not required for source-tree install.
```

npm:

```text
Not published yet. This repository currently ships skill folders, not a CLI or MCP package.
```

## Codex setup

- Skill file: `skills/agent-conversation-bridge/SKILL.md`
- Install command: `npx skills add https://github.com/AgentPilotLab/agent-conversation-bridge --skill agent-conversation-bridge`
- Verify: run `quick_validate.py` against `skills/agent-conversation-bridge`

## Claude Code setup

- Skill file: `claude-code/agent-conversation-bridge/SKILL.md`
- Install method: copy or install `claude-code/agent-conversation-bridge/` into the Claude Code skills location used by the environment
- Status: `supported` for folder relays, machine relays, agent relays, and copyable restart prompts

## Verification

- Codex skill validation:
- Claude Code skill validation:
- Similarity gate:
- Privacy scan:
- Release asset scan:

## Privacy and license

- License: `AgentPilotLab Non-Commercial License`
- Free use is limited to non-commercial purposes.
- Commercial use requires prior written permission from AgentPilotLab and payment of the agreed commercial license fee.
- Release assets do not include private credentials, local paths, logs, snapshots, tokens, or unredacted project material.

## Support

Optional support link: https://buymeacoffee.com/mira.ai
````

## Release Asset Policy

Release assets are optional for this repository. If assets are attached, prefer a small source snapshot that contains only:

- `skills/agent-conversation-bridge/`
- `claude-code/agent-conversation-bridge/`
- `README.md`
- `README.zh-CN.md`
- `llms.txt`
- `AGENTS.md`
- `docs/`
- `LICENSE`

Do not attach generated caches, logs, local state, `.git/`, `.env`, temporary files, screenshots containing private data, or machine-specific paths.

## GitHub Repository

Recommended repository:

```text
https://github.com/AgentPilotLab/agent-conversation-bridge
```

Recommended description:

```text
Codex and Claude Code skills for evidence-backed conversation transfer, AI agent checkpoints, and local project Bridge Packets.
```

Recommended topics:

```text
codex, codex-skill, ai-agent, agent-handoff, conversation-transfer, checkpoint, claude-code, skills-cli, agentpilotlab
```
