# Similarity Gate

This repository intentionally avoids cloning the public `mattpocock/skills` `handoff` text.

Run for the Codex version:

```powershell
powershell -ExecutionPolicy Bypass -File .\tools\measure-skill-similarity.ps1
```

Run for the Claude Code version:

```powershell
powershell -ExecutionPolicy Bypass -File .\tools\measure-skill-similarity.ps1 -CandidatePath .\claude-code\agent-conversation-bridge\SKILL.md
```

Default reference:

```text
https://raw.githubusercontent.com/mattpocock/skills/main/skills/productivity/handoff/SKILL.md
```

The gate reports:

- line Jaccard overlap
- token Jaccard overlap
- five-gram phrase Jaccard overlap
- shared nontrivial lines

Suggested publish thresholds:

- line Jaccard: 10% or lower
- token Jaccard: 25% or lower
- five-gram phrase Jaccard: 5% or lower

If the gate fails, rewrite concepts and sentence structures rather than changing isolated words.
