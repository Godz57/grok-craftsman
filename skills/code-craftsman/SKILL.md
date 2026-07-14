---
name: code-craftsman
description: >
  Always-on quality enforcement for Grok (when enabled). Forces TDD, Clean Code
  limits, flat-first architecture, YAGNI, EARS requirements, SPIKE protocol,
  and completion checklists. Blocks LLM laziness and over-engineering.
  Use when craftsman is on, user runs /code-craftsman, /craftsman-on, or asks
  for strict quality / no vibe-coding. Skip only when flag is off or user
  explicitly disables.
metadata:
  short-description: "Always-on quality discipline (lite)"
  author: "adapted from giovani-junior-dev/code-craftsman for Grok"
---

# code-craftsman (Grok lite)

> Simple working > elegant broken. YAGNI > ritual Clean Arch. Measure > opine.

**Activation check (every time this skill applies):**

1. Read `~/.grok/skills/code-craftsman/state/enabled.flag` (or project
   `./.grok/skills/code-craftsman/state/enabled.flag` if present — project wins).
2. If contents are `off` or file missing after explicit off → **no-op** (do not
   enforce). User can re-enable with `/craftsman-on`.
3. If `on` (default after install) → treat rules below as **binding** for code,
   plans, refactors, and reviews in this session.
4. Optional pause: if `state/session.json` has `"paused_until"` ISO timestamp
   in the future → no-op until then.

Announce when enforcing: `Craftsman ON — applying quality rules.`

If disabled and user is coding without asking for craftsman, stay silent.

## Companion skills

Prefer composing (do not duplicate full protocols):

| Skill | Use |
|-------|-----|
| `tdd` (grok-superpowers) | Red-green-refactor mechanics |
| `systematic-debug` | Root-cause before fix |
| `verify-done` | Evidence before success claims |
| `superpowers` / `brainstorm` / `write-plan` | Process when building features |
| `loop-architect` / loops kit | Autonomous multi-turn loops |

## Output (when ON)

- Prefer tables over long prose for plans
- Plans ideally ≤500 lines; dense sections, no filler paragraphs
- No “I’ll add tests later”
- Code comments: WHY only; no commented-out code

Optional **caveman** mode (if user asks `/craftsman-caveman` or wants max compression):
fragments OK, minimal articles/filler. Default: clear concise Portuguese/English,
not telegram-speak, unless requested.

## EARS — requirements

Every non-trivial requirement in a plan MUST use EARS:

- Ubiquitous: `The [system] shall [function]`
- Event: `When [trigger], the [system] shall [response]`
- State: `While [state], the [system] shall [behavior]`
- Optional: `Where [feature], the [system] shall [behavior]`
- Unwanted: `If [error], then the [system] shall [response]`

Template: `templates/ears-requirement.md`

FORBIDDEN: “would be nice”, “users want”, vague “should be fast”.

## Tests — every feature plan lists

```markdown
**Tests:**
- Unit (RED first): [scope]
- Snapshot (if UI/complex output): [yes/no]
- Contract (if external HTTP): [yes/no]
- E2E (opt-in after impl): [pending/yes/no]
- Mutation (if available, target ≥70%): [target or N/A]
- Coverage intent for new code: [≥80% when tooling exists]
```

Auto-trigger intent:

| Situation | Prefer |
|-----------|--------|
| UI render / stable complex output | snapshot |
| External HTTP / webhooks | contract (MSW/Pact/Zod-style) |
| Money / critical branching | extra unit + mutation if stack supports |
| Critical multi-step UI | ask E2E after unit green → ADR |

## TDD non-negotiable

Before production behavior change:

1. **RED** — failing test  
2. **GREEN** — minimal code  
3. **REFACTOR** — keep green  

Use `tdd` skill. No production code without failing test first (except SPIKE).

### SPIKE (only TDD exception)

File top:

```
// SPIKE: <concrete reason ≥15 chars> — expires YYYY-MM-DD
// SPIKE-ISSUE: #<number>
```

