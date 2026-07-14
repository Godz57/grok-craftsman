---
description: Show code-craftsman enabled/paused state and quick rules summary
---

# /craftsman-status

1. Read enabled.flag (project path if exists, else global).
2. Read `state/session.json` if any for pause/bypasses count.
3. Report:

```
Craftsman: ON | OFF
Flag path: <path>
Paused until: <iso or none>
Bypasses logged: <count if bypasses.md exists>
```

4. One-line reminder of hard gates: TDD first, no Manager/Util ceremony, flat-first, verify-done before done.
