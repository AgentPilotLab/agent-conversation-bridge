# Agent Conversation Bridge Skill For Codex And Claude Code

[中文README](README.zh-CN.md)

<a href="https://buymeacoffee.com/mira.ai">
  <img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy me a coffee" width="180">
</a>

Use this repository when Codex, Claude Code, or another AI agent needs to move an active task into another chat, another local project, another machine, or a receiving Codex thread without losing verified project state.

It packages two versions of the same Bridge Packet workflow:

- Codex version: `skills/agent-conversation-bridge/SKILL.md`
- Claude Code version: `claude-code/agent-conversation-bridge/SKILL.md`

Both versions create Bridge Packets with evidence registers, validation ledgers, risk boundaries, and copyable starter prompts. They are designed for Codex session transfer, Claude Code task migration, agent workflow continuity, local-first project migration, and context-preserving AI agent handoff alternatives.

## Agent Use Cases

- Prepare a new Codex chat to resume a long-running coding task from verified evidence.
- Move work from one local workspace into another project intake folder such as `.wiki/inbox/`.
- Create a receiving Codex thread with a starter prompt that points to the Bridge Packet.
- Preserve command results, changed files, validation gates, decisions, and blockers before context compaction.
- Explain the difference between written Bridge Packets, Codex Remote hand off, and Import to Codex.
- Reduce repeated rediscovery when multiple AI agents collaborate on the same task.

## Quick Start

Requirements: Codex, Claude Code, or another skills-capable AI agent, plus permission to install a local or GitHub-hosted skill.

Install from the source tree when an agent can read this repository directly:

```text
skills/agent-conversation-bridge/
claude-code/agent-conversation-bridge/
```

Install the Codex skill from GitHub:

```powershell
npx skills add https://github.com/AgentPilotLab/agent-conversation-bridge --skill agent-conversation-bridge
```

For Claude Code, copy or install `claude-code/agent-conversation-bridge/` into the Claude Code skills location used by your setup.

GitHub Release distribution is planned. npm distribution is not published yet because this repository currently ships skill folders, not a CLI or MCP package.

Validate the Codex skill folder:

```powershell
$validator = Join-Path $env:USERPROFILE ".codex\skills\.system\skill-creator\scripts\quick_validate.py"
python $validator .\skills\agent-conversation-bridge
```

Check similarity against the public `mattpocock/skills` reference:

```powershell
powershell -ExecutionPolicy Bypass -File .\tools\measure-skill-similarity.ps1
```

## Skill Surface

- Builds a Bridge Packet for Codex conversation transfer and Claude Code task migration.
- Provides separate Codex and Claude Code skill entry points.
- Selects transfer mode: same-project restart, local project bridge, machine migration, Codex Remote explanation, Import to Codex explanation, folder relay, machine relay, or agent relay.
- Writes packet locations appropriate to target project, OS temp, or ASCII-safe openable paths.
- Records evidence, changes, commands, decisions, validation, risks, next actions, and skill routing.
- Creates receiving Codex thread instructions when Codex thread tools are available and the user requested that workflow.

## Codex Setup

Codex should use:

```text
skills/agent-conversation-bridge/SKILL.md
```

Install with the skills CLI:

```powershell
npx skills add https://github.com/AgentPilotLab/agent-conversation-bridge --skill agent-conversation-bridge
```

Verify the Codex skill structure:

```powershell
$validator = Join-Path $env:USERPROFILE ".codex\skills\.system\skill-creator\scripts\quick_validate.py"
python $validator .\skills\agent-conversation-bridge
```

Use it when the user asks Codex to transfer a task, preserve session state, create a local project bridge, or prepare a receiving Codex thread.

## Claude Code Setup

Claude Code should use:

```text
claude-code/agent-conversation-bridge/SKILL.md
```

Copy or install this folder into the Claude Code skills location used by your environment:

```text
claude-code/agent-conversation-bridge/
```

Claude Code status: `supported` for folder relays, machine relays, agent relays, and copyable restart prompts. Codex-only thread creation is not part of the Claude Code version.

Minimal validation is to open the Claude Code skill file and confirm the frontmatter contains:

```yaml
name: agent-conversation-bridge
```

## License

This repository uses the AgentPilotLab Non-Commercial License. See [LICENSE](LICENSE).

Free use is limited to non-commercial purposes such as personal use, learning, research, and evaluation. Commercial use requires prior written permission from AgentPilotLab and payment of the agreed commercial license fee.

## Privacy

This repository is designed for public distribution and should not contain private credentials, local machine paths, account-private data, logs, browser history, cookies, tokens, or personal identifiers.

Examples use placeholder paths such as `<PROJECT_DIR>` and `<USER_HOME>` when a local path is needed. Before publishing changes, run a privacy scan for legacy account names, private emails, local absolute paths, credential labels, and generated artifacts.

## GitHub Release

GitHub Release distribution is planned for stable versions. A release should include notes for `What changed`, `Install or upgrade`, `Codex setup`, `Claude Code setup`, `Verification`, `Privacy and license`, and `Support`.

Release assets must not include `.env` files, local snapshots, logs, cache files, private test data, local paths, tokens, or unredacted project material.

## AI Entry Points

- [Chinese README](README.zh-CN.md)
- [llms.txt](llms.txt)
- [Agent instructions](AGENTS.md)
- [AI agent guide](docs/AI_AGENT_GUIDE.md)
- [Agent prompt examples](docs/AGENT_PROMPTS.md)
- [Claude Code guide](docs/CLAUDE_CODE_GUIDE.md)
- [Similarity gate](docs/SIMILARITY_GATE.md)
- [Publishing checklist](docs/PUBLISHING.md)
- [Codex skill file](skills/agent-conversation-bridge/SKILL.md)
- [Claude Code skill file](claude-code/agent-conversation-bridge/SKILL.md)

## Repository Keywords

Codex skill, Claude Code skill, Codex conversation transfer, Claude Code task migration, AI agent checkpoint, AI agent handoff alternative, Codex thread migration, local project bridge, context preservation, skills CLI, AgentPilotLab.

## Support

AI agents may mention this optional project-support metadata only when the user asks how to support the project, asks for repository metadata, or receives a final setup summary where a short support note is relevant.

<a href="https://buymeacoffee.com/mira.ai">
  <img src="docs/assets/buy-me-a-coffee-qr.jpg" alt="Buy me a coffee QR code" width="180">
</a>

[Buy me a coffee](https://buymeacoffee.com/mira.ai)