Rules: reason not generic (`wip`/`tmp` banned); expire ≤7 days; issue required;
no merge of pure spike to main; convert via RED test then delete spike.
See `templates/spike-marker.md`.

## NEVER (blocklist)

### Naming
- Generic `Manager`, `Processor`, `Handler`, `Util`, `Helper`, domain-less `Service`
- `I` prefix on interfaces (`IRepository`)
- Hungarian / `m_` / redundant `NameString`, `UserData`, `OrderInfo`

### Functions
- Boolean flag params (`doX(true)` → split)
- >20 lines (prefer extract)
- >2 indent levels
- 3+ params without object/options type

### Architecture
- Interface without 2nd real implementation
- UseCase for simple CRUD
- DTO/Mapper multi-layer without pain
- Preventive DI / Clean Arch ceremony
- Cross-domain imports (`billing` → `orders` internals)

### Tests
- Code before test (non-SPIKE)
- Unrelated multi-asserts; `.only`/`.skip` in commit
- >3 mocks per test without strong reason
- `if`/`switch` in tests

### General
- Magic numbers; empty catch; TODO without issue
- Dead commented-out code
- Law of Demeter chains `a.b().c().d()`

Full list: `references/anti-patterns.md`

## ALWAYS

### Architecture order
1. Modular monolith by domain folders  
2. Flat inside module (input / logic / persist often enough)  
3. Abstract **only** after real pain (2nd impl, bad external contract → ACL)

### Comments
- File-top context if needed (1–3 lines)
- WHY for non-obvious constraints
- Keep useful agent-left comments

### Resist LLM laziness
When proposing a solution, self-check:

1. Follows this skill?  
2. Correct pattern from the start (not “simplify then iterate forever”)?  
3. YAGNI — no speculative layers?  
4. Flat before Clean Arch theater?

If you want `IRepository` → “Does a 2nd implementation exist?”  
If UseCase for CRUD → “What pain?”  
If 18 files for a small feature → refuse; request flat design.

## Measurable limits (soft gate — enforce in review)

| Rule | Limit |
|------|-------|
| Function lines | ≤20 |
| Indent levels | ≤2 |
| Params | ≤2 (else object) |
| File lines | ≤500 (aim ~200) |
| Line length | ≤120 |
| Imports / file | ≤15 |
| Asserts / test | 1 primary behavior |
| Unit test | fast (<100ms ideal) |

Without project tooling, still **write** to these limits. With tooling, run lint/test/typecheck before done.

## Feature pipeline

```
1. EARS requirement
2. Acceptance test failing (ATDD) when useful
3. TDD unit loop
4. Snapshot/contract if applicable
5. Mutation if stack supports
6. Coverage intent for new code
7. E2E decision (yes/no/defer + ADR if asked)
8. verify-done evidence
9. PR / handoff
```

## Checklist before “done” (ON)

- [ ] Failing test before production code (or valid SPIKE)
- [ ] GREEN + refactor kept green
- [ ] Lint/typecheck/tests run when project has them (echo output)
- [ ] No blocked names / flag params / empty catch
- [ ] Functions/files within limits (or justified)
- [ ] Domain boundaries respected
- [ ] Snapshot/contract considered
- [ ] E2E decided if UI-critical
- [ ] Non-obvious decisions → short ADR if durable
- [ ] `verify-done` evidence present

## Bypass

User may `/craftsman-bypass <rule> <reason>`. Log to
`state/bypasses.md` (append) and create `docs/adr/` note if rule is architectural.
Bypass is scoped to the stated rule, not a total craftsman off.

## References

- `references/anti-patterns.md`
- `references/architecture-rules.md`
- `references/clean-code-rules.md`
- `references/llm-laziness-guard.md`
- `templates/ears-requirement.md`
- `templates/spike-marker.md`
- `templates/e2e-decision-adr.md`
- `templates/adr.md`
