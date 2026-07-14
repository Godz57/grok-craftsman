---
description: Enable code-craftsman quality enforcement for this environment
---

# /craftsman-on

1. Write `on` to:
   - Prefer project: `./.grok/skills/code-craftsman/state/enabled.flag` if `./.grok/skills/code-craftsman` exists
   - Else: `~/.grok/skills/code-craftsman/state/enabled.flag`
2. Create parent dirs if needed.
3. Clear pause in `state/session.json` if present (`paused_until` remove or set null).
4. Confirm: **Craftsman ON** — TDD, Clean Code limits, flat-first, anti-patterns active.
5. Remind: `/craftsman-off` to disable; `/craftsman-status` for state.
