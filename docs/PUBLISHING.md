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
