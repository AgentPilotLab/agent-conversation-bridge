# AgentPilotLab Repository Instructions

This repository is AI-agent-first. Treat it as a skill package and operating manual for Codex, Claude Code, and other skills-capable agents.

## Primary Goal

Maintain `agent-conversation-bridge` as distinct Codex and Claude Code conversation-transfer skills that help agents move work between sessions with evidence-backed Bridge Packets.

## Editing Rules

- Keep the Codex skill content in `skills/agent-conversation-bridge/SKILL.md`.
- Keep the Claude Code skill content in `claude-code/agent-conversation-bridge/SKILL.md`.
- Keep repository docs aligned with the same keywords: Codex conversation transfer, AI agent checkpoint, local project bridge, context preservation, and Bridge Packet.
- Do not copy wording from the public `mattpocock/skills` `handoff` skill. Run the similarity gate after substantial edits.
- Prefer concise skill instructions. Put repository usage, SEO, publishing, and validation details in docs rather than inside the skill body.
- Redact secrets, tokens, cookies, private emails, local-only credentials, and personal identifiers from examples.

## Required Checks

Run these before publishing changes:

```powershell
$validator = Join-Path $env:USERPROFILE ".codex\skills\.system\skill-creator\scripts\quick_validate.py"
python $validator .\skills\agent-conversation-bridge
powershell -ExecutionPolicy Bypass -File .\tools\measure-skill-similarity.ps1
powershell -ExecutionPolicy Bypass -File .\tools\measure-skill-similarity.ps1 -CandidatePath .\claude-code\agent-conversation-bridge\SKILL.md -MaxTokenJaccard 25 -MaxLineJaccard 10 -MaxPhraseJaccard 5
```

Also run a local privacy scan for legacy account names, old support slugs, private email addresses, local absolute paths, and credential labels before publishing. Keep the sensitive search terms out of committed documentation when possible.

## Git Identity

Before the first commit in a new clone or regenerated repository, confirm:

- GitHub or remote account username
- `git user.name`
- `git user.email`

AgentPilotLab defaults are documented in the project wiki, but confirmation is still required before committing.
