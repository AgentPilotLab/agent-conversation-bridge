---
name: agent-conversation-bridge
description: Build evidence-backed Bridge Packets for moving Codex work between chats, machines, local projects, or receiving Codex threads. Use when the user asks to transfer context, resume elsewhere, checkpoint a long task, prepare another Codex session, preserve project state before compaction, or create a receiving thread with a starter prompt.
---

# Agent Conversation Bridge For Codex

Create a Bridge Packet: a compact but complete operating package that gives the receiving agent a verified start state, not a memory-flavored recap. Treat the packet as an evidence map plus a launch message.

## Operating Rules

- Preserve the user's exact objective, constraints, tone preferences, and unresolved decisions.
- Separate observed facts from inference. Mark uncertain items as `Unknown`, `Unverified`, or `Needs user confirmation`.
- Prefer file paths, command results, URLs, screenshots, diffs, test output, and issue/PR links over conversational memory.
- Redact secrets and private identifiers. Say what kind of value was removed without exposing it.
- Keep the source thread quiet after creating a receiving thread unless the user asks both threads to continue.

## Transfer Modes

Choose the mode before writing the packet.

- `same-project restart`: user wants a later or fresh chat to pick up this repository.
- `local project bridge`: user names another local workspace or asks this thread to open a new Codex conversation there.
- `machine migration`: user is moving work to another computer or Codex install.
- `remote handoff explanation`: user is asking about Codex Remote hand off, Git state movement, or host switching.
- `import explanation`: user is asking about importing Codex setup, projects, skills, plugins, MCP config, or supported recent chats.

For ambiguous destination requests, ask one concise question. For all other cases, make the most useful packet immediately.

## Packet Locations

- For a named target project, write inside that project. Prefer `.wiki/inbox/` when it exists; otherwise use `docs/bridges/`.
- For ordinary restart or machine migration, write an ASCII-safe copy under the OS temp directory and report the absolute path.
- If the path contains spaces, CJK characters, brackets, `%`, `#`, or hidden folders, also create or choose an ASCII-safe openable copy.
- For browser-openable HTML packets, include a complete document shell with `<!doctype html>`, UTF-8 metadata, and a body element.

## Bridge Packet Template

Use these headings unless a shorter packet is clearly enough:

1. `Receiver Mission`: the active goal, done criteria, and what success must prove.
2. `User Directives`: instructions, preferences, wording to preserve, and hard boundaries.
3. `Runtime Snapshot`: OS, shell, cwd, repository identity, branch, dirty-state summary, sandbox/tool limits, and relevant accounts.
4. `Evidence Register`: files, URLs, docs, images, tickets, chats, and commands inspected, with the useful fact extracted from each.
5. `Change Register`: files created or edited, why they changed, and whether the edit was verified.
6. `Command Ledger`: important commands, outcomes, failures, approvals, retries, and concise key output.
7. `Decision Log`: assumptions accepted, alternatives rejected, and decisions still waiting for the user.
8. `Validation Ledger`: tests, builds, lint, similarity checks, manual inspections, screenshots, or other gates and their status.
9. `Risk Register`: stale facts, fragile environment details, privacy redactions, auth boundaries, and irreversible actions to avoid.
10. `Resume Queue`: ordered next actions with the safest starting point first.
11. `Skill Router`: skills/tools the receiving agent should load and why.
12. `Starter Message`: a copyable first prompt that tells the receiving agent where to read the packet.

## Local Project Bridge

When the user asks you to move work into another local project or create the receiving conversation yourself:

1. Identify the destination project path or name. Ask only if there is no reliable match.
2. Write the Bridge Packet into the destination project using the packet-location rules.
3. Make the `Starter Message` instruct the receiving agent to read the destination packet before acting.
4. If thread tools are absent, use tool discovery for Codex thread creation.
5. Use the Codex project list to find the destination. Create the receiving thread with local environment and the starter message.
6. Report the new thread directive only after thread creation succeeds.
7. If project lookup or thread creation fails, give the packet path and starter message so the user can start the receiving thread manually.

## Migration Distinctions

When the user says "handoff", "move", "migrate", "transfer", or similar, name the mechanism clearly:

- Bridge Packet: a written restart artifact for another chat, project, or machine.
- Codex Remote hand off: moving an existing remote thread and Git state between connected hosts.
- Import to Codex: bringing supported setup data such as projects, skills, plugins, MCP config, and recent chats into a Codex install.

Do not blur these mechanisms. If the user needs a product workflow rather than a written packet, explain the correct workflow and then offer the packet only when it helps.

## Starter Message Pattern

End every packet with a prompt like this:

```text
Use $agent-conversation-bridge. First read: <absolute packet path or URL>. Continue from the Receiver Mission and Validation Ledger. Do not redo completed work unless the evidence is missing or stale.
```

Adapt the skill name if the receiving environment uses a different installed skill.
