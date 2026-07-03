# Claude Code Version

This repository includes a Claude Code oriented skill at:

```text
claude-code/agent-conversation-bridge/SKILL.md
```

Use this version when the receiving environment is Claude Code or another local coding agent that does not have Codex desktop thread-creation tools.

## Manual Install Pattern

Copy the folder into the Claude Code skills location used by the user's setup, preserving the `SKILL.md` file:

```text
agent-conversation-bridge/
  SKILL.md
```

If a project keeps local skills inside the repository, place it in the project's configured skills folder and invoke it as `agent-conversation-bridge`.

## Difference From The Codex Version

- Codex version: includes Codex thread creation, Codex project lookup, and Codex-specific migration distinctions.
- Claude Code version: focuses on local folder relays, machine relays, agent relays, and copyable restart prompts.

Both versions use the same Bridge Packet vocabulary so downstream agents can share packet artifacts.
