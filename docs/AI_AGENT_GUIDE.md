# AI Agent Guide

Use this repository when the user needs session continuity rather than a short chat recap.

## Recommended Workflow

1. Read `skills/agent-conversation-bridge/SKILL.md` for Codex or `claude-code/agent-conversation-bridge/SKILL.md` for Claude Code.
2. Identify the transfer mode.
3. Gather evidence from files, commands, URLs, tool output, and current repository state.
4. Write a Bridge Packet to the correct destination.
5. Provide the Starter Message in the final response.
6. If publishing or editing this repository, run the validation commands in `AGENTS.md`.

## What Good Output Looks Like

A good Bridge Packet lets a receiving agent answer:

- What exact goal is active?
- What has already been verified?
- Which files changed?
- Which commands matter?
- Which decisions are settled?
- Where should work resume?
- What must not be touched?

## Boundaries

- Do not include secrets, private tokens, cookies, or passwords.
- Do not pretend a written packet can move Git state between machines; explain Codex Remote hand off when that is the requested mechanism.
- Do not create new Codex threads unless the user asked for that or the Codex skill instructions require it for a named local project bridge.
