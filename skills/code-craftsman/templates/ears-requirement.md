# EARS requirement template

## Patterns

1. **Ubiquitous:** `The [system] shall [function].`
2. **Event-driven:** `When [trigger], the [system] shall [response].`
3. **State-driven:** `While [state], the [system] shall [behavior].`
4. **Optional:** `Where [feature included], the [system] shall [behavior].`
5. **Unwanted:** `If [error], then the [system] shall [response].`

## Template

```markdown
# Requirement: <ID> — <Short title>

**Type:** [event-driven | state-driven | ubiquitous | optional | unwanted]
**Priority:** [must | should | could | won't]

## Statement
When <trigger>, the <component> shall <response>.

## Acceptance Criteria
Given <context>
When <action>
Then <observable outcome>

## Out of scope
- ...

## Test approach
- [ ] Unit
- [ ] Snapshot (if UI)
- [ ] Contract (if external API)
- [ ] E2E (decide after implementation)
```
