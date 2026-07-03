---
name: agent-conversation-bridge
description: Create evidence-backed Bridge Packets for moving Claude Code work between chats, folders, machines, or another agent. Use when the user asks to resume elsewhere, preserve task state, migrate project context, checkpoint long-running coding work, or prepare a copyable restart prompt for Claude Code or another AI coding agent.
---

# Agent Conversation Bridge For Claude Code

Build a Bridge Packet that gives the receiving Claude Code session a verified project start state. The packet should read like an operational relay: mission, evidence, risks, validation, and the next commandable steps.

## Core Rules

- Anchor every claim to visible evidence where possible: files, commands, diffs, logs, issue links, screenshots, or tool output.
- Keep user intent, constraints, style preferences, and approval boundaries intact.
- Mark memory-only facts as `Unverified` until a current file, command, or external source confirms them.
- Remove secrets, personal identifiers, cookies, tokens, passwords, and account-private details.
- Keep implementation paused after producing a bridge unless the user asks the current session to keep working too.

## Bridge Modes

- `folder restart`: same project, later Claude Code session.
- `target folder relay`: user names another local folder or repository.
- `machine relay`: user wants to continue on another computer.
- `agent relay`: user wants another AI coding agent to pick up the task.
- `mechanism advice`: user asks whether they need a written bridge, Git push, remote workspace, export/import, or a new session.

Ask one short destination question only when the requested target is ambiguous.

## Output Placement

- For a target folder, write to `.wiki/inbox/` if present; otherwise use `docs/bridges/`.
- For a restart without a target folder, write to an OS temp path and include a copyable absolute path.
- If paths may break Markdown or browser parsing, also create an ASCII-safe duplicate path.
- For HTML bridge output, produce a complete standalone HTML file, not a fragment.

## Packet Headings

Use these headings for normal bridge packets:

1. `Receiving Mission`
2. `User Rules`
3. `Project Snapshot`
4. `Evidence Register`
5. `Edit Register`
6. `Command Register`
7. `Decision Register`
8. `Validation Register`
9. `Risk Register`
10. `Resume Steps`
11. `Useful Skills Or Tools`
12. `Copyable Restart Prompt`

Use `Unknown`, `Not checked`, or `Not applicable` rather than guessing.

## Restart Prompt

End with a prompt like:

```text
Use the agent-conversation-bridge skill. First read <absolute packet path>. Continue from Receiving Mission and Validation Register. Trust only evidence in the packet or freshly inspected project state.
```

Adapt the wording if the receiving agent is Codex, Claude Code, or another local coding agent.
