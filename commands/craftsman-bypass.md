---
description: Bypass one craftsman rule with a written reason (ADR if architectural)
argument-hint: "<rule> <reason>"
---

# /craftsman-bypass

Arguments: `$ARGUMENTS` → parse **rule** + **reason** (reason required, ≥10 chars).

1. If reason missing/short → refuse; ask for justification.
2. Append to `state/bypasses.md` (under the active skill state dir):

```markdown
## YYYY-MM-DD HH:mm
- Rule: <rule>
- Reason: <reason>
- Session: craftsman bypass
```

3. If rule is architectural (interface, layering, cross-domain, Clean Arch) → also write short ADR under `docs/adr/` using template `templates/adr.md`.
4. Confirm: bypass recorded; **only that rule** is relaxed for the ongoing task — rest of craftsman stays ON.
