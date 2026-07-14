# SPIKE protocol

Temporary exploration **without** TDD. Not a permanent bypass.

## Marker (file top, both lines)

```
// SPIKE: <concrete reason ≥15 chars> — expires YYYY-MM-DD
// SPIKE-ISSUE: #<number>
```

## Rules

1. Concrete reason (not “wip”, “testing”, “exploring”)
2. Expiration ≤7 days
3. Issue number required
4. Prefer one active spike at a time
5. Do not merge pure spike branch to main

## Convert to production

1. Delete or isolate spike  
2. RED test for real behavior  
3. GREEN implementation  
4. Close SPIKE issue referencing feature issue  
